import os
import sys
import subprocess
import argparse
import json
import re
import shutil
import hashlib
import tempfile
import time
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
from threading import Lock


# --- Project-local Terraform provider cache -------------------------------
# Everything provider-related is scoped to <repo>/.terraform-cache so running
# tests never touches $HOME/.terraform.d or any other project on the machine.
# cli.tfrc points Terraform at a filesystem mirror of the single unified provider
# version, which makes per-directory `terraform init` fully offline and
# re-download-free (the provider is fetched once when the mirror is built).
REPO_ROOT = Path(__file__).resolve().parents[2]
CACHE_ROOT = REPO_ROOT / ".terraform-cache"
CLI_CONFIG_FILE = CACHE_ROOT / "cli.tfrc"
MIRROR_DIR = CACHE_ROOT / "mirror"
CACHE_SETUP_SCRIPT = Path(__file__).resolve().parent / "cache_setup.sh"

# --- Committed plan-JSON cache --------------------------------------------
# `terraform plan` (provider schema load) is ~90% of per-policy time, but the
# fixtures are static, so the resulting plan.json only changes when a fixture's
# *.tf or the provider version changes. We cache plan.json under
# inputs/plan_cache/<platform>/<sha>.json (committed). On a run, a cache hit feeds
# OPA directly and skips terraform entirely; a miss runs terraform once and writes
# the cache. The target provider version is read from provider_version.txt (the
# single source of truth shared with cache_setup.sh and unify_provider_versions.py)
# so a provider bump invalidates every cached plan.
TARGET_PROVIDER_VERSION = (Path(__file__).resolve().parent / "provider_version.txt").read_text().strip()
PLAN_CACHE_ROOT = REPO_ROOT / "inputs" / "plan_cache"


def fixture_sha(input_dir: Path) -> str:
    """Stable hash of a fixture: its *.tf contents + the target provider version."""
    h = hashlib.sha256()
    h.update(f"provider={TARGET_PROVIDER_VERSION}\n".encode())
    for tf in sorted(input_dir.glob("*.tf")):
        h.update(tf.name.encode())
        h.update(b"\0")
        h.update(tf.read_bytes())
        h.update(b"\0")
    return h.hexdigest()


def plan_cache_path(input_dir: Path) -> Path:
    """inputs/plan_cache/<platform>/<sha>.json for a fixture dir."""
    parts = input_dir.resolve().parts
    platform = parts[parts.index("inputs") + 1]   # inputs/<platform>/<service>/...
    return PLAN_CACHE_ROOT / platform / f"{fixture_sha(input_dir)}.json"


def get_or_build_plan(input_dir: Path, cache_path: Path, verbose: bool = False) -> Path | None:
    """Return the cached plan.json if present; otherwise run terraform and cache it."""
    if cache_path.exists():
        return cache_path
    plan_json = run_terraform_commands(input_dir, verbose)
    if plan_json is None or not plan_json.exists():
        return None
    cache_path.parent.mkdir(parents=True, exist_ok=True)
    # Write atomically so an interrupted run never leaves a truncated cache file
    # that a later run would treat as a valid hit. tmp name is unique per fixture.
    tmp = cache_path.with_suffix(f".{os.getpid()}.tmp")
    shutil.copyfile(plan_json, tmp)
    os.replace(tmp, cache_path)
    return cache_path


def prune_plan_cache(inputs_root: Path, used_paths: set[Path]) -> None:
    """Delete cached plans no fixture references — only safe after a full-platform run."""
    repo_inputs = (REPO_ROOT / "inputs").resolve()
    try:
        rel = inputs_root.resolve().relative_to(repo_inputs)
    except ValueError:
        print("plan-cache prune skipped: --inputs is outside the repo inputs/ tree.")
        return
    if len(rel.parts) > 1:
        print(f"plan-cache prune skipped: run is scoped to '{inputs_root}', not a whole "
              "platform — a scoped run can't know which cached plans are orphaned.")
        return
    platforms = {p.parent.name for p in used_paths}
    removed = 0
    for plat in platforms:
        pdir = PLAN_CACHE_ROOT / plat
        if not pdir.is_dir():
            continue
        keep = {p.name for p in used_paths if p.parent.name == plat}
        for f in pdir.glob("*.json"):
            if f.name not in keep:
                f.unlink()
                removed += 1
    print(f"plan-cache prune: removed {removed} orphaned plan(s).")


