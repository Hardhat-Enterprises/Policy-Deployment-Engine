## 🛡️ Policy Deployment Engine: `vertex_ai_featurestore`

This section provides a concise policy evaluation for the `vertex_ai_featurestore` resource in GCP.

Reference: [Terraform Registry – vertex_ai_featurestore](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vertex_ai_featurestore)

---

## 1. Argument Reference

### `name`
- Description: (Optional) The name of the Featurestore. This value may be up to 60 characters, and valid characters are [a-z0-9_]. The first character cannot be a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A set of key/value label pairs to assign to this Featurestore. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `online_serving_config`
- Description: (Optional) Config for online serving resources. Structure is [documented below](#nested_online_serving_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `online_storage_ttl_days`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) TTL in days for feature values that will be stored in online serving storage. The Feature Store online storage periodically removes obsolete feature values older than onlineStorageTtlDays since the feature generation time. Note that onlineStorageTtlDays should be less than or equal to offlineStorageTtlDays for each EntityType under a featurestore. If not set, default to 4000 days
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_spec`
- Description: (Optional) If set, both of the online and offline data storage will be secured by this key. Structure is [documented below](#nested_encryption_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the dataset. eg us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_destroy`
- Description: <a name="nested_online_serving_config"></a>The `online_serving_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_node_count`
- Description: (Optional) The number of nodes for each cluster. The number of nodes will not scale automatically but can be scaled manually by providing different values when updating.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scaling`
- Description: (Optional) Online serving scaling configuration. Only one of fixedNodeCount and scaling can be set. Setting one will reset the other. Structure is [documented below](#nested_online_serving_config_scaling). <a name="nested_online_serving_config_scaling"></a>The `scaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_node_count`
- Description: (Required) The minimum number of nodes to scale down to. Must be greater than or equal to 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_node_count`
- Description: (Required) The maximum number of nodes to scale up to. Must be greater than minNodeCount, and less than or equal to 10 times of 'minNodeCount'. <a name="nested_encryption_spec"></a>The `encryption_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Required) The Cloud KMS resource identifier of the customer managed encryption key used to protect a resource. Has the form: projects/my-project/locations/my-region/keyRings/my-kr/cryptoKeys/my-key. The key needs to be in the same region as where the compute resource is created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
