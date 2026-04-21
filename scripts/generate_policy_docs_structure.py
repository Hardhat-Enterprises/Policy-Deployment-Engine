#!/usr/bin/env python3
"""
Generate policy-level documentation folder structure.

This script scans the policies/ folder and creates matching docs/ folder structure
with placeholder .json and .md files for each policy.

Usage:
    python scripts/generate_policy_docs_structure.py --csp gcp [--dry-run]
"""

import argparse
import json
from pathlib import Path
from typing import List, Tuple


def find_policy_files(policies_root: Path) -> List[Path]:
    """Find all policy.rego files in the policies directory."""
    return list(policies_root.rglob("policy.rego"))


def get_policy_structure(policy_file: Path, policies_root: Path) -> Tuple[str, str, str]:
    """
    Extract service, resource, and policy_name from policy file path.

    Example:
        policies/gcp/firebase_app_check/google_firebase_app_check_device_check_config/token_ttl/policy.rego
        Returns: ('firebase_app_check', 'google_firebase_app_check_device_check_config', 'token_ttl')
    """
    relative_path = policy_file.parent.relative_to(policies_root)
    parts = relative_path.parts

    if len(parts) < 3:
        raise ValueError(f"Invalid policy path structure: {policy_file}")

    service = parts[0]
    resource = parts[1]
    policy_name = parts[2]

    return service, resource, policy_name


def create_policy_json_template(service: str, resource: str, policy_name: str) -> dict:
    """Create a template JSON structure for policy documentation."""
    return {
        "policy_name": policy_name,
        "resource_type": resource,
        "service": service,
        "description": f"Policy documentation for {policy_name}",
        "security_impact": True,
        "rationale": "TODO: Add rationale for this policy",
        "compliant_example": "TODO: Add compliant example",
        "non_compliant_example": "TODO: Add non-compliant example",
        "references": []
    }


def create_policy_md_template(service: str, resource: str, policy_name: str) -> str:
    """Create a template Markdown file for policy documentation."""
    return f"""# {policy_name.replace('_', ' ').title()} Policy

## Overview

This policy validates the `{policy_name}` attribute for `{resource}` resources.

## Service

**GCP Service:** {service.replace('_', ' ').title()}

## Resource Type

`{resource}`

## Policy Attribute

`{policy_name}`

## Security Rationale

TODO: Explain why this policy is important for security.

## Compliant Example

```hcl
# TODO: Add compliant Terraform configuration example
```

## Non-Compliant Example

```hcl
# TODO: Add non-compliant Terraform configuration example
```

## References

- TODO: Add relevant documentation links
- [GCP Documentation](https://cloud.google.com/docs)

## Testing

Test files are located in:
```
inputs/gcp/{service}/{resource}/{policy_name}/
├── c.tf      # Compliant test case
├── nc.tf     # Non-compliant test case
└── config.tf # Provider configuration
```

## Policy Implementation

Policy file: `policies/gcp/{service}/{resource}/{policy_name}/policy.rego`
"""


def create_docs_structure(
    policies_root: Path,
    docs_root: Path,
    csp: str,
    dry_run: bool = True
) -> Tuple[int, int]:
    """
    Create docs folder structure matching policies folder.

    Returns:
        Tuple of (folders_created, files_created)
    """
    policy_files = find_policy_files(policies_root)

    folders_created = 0
    files_created = 0

    print(f"Found {len(policy_files)} policy files to process")
    print(f"Mode: {'DRY RUN' if dry_run else 'WRITING FILES'}")
    print()

    for policy_file in policy_files:
        try:
            service, resource, policy_name = get_policy_structure(policy_file, policies_root)

            # Create docs folder path
            policy_docs_dir = docs_root / service.replace('_', ' ').title().replace(' ', '_') / resource / policy_name

            if dry_run:
                print(f"Would create: {policy_docs_dir}")
            else:
                policy_docs_dir.mkdir(parents=True, exist_ok=True)
                folders_created += 1

            # Create JSON file
            json_file = policy_docs_dir / f"{policy_name}.json"
            json_content = create_policy_json_template(service, resource, policy_name)

            if dry_run:
                print(f"  Would create: {json_file.name}")
            else:
                if not json_file.exists():  # Don't overwrite existing files
                    json_file.write_text(json.dumps(json_content, indent=2), encoding='utf-8')
                    files_created += 1
                else:
                    print(f"  Skipping existing: {json_file}")

            # Create MD file
            md_file = policy_docs_dir / f"{policy_name}.md"
            md_content = create_policy_md_template(service, resource, policy_name)

            if dry_run:
                print(f"  Would create: {md_file.name}")
            else:
                if not md_file.exists():  # Don't overwrite existing files
                    md_file.write_text(md_content, encoding='utf-8')
                    files_created += 1
                else:
                    print(f"  Skipping existing: {md_file}")

            if dry_run:
                print()

        except Exception as e:
            print(f"Error processing {policy_file}: {e}")
            continue

    return folders_created, files_created


def main():
    parser = argparse.ArgumentParser(
        description="Generate policy-level documentation folder structure"
    )
    parser.add_argument(
        "--csp",
        choices=["gcp", "aws", "azure"],
        required=True,
        help="Cloud service provider"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        default=True,
        help="Dry run mode - don't create files (default: True)"
    )
    parser.add_argument(
        "--no-dry-run",
        action="store_false",
        dest="dry_run",
        help="Actually create files and folders"
    )
    parser.add_argument(
        "--policies-root",
        type=Path,
        default=Path("policies"),
        help="Root directory for policies (default: policies)"
    )
    parser.add_argument(
        "--docs-root",
        type=Path,
        default=Path("docs"),
        help="Root directory for docs (default: docs)"
    )

    args = parser.parse_args()

    # Set up paths
    policies_root = args.policies_root / args.csp
    docs_root = args.docs_root / args.csp

    if not policies_root.exists():
        print(f"Error: Policies root does not exist: {policies_root}")
        return 1

    # Create docs structure
    folders_created, files_created = create_docs_structure(
        policies_root,
        docs_root,
        args.csp,
        args.dry_run
    )

    print()
    print("=" * 60)
    if args.dry_run:
        print("DRY RUN COMPLETE")
        print(f"Would create {folders_created} folders and {files_created} files")
        print()
        print("Run with --no-dry-run to actually create the files")
    else:
        print("COMPLETE")
        print(f"Created {folders_created} folders and {files_created} files")
    print("=" * 60)

    return 0


if __name__ == "__main__":
    exit(main())
