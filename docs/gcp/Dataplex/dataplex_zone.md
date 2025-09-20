## 🛡️ Policy Deployment Engine: `dataplex_zone`

This section provides a concise policy evaluation for the `dataplex_zone` resource in GCP.

Reference: [Terraform Registry – dataplex_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_zone)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `discovery_spec` | Required. Specification of the discovery feature applied to data in this zone. | true | false | None | None | None |
| `lake` | The lake for the resource | true | false | None | None | None |
| `location` | The location for the resource | true | false | None | None | None |
| `name` | The name of the zone. | true | false | None | None | None |
| `resource_spec` | Required. Immutable. Specification of the resources that are referenced by the assets within this zone. | true | false | None | None | None |
| `type` | Required. Immutable. The type of the zone. | true | true | Zones must only be RAW or CURATED to ensure proper governance classification. | RAW or CURATED | TYPE_UNSPECIFIED or custom values |
| `csv_options` |  | false | false | None | None | None |
| `json_options` |  | false | false | None | None | None |

### discovery_spec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `csv_options` | Optional. Configuration for CSV data. | false | false | None | None | None |
| `enabled` | Required. Whether discovery is enabled. | true | true | Discovery must be enabled to ensure visibility and schema detection. | True | False |
| `exclude_patterns` | Optional. The list of patterns to apply for selecting data to exclude during discovery. | false | false | None | None | None |
| `include_patterns` | Optional. The list of patterns to apply for selecting data to include during discovery. | false | false | None | None | None |
| `json_options` | Optional. Configuration for Json data. | false | false | None | None | None |
| `schedule` | Optional. Cron schedule for running discovery periodically. | false | false | None | None | None |

### resource_spec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location_type` | Required. Immutable. The location type of the resources that are allowed. | true | true | Restricting to SINGLE_REGION enforces data residency and compliance. | SINGLE_REGION | MULTI_REGION |
| `description` | Optional. Description of the zone. | false | false | None | None | None |
| `display_name` | Optional. User friendly display name. | false | false | None | None | None |
| `labels` | Optional. User defined labels for the zone. | false | true | Zones must have an 'owner' label for accountability. | {"owner": "platform-team"} | {} or missing 'owner' |
| `project` | The project for the resource | false | false | None | None | None |

### csv_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `delimiter` | Optional. The delimiter being used to separate values. | false | false | None | None | None |
| `disable_type_inference` | Optional. Whether to disable the inference of data type. | false | false | None | None | None |
| `encoding` | Optional. The character encoding of the data. | false | false | None | None | None |
| `header_rows` | Optional. The number of rows to interpret as header rows. | false | false | None | None | None |

### json_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `disable_type_inference` | Optional. Whether to disable the inference of data type for Json data. | false | false | None | None | None |
| `encoding` | Optional. The character encoding of the data. | false | false | None | None | None |
