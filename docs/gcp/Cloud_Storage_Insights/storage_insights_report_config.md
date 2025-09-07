## 🛡️ Policy Deployment Engine: `storage_insights_report_config`

This section provides a concise policy evaluation for the `storage_insights_report_config` resource in GCP.

Reference: [Terraform Registry – storage_insights_report_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_insights_report_config)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the ReportConfig. The source and destination buckets specified in the ReportConfig must be in the same location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frequency_options`
- Description: (Optional) Options for configuring how inventory reports are generated. Structure is [documented below](#nested_frequency_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parquet_options`
- Description: (Optional) An option for outputting inventory reports as parquet files.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `csv_options`
- Description: (Optional) Options for configuring the format of the inventory report CSV file. Structure is [documented below](#nested_csv_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_metadata_report_options`
- Description: (Optional) Options for including metadata in an inventory report. Structure is [documented below](#nested_object_metadata_report_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The editable display name of the inventory report configuration. Has a limit of 256 characters. Can be empty.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_frequency_options"></a>The `frequency_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `frequency`
- Description: (Required) The frequency in which inventory reports are generated. Values are DAILY or WEEKLY. Possible values are: `DAILY`, `WEEKLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_date`
- Description: (Required) The date to start generating inventory reports. For example, {"day": 15, "month": 8, "year": 2022}. Structure is [documented below](#nested_frequency_options_start_date).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_date`
- Description: (Required) The date to stop generating inventory reports. For example, {"day": 15, "month": 9, "year": 2022}. Structure is [documented below](#nested_frequency_options_end_date). <a name="nested_frequency_options_start_date"></a>The `start_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) The day of the month to start generating inventory reports.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Required) The month to start generating inventory reports.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Required) The year to start generating inventory reports <a name="nested_frequency_options_end_date"></a>The `end_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) The day of the month to stop generating inventory reports.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Required) The month to stop generating inventory reports.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Required) The year to stop generating inventory reports <a name="nested_csv_options"></a>The `csv_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `record_separator`
- Description: (Optional) The character used to separate the records in the inventory report CSV file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delimiter`
- Description: (Optional) The delimiter used to separate the fields in the inventory report CSV file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_required`
- Description: (Optional) The boolean that indicates whether or not headers are included in the inventory report CSV file. <a name="nested_object_metadata_report_options"></a>The `object_metadata_report_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_fields`
- Description: (Required) The metadata fields included in an inventory report.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_filters`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_object_metadata_report_options_storage_filters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_destination_options`
- Description: (Required) Options for where the inventory reports are stored. Structure is [documented below](#nested_object_metadata_report_options_storage_destination_options). <a name="nested_object_metadata_report_options_storage_filters"></a>The `storage_filters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Optional) The filter to use when specifying which bucket to generate inventory reports for. <a name="nested_object_metadata_report_options_storage_destination_options"></a>The `storage_destination_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) The destination bucket that stores the generated inventory reports.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_path`
- Description: (Optional) The path within the destination bucket to store generated inventory reports.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
