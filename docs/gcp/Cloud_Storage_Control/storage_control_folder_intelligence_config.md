## 🛡️ Policy Deployment Engine: `storage_control_folder_intelligence_config`

This section provides a concise policy evaluation for the `storage_control_folder_intelligence_config` resource in GCP.

Reference: [Terraform Registry – storage_control_folder_intelligence_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_control_folder_intelligence_config)

---

## 1. Argument Reference

### `name`
- Description: (Required) Identifier of the GCP Folder. For GCP Folder, this field can be folder number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edition_config`
- Description: (Optional) Edition configuration of the Storage Intelligence resource. Valid values are INHERIT, TRIAL, DISABLED and STANDARD.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Optional) Filter over location and bucket using include or exclude semantics. Resources that match the include or exclude filter are exclusively included or excluded from the Storage Intelligence plan. Structure is [documented below](#nested_filter). <a name="nested_filter"></a>The `filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_cloud_storage_buckets`
- Description: (Optional) Buckets to exclude from the Storage Intelligence plan. Structure is [documented below](#nested_filter_excluded_cloud_storage_buckets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_cloud_storage_buckets`
- Description: (Optional) Buckets to include in the Storage Intelligence plan. Structure is [documented below](#nested_filter_included_cloud_storage_buckets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_cloud_storage_locations`
- Description: (Optional) Locations to exclude from the Storage Intelligence plan. Structure is [documented below](#nested_filter_excluded_cloud_storage_locations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_cloud_storage_locations`
- Description: (Optional) Locations to include in the Storage Intelligence plan. Structure is [documented below](#nested_filter_included_cloud_storage_locations). <a name="nested_filter_excluded_cloud_storage_buckets"></a>The `excluded_cloud_storage_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_id_regexes`
- Description: (Required) List of bucket id regexes to exclude in the storage intelligence plan. <a name="nested_filter_included_cloud_storage_buckets"></a>The `included_cloud_storage_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_id_regexes`
- Description: (Required) List of bucket id regexes to exclude in the storage intelligence plan. <a name="nested_filter_excluded_cloud_storage_locations"></a>The `excluded_cloud_storage_locations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locations`
- Description: (Required) List of locations. <a name="nested_filter_included_cloud_storage_locations"></a>The `included_cloud_storage_locations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locations`
- Description: (Required) List of locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
