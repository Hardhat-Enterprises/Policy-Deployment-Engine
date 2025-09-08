## 🛡️ Policy Deployment Engine: `storage_insights_dataset_config`

This section provides a concise policy evaluation for the `storage_insights_dataset_config` resource in GCP.

Reference: [Terraform Registry – storage_insights_dataset_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_insights_dataset_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `retention_period_days` | Number of days of history that must be retained. | true | None | None |
| `location` | The location of the DatasetConfig. | true | None | None |
| `dataset_config_id` | The user-defined ID of the DatasetConfig | true | None | None |
| `organization_number` | Organization resource ID that the source projects should belong to. Projects that do not belong to the provided organization are not considered when creating the dataset. | false | None | None |
| `include_newly_created_buckets` | If set to true, the request includes all the newly created buckets in the dataset that meet the inclusion and exclusion rules. | false | None | None |
| `description` | An optional user-provided description for the dataset configuration with a maximum length of 256 characters. | false | None | None |
| `organization_scope` | Defines the options for providing a source organization for the DatasetConfig. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `link_dataset` | Setting this field to true while creation will automatically link the created dataset as an additional functionality. -> **Note** A dataset config resource can only be destroyed once it is unlinked, so users must set this field to false to unlink the dataset and destroy the dataset config resource. | none | None | None |

### identity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | (Output) Name of the identity. | none | None | None |
| `type` | Type of identity to use for the DatasetConfig. Possible values are: `IDENTITY_TYPE_PER_CONFIG`, `IDENTITY_TYPE_PER_PROJECT`. | true | None | None |

### source_projects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_numbers` | The list of project numbers to include in the DatasetConfig. | false | None | None |

### source_folders Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `folder_numbers` | The list of folder numbers to include in the DatasetConfig. | false | None | None |

### include_cloud_storage_locations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `locations` | The list of cloud storage locations to include in the DatasetConfig. | true | None | None |

### exclude_cloud_storage_locations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `locations` | The list of cloud storage locations to exclude in the DatasetConfig. | true | None | None |

### include_cloud_storage_buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_storage_buckets` | The list of cloud storage buckets/bucket prefix regexes to include in the DatasetConfig. Structure is [documented below](#nested_include_cloud_storage_buckets_cloud_storage_buckets). | true | None | None |

### exclude_cloud_storage_buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_storage_buckets` | The list of cloud storage buckets/bucket prefix regexes to exclude in the DatasetConfig. Structure is [documented below](#nested_exclude_cloud_storage_buckets_cloud_storage_buckets). | true | None | None |

### cloud_storage_buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_name` | The list of cloud storage bucket names to exclude in the DatasetConfig. Exactly one of the bucket_name and bucket_prefix_regex should be specified. | false | None | None |
| `bucket_prefix_regex` | The list of regex patterns for bucket names matching the regex. Regex should follow the syntax specified in google/re2 on GitHub. Exactly one of the bucket_name and bucket_prefix_regex should be specified. | false | None | None |
