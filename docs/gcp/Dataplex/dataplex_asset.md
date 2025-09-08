## 🛡️ Policy Deployment Engine: `dataplex_asset`

This section provides a concise policy evaluation for the `dataplex_asset` resource in GCP.

Reference: [Terraform Registry – dataplex_asset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_asset)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataplex_zone` | The zone for the resource | true | None | None |
| `lake` | The lake for the resource | true | None | None |
| `location` | The location for the resource | true | None | None |
| `name` | The name of the asset. | true | None | None |

### discovery_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `csv_options` | Optional. Configuration for CSV data. | false | None | None |
| `enabled` | Required. Whether discovery is enabled. | true | None | None |
| `exclude_patterns` | Optional. The list of patterns to apply for selecting data to exclude during discovery. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names. | false | None | None |
| `include_patterns` | Optional. The list of patterns to apply for selecting data to include during discovery if only a subset of the data should considered. For Cloud Storage bucket assets, these are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these are interpreted as patterns to match table names. | false | None | None |
| `json_options` | Optional. Configuration for Json data. | false | None | None |
| `schedule` | Optional. Cron schedule (https://en.wikipedia.org/wiki/Cron) for running discovery periodically. Successive discovery runs must be scheduled at least 60 minutes apart. The default value is to run discovery every 60 minutes. To explicitly set a timezone to the cron tab, apply a prefix in the cron tab: "CRON_TZ=${IANA_TIME_ZONE}" or TZ=${IANA_TIME_ZONE}". The ${IANA_TIME_ZONE} may only be a valid string from IANA time zone database. For example, "CRON_TZ=America/New_York 1 * * * *", or "TZ=America/New_York 1 * * * *". | false | None | None |

### resource_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Immutable. Relative name of the cloud resource that contains the data that is being managed within a lake. For example: `projects/{project_number}/buckets/{bucket_id}` `projects/{project_number}/datasets/{dataset_id}` | false | None | None |
| `read_access_mode` | Optional. Determines how read permissions are handled for each asset and their associated tables. Only available to storage buckets assets. Possible values: DIRECT, MANAGED | false | None | None |
| `type` | Required. Immutable. Type of resource. Possible values: STORAGE_BUCKET, BIGQUERY_DATASET - - - | true | None | None |
| `description` | Optional. Description of the asset. | false | None | None |
| `display_name` | Optional. User friendly display name. | false | None | None |
| `labels` | Optional. User defined labels for the asset. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | The project for the resource | false | None | None |

### csv_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `delimiter` | Optional. The delimiter being used to separate values. This defaults to ','. | false | None | None |
| `disable_type_inference` | Optional. Whether to disable the inference of data type for CSV data. If true, all columns will be registered as strings. | false | None | None |
| `encoding` | Optional. The character encoding of the data. The default is UTF-8. | false | None | None |
| `header_rows` | Optional. The number of rows to interpret as header rows that should be skipped when reading data rows. | false | None | None |

### json_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disable_type_inference` | Optional. Whether to disable the inference of data type for Json data. If true, all columns will be registered as their primitive types (strings, number or boolean). | false | None | None |
| `encoding` | Optional. The character encoding of the data. The default is UTF-8. | false | None | None |
