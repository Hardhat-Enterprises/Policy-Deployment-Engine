## 🛡️ Policy Deployment Engine: `vertex_ai_dataset`

This section provides a concise policy evaluation for the `vertex_ai_dataset` resource in GCP.

Reference: [Terraform Registry – vertex_ai_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_dataset)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The user-defined name of the Dataset. The name can be up to 128 characters long and can be consist of any UTF-8 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_schema_uri`
- Description: (Required) Points to a YAML file stored on Google Cloud Storage describing additional information about the Dataset. The schema is defined as an OpenAPI 3.0.2 Schema Object. The schema files that can be used here are found in gs://google-cloud-aiplatform/schema/dataset/metadata/.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A set of key/value label pairs to assign to this Workflow. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_spec`
- Description: (Optional) Customer-managed encryption key spec for a Dataset. If set, this Dataset and all sub-resources of this Dataset will be secured by this key. Structure is [documented below](#nested_encryption_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the dataset. eg us-central1
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