def ensure_cache_ready() -> None:
    """Make sure the project-local provider cache exists; build it if not.

    The cache (.terraform-cache/) is gitignored, so a fresh checkout won't have
    it. Rather than make every student remember a setup step, we detect a missing
    cache and run cache_setup.sh for them once (it needs the registry reachable on
    that first build). Subsequent runs are fully offline from the mirror.
    """
    if CLI_CONFIG_FILE.exists() and any(MIRROR_DIR.rglob("terraform-provider-*")):
        return
    print("⏳ Provider cache not found — running cache_setup.sh (one-time setup)…")
    result = subprocess.run(["bash", str(CACHE_SETUP_SCRIPT)], cwd=str(REPO_ROOT))
    if result.returncode != 0 or not CLI_CONFIG_FILE.exists() \
            or not any(MIRROR_DIR.rglob("terraform-provider-*")):
        sys.exit("❌ Could not set up the Terraform provider cache. "
                 "Run 'bash scripts/auto_test/cache_setup.sh' manually and retry.")


def normalize_policies_root(provided_root: Path) -> Path:
    """
    Traverse up the directory tree to find the root containing _helpers module.
    
    This handles cases where users pass service-specific policy paths (e.g.,
    ./policies/gcp/service_name) but OPA needs access to the shared helpers
    located at policies/_helpers. The function ensures OPA can always load
    the terraform.helpers module and its dependencies.
    
    Args:
        provided_root: The policies root directory provided by the user
        
    Returns:
        The actual policies root containing _helpers directory
    """
    current = Path(provided_root).resolve()
    max_traversal = 5  # Safety limit to prevent infinite loops
    
    for _ in range(max_traversal):
        if (current / "_helpers").exists():
            return current
        parent = current.parent
        if parent == current:  # Reached filesystem root
            break
        current = parent
    
    # If helpers not found, return original path
    # (will fail with OPA error showing undefined function)
    return Path(provided_root).resolve()


def extract_path_parts(path: Path):
    if len(path.parts) < 3:
        sys.exit(f"Invalid path: {path}")
    return path.parts[-3], path.parts[-2], path.parts[-1]  # service, resource, attribute


def fmt_duration(seconds: float) -> str:
    s = int(round(seconds))
    if s >= 3600:
        return f"{s // 3600}h{(s % 3600) // 60:02d}m{s % 60:02d}s"
    if s >= 60:
        return f"{s // 60}m{s % 60:02d}s"
    return f"{s}s"


def make_failure(attribute: str, reason: str, service: str, resource: str) -> dict:
    return {"service": str(service), "resource": str(resource), "policy": str(attribute), "passed": False,
            "failure": {"reason": reason}}


def make_success(attribute: str, service: str, resource: str) -> dict:
    return {"service": str(service), "resource": str(resource), "policy": str(attribute), "passed": True}


def opa_eval_value(data_paths, plan_json_path: Path, query: str):
    """Evaluate an OPA query and return the expression value from JSON output or None.

    ``data_paths`` is one path or a list of paths passed as ``--data``. Passing only
    the helpers dir + the single resource's policy dir (instead of the whole
    ``policies/`` tree) makes each eval ~20x faster — OPA otherwise re-parses and
    compiles all ~1000 policies on every single call.
    """
    if isinstance(data_paths, (str, Path)):
        data_paths = [data_paths]
    cmd = ["opa", "eval"]
    for p in data_paths:
        cmd += ["--data", str(p)]
    cmd += ["--input", str(plan_json_path), "--format", "json", query]
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        thread_safe_print(f"❌ OPA eval failed for query: {query}")
        thread_safe_print(f"Command: {' '.join(cmd)}")
        if result.stdout:
            thread_safe_print(f"STDOUT: {result.stdout[:500]}")
        if result.stderr:
            thread_safe_print(f"STDERR: {result.stderr[:500]}")
        return None
    try:
        payload = json.loads(result.stdout)
        res = payload.get("result")
        if not res:
            thread_safe_print(f"OPA query returned empty result for: {query}")
            return None
        # Take first expression value
        exprs = res[0].get("expressions") if isinstance(res, list) and res else None
        if not exprs:
            thread_safe_print(f"OPA query returned no expressions for: {query}")
            return None
        return exprs[0].get("value")
    except Exception as e:
        thread_safe_print(f"❌ Failed to parse OPA JSON output: {e}")
        thread_safe_print(f"Query: {query}")
        thread_safe_print(f"Output: {result.stdout[:500]}")
        return None


