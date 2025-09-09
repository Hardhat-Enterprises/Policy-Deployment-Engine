import os
import sys
import subprocess
import argparse
import json
import re
from pathlib import Path

def extract_path_parts(path: Path):
    if len(path.parts) < 3:
        sys.exit(f"Invalid path: {path}")
    return path.parts[-3], path.parts[-2], path.parts[-1]  # service, resource, attribute

def make_failure(attribute: str, reason: str, service: str, resource: str) -> dict:
    return {"service": str(service), "resource": str(resource), "policy": str(attribute), "passed": False, "failure": {"reason": reason}}

def make_success(attribute: str, service: str, resource: str) -> dict:
    return {"service": str(service), "resource": str(resource), "policy": str(attribute), "passed": True}

def opa_eval_value(policies_root: Path, plan_json_path: Path, query: str):
    """Evaluate an OPA query and return the expression value from JSON output or None."""
    cmd = f'opa eval --data "{policies_root}" --input "{plan_json_path}" --format json "{query}"'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"OPA eval failed: {query}")
        print(result.stdout)
        print(result.stderr)
        return None
    try:
        payload = json.loads(result.stdout)
        res = payload.get("result")
        if not res:
            return None
        # Take first expression value
        exprs = res[0].get("expressions") if isinstance(res, list) and res else None
        if not exprs:
            return None
        return exprs[0].get("value")
    except Exception as e:
        print(f"Failed to parse OPA JSON output: {e}")
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
    env.update({
        'GOOGLE_CREDENTIALS': '{"type": "service_account", "project_id": "fake-project"}',
        'GOOGLE_PROJECT': 'fake-project',
        'GOOGLE_REGION': 'us-central1'
    })
    tf_commands = [
        ("terraform init -backend=false -reconfigure"),
        ("terraform plan -refresh=false -input=false -out=plan"),
        ("terraform show -json plan > plan.json"),
    ]
    for cmd in tf_commands:
        result = subprocess.run(cmd, shell=True, cwd=str(input_dir), capture_output=True, text=True, env=env)
        if result.returncode != 0:
            if verbose:
                print(f" Command failed: {cmd}")
                print(result.stdout)
                print(result.stderr)
            return None
    return input_dir / "plan.json"

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

def log_messages(verbose: bool, message_query: str, messages: list[str]) -> None:
    if not verbose:
        return
    print(f"OPA check: {message_query}")
    for m in messages:
        print(m)

def validate_policy_output(attribute: str, resource_type: str | None, plan_path: Path, messages: list[str], verbose: bool, service: str, resource: str) -> dict:
    unique_names = get_unique_resource_names(plan_path, str(resource_type))
    matched = match_names_in_messages(messages, unique_names)

    # Fail if any name other than 'nc*' appears
    nc_pattern = re.compile(r"^nc\d*$", re.IGNORECASE)
    non_nc_in_output = {n.strip() for n in matched if not nc_pattern.fullmatch(n)}
    if non_nc_in_output:
        print(f"Check failed: Resources in output other than 'nc' found: {', '.join(sorted(non_nc_in_output))}\n")
        return make_failure(attribute, f"Resources in output other than 'nc' found: {', '.join(sorted(non_nc_in_output))}", service, resource)

    # Ensure all resources are mentioned, except 'c*' which can be omitted
    missing = unique_names - matched
    ignore_pattern = re.compile(r"^c\d*$", re.IGNORECASE)
    missing_non_c = {n.strip() for n in missing if not ignore_pattern.fullmatch(n)}

    if verbose:
        rt = resource_type if resource_type else "any"
        print(f"Unique resource names in plan ({rt}): {len(unique_names)}")
        print(f"Names mentioned in output: {len(matched)}")
        if missing:
            print(f" Missing mentions: {', '.join(sorted(missing))}")

    if missing_non_c:
        if verbose:
            print(f"Check failed: Unmentioned resources other than 'c' found: {', '.join(sorted(missing_non_c))}\n")
        return make_failure(attribute, f"Unmentioned resources other than 'c' found: {', '.join(sorted(missing_non_c))}", service, resource)

    if missing and missing == {"c"} and verbose:
        print("Only compliant resources are unmentioned; ignoring")
    if verbose:
        print("Check passed\n")
    return make_success(attribute, service, resource)

def run_policy_check_pair(input_dir: Path, policy_dir: Path, policies_root: Path, verbose: bool = False):
    # Extract data about services and filesystem paths
    abs_input_dir = input_dir.resolve()
    service, resource, attribute = extract_path_parts(input_dir)
    # Runs TF commands and returns abs path to plan.json
    plan_path = run_terraform_commands(abs_input_dir, verbose)
    if plan_path is None:
        res = make_failure(attribute, "Terraform failed to compile!", service, resource)
        return res
    
    message_query, vars_resource_type_query = get_policy_metadata(policy_dir, service, resource, attribute)

    resource_type = get_resource_type(policies_root, plan_path, vars_resource_type_query)
    if resource_type is None:
        res = make_failure(attribute, "Could not find any resources!", service, resource)
        return res
    
    messages = get_policy_messages(policies_root, plan_path, message_query)
    if not messages:
        res = make_failure(attribute, "Could not run OPA query!", service, resource)
        return res
    
    log_messages(verbose, message_query, messages)
    res = validate_policy_output(attribute, resource_type, plan_path, messages, verbose, service, resource)
    return res

def find_matching_pairs(inputs_root: Path, policies_root: Path):
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
        policy_dir = policies_root / relative
        if policy_dir.is_dir():
            pairs.append((input_dir, policy_dir))
        else:
            print(f" No matching policy dir for: {input_dir}")

    return pairs

def main():
    parser = argparse.ArgumentParser(description="Run Terraform + OPA policy checks for all matched input/policy pairs.")
    parser.add_argument("--inputs", default="inputs/gcp", help="Root directory for Terraform inputs")
    parser.add_argument("--policies", default="policies/gcp", help="Root directory for policy files")
    parser.add_argument("--verbose", action="store_true", help="Enable verbose output")
    args = parser.parse_args()

    inputs_root = Path(args.inputs)
    policies_root = Path(args.policies)

    pairs = find_matching_pairs(inputs_root, policies_root)
    if not pairs:
        print(" No matching input/policy pairs found.")
        sys.exit(1)

    results = []
    failure_flag = False
    for input_dir, policy_dir in pairs:
        result = run_policy_check_pair(input_dir, policy_dir, policies_root, verbose=args.verbose)
        results.append(result)

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