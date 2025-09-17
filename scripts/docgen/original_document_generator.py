import os
import re
import json

# Paths
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
INPUT_DIR = "C:/Users/james/Downloads/terraform-provider-google/website/docs/r"
OUTPUT_DIR = os.path.join(REPO_ROOT, "docs", "gcp")
os.makedirs(OUTPUT_DIR, exist_ok=True)

MAX_SERVICES = 2000  # For testing


def _strip_leading_anchor(s: str) -> str:
    """
    Remove a leading <a ...></a> anchor if present on the line.
    """
    return re.sub(r'^\s*<a[^>]*></a>\s*', '', s)


def extract_arguments(lines, current_parent=None):
    """
    Parse markdown lines and return a nested dictionary for blocks/arguments.
    Adds 'parent' field to each argument for proper nesting.
    """
    args_dict = {}
    i = 0

    while i < len(lines):
        raw_line = lines[i]
        line = _strip_leading_anchor(raw_line).strip()

        # skip empty lines
        if not line:
            i += 1
            continue

        # Detect block start
        match_block = re.match(r"^The\s+`(.+?)`\s+block supports:", line, flags=re.I)
        if match_block:
            current_block = match_block.group(1)
            # collect lines belonging to this block
            i += 1
            block_lines = []
            while i < len(lines):
                next_raw = lines[i]
                next_stripped = _strip_leading_anchor(next_raw).strip()
                if re.match(r"^The\s+`(.+?)`\s+block supports:", next_stripped, flags=re.I):
                    break
                block_lines.append(next_raw)
                i += 1

            # Recursive call: parent = current block
            nested_args = extract_arguments(block_lines, current_parent=current_block)

            # attach nested args
            if current_block in args_dict:
                args_dict[current_block].setdefault("arguments", {})
                args_dict[current_block]["arguments"].update(nested_args)
            else:
                args_dict[current_block] = {
                    "description": "",
                    "required": None,
                    "security_impact": None,
                    "rationale": None,
                    "compliant": None,
                    "non-compliant": None,
                    "parent": current_parent,
                    "arguments": nested_args
                }
            continue

        # Detect an argument line: "* `name` -"
        match_arg = re.match(r"^\*\s+`([^`]+)`\s+-", line)
        if match_arg:
            arg_name = match_arg.group(1)
            desc_lines = []
            i += 1
            while i < len(lines):
                next_raw = lines[i]
                next_stripped = _strip_leading_anchor(next_raw).strip()
                if re.match(r"^\*\s+`([^`]+)`\s+-", next_stripped) or re.match(r"^The\s+`(.+?)`\s+block supports:", next_stripped, flags=re.I):
                    i -= 1
                    break
                if next_stripped:
                    desc_lines.append(next_stripped)
                i += 1

            full_desc = " ".join(desc_lines).strip()

            # Detect required/optional
            m = re.match(r'^\(?\s*(required|optional)\s*\)?[.:]?\s*', full_desc, flags=re.I)
            required_val = None
            if m:
                required_val = True if m.group(1).lower() == "required" else False
                full_desc = full_desc[m.end():].strip()

            args_dict[arg_name] = {
                "description": full_desc,
                "required": required_val,
                "security_impact": None,
                "rationale": None,
                "compliant": None,
                "non-compliant": None,
                "parent": current_parent
            }

        i += 1

    return args_dict



def build_json_object(resource_name, arg_lines, subcategory):
    resource_data = {
        "resource_name": resource_name,
        "subcategory": subcategory,
        "arguments": extract_arguments(arg_lines)
    }
    return resource_data


def get_subcategory(content):
    match = re.search(r'^subcategory:\s*"([^"]+)"', content, flags=re.MULTILINE)
    return match.group(1).strip() if match else "Uncategorized"


def main():
    processed_services = set()

    for filename in sorted(os.listdir(INPUT_DIR)):
        if not filename.endswith(".markdown"):
            continue

        service_name = filename.split("_")[0]
        if service_name not in processed_services:
            if len(processed_services) >= MAX_SERVICES:
                print(f"⏹️ Stopping after {MAX_SERVICES} services (test mode).")
                break
            processed_services.add(service_name)

        file_path = os.path.join(INPUT_DIR, filename)
        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()

        subcategory = get_subcategory(content)
        subcat_folder = subcategory.replace(" ", "_").lower()
        output_subdir = os.path.join(OUTPUT_DIR, subcat_folder, "resource_json")
        os.makedirs(output_subdir, exist_ok=True)  # now includes resource_json folder

        resource_name = filename.replace(".html.markdown", "")

        if "## Argument Reference" not in content:
            print(f"⚠️ Skipping {resource_name}: no 'Argument Reference' section found.")
            continue

        arg_ref = re.split(r"##\s+Argument Reference", content, flags=re.IGNORECASE)[1]
        arg_ref = re.split(r"##\s+Attributes Reference", arg_ref, flags=re.IGNORECASE)[0]

        arg_lines = arg_ref.splitlines()
        resource_json = build_json_object(resource_name, arg_lines, subcategory)

        json_output_path = os.path.join(output_subdir, f"{resource_name}.json")
        with open(json_output_path, "w", encoding="utf-8") as json_out:
            json.dump(resource_json, json_out, indent=2)

        print(f"✅ JSON written for: {resource_name} in subcategory: {subcategory}")


if __name__ == "__main__":
    main()