def get_unique_resource_names(plan_json_path: Path, resource_type: str) -> set[str]:
    """Return unique Terraform resource names for a given type,
    considering only root_module resources.
    """
    try:
        data = json.loads(plan_json_path.read_text(encoding="utf-8"))
    except Exception as e:
        print(f"Failed to read/parse JSON: {plan_json_path}: {e}")
        return set()

    names: set[str] = set()

    root = data.get("planned_values", {}).get("root_module", {})
    for res in root.get("resources", []):
        if res.get("type") == resource_type:
            name = res.get("name")
            if isinstance(name, str):
                names.add(name)

    return names


def get_resource_name_map(plan_json_path: Path, resource_type: str,
                          resource_value_name: str | None) -> dict[str, str | None]:
    """Map each resource's Terraform label to the identifier the OPA message uses.

    The rego helper identifies a resource by ``resource_value_name`` via
    ``values[key] -> resource[key] -> null`` (see _helpers/shared.rego). We mirror
    that here so a fixture can use a valid id value (e.g. one that rejects the
    underscore example-name format) and still be matched: the message carries the
    id *value*, which we map back to the ``compliant_example_N`` label.

    For ``resource_value_name == "name"`` with a computed name, ``values`` has no
    ``name`` so the lookup falls back to the top-level ``name`` (the label) — the
    same behaviour the rego helper relies on.
    """
    try:
        data = json.loads(plan_json_path.read_text(encoding="utf-8"))
    except Exception as e:
        print(f"Failed to read/parse JSON: {plan_json_path}: {e}")
        return {}

    name_map: dict[str, str | None] = {}
    root = data.get("planned_values", {}).get("root_module", {})
    for res in root.get("resources", []):
        if res.get("type") != resource_type:
            continue
        label = res.get("name")
        if not isinstance(label, str):
            continue
        identifier: str | None = None
        if resource_value_name:
            vals = res.get("values", {}) or {}
            if resource_value_name in vals:
                identifier = vals[resource_value_name]
            elif resource_value_name in res:
                identifier = res[resource_value_name]
        name_map[label] = identifier if isinstance(identifier, str) else None
    return name_map


def get_all_resource_types(plan_json_path: Path) -> list[str]:
    """Return all unique resource types found in the plan.json file."""
    try:
        data = json.loads(plan_json_path.read_text(encoding="utf-8"))
    except Exception as e:
        return []
    
    resource_types = set()
    root = data.get("planned_values", {}).get("root_module", {})
    for res in root.get("resources", []):
        res_type = res.get("type")
        if res_type:
            resource_types.add(res_type)
    
    return sorted(resource_types)


def parse_rego_metadata(policy_file: Path):
    """Parse the <argument>.rego policy file to extract
    (package_path, vars_import_data_path). Returns (pkg_path, vars_import) or
    (None, None). The vars import still targets the ``...vars`` package (the file
    is _vars.rego but the package name is unchanged).
    """
    if not policy_file.exists():
        return None, None
    pkg = None
    vars_import = None
    try:
        for line in policy_file.read_text(encoding="utf-8").splitlines():
            if pkg is None:
                m = re.match(r"^\s*package\s+([^\s]+)\s*$", line)
                if m:
                    pkg = m.group(1).strip()
                    continue
            if vars_import is None:
                m2 = re.match(r"^\s*import\s+(data\.[\w\.]*?\.vars)\b", line)
                if m2:
                    vars_import = m2.group(1).strip()
            if pkg and vars_import:
                break
    except Exception:
        return None, None
    return pkg, vars_import


def extract_non_compliant_text(messages: list[str]) -> list[str]:
    """Return only the "Non-Compliant Resources: ..." segments of the messages.

    The helper formats each situation as a list whose middle entry is
    ``Non-Compliant Resources: <comma-list>``; resource matching must look only
    there, not in the situation description or the "Potential Remedies" text
    (which may echo an approved value that a compliant fixture uses as its id).
    Falls back to the full messages if no such segment is present (non-standard
    message shapes).
    """
    segments: list[str] = []
    for m in messages:
        segments.extend(re.findall(r"Non-Compliant Resources:\s*([^']*)", m))
    return segments if segments else messages


