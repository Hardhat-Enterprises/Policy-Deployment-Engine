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
import uuid
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

# Committed plans live beside their fixtures. Every consumer uses the same
# effective-file resolver and hash, including migrations and temporary test trees.
TARGET_PROVIDER_VERSION = (Path(__file__).resolve().parent / "provider_version.txt").read_text().strip()
POLICIES_ROOT = REPO_ROOT / "policies"
PLATFORM_CONFIG_NAME = "config.tf"
FIXTURE_TF_FILES = ("compliant.tf", "nonCompliant.tf")
POLICY_FILE = "policy.rego"
VARS_FILE = "_vars.rego"
PLAN_FILE_RE = re.compile(r"^[0-9a-f]{64}\.json$")
UTF8_BOM = b"\xef\xbb\xbf"


def policy_root(policy_dir: Path, repo_root: Path | None = None) -> Path:
    """Resolve the owning policies root; an explicit root never falls back elsewhere."""
    directory = Path(policy_dir).resolve()
    candidates = [Path(repo_root).resolve() / "policies"] if repo_root is not None else [
        p for p in directory.parents if p.name == "policies"]
    for root in candidates:
        try:
            parts = directory.relative_to(root).parts
        except ValueError:
            continue
        if len(parts) == 4 and parts[0] in {"gcp", "aws", "azure"}:
            return root
    raise ValueError(f"Not an argument directory under policies/<platform>/<service>/<resource>: {directory}")


def platform_of(policy_dir: Path, repo_root: Path | None = None) -> str:
    return Path(policy_dir).resolve().relative_to(policy_root(policy_dir, repo_root)).parts[0]


def fixture_files(policy_dir: Path, repo_root: Path | None = None) -> dict[str, Path]:
    """Terraform's effective *.tf files; local config replaces the shared default."""
    directory = Path(policy_dir).resolve()
    root = policy_root(directory, repo_root)
    files = {p.name: p for p in directory.glob("*.tf") if p.is_file()}
    config = files.get(PLATFORM_CONFIG_NAME, root / platform_of(directory, repo_root) / PLATFORM_CONFIG_NAME)
    if not config.is_file():
        raise FileNotFoundError(f"Missing effective config.tf for {directory}: {config}")
    files[PLATFORM_CONFIG_NAME] = config
    return files


def canonical_text_bytes(data: bytes) -> bytes:
    """A text file's bytes reduced to the form every checkout agrees on.

    CRLF (and a lone CR) collapse to LF and a leading UTF-8 BOM is dropped. Only
    ever used for hashing — nothing is rewritten on disk.

    This is what makes fixture_sha checkout-independent. Terraform reads CRLF and
    LF identically, so the two spellings of a fixture plan to the same document;
    hashing the raw bytes made them two different fixtures anyway. A contributor
    on Windows defaults (core.autocrlf=true) therefore computed a sha nobody else
    could reproduce: their plan cache hit locally, and on every LF checkout — CI
    and the portal included — the expected <sha>.json was a different name, the
    plan looked absent, and every argument of the resource came back
    `fixture-missing-plan`. Normalising here fixes that for any checkout, however
    the contributor's git is configured; .gitattributes then keeps the bytes
    themselves LF in the repository.

    LF is the canonical form, so the sha of an all-LF tree is unchanged — which is
    the name dev and CI already carry for all but the handful of fixtures that were
    committed with CRLF bytes (renamed in the change that introduced this).
    """
    if data.startswith(UTF8_BOM):
        data = data[len(UTF8_BOM):]
    return data.replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def sha_for_files(files: dict[str, Path], transform=canonical_text_bytes) -> str:
    """Hash named effective files. Also used by the read-only legacy migration adapter."""
    h = hashlib.sha256()
    h.update(f"provider={TARGET_PROVIDER_VERSION}\n".encode())
    for name in sorted(files):
        h.update(name.encode())
        h.update(b"\0")
        h.update(transform(files[name].read_bytes()))
        h.update(b"\0")
    return h.hexdigest()


def fixture_sha(policy_dir: Path, repo_root: Path | None = None) -> str:
    return sha_for_files(fixture_files(policy_dir, repo_root))


def plan_cache_path(policy_dir: Path, repo_root: Path | None = None) -> Path:
    return Path(policy_dir) / f"{fixture_sha(policy_dir, repo_root)}.json"


def _sha_over(policy_dir: Path, transform) -> str:
    return sha_for_files(fixture_files(policy_dir), transform)


