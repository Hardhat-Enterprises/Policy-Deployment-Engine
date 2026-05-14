## 🛡️ Policy Deployment Engine: `storage_insights_dataset_config`

This section provides a concise policy evaluation for the `storage_insights_dataset_config` resource in GCP.

Reference: [Terraform Registry – storage_insights_dataset_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_insights_dataset_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retention_period_days` | Number of days of history that must be retained. | false | false | This setting controls operational data retention duration and does not directly impact authentication, authorisation, or access security. | None | None |
| `identity` | Identity used by DatasetConfig. Structure is [documented below](#nested_identity). | true | true | Identity configuration affects how permissions and access are managed for the DatasetConfig resource. | None | None |
| `location` | The location of the DatasetConfig. | true | true | DatasetConfig should be created only in approved Australian regions to meet location control requirements. | australia-southeast1 | europe-west8 |
| `dataset_config_id` | The user-defined ID of the DatasetConfig | true | false | The dataset configuration ID is used only for identification purposes and does not affect security controls or permissions. | None | None |
| `organization_number` | Organization resource ID that the source projects should belong to. Projects that do not belong to the provided organization are not considered when creating the dataset. | false | false | This value is mainly used for organisational filtering and does not directly introduce a security risk. | None | None |
| `include_newly_created_buckets` | If set to true, the request includes all the newly created buckets in the dataset that meet the inclusion and exclusion rules. | true | true | New buckets should be manually reviewed before being included in Storage Insights datasets. | False | True |
| `description` | An optional user-provided description for the dataset configuration with a maximum length of 256 characters. | false | false | The description field is informational only and does not influence security behaviour or access management. | None | None |
| `source_projects` | Defines the options for providing source projects for the DatasetConfig. Structure is [documented below](#nested_source_projects). | false | false | Source project settings are used for selecting resources and do not directly enforce authentication or security controls. | None | None |
| `source_folders` | Defines the options for providing source folders for the DatasetConfig. Structure is [documented below](#nested_source_folders). | false | false | Source folder settings are mainly used for resource grouping and do not directly control authentication or security enforcement. | None | None |
| `organization_scope` | Defines the options for providing a source organization for the DatasetConfig. | true | true | Organization scope should be disabled unless there is formal approval for organisation-wide monitoring. | False | True |
| `include_cloud_storage_locations` | Defines the options for including cloud storage locations for the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_locations). | false | true | Cloud storage location selection can affect data residency, compliance, and regulatory requirements. | None | None |
| `exclude_cloud_storage_locations` | Defines the options for excluding cloud storage locations for the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_locations). | false | false | Excluded storage locations are mainly used for filtering resources and do not directly impact authentication or access control. | None | None |
| `include_cloud_storage_buckets` | Defines the options for including cloud storage buckets for the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_buckets). | false | false | Bucket inclusion settings are mainly used for selecting resources and do not directly modify authentication or access control policies. | None | None |
| `exclude_cloud_storage_buckets` | Defined the options for excluding cloud storage buckets for the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_buckets). | false | false | Bucket exclusion settings are mainly used for filtering resources and do not directly affect authentication or security controls. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | This argument specifies the project context only and does not directly introduce security risks or enforce security controls. | None | None |
| `link_dataset` | Setting this field to true while creation will automatically link the created dataset as an additional functionality. -> **Note** A dataset config resource can only be destroyed once it is unlinked, so users must set this field to false to unlink the dataset and destroy the dataset config resource. | true | true | Dataset linking should be disabled by default and enabled only after approval. | False | True |
| `cloud_storage_buckets` |  | false | false | Cloud storage bucket settings are mainly used for resource selection and filtering and do not directly affect authentication or security enforcement. | None | None |

### identity Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | (Output) Name of the identity. | false | false | The identity name is an informational output field and does not influence security policies or permissions. | None | None |
| `type` | Type of identity to use for the DatasetConfig. Possible values are: `IDENTITY_TYPE_PER_CONFIG`, `IDENTITY_TYPE_PER_PROJECT`. | true | true | A per-config identity supports better isolation and limits the risk of broad permissions being reused across configurations. | IDENTITY_TYPE_PER_CONFIG | IDENTITY_TYPE_PER_PROJECT |

### source_projects Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_numbers` | The list of project numbers to include in the DatasetConfig. | false | false | Project numbers are used for identifying source resources and do not directly impact security policies or access management. | None | None |

### source_folders Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `folder_numbers` | The list of folder numbers to include in the DatasetConfig. | false | false | Folder numbers are administrative identifiers used for selecting resources and do not directly affect security controls. | None | None |

### include_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | The list of cloud storage locations to include in the DatasetConfig. | true | true | Only approved Australian Cloud Storage locations should be included in the DatasetConfig. | australia-southeast1 | europe-west8 |

### exclude_cloud_storage_locations Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locations` | The list of cloud storage locations to exclude in the DatasetConfig. | true | false | This setting is used for filtering excluded storage locations and does not directly affect security enforcement or permissions. | None | None |

### include_cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cloud_storage_buckets` | The list of cloud storage buckets/bucket prefix regexes to include in the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_buckets_cloud_storage_buckets). | true | false | Included bucket settings are operational resource selection configurations and do not directly affect security enforcement. | None | None |

### exclude_cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cloud_storage_buckets` | The list of cloud storage buckets/bucket prefix regexes to exclude in the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_buckets_cloud_storage_buckets). | true | false | Excluded bucket configurations are operational filtering settings and do not directly impact permissions or security enforcement. | None | None |

### cloud_storage_buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_name` | The list of cloud storage bucket names to exclude in the DatasetConfig. Exactly one of the bucket_name and bucket_prefix_regex should be specified. | false | false | Bucket names are resource identifiers used for configuration purposes and do not directly impact access control or security policies. | None | None |
| `bucket_prefix_regex` | The list of regex patterns for bucket names matching the regex. Regex should follow the syntax specified in google/re2 on GitHub. Exactly one of the bucket_name and bucket_prefix_regex should be specified. | false | false | Regex patterns are used for bucket matching and filtering purposes and do not directly affect security controls or permissions. | None | None |
