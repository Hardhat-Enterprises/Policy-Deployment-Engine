import os
import sys
import subprocess
import argparse
import json
import re
import shutil
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor, as_completed
from threading import Lock


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


def make_failure(attribute: str, reason: str, service: str, resource: str) -> dict:
    return {"service": str(service), "resource": str(resource), "policy": str(attribute), "passed": False,
            "failure": {"reason": reason}}


def make_success(attribute: str, service: str, resource: str) -> dict:
    return {"service": str(service), "resource": str(resource), "policy": str(attribute), "passed": True}


def opa_eval_value(policies_root: Path, plan_json_path: Path, query: str):
    """Evaluate an OPA query and return the expression value from JSON output or None."""
    cmd = f'opa eval --data "{policies_root}" --input "{plan_json_path}" --format json "{query}"'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        thread_safe_print(f"❌ OPA eval failed for query: {query}")
        thread_safe_print(f"Command: {cmd}")
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


def parse_rego_metadata(policy_dir: Path):
    """Parse policy.rego to extract (package_path, vars_import_data_path).
    Returns a tuple (pkg_path, vars_import) or (None, None).
    """
    policy_file = policy_dir / "policy.rego"
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


def get_resource_type(policies_root: Path, plan_path: Path, vars_resource_type_query: str):
    return opa_eval_value(policies_root.resolve(), plan_path, vars_resource_type_query)


def normalize_messages(messages_value) -> list[str]:
    if isinstance(messages_value, list):
        return [str(m) for m in messages_value]
    if isinstance(messages_value, str):
        return [messages_value]
    if messages_value is not None:
        return [str(messages_value)]
    return []


def get_policy_messages(policies_root: Path, plan_path: Path, message_query: str) -> list[str]:
    val = opa_eval_value(policies_root.resolve(), plan_path, message_query)
    return normalize_messages(val)


def run_terraform_commands(input_dir: Path, verbose: bool = False) -> Path | None:
    env = os.environ.copy()

    creds_path = input_dir / "fake-creds.json"
    creds_content = '{"type": "service_account", "project_id": "fake-project"}'
    creds_path.write_text(creds_content)

    plugin_cache = Path.home() / ".terraform.d" / "plugin-cache"
    global_data_dir = Path(".tfshared").resolve()
    global_data_dir.mkdir(parents=True, exist_ok=True)
    
    env.update({
        'GOOGLE_APPLICATION_CREDENTIALS': str(creds_path),
        'GOOGLE_PROJECT': 'fake-project',
        'GOOGLE_REGION': 'us-central1',
        'TF_PLUGIN_CACHE_DIR': str(plugin_cache),
        'TF_DATA_DIR': str(global_data_dir),
    })

    commands = [
        ("terraform init -backend=false"),
        ("terraform plan -refresh=false -lock=false -input=false -out=plan"),
        ("terraform show -json plan | cat > plan.json")
    ]

    for cmd in commands:
        result = subprocess.run(
            cmd,
            shell=True,
            cwd=input_dir,
            capture_output=True,
            text=True,
            env=env
        )
        if result.returncode != 0:
            if verbose:
                print(f"❌ Command failed: {cmd}")
                print("--- stdout ---")
                print(result.stdout)
                print("--- stderr ---")
                print(result.stderr)
            return None

    plan_json = input_dir / "plan.json"
    return plan_json


def get_policy_metadata(policy_dir: Path, service: str, resource: str, attribute: str) -> tuple[str, str]:
    """Return (message_query, vars_resource_type_query)."""
    pkg_path, vars_import = parse_rego_metadata(policy_dir)
    if not pkg_path:
        pkg_path = f"terraform.gcp.security.{service}.{resource}.{attribute}"
    message_query = f"data.{pkg_path}.message"
    if vars_import:
        vars_resource_type_query = f"{vars_import}.variables.resource_type"
    else:
        vars_resource_type_query = f"data.terraform.gcp.security.{service}.{resource}.vars.variables.resource_type"
    return message_query, vars_resource_type_query


