## 🛡️ Policy Deployment Engine: `storage_insights_dataset_config`

This section provides a concise policy evaluation for the `storage_insights_dataset_config` resource in GCP.

Reference: [Terraform Registry – storage_insights_dataset_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_insights_dataset_config)

---

## 1. Argument Reference

### `retention_period_days`
- Description: (Required) Number of days of history that must be retained.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identity`
- Description: (Required) Identity used by DatasetConfig. Structure is [documented below](#nested_identity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the DatasetConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_config_id`
- Description: (Required) The user-defined ID of the DatasetConfig
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization_number`
- Description: (Optional) Organization resource ID that the source projects should belong to. Projects that do not belong to the provided organization are not considered when creating the dataset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_newly_created_buckets`
- Description: (Optional) If set to true, the request includes all the newly created buckets in the dataset that meet the inclusion and exclusion rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional user-provided description for the dataset configuration with a maximum length of 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_projects`
- Description: (Optional) Defines the options for providing source projects for the DatasetConfig. Structure is [documented below](#nested_source_projects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_folders`
- Description: (Optional) Defines the options for providing source folders for the DatasetConfig. Structure is [documented below](#nested_source_folders).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization_scope`
- Description: (Optional) Defines the options for providing a source organization for the DatasetConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_cloud_storage_locations`
- Description: (Optional) Defines the options for including cloud storage locations for the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_locations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_cloud_storage_locations`
- Description: (Optional) Defines the options for excluding cloud storage locations for the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_locations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_cloud_storage_buckets`
- Description: (Optional) Defines the options for including cloud storage buckets for the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_buckets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_cloud_storage_buckets`
- Description: (Optional) Defined the options for excluding cloud storage buckets for the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_buckets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `link_dataset`
- Description: Setting this field to true while creation will automatically link the created dataset as an additional functionality. -> **Note** A dataset config resource can only be destroyed once it is unlinked, so users must set this field to false to unlink the dataset and destroy the dataset config resource. <a name="nested_identity"></a>The `identity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Output) Name of the identity.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of identity to use for the DatasetConfig. Possible values are: `IDENTITY_TYPE_PER_CONFIG`, `IDENTITY_TYPE_PER_PROJECT`. <a name="nested_source_projects"></a>The `source_projects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_numbers`
- Description: (Optional) The list of project numbers to include in the DatasetConfig. <a name="nested_source_folders"></a>The `source_folders` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `folder_numbers`
- Description: (Optional) The list of folder numbers to include in the DatasetConfig. <a name="nested_include_cloud_storage_locations"></a>The `include_cloud_storage_locations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locations`
- Description: (Required) The list of cloud storage locations to include in the DatasetConfig. <a name="nested_exclude_cloud_storage_locations"></a>The `exclude_cloud_storage_locations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locations`
- Description: (Required) The list of cloud storage locations to exclude in the DatasetConfig. <a name="nested_include_cloud_storage_buckets"></a>The `include_cloud_storage_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_buckets`
- Description: (Required) The list of cloud storage buckets/bucket prefix regexes to include in the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_buckets_cloud_storage_buckets). <a name="nested_include_cloud_storage_buckets_cloud_storage_buckets"></a>The `cloud_storage_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name`
- Description: (Optional) The list of cloud storage bucket names to include in the DatasetConfig. Exactly one of the bucket_name and bucket_prefix_regex should be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_prefix_regex`
- Description: (Optional) The list of regex patterns for bucket names matching the regex. Regex should follow the syntax specified in google/re2 on GitHub. Exactly one of the bucket_name and bucket_prefix_regex should be specified. <a name="nested_exclude_cloud_storage_buckets"></a>The `exclude_cloud_storage_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_buckets`
- Description: (Required) The list of cloud storage buckets/bucket prefix regexes to exclude in the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_buckets_cloud_storage_buckets). <a name="nested_exclude_cloud_storage_buckets_cloud_storage_buckets"></a>The `cloud_storage_buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name`
- Description: (Optional) The list of cloud storage bucket names to exclude in the DatasetConfig. Exactly one of the bucket_name and bucket_prefix_regex should be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_prefix_regex`
- Description: (Optional) The list of regex patterns for bucket names matching the regex. Regex should follow the syntax specified in google/re2 on GitHub. Exactly one of the bucket_name and bucket_prefix_regex should be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
