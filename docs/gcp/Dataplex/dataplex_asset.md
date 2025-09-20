## 🛡️ Policy Deployment Engine: `dataplex_asset`

This section provides a concise policy evaluation for the `dataplex_asset` resource in GCP.

Reference: [Terraform Registry – dataplex_asset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_asset)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataplex_zone` | The zone for the resource | true | false | None | None | None |
| `discovery_spec` | Required. Specification of the discovery feature applied to data referenced by this asset. | true | false | None | None | None |
| `lake` | The lake for the resource | true | false | None | None | None |
| `location` | The location for the resource | true | false | None | None | None |
| `name` | The name of the asset. | true | false | None | None | None |
| `resource_spec` | Required. Immutable. Specification of the resource that is referenced by this asset. | true | false | None | None | None |
| `csv_options` |  | false | false | None | None | None |
| `json_options` |  | false | false | None | None | None |

### discovery_spec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `csv_options` | Optional. Configuration for CSV data. | false | false | None | None | None |
| `enabled` | Required. Whether discovery is enabled. | true | true | Discovery must be enabled for assets so data can be scanned and classified. | True | False |
| `exclude_patterns` | Optional. Patterns to exclude during discovery. | false | false | None | None | None |
| `include_patterns` | Optional. Patterns to include during discovery. | false | false | None | None | None |
| `json_options` | Optional. Configuration for Json data. | false | true | JSON options must be enabled to ensure correct schema inference for JSON files. | {"encoding": "UTF-8", "disable_type_inference": false} | Not set or wrong encoding |
| `schedule` | Optional. Cron schedule for running discovery periodically. | false | false | None | None | None |

### resource_spec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Immutable. Relative name of the cloud resource. | false | false | None | None | None |
| `read_access_mode` | Optional. Determines how read permissions are handled. | false | false | None | None | None |
| `type` | Required. Immutable. Type of resource. | true | true | Assets should only use approved resource types like STORAGE_BUCKET. | STORAGE_BUCKET | BIGQUERY_DATASET (if restricted) |
| `description` | Optional. Description of the asset. | false | false | None | None | None |
| `display_name` | Optional. User friendly display name. | false | false | None | None | None |
| `labels` | Optional. User defined labels for the asset. | false | true | Assets must have an 'owner' label for accountability. | {"owner": "analytics-team"} | {} or missing owner |
| `project` | The project for the resource | false | false | None | None | None |

### csv_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `delimiter` | Optional. The delimiter being used to separate values. | false | false | None | None | None |
| `disable_type_inference` | Optional. Whether to disable the inference of data type for CSV data. | false | false | None | None | None |
| `encoding` | Optional. The character encoding of the data. | false | false | None | None | None |
| `header_rows` | Optional. The number of rows to interpret as header rows. | false | false | None | None | None |

### json_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disable_type_inference` | Optional. Whether to disable the inference of data type for Json data. | false | false | None | None | None |
| `encoding` | Optional. The character encoding of the data. | false | false | None | None | None |
