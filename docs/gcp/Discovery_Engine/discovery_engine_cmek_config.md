## 🛡️ Policy Deployment Engine: `discovery_engine_cmek_config`

This section provides a concise policy evaluation for the `discovery_engine_cmek_config` resource in GCP.

Reference: [Terraform Registry – discovery_engine_cmek_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_cmek_config)

---

## 1. Argument Reference

### `kms_key`
- Description: (Required) KMS key resource name which will be used to encrypt resources `projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{keyId}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The geographic location where the CMEK config should reside. The value can only be one of "us" and "eu".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `single_region_keys`
- Description: (Optional) Single-regional CMEKs that are required for some VAIS features. Structure is [documented below](#nested_single_region_keys).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cmek_config_id`
- Description: (Optional) The unique id of the cmek config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `set_default`
- Description: (Optional) Set the following CmekConfig as the default to be used for child resources if one is not specified. The default value is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_single_region_keys"></a>The `single_region_keys` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Required) Single-regional kms key resource name which will be used to encrypt resources `projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{keyId}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
