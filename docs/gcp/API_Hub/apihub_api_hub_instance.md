## 🛡️ Policy Deployment Engine: `apihub_api_hub_instance`

This section provides a concise policy evaluation for the `apihub_api_hub_instance` resource in GCP.

Reference: [Terraform Registry – apihub_api_hub_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_api_hub_instance)

---

## 1. Argument Reference

### `config`
- Description: (Required) Available configurations to provision an ApiHub Instance. Structure is [documented below](#nested_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the ApiHub instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Instance labels to represent user-provided metadata. Refer to cloud documentation on labels for more details. https://cloud.google.com/compute/docs/labeling-resources **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_hub_instance_id`
- Description: (Optional) Optional. Identifier to assign to the Api Hub instance. Must be unique within scope of the parent resource. If the field is not provided, system generated id will be used. This value should be 4-40 characters, and valid characters are `/a-z[0-9]-_/`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_type`
- Description: (Optional) Optional. Encryption type for the region. If the encryption type is CMEK, the cmek_key_name must be provided. If no encryption type is provided, GMEK will be used. Possible values: ENCRYPTION_TYPE_UNSPECIFIED GMEK CMEK
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cmek_key_name`
- Description: (Optional) Optional. The Customer Managed Encryption Key (CMEK) used for data encryption. The CMEK name should follow the format of `projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+)`, where the location must match the instance location. If the CMEK is not provided, a GMEK will be created for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_search`
- Description: (Optional) Optional. If true, the search will be disabled for the instance. The default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vertex_location`
- Description: (Optional) Optional. The name of the Vertex AI location where the data store is stored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
