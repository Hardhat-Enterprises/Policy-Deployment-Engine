# 🛠️ GCP Service Documentation Builder

This repository helps you generate **Markdown documentation** for GCP services (e.g., `vertex_ai`, `access_context_manager`, etc.) using JSON input files.

---

## 🚀 How to Document a New Service

### 1. Get Assigned a Service
The PDE Leadership team will assign you a GCP service to document (for example, `vertex_ai`).  
Do not proceed until you have an official assignment.

### 2. Edit the JSON Resource Definitions
A folder for your assigned service already exists at:
docs/gcp/<service_name>/resource_json

Inside this folder you will find one or more `.json` files, each representing a resource.  
Your task is to **edit the JSON values** to document the arguments properly.

Example: `docs/gcp/vertex_ai/resource_json/vertex_ai_dataset.json`

```json
{
  "resource_name": "vertex_ai_dataset",
  "subcategory": "Vertex AI",
  "arguments": {
    "display_name": {
      "description": "The user-defined name of the Dataset. The name can be up to 128 characters long and can be consist of any UTF-8 characters.",
      "required": true,
      "security_impact": false,
      "rationale": "Display Name has no impact on the security of the resource or data contained.",
      "compliant": null,
      "non-compliant": null,
      "parent": null
    },
    "encryption_spec": {
      "description": "Customer-managed encryption key spec for a Dataset. If set, this Dataset and all sub-resources of this Dataset will be secured by this key. Structure is [documented below](#nested_encryption_spec).",
      "required": false,
      "security_impact": true,
      "rationale": "Correct encryption standards on the VertexAI Dataset is critical to maintain confidentiality of the data.",
      "compliant": "Refer to child argument",
      "non-compliant": "refer to child argument",
      "parent": null,
      "arguments": {
        "kms_key_name": {
          "description": "Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the resource is created.",
          "required": false,
          "security_impact": true,
          "rationale": "The Encryption Key Name must be entered in the correct format to ensure encryption is matained on the dataset.",
          "compliant": "projects/my-project/locations/australia/keyRings/my-kr/cryptoKeys/my-key",
          "non-compliant": "projects/my-project/locations/us-east1/keyRings/my-kr/cryptoKeys/my-key",
          "parent": "encryption_spec"
        }
      }
    }
  }
}
```

Each argument should include these keys:

- description — a clear explanation of the argument.

- required — boolean `true` or `false`.

- security_impact — boolean `true` or `false`.

- rationale — explanation or null.

- compliant — what a compliant value looks like, or null.

- non-compliant — what a non-compliant value looks like, or null.

- parent — `do not edit.`

Nested arguments can be added under an "arguments" object for their parent.

## 🏗️ Generate Markdown Documentation

Once your JSON files are updated, run:

```bash
python3 scripts/docgen/create_markdown.py <service_name>
```

Example
```bash
python3 scripts/docgen/create_markdown.py vertex_ai
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