def match_names_in_messages(messages: list[str], candidate_names: set[str]) -> set[str]:
    """Match candidate names within messages using safe boundaries to avoid short-name false positives."""
    matched: set[str] = set()
    if not messages or not candidate_names:
        return matched
    patterns = {
        name: re.compile(rf"(?<![\w\-]){re.escape(name)}(?![\w\-])")
        for name in candidate_names
    }
    for name, pat in patterns.items():
        if any(pat.search(m) for m in messages):
            matched.add(name)
    return matched


def normalize_messages(messages_value) -> list[str]:
    if isinstance(messages_value, list):
        return [str(m) for m in messages_value]
    if isinstance(messages_value, str):
        return [messages_value]
    if messages_value is not None:
        return [str(messages_value)]
    return []


def get_policy_messages(data_paths, plan_path: Path, message_query: str) -> list[str]:
    val = opa_eval_value(data_paths, plan_path, message_query)
    return normalize_messages(val)


def run_terraform_commands(input_dir: Path, verbose: bool = False) -> Path | None:
    env = os.environ.copy()

    # Fake credentials live in a temp file OUTSIDE the repo tree, so an interrupted
    # run never leaves a stray file in a fixture dir (and concurrent workers can't
    # collide on it).
    creds_fd, creds_name = tempfile.mkstemp(suffix=".json", prefix="fake-creds-")
    with os.fdopen(creds_fd, "w") as fh:
        fh.write('{"type": "service_account", "project_id": "fake-project"}')

    env.update({
        'GOOGLE_APPLICATION_CREDENTIALS': creds_name,
        'GOOGLE_PROJECT': 'fake-project',
        'GOOGLE_REGION': 'us-central1',
        # Project-local, offline provider source (see module header). No global
        # writes, no per-dir re-download. TF_DATA_DIR is intentionally left at its
        # per-directory default so each fixture's .terraform is isolated
        # (concurrency-safe) and symlinks into the shared mirror (tiny footprint);
        # cleanup_workspace removes it after each pair.
        'TF_CLI_CONFIG_FILE': str(CLI_CONFIG_FILE),
        'TF_PLUGIN_CACHE_MAY_BREAK_DEPENDENCY_LOCK_FILE': '1',
    })

    plan_json = input_dir / "plan.json"
    commands = [
        ["terraform", "init", "-backend=false"],
        ["terraform", "plan", "-refresh=false", "-lock=false", "-input=false", "-out=plan"],
    ]

    try:
        for cmd in commands:
            result = subprocess.run(
                cmd, cwd=input_dir, capture_output=True, text=True, env=env)
            if result.returncode != 0:
                if verbose:
                    print(f"❌ Command failed: {' '.join(cmd)}")
                    print("--- stdout ---")
                    print(result.stdout)
                    print("--- stderr ---")
                    print(result.stderr)
                return None

        # `terraform show -json` writes the plan JSON to stdout; redirect it
        # straight to the file (no shell, no needless `| cat`).
        with open(plan_json, "w", encoding="utf-8") as fh:
            result = subprocess.run(
                ["terraform", "show", "-json", "plan"],
                cwd=input_dir, stdout=fh, stderr=subprocess.PIPE, text=True, env=env)
        if result.returncode != 0:
            if verbose:
                print("❌ Command failed: terraform show -json plan")
                print("--- stderr ---")
                print(result.stderr)
            return None
    finally:
        try:
            os.unlink(creds_name)
        except OSError:
            pass

    return plan_json


def get_policy_metadata(policy_file: Path, service: str, resource: str, attribute: str) -> tuple[str, str]:
    """Return (message_query, vars_query).

    ``vars_query`` resolves the whole ``variables`` object so a single OPA eval
    yields both ``resource_type`` and ``resource_value_name`` (one process launch
    instead of two — OPA recompiles the policy set on every launch)."""
    pkg_path, vars_import = parse_rego_metadata(policy_file)
    if not pkg_path:
        pkg_path = f"terraform.gcp.security.{service}.{resource}.{attribute}"
    message_query = f"data.{pkg_path}.message"
    vars_pkg = vars_import or f"data.terraform.gcp.security.{service}.{resource}.vars"
    vars_query = f"{vars_pkg}.variables"
    return message_query, vars_query


# Add a lock for thread-safe printing
print_lock = Lock()

def thread_safe_print(*args, **kwargs):
    """Thread-safe print function."""
    with print_lock:
        print(*args, **kwargs)


