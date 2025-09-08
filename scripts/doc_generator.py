import os
import re
from collections import defaultdict

INPUT_DIR = "C:/Users/james/Downloads/terraform-provider-google/website/docs/r"
OUTPUT_DIR = "docs/gcp"
os.makedirs(OUTPUT_DIR, exist_ok=True)

def extract_arguments(content):
    sections = defaultdict(list)
    current_section = "root"
    lines = content.splitlines()
    i = 0

    while i < len(lines):
        line = lines[i].strip()

        match_block = re.match(r"^The\s+`(.+?)`\s+block supports:", line)
        if match_block:
            current_section = match_block.group(1)
            i += 1
            continue

        match_arg = re.match(r"^\*\s+`([^`]+)`\s+-", line)
        if match_arg:
            arg_name = match_arg.group(1)
            desc_lines = []

            i += 1
            while i < len(lines):
                next_line = lines[i].strip()
                if next_line.startswith("* `") or re.match(r"^The\s+`(.+?)`\s+block supports:", next_line):
                    i -= 1
                    break
                if next_line:
                    desc_lines.append(next_line)
                i += 1

            full_desc = " ".join(desc_lines).strip()
            sections[current_section].append((arg_name, full_desc))
        i += 1

    return sections

def generate_easy_markdown(resource_name, parsed_sections):
    title = resource_name.replace("_", " ").title()
    registry_url = f"https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/{resource_name}"

    md = f"""## 🛡️ Policy Deployment Engine: `{resource_name}`

This section provides a concise policy evaluation for the `{resource_name}` resource in GCP.

Reference: [Terraform Registry – {resource_name}]({registry_url})

---

## 1. Argument Reference
"""

    for arg, desc in parsed_sections.get("root", []):
        md += f"""\n### `{arg}`\n- Description: {desc}\n- Required: \n- Policy Condition?: \n- Decision / Rationale: \n"""

    for block_name, args in parsed_sections.items():
        if block_name == "root":
            continue
        md += f"""\n---\n\n## 2. `{block_name}` Block\n"""
        for arg, desc in args:
            md += f"""\n### `{arg}`\n- Description: {desc}\n- Required: \n- Policy Condition?: \n- Decision / Rationale: \n"""

    return md

def get_subcategory(content):
    # Simple regex to extract the subcategory value
    match = re.search(r'^subcategory:\s*"([^"]+)"', content, flags=re.MULTILINE)
    if match:
        return match.group(1).strip()
    return None


def main():
    for filename in os.listdir(INPUT_DIR):
        if filename.endswith(".markdown"):
            file_path = os.path.join(INPUT_DIR, filename)

            with open(file_path, "r", encoding="utf-8") as f:
                content = f.read()

            subcategory = get_subcategory(content) or "Uncategorized"
            # Make safe folder name by replacing spaces with underscores or similar
            subcat_folder = subcategory.replace(" ", "_")
            output_subdir = os.path.join(OUTPUT_DIR, subcat_folder)
            os.makedirs(output_subdir, exist_ok=True)

            resource_name = filename.replace(".html.markdown", "")

            if "## Argument Reference" not in content:
                print(f"⚠️ Skipping {resource_name}: no 'Argument Reference' section found.")
                continue

            arg_ref = re.split(r"##\s+Argument Reference", content, flags=re.IGNORECASE)[1]
            arg_ref = re.split(r"##\s+Attributes Reference", arg_ref, flags=re.IGNORECASE)[0]

            parsed_sections = extract_arguments(arg_ref)
            markdown_out = generate_easy_markdown(resource_name, parsed_sections)

            output_path = os.path.join(output_subdir, f"{resource_name}.md")
            with open(output_path, "w", encoding="utf-8") as out:
                out.write(markdown_out)

            print(f"✅ Generated editable markdown for: {resource_name} in subcategory: {subcategory}")


if __name__ == "__main__":
    main()
