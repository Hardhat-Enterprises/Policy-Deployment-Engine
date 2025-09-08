import os
import json

# Paths
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
JSON_BASE_DIR = os.path.join(REPO_ROOT, "docs", "gcp")  # base dir containing subcategories
OUTPUT_DIR = JSON_BASE_DIR  # markdown files will go next to resource_json folders

BOOLEAN_OPTIONS = ["true", "false"]


def validate_argument(arg_name, arg_details):
    """
    Validate argument values and default invalid or missing fields.
    """
    mandatory = arg_details.get("required")
    security_impact = arg_details.get("security_impact")

    if mandatory not in BOOLEAN_OPTIONS:
        arg_details["required"] = False
    if security_impact not in BOOLEAN_OPTIONS:
        arg_details["security_impact"] = "none"


def generate_top_level_table(args_dict, resource_name=None):
    """
    Generate the top-level table only (parent=None), skipping any argument that has child arguments.
    """
    md = "| Argument | Description | Mandatory | Security Impact | Rationale |\n"
    md += "|----------|------------|-----------|----------------|-----------|\n"

    for arg, details in args_dict.items():
        # Skip arguments that have nested arguments
        if "arguments" in details and details["arguments"]:
            if resource_name == "access_context_manager_access_level_condition":
                print(f"[DEBUG] Skipping top-level Arg with children: '{arg}'", flush=True)
            continue

        details.setdefault("required", False)
        details.setdefault("security_impact", "none")
        details.setdefault("decision_rationale", "")
        details.setdefault("description", "")

        if resource_name == "access_context_manager_access_level_condition":
            print(f"[DEBUG] Top-level Arg: '{arg}', Parent: '{details.get('parent')}'", flush=True)

        md += f"| `{arg}` | {details['description']} | {str(details['required']).lower()} | {details['security_impact']} | {details['decision_rationale']} |\n"

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
            md += f"{indent}| Argument | Description | Mandatory | Security Impact | Rationale |\n"
            md += f"{indent}|----------|------------|-----------|----------------|-----------|\n"

            for sub_arg, sub_details in details["arguments"].items():
                sub_details.setdefault("required", False)
                sub_details.setdefault("security_impact", "none")
                sub_details.setdefault("decision_rationale", "")
                sub_details.setdefault("description", "")

                if resource_name == "access_context_manager_access_level_condition":
                    print(f"[DEBUG] Nested Arg: '{sub_arg}', Parent: '{sub_details.get('parent')}', Block: '{arg}'", flush=True)

                md += f"{indent}| `{sub_arg}` | {sub_details['description']} | {str(sub_details['required']).lower()} | {sub_details['security_impact']} | {sub_details['decision_rationale']} |\n"

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
    # Walk subcategory folders
    for subcat_name in sorted(os.listdir(JSON_BASE_DIR)):
        subcat_path = os.path.join(JSON_BASE_DIR, subcat_name)
        if not os.path.isdir(subcat_path):
            continue

        resource_json_dir = os.path.join(subcat_path, "resource_json")
        if not os.path.isdir(resource_json_dir):
            continue

        for json_file in sorted(os.listdir(resource_json_dir)):
            if not json_file.endswith(".json"):
                continue

            json_path = os.path.join(resource_json_dir, json_file)
            with open(json_path, "r", encoding="utf-8") as f:
                resource_json = json.load(f)

            markdown_out = generate_markdown_from_json(resource_json)

            # Save markdown in the subcategory folder (next to resource_json)
            md_path = os.path.join(subcat_path, json_file.replace(".json", ".md"))
            with open(md_path, "w", encoding="utf-8") as out:
                out.write(markdown_out)

            print(f"✅ Markdown built for: {md_path}")


if __name__ == "__main__":
    main()
