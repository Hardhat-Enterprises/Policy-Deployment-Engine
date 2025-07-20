import os
import argparse
import json
from pathlib import Path

def is_terraform_directory(directory: Path) -> bool:
    """Returns True if the directory contains at least one .tf file."""
    return any(f.suffix == ".tf" for f in directory.glob("*.tf"))

def find_input_policy_pairs(inputs_root: Path, policies_root: Path):
    pairs = []
    for input_dir in inputs_root.rglob("*"):
        if input_dir.is_dir() and is_terraform_directory(input_dir):
            relative_path = input_dir.relative_to(inputs_root)
            policy_dir = policies_root / relative_path
            if policy_dir.exists() and policy_dir.is_dir():
                pairs.append({
                    "input": str(input_dir),
                    "policy": str(policy_dir)
                })
            else:
                print(f"No matching policy directory for: {input_dir}")
    return pairs

def main():
    parser = argparse.ArgumentParser(description="Find matching Terraform input and OPA policy directories.")
    parser.add_argument("--inputs", required=True, help="Path to the root of Terraform input directories.")
    parser.add_argument("--policies", required=True, help="Path to the root of OPA policy directories.")
    args = parser.parse_args()

    inputs_root = Path(args.inputs).resolve()
    policies_root = Path(args.policies).resolve()

    if not inputs_root.is_dir() or not policies_root.is_dir():
        print("One or both of the provided paths are not valid directories.")
        exit(1)

    pairs = find_input_policy_pairs(inputs_root, policies_root)
    print(json.dumps(pairs))  # CI workflows will consume this

if __name__ == "__main__":
    main()