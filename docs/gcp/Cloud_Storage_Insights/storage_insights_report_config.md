## 🛡️ Policy Deployment Engine: `storage_insights_report_config`

This section provides a concise policy evaluation for the `storage_insights_report_config` resource in GCP.

Reference: [Terraform Registry – storage_insights_report_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_insights_report_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the ReportConfig. The source and destination buckets specified in the ReportConfig must be in the same location. | true | None | None |
| `parquet_options` | An option for outputting inventory reports as parquet files. | false | None | None |
| `display_name` | The editable display name of the inventory report configuration. Has a limit of 256 characters. Can be empty. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### frequency_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `frequency` | The frequency in which inventory reports are generated. Values are DAILY or WEEKLY. Possible values are: `DAILY`, `WEEKLY`. | true | None | None |
| `start_date` | The date to start generating inventory reports. For example, {"day": 15, "month": 8, "year": 2022}. Structure is [documented below](#nested_frequency_options_start_date). | true | None | None |
| `end_date` | The date to stop generating inventory reports. For example, {"day": 15, "month": 9, "year": 2022}. Structure is [documented below](#nested_frequency_options_end_date). | true | None | None |

### csv_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `record_separator` | The character used to separate the records in the inventory report CSV file. | false | None | None |
| `delimiter` | The delimiter used to separate the fields in the inventory report CSV file. | false | None | None |
| `header_required` | The boolean that indicates whether or not headers are included in the inventory report CSV file. | false | None | None |

### object_metadata_report_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metadata_fields` | The metadata fields included in an inventory report. | true | None | None |
| `storage_filters` | A nested object resource. Structure is [documented below](#nested_object_metadata_report_options_storage_filters). | false | None | None |
| `storage_destination_options` | Options for where the inventory reports are stored. Structure is [documented below](#nested_object_metadata_report_options_storage_destination_options). | true | None | None |

### start_date Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `day` | The day of the month to start generating inventory reports. | true | None | None |
| `month` | The month to start generating inventory reports. | true | None | None |
| `year` | The year to start generating inventory reports | true | None | None |

### end_date Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `day` | The day of the month to stop generating inventory reports. | true | None | None |
| `month` | The month to stop generating inventory reports. | true | None | None |
| `year` | The year to stop generating inventory reports | true | None | None |

### storage_filters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | The filter to use when specifying which bucket to generate inventory reports for. | false | None | None |

### storage_destination_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | The destination bucket that stores the generated inventory reports. | true | None | None |
| `destination_path` | The path within the destination bucket to store generated inventory reports. | false | None | None |
