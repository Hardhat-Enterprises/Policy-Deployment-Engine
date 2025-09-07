## 🛡️ Policy Deployment Engine: `kms_key_handle`

This section provides a concise policy evaluation for the `kms_key_handle` resource in GCP.

Reference: [Terraform Registry – kms_key_handle](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_handle)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name for the KeyHandle.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_type_selector`
- Description: (Required) Selector of the resource type where we want to protect resources. For example, `storage.googleapis.com/Bucket`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the KeyHandle. A full list of valid locations can be found by running `gcloud kms locations list`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
