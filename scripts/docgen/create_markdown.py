import os
import json
import sys

# Paths
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(os.path.dirname(SCRIPT_DIR))  # two levels up to repo root
JSON_BASE_DIR = os.path.join(REPO_ROOT, "docs", "gcp")  # base dir containing service folders
OUTPUT_DIR = JSON_BASE_DIR  # markdown files will go next to resource_json folders

def validate_argument(details):
    """
    Validate and normalize argument fields.
    """
    # normalize 'required'
    if isinstance(details.get("required"), str):
        details["required"] = details["required"].lower() == "true"
    elif not isinstance(details.get("required"), bool):
        details["required"] = False

    # normalize 'security_impact' as boolean
    if isinstance(details.get("security_impact"), str):
        details["security_impact"] = details["security_impact"].lower() == "true"
    elif not isinstance(details.get("security_impact"), bool):
        details["security_impact"] = False

    # set defaults
    details.setdefault("rationale", "")
    details.setdefault("description", "")
    details.setdefault("compliant", "")
    details.setdefault("non-compliant", "")

def generate_top_level_table(args_dict, resource_name=None):
    """
    Generate the top-level table (parent=None). Show ALL arguments,
    including those with child arguments.
    """
    md = "| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |\n"
    md += "|----------|-------------|----------|-----------------|-----------|-----------|---------------|\n"

    for arg, details in args_dict.items():
        validate_argument(details)

        md += (
            f"| `{arg}` | {details['description']} | {str(details['required']).lower()} "
            f"| {str(details['security_impact']).lower()} | {details.get('rationale','')} "
            f"| {details['compliant']} | {details['non-compliant']} |\n"
        )

    return md

def generate_nested_blocks(args_dict, level=0, resource_name=None):
    """
    Generate nested blocks for any argument with 'arguments' defined.
    """
    md = ""
    indent = "  " * level

    for arg, details in args_dict.items():
        if "arguments" in details and details["arguments"]:
            # Create a block header
            md += f"\n### {indent}{arg} Block\n"
            # Table header
            md += (
                f"{indent}| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |\n"
            )
            md += (
                f"{indent}|----------|-------------|----------|-----------------|-----------|-----------|---------------|\n"
            )

            for sub_arg, sub_details in details["arguments"].items():
                validate_argument(sub_details)

                md += (
                    f"{indent}| `{sub_arg}` | {sub_details['description']} | {str(sub_details['required']).lower()} "
                    f"| {str(sub_details['security_impact']).lower()} | {sub_details.get('rationale','')} "
                    f"| {sub_details['compliant']} | {sub_details['non-compliant']} |\n"
                )

            # Recurse into deeper nested blocks
            md += generate_nested_blocks(details["arguments"], level=level + 1, resource_name=resource_name)

    return md

def generate_markdown_from_json(resource_json):
    resource_name = resource_json["resource_name"]
    registry_url = f"https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/{resource_name}"

    md = f"""## 🛡️ Policy Deployment Engine: `{resource_name}`

This section provides a concise policy evaluation for the `{resource_name}` resource in GCP.

Reference: [Terraform Registry – {resource_name}]({registry_url})

---

## Argument Reference
"""

    # 1️⃣ Top-level table
    md += generate_top_level_table(resource_json["arguments"], resource_name)

    # 2️⃣ Nested blocks for arguments that have 'arguments'
    md += generate_nested_blocks(resource_json["arguments"], resource_name=resource_name)

    return md

def main():
    if len(sys.argv) < 2:
        print("Usage: python create_markdown.py <service_name>")
        sys.exit(1)

    service_name = sys.argv[1]
    subcat_path = os.path.join(JSON_BASE_DIR, service_name)

    if not os.path.isdir(subcat_path):
        print(f"❌ Service '{service_name}' not found in {JSON_BASE_DIR}")
        sys.exit(1)

    resource_json_dir = os.path.join(subcat_path, "resource_json")
    if not os.path.isdir(resource_json_dir):
        print(f"❌ No resource_json directory found in {subcat_path}")
        sys.exit(1)

    for json_file in sorted(os.listdir(resource_json_dir)):
        if not json_file.endswith(".json"):
            continue

        json_path = os.path.join(resource_json_dir, json_file)
        with open(json_path, "r", encoding="utf-8") as f:
            resource_json = json.load(f)

        markdown_out = generate_markdown_from_json(resource_json)

        new_name = json_file.replace(".json", ".md")

        # Save markdown in the service folder (next to resource_json)
        md_path = os.path.join(subcat_path, new_name)
        with open(md_path, "w", encoding="utf-8") as out:
            out.write(markdown_out)

        print(f"✅ Markdown built for: {new_name}")

if __name__ == "__main__":
    main()
