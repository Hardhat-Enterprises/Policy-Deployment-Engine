## 🛡️ Policy Deployment Engine: `dialogflow_encryption_spec`

This section provides a concise policy evaluation for the `dialogflow_encryption_spec` resource in GCP.

Reference: [Terraform Registry – dialogflow_encryption_spec](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_encryption_spec)

---

## 1. Argument Reference

### `encryption_spec`
- Description: (Required) A nested object resource. Structure is [documented below](#nested_encryption_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location in which the encryptionSpec is to be initialized.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_encryption_spec"></a>The `encryption_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Required) The name of customer-managed encryption key that is used to secure a resource and its sub-resources. If empty, the resource is secured by the default Google encryption key. Only the key in the same location as this resource is allowed to be used for encryption. Format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{key}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