def validate_policy_output(attribute: str, resource_type: str | None, plan_path: Path, messages: list[str],
                           verbose: bool, service: str, resource: str,
                           resource_value_name: str | None = None) -> dict:
    # Map each label to the identifier the OPA message uses (the resource_value_name
    # value). A label counts as flagged if EITHER the label OR its identifier appears
    # in the messages — so fixtures whose id field rejects the underscore example-name
    # format can still be matched via a valid id value.
    name_map = get_resource_name_map(plan_path, str(resource_type), resource_value_name)
    unique_names = set(name_map.keys())
    candidates = unique_names | {v for v in name_map.values() if v}
    # Match only within the "Non-Compliant Resources:" portion(s) of the message,
    # never the remedy/advisory text — otherwise an approved value echoed in a
    # remedy ("change ... to <approved>") would falsely flag the compliant example
    # that legitimately uses that approved value as its id.
    nc_text = extract_non_compliant_text(messages)
    matched_strings = match_names_in_messages(nc_text, candidates)
    matched = {
        label for label, ident in name_map.items()
        if label in matched_strings or (ident and ident in matched_strings)
    }

    # Resource labels follow the example convention: compliant_example_N must NOT
    # be flagged (compliant), non_compliant_example_N MUST be flagged.
    compliant_pattern = re.compile(r"^compliant_example_\d+$")
    non_compliant_pattern = re.compile(r"^non_compliant_example_\d+$")

    # Fail if a compliant example was flagged (a false positive).
    flagged_compliant = {n.strip() for n in matched if not non_compliant_pattern.fullmatch(n)}
    if flagged_compliant:
        thread_safe_print(f"Check failed: compliant resources were flagged: {', '.join(sorted(flagged_compliant))}\n")
        return make_failure(attribute,
                            f"Compliant resources were flagged: {', '.join(sorted(flagged_compliant))}",
                            service, resource)

    # Every non-compliant example must be flagged; compliant examples may be omitted.
    missing = unique_names - matched
    missing_non_compliant = {n.strip() for n in missing if not compliant_pattern.fullmatch(n)}

    if verbose:
        rt = resource_type if resource_type else "any"
        thread_safe_print(f"Unique resource names in plan ({rt}): {len(unique_names)}")
        thread_safe_print(f"Names mentioned in output: {len(matched)}")
        if missing:
            thread_safe_print(f" Missing mentions: {', '.join(sorted(missing))}")

    if missing_non_compliant:
        if verbose:
            thread_safe_print(f"Check failed: non-compliant resources not flagged: {', '.join(sorted(missing_non_compliant))}\n")
        return make_failure(attribute,
                            f"Non-compliant resources were not flagged: {', '.join(sorted(missing_non_compliant))}", service,
                            resource)

    if missing and not missing_non_compliant and verbose:
        thread_safe_print("Only compliant resources are unmentioned; ignoring")
    if verbose:
        thread_safe_print("Check passed\n")
    return make_success(attribute, service, resource)


def run_policy_check_pair(input_dir: Path, policy_file: Path, policies_root: Path,
                          cache_path: Path, verbose: bool = False):
    # Extract data about services and filesystem paths
    abs_input_dir = input_dir.resolve()
    service, resource, attribute = extract_path_parts(input_dir)
    # Cache hit -> use the committed plan.json; miss -> run terraform and cache it.
    plan_path = get_or_build_plan(abs_input_dir, cache_path, verbose)
    cleanup_workspace(abs_input_dir, verbose)

    if plan_path is None:
        res = make_failure(attribute, "Terraform failed to compile!", service, resource)
        return res

    # plan_path is the persistent plan_cache file — never delete it here.
    message_query, vars_query = get_policy_metadata(
        policy_file, service, resource, attribute)

    # Scope OPA's --data to just the shared helpers + this resource's policy dir
    # (the .rego + _vars.rego). Loading the whole policies/ tree on every eval
    # re-compiles ~1000 policies per call and dominates runtime; this is ~20x faster.
    data_paths = [(policies_root / "_helpers").resolve(), policy_file.parent.resolve()]

    # One eval fetches the whole `variables` object (resource_type + value_name).
    variables = opa_eval_value(data_paths, plan_path, vars_query)
    resource_type = variables.get("resource_type") if isinstance(variables, dict) else None
    if resource_type is None:
        # Get diagnostic info
        actual_types = get_all_resource_types(plan_path)
        diagnostics = [
            f"Query used: {vars_query}.resource_type",
            f"Resource types found in plan: {', '.join(actual_types) if actual_types else 'NONE'}",
            f"Plan file: {plan_path}"
        ]
        error_msg = "Could not find resource_type variable! " + " | ".join(diagnostics)
        return make_failure(attribute, error_msg, service, resource)

    messages = get_policy_messages(data_paths, plan_path, message_query)
    if not messages:
        return make_failure(attribute, "Could not run OPA query!", service, resource)

    resource_value_name = variables.get("resource_value_name")
    if not isinstance(resource_value_name, str):
        resource_value_name = None

    if verbose:
        thread_safe_print(f"OPA check: {message_query}")
        for m in messages:
            thread_safe_print(m)

    return validate_policy_output(attribute, resource_type, plan_path, messages, verbose, service, resource,
                                  resource_value_name)

