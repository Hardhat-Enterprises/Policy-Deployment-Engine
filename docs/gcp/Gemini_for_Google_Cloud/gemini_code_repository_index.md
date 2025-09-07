## 🛡️ Policy Deployment Engine: `gemini_code_repository_index`

This section provides a concise policy evaluation for the `gemini_code_repository_index` resource in GCP.

Reference: [Terraform Registry – gemini_code_repository_index](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_code_repository_index)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the Code Repository Index, for example `us-central1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code_repository_index_id`
- Description: (Required) Required. Id of the Code Repository Index.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) Optional. Immutable. Customer-managed encryption key name, in the format `projects/*/locations/*/keyRings/*/cryptoKeys/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_destroy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
