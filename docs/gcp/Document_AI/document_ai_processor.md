## 🛡️ Policy Deployment Engine: `document_ai_processor`

This section provides a concise policy evaluation for the `document_ai_processor` resource in GCP.

Reference: [Terraform Registry – document_ai_processor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/document_ai_processor)

---

## 1. Argument Reference

### `type`
- Description: (Required) The type of processor. For possible types see the [official list](https://cloud.google.com/document-ai/docs/reference/rest/v1/projects.locations/fetchProcessorTypes#google.cloud.documentai.v1.DocumentProcessorService.FetchProcessorTypes)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) The display name. Must be unique.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The KMS key used for encryption/decryption in CMEK scenarios. See https://cloud.google.com/security-key-management.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