# Add a lock for thread-safe printing
print_lock = Lock()

def thread_safe_print(*args, **kwargs):
    """Thread-safe print function."""
    with print_lock:
        print(*args, **kwargs)


def validate_policy_output(attribute: str, resource_type: str | None, plan_path: Path, messages: list[str],
                           verbose: bool, service: str, resource: str) -> dict:
    unique_names = get_unique_resource_names(plan_path, str(resource_type))
    matched = match_names_in_messages(messages, unique_names)

    # Fail if any name other than 'nc*' appears
    nc_pattern = re.compile(r"^nc\d*$", re.IGNORECASE)
    non_nc_in_output = {n.strip() for n in matched if not nc_pattern.fullmatch(n)}
    if non_nc_in_output:
        thread_safe_print(f"Check failed: Resources in output other than 'nc' found: {', '.join(sorted(non_nc_in_output))}\n")
        return make_failure(attribute,
                            f"Resources in output other than 'nc' found: {', '.join(sorted(non_nc_in_output))}",
                            service, resource)

    # Ensure all resources are mentioned, except 'c*' which can be omitted
    missing = unique_names - matched
    ignore_pattern = re.compile(r"^c\d*$", re.IGNORECASE)
    missing_non_c = {n.strip() for n in missing if not ignore_pattern.fullmatch(n)}

    if verbose:
        rt = resource_type if resource_type else "any"
        thread_safe_print(f"Unique resource names in plan ({rt}): {len(unique_names)}")
        thread_safe_print(f"Names mentioned in output: {len(matched)}")
        if missing:
            thread_safe_print(f" Missing mentions: {', '.join(sorted(missing))}")

    if missing_non_c:
        if verbose:
            thread_safe_print(f"Check failed: Unmentioned resources other than 'c' found: {', '.join(sorted(missing_non_c))}\n")
        return make_failure(attribute,
                            f"Unmentioned resources other than 'c' found: {', '.join(sorted(missing_non_c))}", service,
                            resource)

    if missing and missing == {"c"} and verbose:
        thread_safe_print("Only compliant resources are unmentioned; ignoring")
    if verbose:
        thread_safe_print("Check passed\n")
    return make_success(attribute, service, resource)


def run_policy_check_pair(input_dir: Path, policy_dir: Path, policies_root: Path, verbose: bool = False):
    # Extract data about services and filesystem paths
    abs_input_dir = input_dir.resolve()
    service, resource, attribute = extract_path_parts(input_dir)
    # Runs TF commands and returns abs path to plan.json
    plan_path = run_terraform_commands(abs_input_dir, verbose)
    cleanup_workspace(abs_input_dir)

    if plan_path is None:
        res = make_failure(attribute, "Terraform failed to compile!", service, resource)
        return res

    message_query, vars_resource_type_query = get_policy_metadata(policy_dir, service, resource, attribute)

    resource_type = get_resource_type(policies_root, plan_path, vars_resource_type_query)
    if resource_type is None:
        # Get diagnostic info
        actual_types = get_all_resource_types(plan_path)
        diagnostics = [
            f"Query used: {vars_resource_type_query}",
            f"Resource types found in plan: {', '.join(actual_types) if actual_types else 'NONE'}",
            f"Plan file: {plan_path}"
        ]
        error_msg = "Could not find resource_type variable! " + " | ".join(diagnostics)
        res = make_failure(attribute, error_msg, service, resource)
        return res

    messages = get_policy_messages(policies_root, plan_path, message_query)
    if not messages:
        res = make_failure(attribute, "Could not run OPA query!", service, resource)
        return res

    if verbose:
        thread_safe_print(f"OPA check: {message_query}")
        for m in messages:
            thread_safe_print(m)
    
    res = validate_policy_output(attribute, resource_type, plan_path, messages, verbose, service, resource)
    return res

