## 🛡️ Policy Deployment Engine: `storage_insights_report_config`

This section provides a concise policy evaluation for the `storage_insights_report_config` resource in GCP.

Reference: [Terraform Registry – storage_insights_report_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_insights_report_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the ReportConfig. The source and destination buckets specified in the ReportConfig must be in the same location. | true | true | Storage Insights reports should be generated only in approved Australian regions. | australia-southeast1 | europe-west8 |
| `frequency_options` | Options for configuring how inventory reports are generated. Structure is [documented below](#nested_frequency_options). | false | false | None | None | None |
| `parquet_options` | An option for outputting inventory reports as parquet files. | false | false | None | None | None |
| `csv_options` | Options for configuring the format of the inventory report CSV file. Structure is [documented below](#nested_csv_options). | false | false | None | None | None |
| `object_metadata_report_options` | Options for including metadata in an inventory report. Structure is [documented below](#nested_object_metadata_report_options). | false | false | None | None | None |
| `display_name` | The editable display name of the inventory report configuration. Has a limit of 256 characters. Can be empty. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `start_date` |  | false | false | None | None | None |
| `end_date` |  | false | false | None | None | None |
| `storage_filters` |  | false | false | None | None | None |
| `storage_destination_options` |  | false | false | None | None | None |

### frequency_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `frequency` | The frequency in which inventory reports are generated. Values are DAILY or WEEKLY. Possible values are: `DAILY`, `WEEKLY`. | true | true | Weekly report generation reduces unnecessary report creation while still supporting monitoring and review. | WEEKLY | DAILY |
| `start_date` | The date to start generating inventory reports. For example, {"day": 15, "month": 8, "year": 2022}. Structure is [documented below](#nested_frequency_options_start_date). | true | false | None | None | None |
| `end_date` | The date to stop generating inventory reports. For example, {"day": 15, "month": 9, "year": 2022}. Structure is [documented below](#nested_frequency_options_end_date). | true | false | None | None | None |

### csv_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `record_separator` | The character used to separate the records in the inventory report CSV file. | false | false | None | None | None |
| `delimiter` | The delimiter used to separate the fields in the inventory report CSV file. | false | false | None | None | None |
| `header_required` | The boolean that indicates whether or not headers are included in the inventory report CSV file. | true | true | Headers improve readability, traceability, and audit review of generated inventory reports. | True | False |

### object_metadata_report_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `metadata_fields` | The metadata fields included in an inventory report. | true | true | Inventory reports should include only approved metadata fields needed for monitoring and review. | bucket,name,project | bucket,name,project,acl |
| `storage_filters` | A nested object resource. Structure is [documented below](#nested_object_metadata_report_options_storage_filters). | false | false | None | None | None |
| `storage_destination_options` | Options for where the inventory reports are stored. Structure is [documented below](#nested_object_metadata_report_options_storage_destination_options). | true | false | None | None | None |

### start_date Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `day` | The day of the month to start generating inventory reports. | true | false | None | None | None |
| `month` | The month to start generating inventory reports. | true | false | None | None | None |
| `year` | The year to start generating inventory reports | true | false | None | None | None |

### end_date Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `day` | The day of the month to stop generating inventory reports. | true | false | None | None | None |
| `month` | The month to stop generating inventory reports. | true | false | None | None | None |
| `year` | The year to stop generating inventory reports | true | false | None | None | None |

### storage_filters Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The filter to use when specifying which bucket to generate inventory reports for. | true | true | Reports should only be generated from trusted and approved source buckets. | approved-source-bucket | unapproved-bucket |

### storage_destination_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | The destination bucket that stores the generated inventory reports. | true | true | Inventory reports should be stored only in approved secure destination buckets. | secure-report-bucket | public-report-bucket |
| `destination_path` | The path within the destination bucket to store generated inventory reports. | true | true | Reports should be stored in a standard approved path for easier tracking and access control. | storage-insights-reports | test |
