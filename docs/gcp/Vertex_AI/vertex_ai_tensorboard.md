## 🛡️ Policy Deployment Engine: `vertex_ai_tensorboard`

This section provides a concise policy evaluation for the `vertex_ai_tensorboard` resource in GCP.

Reference: [Terraform Registry – vertex_ai_tensorboard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_tensorboard)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) User provided name of this Tensorboard.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of this Tensorboard.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_spec`
- Description: (Optional) Customer-managed encryption key spec for a Tensorboard. If set, this Tensorboard and all sub-resources of this Tensorboard will be secured by this key. Structure is [documented below](#nested_encryption_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels with user-defined metadata to organize your Tensorboards. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the tensorboard. eg us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_encryption_spec"></a>The `encryption_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Required) The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the resource is created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
