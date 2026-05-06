## 🛡️ Policy Deployment Engine: `storage_insights_dataset_config`

This section provides a concise policy evaluation for the `storage_insights_dataset_config` resource in GCP.

Reference: [Terraform Registry – storage_insights_dataset_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_insights_dataset_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retention_period_days` | Number of days of history that must be retained. | true | true | Storage Insights history should be retained long enough to support monitoring, compliance review, and incident investigation. | 30 | 1 |
| `identity` | Identity used by DatasetConfig. Structure is [documented below](#nested_identity). | true | false | None | None | None |
| `location` | The location of the DatasetConfig. | true | true | DatasetConfig should be created only in approved Australian regions to meet location control requirements. | australia-southeast1 | europe-west8 |
| `dataset_config_id` | The user-defined ID of the DatasetConfig | true | false | None | None | None |
| `organization_number` | Organization resource ID that the source projects should belong to. Projects that do not belong to the provided organization are not considered when creating the dataset. | false | false | None | None | None |
| `include_newly_created_buckets` | If set to true, the request includes all the newly created buckets in the dataset that meet the inclusion and exclusion rules. | true | true | New buckets should be manually reviewed before being included in Storage Insights datasets. | False | True |
| `description` | An optional user-provided description for the dataset configuration with a maximum length of 256 characters. | false | false | None | None | None |
| `source_projects` | Defines the options for providing source projects for the DatasetConfig. Structure is [documented below](#nested_source_projects). | false | false | None | None | None |
| `source_folders` | Defines the options for providing source folders for the DatasetConfig. Structure is [documented below](#nested_source_folders). | false | false | None | None | None |
| `organization_scope` | Defines the options for providing a source organization for the DatasetConfig. | true | true | Organization scope should be disabled unless there is formal approval for organisation-wide monitoring. | False | True |
| `include_cloud_storage_locations` | Defines the options for including cloud storage locations for the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_locations). | false | false | None | None | None |
| `exclude_cloud_storage_locations` | Defines the options for excluding cloud storage locations for the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_locations). | false | false | None | None | None |
| `include_cloud_storage_buckets` | Defines the options for including cloud storage buckets for the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_buckets). | false | false | None | None | None |
| `exclude_cloud_storage_buckets` | Defined the options for excluding cloud storage buckets for the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_buckets). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `link_dataset` | Setting this field to true while creation will automatically link the created dataset as an additional functionality. -> **Note** A dataset config resource can only be destroyed once it is unlinked, so users must set this field to false to unlink the dataset and destroy the dataset config resource. | true | true | Dataset linking should be disabled by default and enabled only after approval. | False | True |
| `cloud_storage_buckets` |  | false | false | None | None | None |

### identity Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | (Output) Name of the identity. | false | false | None | None | None |
| `type` | Type of identity to use for the DatasetConfig. Possible values are: `IDENTITY_TYPE_PER_CONFIG`, `IDENTITY_TYPE_PER_PROJECT`. | true | true | A per-config identity supports better isolation and limits the risk of broad permissions being reused across configurations. | IDENTITY_TYPE_PER_CONFIG | IDENTITY_TYPE_PER_PROJECT |

### source_projects Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_numbers` | The list of project numbers to include in the DatasetConfig. | false | false | None | None | None |

### source_folders Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder_numbers` | The list of folder numbers to include in the DatasetConfig. | false | false | None | None | None |

### include_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | The list of cloud storage locations to include in the DatasetConfig. | true | true | Only approved Australian Cloud Storage locations should be included in the DatasetConfig. | australia-southeast1 | europe-west8 |

### exclude_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | The list of cloud storage locations to exclude in the DatasetConfig. | true | false | None | None | None |

### include_cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cloud_storage_buckets` | The list of cloud storage buckets/bucket prefix regexes to include in the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_buckets_cloud_storage_buckets). | true | false | None | None | None |

### exclude_cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cloud_storage_buckets` | The list of cloud storage buckets/bucket prefix regexes to exclude in the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_buckets_cloud_storage_buckets). | true | false | None | None | None |

### cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_name` | The list of cloud storage bucket names to exclude in the DatasetConfig. Exactly one of the bucket_name and bucket_prefix_regex should be specified. | false | false | None | None | None |
| `bucket_prefix_regex` | The list of regex patterns for bucket names matching the regex. Regex should follow the syntax specified in google/re2 on GitHub. Exactly one of the bucket_name and bucket_prefix_regex should be specified. | false | false | None | None | None |