def _to_crlf(data: bytes) -> bytes:
    """Every line ending as CRLF — what a core.autocrlf=true checkout writes."""
    return canonical_text_bytes(data).replace(b"\n", b"\r\n")


def alternate_fixture_shas(input_dir: Path) -> list[str]:
    """Names, other than fixture_sha, that this exact fixture's plan may carry.

    Both are pre-normalisation spellings of the *same* *.tf, which is why either
    can be renamed onto the canonical name without re-planning:

    * the raw bytes as they sit on disk — the sha a contributor computed while
      their working tree still held CRLF (or a UTF-8 BOM);
    * the bytes projected to CRLF — the sha that same contributor computed for a
      fixture git has since stored as LF. This is the one that matters in CI and
      on the portal, whose checkouts are LF: the plan committed from a Windows
      working tree is named for bytes that no longer exist anywhere in the repo,
      and projecting forward is the only way to recognise it.

    Canonical-equal entries are dropped, so an all-LF fixture returns [].
    """
    canonical = fixture_sha(input_dir)
    out = []
    for transform in (lambda b: b, _to_crlf):
        sha = _sha_over(input_dir, transform)
        if sha != canonical and sha not in out:
            out.append(sha)
    return out


def find_denormalised_plan(input_dir: Path) -> Path | None:
    """A committed plan for these *.tf under a pre-normalisation name, if present."""
    for sha in alternate_fixture_shas(input_dir):
        candidate = input_dir / f"{sha}.json"
        if candidate.is_file():
            return candidate
    return None


def is_committed_plan(path: Path) -> bool:
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
        return isinstance(value, dict) and isinstance(value.get("planned_values"), dict)
    except (OSError, ValueError):
        return False


def adopt_denormalised_plan(input_dir: Path, cache_path: Path) -> bool:
    """Rename a CRLF-era plan onto its canonical name. True if one was adopted.

    A plan named for one of alternate_fixture_shas is the plan for exactly these
    *.tf — the same terraform document under a name computed before fixture_sha
    normalised line endings. Renaming it is strictly better than re-planning: the
    contents are already right, and re-planning costs the contributor a terraform
    run and, on a fresh clone, a 121MB provider download. It also means the fix for
    an affected branch is a rename anyone can produce from any checkout, rather
    than a re-run each contributor must do on the machine that caused it.

    The narrowness matters. The tempting version of this — "adopt the single
    <64-hex>.json in the directory if it parses as a plan" — would quietly undo the
    property the sha naming exists to provide: that a fixture edited without
    re-running the harness is *caught*, rather than silently tested against the
    plan of its old config. A stale plan also parses, and is also the only .json in
    the directory. Keying on the alternate shas keeps that guarantee whole, because
    the match is cryptographic: only these *.tf, under a different spelling of
    their line endings, can produce that name. A fixture that was genuinely edited
    produces none of them.

    Transitional. Once .gitattributes has kept CRLF out of the tree for a release
    or two, no such file will exist and this can go.
    """
    if cache_path.exists():
        return False
    denormalised = find_denormalised_plan(input_dir)
    if denormalised is None or not is_committed_plan(denormalised):
        return False
    try:
        os.replace(denormalised, cache_path)
    except OSError:
        return False
    return True


# Fixtures own distinct plan files. Lock by destination (rather than only hash),
# and use unique temp names so duplicate invocations cannot collide on a write.
_plan_locks: dict[str, Lock] = {}
_plan_locks_guard = Lock()


def get_or_build_plan(policy_dir: Path, cache_path: Path, verbose: bool = False) -> Path | None:
    key = str(cache_path.resolve())
    with _plan_locks_guard:
        lock = _plan_locks.setdefault(key, Lock())
    with lock:
        adopt_denormalised_plan(policy_dir, cache_path)
        if not is_committed_plan(cache_path):
            plan_json = run_terraform_commands(policy_dir, verbose)
            if plan_json is None:
                return None
            # Reject incomplete output before publishing or deleting the previous plan.
            try:
                document = json.loads(plan_json)
                if not isinstance(document, dict) or not isinstance(document.get("planned_values"), dict):
                    return None
            except (TypeError, json.JSONDecodeError):
                return None
            tmp = cache_path.with_name(f"{cache_path.name}.{uuid.uuid4().hex}.tmp")
            try:
                tmp.write_text(plan_json, encoding="utf-8")
                os.replace(tmp, cache_path)
            finally:
                tmp.unlink(missing_ok=True)
        prune_stale_plans(policy_dir, keep=cache_path)
        return cache_path