def cleanup_workspace(workdir: Path, verbose: bool = False):
    # Remove transient terraform artifacts from the input dir. plan.json is already
    # copied into the committed plan_cache before this runs, so the in-dir copy is
    # transient; the lock is regenerated offline from the mirror on each init.
    for fname in ["plan", "plan.json", ".terraform.lock.hcl"]:
        f = workdir / fname
        try:
            f.unlink()
        except FileNotFoundError:
            pass

    # remove .terraform directory recursively
    for tfdir in workdir.rglob(".terraform"):
        if tfdir.is_dir():
            try:
                shutil.rmtree(tfdir)
            except OSError as e:
                if verbose:
                    thread_safe_print(f"⚠️  could not remove {tfdir}: {e}")

def find_matching_pairs(inputs_root: Path, policies_search_root: Path):
    """
    Pair each input argument directory with its policy file.

    Input fixtures live in leaf dirs ``inputs/gcp/<svc>/<resource>/<argument>/``;
    the matching policy is the FILE ``policies/gcp/<svc>/<resource>/<argument>.rego``
    (the per-argument layout — not the old ``<argument>/policy.rego`` directory).

    Args:
        inputs_root: Root directory for Terraform input files
        policies_search_root: The user-provided policies root (for path matching)
    """
    def is_leaf_terraform_dir(directory: Path) -> bool:
        # A single rglob pass: there must be a .tf directly in this dir and none in
        # any descendant dir.
        has_direct = False
        for tf in directory.rglob("*.tf"):
            if tf.parent == directory:
                has_direct = True
            else:
                return False
        return has_direct

    input_dirs = [p for p in inputs_root.rglob('*') if p.is_dir() and is_leaf_terraform_dir(p)]
    pairs = []
    unmatched_inputs = []          # (input_dir, expected_policy_file)
    matched_policy_files = set()

    for input_dir in input_dirs:
        relative = input_dir.relative_to(inputs_root)
        # <argument> may contain dots (a nested docs key); append .rego to the
        # whole name rather than using with_suffix, which would clobber it.
        policy_file = policies_search_root / relative.parent / f"{relative.name}.rego"
        if policy_file.is_file():
            pairs.append((input_dir, policy_file))
            matched_policy_files.add(policy_file.resolve())
        else:
            unmatched_inputs.append((input_dir, policy_file))

    # Orphan policies: every <argument>.rego in scope (excluding the per-resource
    # _vars.rego and the shared _helpers) that no input fixture drives.
    orphan_policies = []           # (policy_file, expected_input_dir)
    for pf in policies_search_root.rglob("*.rego"):
        if pf.name == "_vars.rego" or "_helpers" in pf.parts:
            continue
        if pf.resolve() in matched_policy_files:
            continue
        rel = pf.relative_to(policies_search_root)
        expected_input = inputs_root / rel.parent / pf.stem
        orphan_policies.append((pf, expected_input))

    return pairs, unmatched_inputs, orphan_policies


