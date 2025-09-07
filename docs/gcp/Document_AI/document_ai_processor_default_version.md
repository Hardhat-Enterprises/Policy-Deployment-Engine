## 🛡️ Policy Deployment Engine: `document_ai_processor_default_version`

This section provides a concise policy evaluation for the `document_ai_processor_default_version` resource in GCP.

Reference: [Terraform Registry – document_ai_processor_default_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_processor_default_version)

---

## 1. Argument Reference

### `version`
- Description: (Required) The version to set. Using `stable` or `rc` will cause the API to return the latest version in that release channel. Apply `lifecycle.ignore_changes` to the `version` field to suppress this diff.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `processor`
- Description: (Required) The processor to set the version on.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