def prune_stale_plans(input_dir: Path, keep: Path) -> int:
    """Delete every .json in a fixture dir except ``keep``. Returns the count."""
    removed = 0
    for f in input_dir.glob("*.json"):
        if f.name == keep.name:
            continue
        try:
            f.unlink()
            removed += 1
        except OSError:
            pass
    return removed


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
    # Pass the script as a RELATIVE forward-slash path: absolute Windows paths
    # (C:\...) get their backslashes eaten by bash, and MSYS/WSL bash resolve
    # a relative path correctly from cwd on every platform. On Windows, prefer
    # Git Bash over the WSL shim so the cache is built for the same platform
    # as the terraform.exe that will consume it.
    bash = None
    if os.name == "nt":
        for candidate in (r"C:\Program Files\Git\bin\bash.exe",
                          r"C:\Program Files (x86)\Git\bin\bash.exe"):
            if Path(candidate).exists():
                bash = candidate
                break
    if bash is None:
        bash = shutil.which("bash")
    if bash is None:
        sys.exit("❌ bash not found. Install Git Bash (Windows) or run inside WSL.")
    script_rel = CACHE_SETUP_SCRIPT.relative_to(REPO_ROOT).as_posix()
    result = subprocess.run([bash, script_rel], cwd=str(REPO_ROOT))
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
    """Parse the policy.rego file to extract
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


# policies/_helpers/helpers.rego refuses to evaluate a policy whose conditions name
# a policy_type it cannot dispatch, and says so with a message carrying this prefix.
# Treating that as a plain summary would leave it to chance whether the check went
# red (it would depend on whether the fixture happened to have compliant examples),
# and the reported reason would be the wrong one, so it is matched explicitly.
POLICY_ERROR_PREFIX = "POLICY ERROR:"


def find_policy_error(messages: list[str]) -> str | None:
    """The helper's own hard-error text, if the policy declared something unevaluatable.

    Searched for anywhere in a message rather than only at the start: OPA returns the
    message rule as a nested array and normalize_messages stringifies it, so the marker
    can sit inside a Python repr rather than at position 0.
    """
    for message in messages:
        index = message.find(POLICY_ERROR_PREFIX)
        if index != -1:
            return message[index:].strip().rstrip("]'\"")
    return None


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


def run_terraform_commands(policy_dir: Path, verbose: bool = False) -> str | None:
    """Plan one fixture in a throwaway workspace; return the plan JSON text, or None.

    Terraform runs in a short-lived temp directory, never in the repo tree. Two reasons:

    1. Required by the layout. The provider stub lives once at policies/<platform>/config.tf,
       not beside the fixtures, so the .tf files terraform needs are only ever co-located
       in a workspace we assemble.
    2. Windows MAX_PATH. Argument dirs run to ~230 characters, and `terraform init` then
       wants to create .terraform/providers/registry.terraform.io/hashicorp/google/<ver>/
       <platform>/terraform-provider-google_<ver>_x5.exe under them — roughly another 120,
       which blows past the 260-character limit. A %TEMP%-rooted workspace stays well
       inside it. (Override TMPDIR/TEMP if a runner's temp root is itself very deep.)

    As a bonus nothing is left to clean up in the repo: no .terraform, no lock file, no
    stray plan.json in a policy directory.
    """
    env = os.environ.copy()

    # Fake credentials live in the workspace too, so an interrupted run leaves nothing
    # behind anywhere and concurrent workers can't collide on it.
    work = Path(tempfile.mkdtemp(prefix="pde-tf-"))
    creds = work / "fake-creds.json"
    creds.write_text('{"type": "service_account", "project_id": "fake-project"}', encoding="utf-8")

    env.update({
        'GOOGLE_APPLICATION_CREDENTIALS': str(creds),
        'GOOGLE_PROJECT': 'fake-project',
        'GOOGLE_REGION': 'us-central1',
        # Project-local, offline provider source (see module header). No global writes,
        # no per-dir re-download. TF_DATA_DIR is left at its per-directory default so each
        # workspace's .terraform is isolated (concurrency-safe) and symlinks into the
        # shared mirror; the whole workspace is deleted below. The provider comes from a
        # filesystem mirror (not TF_PLUGIN_CACHE_DIR), so no plugin-cache env is set.
        'TF_CLI_CONFIG_FILE': str(CLI_CONFIG_FILE),
    })

    commands = [
        ["terraform", "init", "-backend=false"],
        ["terraform", "plan", "-refresh=false", "-lock=false", "-input=false", "-out=plan"],
    ]

    try:
        for name, src in fixture_files(policy_dir).items():
            shutil.copyfile(src, work / name)

        for cmd in commands:
            result = subprocess.run(
                cmd, cwd=work, capture_output=True, text=True, env=env)
            if result.returncode != 0:
                if verbose:
                    thread_safe_print(f"Command failed: {' '.join(cmd)} (in {policy_dir})")
                    thread_safe_print("--- stdout ---")
                    thread_safe_print(result.stdout)
                    thread_safe_print("--- stderr ---")
                    thread_safe_print(result.stderr)
                return None

        # `terraform show -json` writes the plan JSON to stdout; capture it directly
        # (no shell, no intermediate file — the caller writes it to the cache).
        result = subprocess.run(
            ["terraform", "show", "-json", "plan"],
            cwd=work, capture_output=True, text=True, env=env)
        if result.returncode != 0:
            if verbose:
                thread_safe_print("Command failed: terraform show -json plan")
                thread_safe_print("--- stderr ---")
                thread_safe_print(result.stderr)
            return None
        return result.stdout
    except OSError as e:
        if verbose:
            thread_safe_print(f"Workspace error for {policy_dir}: {e}")
        return None
    finally:
        shutil.rmtree(work, ignore_errors=True)


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
    # A policy the engine refused to evaluate fails outright, with the helper's own
    # text as the reason. This must come first: without it the run would fall through
    # to name-matching against an error string, and report "non-compliant resources
    # were not flagged" — true, but it hides why, and it would report nothing at all
    # for a fixture that has no non-compliant examples.
    policy_error = find_policy_error(messages)
    if policy_error:
        thread_safe_print(f"Check failed: {policy_error}\n")
        return make_failure(attribute, policy_error, service, resource)

    # Map each label to the identifier the OPA message uses (the resource_value_name
    # value). A label counts as flagged if EITHER the label OR its identifier appears
    # in the messages — so fixtures whose id field rejects the underscore example-name
    # format can still be matched via a valid id value.
    name_map = get_resource_name_map(plan_path, str(resource_type), resource_value_name)
    unique_names = set(name_map.keys())

    # A policy whose declared resource type matches nothing in the plan is inert:
    # there is nothing to flag, so nothing goes unflagged and the check would pass
    # while testing nothing at all. Every fixture is required to contain compliant
    # and non-compliant examples of the resource under test, so zero matches always
    # means the policy's _vars.rego names the wrong type.
    if not unique_names:
        actual_types = get_all_resource_types(plan_path)
        reason = (
            f"Policy declares resource_type '{resource_type}', which matches no resource "
            f"in the plan. Types present: "
            f"{', '.join(actual_types) if actual_types else 'NONE'}"
        )
        thread_safe_print(f"Check failed: {reason}\n")
        return make_failure(attribute, reason, service, resource)

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


def run_policy_check_pair(policy_dir: Path, policy_file: Path, policies_root: Path,
                          cache_path: Path, verbose: bool = False):
    # Extract data about services and filesystem paths
    abs_policy_dir = policy_dir.resolve()
    service, resource, attribute = extract_path_parts(policy_dir)
    # Cache hit -> use the committed plan.json; miss -> run terraform and cache it.
    plan_path = get_or_build_plan(abs_policy_dir, cache_path, verbose)

    if plan_path is None:
        return make_failure(attribute, "Terraform failed to compile!", service, resource)

    # plan_path is the persistent plan_cache file — never delete it here.
    message_query, vars_query = get_policy_metadata(
        policy_file, service, resource, attribute)

    # Scope OPA's --data to just the shared helpers + this policy + its resource's
    # _vars.rego. Loading the whole policies/ tree on every eval re-compiles ~1000
    # policies per call and dominates runtime; this is ~20x faster. The files are named
    # explicitly rather than passing the argument dir, because _vars.rego lives one
    # level up (at the resource) and would otherwise be missed.
    data_paths = [(policies_root / "_helpers").resolve(), policy_file.resolve()]
    vars_file = policy_file.parent.parent / VARS_FILE
    if vars_file.is_file():
        data_paths.append(vars_file.resolve())

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


def discover_policies(policies_search_root: Path):
    """Find every policy directory under the given root.

    A policy is one self-contained directory:
        policies/<platform>/<service>/<resource>/<argument>/
            policy.rego, compliant.tf, nonCompliant.tf

    Returns (pairs, malformed):
      pairs     — [(policy_dir, policy_file)] for complete policies.
      malformed — [(policy_dir, reason)] for a directory that is only half a policy: a
                  policy.rego with fixtures missing, or fixtures with no policy.rego.
                  Both are hard failures — such a policy can never be tested.
    """
    pairs = []
    malformed = []
    seen = set()

    for policy_file in sorted(policies_search_root.rglob(POLICY_FILE)):
        policy_dir = policy_file.parent
        seen.add(policy_dir.resolve())
        missing = [f for f in FIXTURE_TF_FILES if not (policy_dir / f).is_file()]
        if missing:
            malformed.append((policy_dir, f"missing fixture file(s): {', '.join(missing)}"))
        else:
            pairs.append((policy_dir, policy_file))

    # The inverse: a directory carrying fixtures but no policy.rego. Skip the shared
    # helpers and the per-platform config.tf, which are not policy directories.
    for tf in sorted(policies_search_root.rglob("*.tf")):
        policy_dir = tf.parent
        if policy_dir.resolve() in seen or "_helpers" in policy_dir.parts:
            continue
        if tf.name == PLATFORM_CONFIG_NAME:
            continue                       # policies/<platform>/config.tf
        seen.add(policy_dir.resolve())
        malformed.append((policy_dir, f"terraform fixtures with no {POLICY_FILE}"))

    for rego in sorted(policies_search_root.rglob("*.rego")):
        if rego.name not in {POLICY_FILE, VARS_FILE} and "_helpers" not in rego.parts:
            malformed.append((rego.parent / rego.stem, f"legacy policy file {rego}; run the layout migration"))
    for directory, _ in pairs[:]:
        try:
            fixture_files(directory)
        except (OSError, ValueError) as exc:
            pairs.remove((directory, directory / POLICY_FILE))
            malformed.append((directory, str(exc)))

    return pairs, malformed


def write_report(results: list, path: str) -> None:
    """Write the full results list to PATH as a JSON array.

    Each entry keeps the shape produced by make_success/make_failure —
    {"service", "resource", "policy", "passed"} — with failure entries retaining
    their extra keys (e.g. "failure"). Called before any failure exit so a run
    with failing policies still emits the complete report (including the
    passed: false entries) for CI to publish as an artifact.
    """
    with open(path, "w", encoding="utf-8") as fh:
        json.dump(results, fh, indent=2)
        fh.write("\n")


def verify_plan_cache(pairs, verbose: bool = False) -> int:
    """Read-only: require each fixture's expected, parseable plan and no stale plans."""
    errors = []
    for directory, _ in pairs:
        try:
            expected = plan_cache_path(directory)
            if not expected.is_file():
                errors.append(f"{directory}: missing committed plan {expected.name}")
            else:
                plan = json.loads(expected.read_text(encoding="utf-8"))
                if not isinstance(plan, dict) or not isinstance(plan.get("planned_values"), dict):
                    errors.append(f"{expected}: not a Terraform plan")
            for sibling in directory.glob("*.json"):
                if sibling != expected:
                    errors.append(f"{sibling}: unexpected or stale plan; expected {expected.name}")
        except (OSError, ValueError) as exc:
            errors.append(f"{directory}: {exc}")
    for error in errors:
        print(f"[FAIL] {error}")
    print(f"[{ 'FAIL' if errors else 'OK' }] checked {len(pairs)} fixture-local plans")
    return 1 if errors else 0


def main():
    # The progress line and summary use emoji. On Windows, piping stdout switches
    # Python from the console's UTF-8 to the locale codepage (cp1252), which cannot
    # encode them — so `auto_test.py | tee log` died with UnicodeEncodeError. Ask for
    # UTF-8 explicitly; harmless where it is already the default.
    for stream in (sys.stdout, sys.stderr):
        try:
            stream.reconfigure(encoding="utf-8")
        except (AttributeError, OSError):
            pass

    parser = argparse.ArgumentParser(
        description="Run Terraform + OPA policy checks over the policies tree.",
        epilog="Examples:"
               "\n  auto_test.py                                   # whole repo"
               "\n  auto_test.py gcp                               # whole platform"
               "\n  auto_test.py 'gcp/Cloud Storage'               # whole service"
               "\n  auto_test.py 'gcp/Cloud Storage/google_storage_bucket'   # one resource",
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument(
        "target", nargs="?", default=None,
        help="What to test, as <platform>[/<service>[/<resource>]] — e.g. 'gcp', "
             "'gcp/AlloyDB', 'gcp/AlloyDB/google_alloydb_backup'. Quote service names "
             "that contain spaces. Omit to test the whole repo. Cannot be combined "
             "with --policies.")
    parser.add_argument("--policies", default=None,
                        help="Explicit policies root (advanced; a positional target overrides it). "
                             "Default: the whole repo (policies/), or policies/<target>.")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose output")
    parser.add_argument("--workers", type=int, default=4, help="Number of parallel workers (default: 4)")
    parser.add_argument("--verify-plan-cache", action="store_true",
                        help="Read-only: check every fixture has a committed plan, then exit. "
                             "Runs no terraform and no OPA, and writes nothing.")
    parser.add_argument("--report", default=None, metavar="PATH",
                        help="Write the full results list to PATH as a JSON array of "
                             "{service, resource, policy, passed} objects (failure entries keep "
                             "their extra keys). Written even when policies fail, before the "
                             "non-zero exit, so CI can publish it as an artifact.")
    args = parser.parse_args()
    start_time = time.monotonic()

    if args.target and args.policies:
        parser.error("pass either a positional target or --policies, not both.")

    if args.target:
        policies_search_root = Path("policies") / args.target
    else:
        policies_search_root = Path(args.policies) if args.policies else Path("policies")
    policies_base_root = normalize_policies_root(policies_search_root)

    pairs, malformed = discover_policies(policies_search_root)
    if not pairs and not malformed:
        print(f" No policies found under {policies_search_root}.")
        sys.exit(1)

    if args.verify_plan_cache:
        if malformed:
            print(f"[FAIL] {len(malformed)} malformed policy director(ies) — fix these first:")
            for policy_dir, reason in sorted(malformed):
                print(f"  {policy_dir}: {reason}")
            sys.exit(1)
        sys.exit(verify_plan_cache(pairs, args.verbose))

    # Resolve each policy's plan-cache path up front; only stand up the terraform
    # provider cache if at least one plan is missing (a fully-cached run needs no
    # terraform/provider at all).
    pair_cache = {(d, p): plan_cache_path(d) for d, p in pairs}
    for (directory, _), cache in pair_cache.items():
        adopt_denormalised_plan(directory, cache)
    misses = sum(1 for cp in pair_cache.values() if not is_committed_plan(cp))
    if misses:
        print(f"[*] {misses}/{len(pairs)} plan(s) not cached — ensuring terraform provider cache…")
        ensure_cache_ready()
    else:
        print(f"[*] all {len(pairs)} plan(s) cached — skipping terraform entirely")

    results = []

    # A half-built policy is a hard failure (it can never be tested).
    for policy_dir, reason in malformed:
        service, resource, attribute = extract_path_parts(policy_dir)
        results.append(make_failure(attribute, reason, service, resource))

    # Process pairs in parallel
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        # Submit all tasks
        future_to_pair = {
            executor.submit(run_policy_check_pair, policy_dir, policy_file, policies_base_root,
                            pair_cache[(policy_dir, policy_file)], args.verbose): (policy_dir, policy_file)
            for policy_dir, policy_file in pairs
        }

        # Collect results as they complete
        total = len(future_to_pair)
        done = passed = 0
        for future in as_completed(future_to_pair):
            policy_dir, policy_file = future_to_pair[future]
            try:
                result = future.result()
                results.append(result)
                if result.get("passed"):
                    passed += 1
            except Exception as exc:
                thread_safe_print(f"Error processing {policy_dir}: {exc}")
                service, resource, attribute = extract_path_parts(policy_dir)
                results.append(make_failure(attribute, f"Exception: {exc}", service, resource))
            done += 1
            if not args.verbose:
                with print_lock:
                    pct = 100.0 * done / total
                    print(f"\r[{pct:5.1f}%] {done}/{total}  ✅ {passed}  ❌ {done - passed}  "
                          f"{fmt_duration(time.monotonic() - start_time)}", end="", flush=True)
        if not args.verbose:
            print()  # newline after the progress line

    # Emit the machine-readable report BEFORE the failure exit below, so a run with
    # failing policies still writes the full report (including passed: false entries).
    # The exit code is unchanged — CI still fails the check on policy failures.
    if args.report:
        write_report(results, args.report)
        print(f"[*] wrote policy report ({len(results)} entries) to {args.report}")

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