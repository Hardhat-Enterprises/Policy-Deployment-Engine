# 🛠️ GCP Service Documentation Builder

This repository helps you generate **Markdown documentation** for GCP services (e.g., `alloydb`, `access_context_manager`, etc.) using JSON input files.

---

## 🚀 How to Document a New Service

### 1. Get Assigned a Service
The PDE Leadership team will assign you a GCP service to document (for example, `alloydb`).  
Do not proceed until you have an official assignment.

### 2. Edit the JSON Resource Definitions
A folder for your assigned service already exists at:
docs/gcp/<service_name>/resource_json

Inside this folder you will find one or more `.json` files, each representing a resource.  
Your task is to **edit the JSON values** to document the arguments properly.

Example: `docs/gcp/alloydb/resource_json/instance.json`

```json
{
  "resource_name": "google_alloydb_instance",
  "subcategory": "AlloyDB",
  "arguments": {
    "instance_id": {
      "description": "The ID of the instance.",
      "required": true,
      "security_impact": null,
      "rationale": null,
      "compliant": "Instance ID follows naming convention",
      "non-compliant": "Instance ID uses invalid characters",
      "parent": null
    },
    "display_name": {
      "description": "The display name of the instance.",
      "required": false,
      "security_impact": null,
      "rationale": null,
      "compliant": "Clear and descriptive name",
      "non-compliant": "Empty or misleading name",
      "parent": null
    }
  }
}
```

Each argument should include these keys:

- description — a clear explanation of the argument.

- required — boolean true or false.

- security_impact — descriptive string or null.

- rationale — explanation or null.

- compliant — what a compliant value looks like, or null.

- non-compliant — what a non-compliant value looks like, or null.

- parent — do not edit.

Nested arguments can be added under an "arguments" object for their parent.

## 🏗️ Generate Markdown Documentation

Once your JSON files are updated, run:

```bash
python3 scripts/docgen/create_markdown.py <service_name>
```

Example
```bash
python3 scripts/docgen/create_markdown.py alloydb
```

This will (automatically):
- Read all JSON files inside `docs/gcp/<service_name>/resource_json/`

- Generate corresponding `.md` files

- Save them in the `docs/gcp/<service_name>/ `folder (next to resource_json)

## ✅ Example Workflow

1. Get assigned `alloydb` from PDE Leadership.  
2. Open `docs/gcp/alloydb/resource_json/`.  
3. Edit `instance.json`, `cluster.json`, etc., filling in descriptions, compliant, and non-compliant values.  
4. Run:

```bash
python3 scripts/docgen/create_markdown.py alloydb
```
5. Review the generated `.md` files files in `docs/gcp/alloydb/`

## ⚠️ Notes & Best Practices

- **Do not create new folders** — the structure is already set up.  
- **JSON keys must match exactly** (`resource_name`, `arguments`, `description`, `required`, `security_impact`, `rationale`, `compliant`, `non-compliant`, `parent`).  
- **Booleans must be true/false** (not strings).  
- **Compliant / Non-compliant**: provide practical examples whenever possible.  
- **Nested arguments**: define them under a parent’s `"arguments"` key.  