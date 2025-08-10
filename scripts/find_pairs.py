import os
import sys
import subprocess
import argparse
import json
import re
from pathlib import Path

def run_command(cmd, desc=None, cwd=None, print_output=False):
    if desc:
        print(desc)
    result = subprocess.run(cmd, shell=True, cwd=cwd, capture_output=True, text=True)
    if result.returncode != 0:
        print(f" Command failed: {cmd}")
        print(result.stdout)
        print(result.stderr)
        sys.exit(result.returncode)
    if print_output:
        print(result.stdout)


def extract_path_parts(path: Path):
    if len(path.parts) < 3:
        sys.exit(f"Invalid path: {path}")
    return path.parts[-3], path.parts[-2], path.parts[-1]  # service, resource, attribute


def build_opa_command(service, resource, attribute, policies_dir, plan_path):
    query = f"data.terraform.gcp.security.{service}.{resource}.{attribute}.message"
    data_path = str(Path(policies_dir).resolve())
    return f'opa eval --data "{data_path}" --input "{plan_path}" --format pretty "{query}"', query


def opa_eval_value(policies_root: Path, plan_json_path: Path, query: str):
    """Evaluate an OPA query and return the expression value from JSON output, or None."""
    cmd = f'opa eval --data "{policies_root}" --input "{plan_json_path}" --format json "{query}"'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"❌ OPA eval failed: {query}")
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
        print(f"⚠️ Failed to parse OPA JSON output: {e}")
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


def extract_names_from_opa_output(messages: list[str] | None, details: object | None) -> set[str]:
    """Extract resource names from structured OPA details if available.
    Looks for common keys like name/resource_name/resource/address.
    """
    names: set[str] = set()
    if isinstance(details, list):
        for item in details:
            if isinstance(item, dict):
                for key in ("name", "resource_name", "resource", "address"):
                    v = item.get(key)
                    if isinstance(v, str):
                        names.add(v)
    elif isinstance(details, dict):
        # Sometimes details can be a dict with nested arrays
        for key in ("name", "resource_name", "resource", "address"):
            v = details.get(key)
            if isinstance(v, str):
                names.add(v)
    return names


def match_names_in_messages(messages: list[str], candidate_names: set[str]) -> set[str]:
    """Match candidate names within messages using safe token boundaries to avoid short-name false positives."""
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


def run_policy_check_pair(input_dir: Path, policy_dir: Path):
    print(f"\n Running policy check for: {input_dir}")
    root_dir = Path.cwd()
    abs_input_dir = input_dir.resolve()

    service, resource, attribute = extract_path_parts(input_dir)

    plan_path = abs_input_dir / "plan.json"
    # Use the root policies directory for OPA --data
    policies_root = Path(sys.argv[sys.argv.index('--policies') + 1]) if '--policies' in sys.argv else Path('policies/gcp')

    # 1) Terraform steps 
    tf_commands = [
            ("terraform init -backend=false -reconfigure", "▶ terraform init (no backend)"),
            ("terraform plan -refresh=false -input=false -out=plan", "▶ terraform plan (no refresh)"),
            ("terraform show -json plan > plan.json", "▶ terraform show"),
        ]
    for cmd, desc in tf_commands:
        run_command(cmd, desc, cwd=str(abs_input_dir))

    # 2) Build OPA queries from policy.rego metadata to avoid directory/package mismatches
    pkg_path, vars_import = parse_rego_metadata(policy_dir)
    if not pkg_path:
        # Fallback to directory-derived package path
        pkg_path = f"terraform.gcp.security.{service}.{resource}.{attribute}"
    message_query = f"data.{pkg_path}.message"
    details_query = f"data.{pkg_path}.details"

    if vars_import:
        vars_resource_type_query = f"{vars_import}.variables.resource_type"
    else:
        vars_resource_type_query = f"data.terraform.gcp.security.{service}.{resource}.vars.variables.resource_type"

    # 2a) OPA queries (JSON output for parsing)
    policies_data_path = str(policies_root.resolve())
    resource_type = opa_eval_value(Path(policies_data_path), plan_path, vars_resource_type_query)
    messages_value = opa_eval_value(Path(policies_data_path), plan_path, message_query)
    details_value = opa_eval_value(Path(policies_data_path), plan_path, details_query)

    # Normalize messages to a list of strings
    messages: list[str] = []
    if isinstance(messages_value, list):
        messages = [str(m) for m in messages_value]
    elif isinstance(messages_value, str):
        messages = [messages_value]
    elif messages_value is not None:
        messages = [str(messages_value)]

    print(f"▶ OPA check: {message_query}")
    for m in messages:
        print(m)

    # 3) Count unique resource names from plan.json limited to this policy's TF (root module only)
    unique_names = get_unique_resource_names(plan_path, str(resource_type) if resource_type else None, include_children=False)

    # Prefer names referenced in structured details; fallback to regex on messages
    names_in_output = extract_names_from_opa_output(messages, details_value)
    if names_in_output:
        matched = unique_names & names_in_output
    else:
        matched = match_names_in_messages(messages, unique_names)

    missing = unique_names - matched
    missing_non_c = {n for n in missing if n != "c"}

    print(f"🔢 Unique resource names in plan ({resource_type if resource_type else 'any'}): {len(unique_names)}")
    print(f"✅ Names mentioned in output: {len(matched)}")
    if missing:
        print(f"ℹ️ Missing mentions: {', '.join(sorted(missing))}")

    if missing_non_c:
        print(f"❌ Check failed: Unmentioned resources other than 'c' found: {', '.join(sorted(missing_non_c))}")
        sys.exit(1)
    else:
        if missing and missing == {"c"}:
            print("ℹ️ Only 'c' is unmentioned; ignoring as per rule")
        print("✅ Check passed\n")


def is_terraform_directory(directory: Path) -> bool:
    """Returns True if the directory contains at least one .tf file."""
    return any(f.suffix == ".tf" for f in directory.glob("*.tf"))

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
        print(f" Checking input dir: {input_dir} against policy dir: {policy_dir}")
        if policy_dir.is_dir():
            pairs.append((input_dir, policy_dir))
        else:
            print(f" No matching policy dir for: {input_dir}")

    return pairs

def main():
    parser = argparse.ArgumentParser(description="Run Terraform + OPA policy checks for all matched input/policy pairs.")
    parser.add_argument("--inputs", default="inputs/gcp", help="Root directory for Terraform inputs")
    parser.add_argument("--policies", default="policies/gcp", help="Root directory for policy files")
    args = parser.parse_args()

    inputs_root = Path(args.inputs)
    policies_root = Path(args.policies)

    pairs = find_matching_pairs(inputs_root, policies_root)
    if not pairs:
        print(" No matching input/policy pairs found.")
        sys.exit(1)

    for input_dir, policy_dir in pairs:
        run_policy_check_pair(input_dir, policy_dir)


if __name__ == "__main__":
    main()