def main():
    parser = argparse.ArgumentParser(
        description="Run Terraform + OPA policy checks for all matched input/policy pairs.")
    parser.add_argument("--inputs", default="inputs/gcp", help="Root directory for Terraform inputs")
    parser.add_argument("--policies", default="policies/gcp", help="Root directory for policy files")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose output")
    parser.add_argument("--workers", type=int, default=4, help="Number of parallel workers (default: 4)")
    parser.add_argument("--prune-plan-cache", action="store_true",
                        help="After a full-platform run, delete cached plans no fixture references "
                             "(orphans from changed/removed fixtures). Ignored for scoped runs.")
    args = parser.parse_args()
    start_time = time.monotonic()

    inputs_root = Path(args.inputs)
    policies_search_root = Path(args.policies)
    policies_base_root = normalize_policies_root(policies_search_root)

    pairs, unmatched_inputs, orphan_policies = find_matching_pairs(
        inputs_root, policies_search_root)
    if not pairs and not unmatched_inputs and not orphan_policies:
        print(" No input/policy pairs or mismatches found.")
        sys.exit(1)

    # Resolve each pair's plan-cache path up front; only stand up the terraform
    # provider cache if at least one plan is missing (a fully-cached run needs no
    # terraform/provider at all).
    pair_cache = {(i, p): plan_cache_path(i) for i, p in pairs}
    misses = sum(1 for cp in pair_cache.values() if not cp.exists())
    if misses:
        print(f"[*] {misses}/{len(pairs)} plan(s) not cached — ensuring terraform provider cache…")
        ensure_cache_ready()
    else:
        print(f"[*] all {len(pairs)} plan(s) cached — skipping terraform entirely")

    results = []

    # A mismatched input/policy is a hard failure (the pair can never be tested).
    for input_dir, policy_file in unmatched_inputs:
        service, resource, attribute = extract_path_parts(input_dir)
        results.append(make_failure(
            attribute, f"No matching policy file (expected {policy_file})", service, resource))
    for policy_file, expected_input in orphan_policies:
        service, resource, attribute = policy_file.parts[-3], policy_file.parts[-2], policy_file.stem
        results.append(make_failure(
            attribute, f"No matching input fixture (expected {expected_input}/)", service, resource))

    # Process pairs in parallel
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        # Submit all tasks
        future_to_pair = {
            executor.submit(run_policy_check_pair, input_dir, policy_file, policies_base_root,
                            pair_cache[(input_dir, policy_file)], args.verbose): (input_dir, policy_file)
            for input_dir, policy_file in pairs
        }

        # Collect results as they complete
        total = len(future_to_pair)
        done = passed = 0
        for future in as_completed(future_to_pair):
            input_dir, policy_file = future_to_pair[future]
            try:
                result = future.result()
                results.append(result)
                if result.get("passed"):
                    passed += 1
            except Exception as exc:
                thread_safe_print(f"Error processing {input_dir}: {exc}")
                service, resource, attribute = extract_path_parts(input_dir)
                results.append(make_failure(attribute, f"Exception: {exc}", service, resource))
            done += 1
            if not args.verbose:
                with print_lock:
                    pct = 100.0 * done / total
                    print(f"\r[{pct:5.1f}%] {done}/{total}  ✅ {passed}  ❌ {done - passed}  "
                          f"{fmt_duration(time.monotonic() - start_time)}", end="", flush=True)
        if not args.verbose:
            print()  # newline after the progress line

    if args.prune_plan_cache:
        # Don't prune if a fixture's terraform failed: we couldn't regenerate that
        # plan offline, so its cache (if any) must not be treated as orphaned.
        tf_failed = any(
            r.get("failure", {}).get("reason", "").startswith("Terraform failed")
            for r in results
        )
        if tf_failed:
            print("plan-cache prune skipped: some fixtures failed terraform "
                  "(cannot safely identify orphans).")
        else:
            prune_plan_cache(inputs_root, set(pair_cache.values()))

    # Quiet output: successes are silent — print only failures, then a one-line
    # summary of coverage (services / resource types / policies) and total time.
    failures = [r for r in results if not r.get("passed")]
    n_services = len({r.get("service") for r in results})
    n_rtypes = len({(r.get("service"), r.get("resource")) for r in results})
    elapsed = fmt_duration(time.monotonic() - start_time)

    def plural(n, word):
        return f"{n} {word}{'' if n == 1 else 's'}"

    coverage = (f"{plural(n_services, 'service')}, {plural(n_rtypes, 'resource type')}, "
                f"{plural(len(results), 'policy').replace('policys', 'policies')}")

    if failures:
        print("\nFailures:")
        for r in sorted(failures, key=lambda x: (x.get("service", ""), x.get("resource", ""), x.get("policy", ""))):
            print(f"  ❌ {r.get('service')} / {r.get('resource')} / {r.get('policy')}")
            print(f"     {r['failure']['reason']}")

    print()
    if failures:
        print(f"❌ {len(failures)} FAILED — {coverage}  in {elapsed}")
        sys.exit(1)
    print(f"✅ all passed — {coverage}  in {elapsed}")


if __name__ == "__main__":
    main()