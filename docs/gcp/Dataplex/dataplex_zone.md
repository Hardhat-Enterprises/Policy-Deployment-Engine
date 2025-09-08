## 🛡️ Policy Deployment Engine: `dataplex_zone`

This section provides a concise policy evaluation for the `dataplex_zone` resource in GCP.

Reference: [Terraform Registry – dataplex_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_zone)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `lake` | The lake for the resource | true | None | None |
| `location` | The location for the resource | true | None | None |
| `name` | The name of the zone. | true | None | None |
| `type` | Required. Immutable. The type of the zone. Possible values: TYPE_UNSPECIFIED, RAW, CURATED | true | None | None |

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
| `location_type` | Required. Immutable. The location type of the resources that are allowed to be attached to the assets within this zone. Possible values: LOCATION_TYPE_UNSPECIFIED, SINGLE_REGION, MULTI_REGION - - - | true | None | None |
| `description` | Optional. Description of the zone. | false | None | None |
| `display_name` | Optional. User friendly display name. | false | None | None |
| `labels` | Optional. User defined labels for the zone. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
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
