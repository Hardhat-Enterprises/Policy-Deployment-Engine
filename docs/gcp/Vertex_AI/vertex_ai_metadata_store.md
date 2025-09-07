## 🛡️ Policy Deployment Engine: `vertex_ai_metadata_store`

This section provides a concise policy evaluation for the `vertex_ai_metadata_store` resource in GCP.

Reference: [Terraform Registry – vertex_ai_metadata_store](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_metadata_store)

---

## 1. Argument Reference

### `name`
- Description: (Optional) The name of the MetadataStore. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the MetadataStore.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_spec`
- Description: (Optional) Customer-managed encryption key spec for a MetadataStore. If set, this MetadataStore and all sub-resources of this MetadataStore will be secured by this key. Structure is [documented below](#nested_encryption_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the Metadata Store. eg us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_encryption_spec"></a>The `encryption_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) Required. The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the resource is created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