def cleanup_workspace(workdir: Path):
    # remove plan binary and other transient parts
    for fname in ["plan", "fake-creds.json"]:
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
            except Exception as e:
                pass

def find_matching_pairs(inputs_root: Path, policies_base_root: Path, policies_search_root: Path):
    """
    Find matching input/policy directory pairs.
    
    Args:
        inputs_root: Root directory for Terraform input files
        policies_base_root: The actual root containing _helpers (for OPA evaluation)
        policies_search_root: The user-provided policies root (for path matching)
    """
    def is_leaf_terraform_dir(directory: Path) -> bool:
        # Must have .tf in this directory
        if not any(f.suffix == ".tf" for f in directory.glob("*.tf")):
            return False
        # And no descendant directory with .tf files
        for tf in directory.rglob("*.tf"):
            if tf.parent != directory:
                return False
        return True

    input_dirs = [p for p in inputs_root.rglob('*') if p.is_dir() and is_leaf_terraform_dir(p)]
    pairs = []

    for input_dir in input_dirs:
        relative = input_dir.relative_to(inputs_root)
        policy_dir = policies_search_root / relative
        if policy_dir.is_dir():
            pairs.append((input_dir, policy_dir))
        else:
            print(f" No matching policy dir for: {input_dir}")
    return pairs


def main():
    parser = argparse.ArgumentParser(
        description="Run Terraform + OPA policy checks for all matched input/policy pairs.")
    parser.add_argument("--inputs", default="inputs/gcp", help="Root directory for Terraform inputs")
    parser.add_argument("--policies", default="policies/gcp", help="Root directory for policy files")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose output")
    parser.add_argument("--workers", type=int, default=4, help="Number of parallel workers (default: 4)")
    args = parser.parse_args()

    inputs_root = Path(args.inputs)
    policies_search_root = Path(args.policies)
    policies_base_root = normalize_policies_root(policies_search_root)

    pairs = find_matching_pairs(inputs_root, policies_base_root, policies_search_root)
    if not pairs:
        print(" No matching input/policy pairs found.")
        sys.exit(1)

    results = []
    failure_flag = False
    
    # Process pairs in parallel
    with ThreadPoolExecutor(max_workers=args.workers) as executor:
        # Submit all tasks
        future_to_pair = {
            executor.submit(run_policy_check_pair, input_dir, policy_dir, policies_base_root, args.verbose): (input_dir, policy_dir)
            for input_dir, policy_dir in pairs
        }
        
        # Collect results as they complete
        for future in as_completed(future_to_pair):
            input_dir, policy_dir = future_to_pair[future]
            try:
                result = future.result()
                results.append(result)
            except Exception as exc:
                thread_safe_print(f"Error processing {input_dir}: {exc}")
                service, resource, attribute = extract_path_parts(input_dir)
                results.append(make_failure(attribute, f"Exception: {exc}", service, resource))

    # Grouped summary by service -> resource
    grouped: dict[str, dict[str, list[dict]]] = {}
    for r in results:
        grouped.setdefault(r.get("service", "unknown"), {}).setdefault(r.get("resource", "unknown"), []).append(r)

    print("\nSummary of policy checks:")
    for service in sorted(grouped):
        print(f"Service: {service}")
        for resource in sorted(grouped[service]):
            print(f"  Resource: {resource}")
            for res in grouped[service][resource]:
                status = "✅" if res["passed"] else "❌"
                if not res["passed"]:
                    failure_flag = True
                print(f"    Policy: {res['policy']} - {status}")
        print()

    if failure_flag:
        print("\nFailures:")
        for service in sorted(grouped):
            for resource in sorted(grouped[service]):
                for res in grouped[service][resource]:
                    if not res["passed"]:
                        print(f"Service: {service} | Resource: {resource} | Policy: {res['policy']}")
                        print(f"{res['failure']['reason']}")
                        print()
        sys.exit(1)


if __name__ == "__main__":
    main()