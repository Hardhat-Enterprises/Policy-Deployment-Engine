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


def get_unique_resource_names(plan_json_path: Path, resource_type: str | None, include_children: bool = True) -> set[str]:
    """Return the set of unique Terraform resource names for an optional type.
    If resource_type is None, collect names for all resources.
    When include_children is False, only consider resources in the root_module (this test dir).
    """
    try:
        data = json.loads(Path(plan_json_path).read_text(encoding="utf-8"))
    except Exception as e:
        print(f"Failed to read/parse JSON: {plan_json_path}: {e}")
        return set()

    names: set[str] = set()

    def add_if_match(res: dict):
        if not isinstance(res, dict):
            return
        if resource_type is None or res.get("type") == resource_type:
            name = res.get("name")
            if isinstance(name, str):
                names.add(name)

    def collect_from_module(module: dict):
        for res in module.get("resources", []) or []:
            add_if_match(res)
        if include_children:
            for child in module.get("child_modules", []) or []:
                if isinstance(child, dict):
                    collect_from_module(child)

    if isinstance(data, dict) and "planned_values" in data:
        root = data.get("planned_values", {}).get("root_module", {})
        if isinstance(root, dict):
            collect_from_module(root)
    elif isinstance(data, dict) and "resources" in data:
        # Non-standard shape, treat as a single module
        collect_from_module(data)
    elif isinstance(data, list):
        for res in data:
            add_if_match(res)

    return names


def count_unique_resource_names(plan_json_path: Path, resource_type: str) -> int:
    # Reuse the above helper for counting
    return len(get_unique_resource_names(plan_json_path, resource_type))


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


def run_policy_check_pair(input_dir: Path, policy_dir: Path, policies_root: Path, verbose: bool = False):
    abs_input_dir = input_dir.resolve()
    service, resource, attribute = extract_path_parts(input_dir)
    plan_path = abs_input_dir / "plan.json"
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
        result = subprocess.run(cmd, shell=True, cwd=str(abs_input_dir), capture_output=True, text=True, env=env)
        if result.returncode != 0:
            if verbose:
                print(f" Command failed: {cmd}")
                print(result.stdout)
                print(result.stderr)
            return {"policy": str(attribute), "passed": False}
    pkg_path, vars_import = parse_rego_metadata(policy_dir)
    if not pkg_path:
        pkg_path = f"terraform.gcp.security.{service}.{resource}.{attribute}"
    message_query = f"data.{pkg_path}.message"
    if vars_import:
        vars_resource_type_query = f"{vars_import}.variables.resource_type"
    else:
        vars_resource_type_query = f"data.terraform.gcp.security.{service}.{resource}.vars.variables.resource_type"
    policies_data_path = str(policies_root.resolve())
    resource_type = opa_eval_value(Path(policies_data_path), plan_path, vars_resource_type_query)
    messages_value = opa_eval_value(Path(policies_data_path), plan_path, message_query)
    messages: list[str] = []
    if isinstance(messages_value, list):
        messages = [str(m) for m in messages_value]
    elif isinstance(messages_value, str):
        messages = [messages_value]
    elif messages_value is not None:
        messages = [str(messages_value)]
    if verbose:
        print(f"OPA check: {message_query}")
        for m in messages:
            print(m)
    unique_names = get_unique_resource_names(plan_path, str(resource_type) if resource_type else None, include_children=False)
    matched = match_names_in_messages(messages, unique_names)
    missing = unique_names - matched
    ignore_pattern = re.compile(r"^c\d*$")
    missing_non_c = {n for n in missing if not ignore_pattern.fullmatch(n)}
    if verbose:
        print(f"Unique resource names in plan ({resource_type if resource_type else 'any'}): {len(unique_names)}")
        print(f"Names mentioned in output: {len(matched)}")
        if missing:
            print(f" Missing mentions: {', '.join(sorted(missing))}")
    if missing_non_c:
        if verbose:
            print(f"Check failed: Unmentioned resources other than 'c' found: {', '.join(sorted(missing_non_c))}")
        return {"policy": str(attribute), "passed": False}
    else:
        if missing and missing == {"c"} and verbose:
            print("Only compliant resources are unmentioned; ignoring")
        if verbose:
            print("Check passed\n")
        return {"policy": str(attribute), "passed": True}

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
    print("\nSummary of policy checks:")
    for res in results:
        if res["passed"]:
            status = "✅"
        else:
            status = "❌"
            failure_flag = True
        print(f"Policy: {res['policy']} - {status}")

    if failure_flag:
        sys.exit(1)

if __name__ == "__main__":
    main()