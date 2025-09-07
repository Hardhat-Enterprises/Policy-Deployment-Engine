## 🛡️ Policy Deployment Engine: `dataplex_datascan`

This section provides a concise policy evaluation for the `dataplex_datascan` resource in GCP.

Reference: [Terraform Registry – dataplex_datascan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_datascan)

---

## 1. Argument Reference

### `data`
- Description: (Required) The data source for DataScan. Structure is [documented below](#nested_data).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_spec`
- Description: (Required) DataScan execution settings. Structure is [documented below](#nested_execution_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the data scan should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_scan_id`
- Description: (Required) DataScan identifier. Must contain only lowercase letters, numbers and hyphens. Must start with a letter. Must end with a number or a letter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the scan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User friendly display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the scan. A list of key->value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_quality_spec`
- Description: (Optional) DataQualityScan related setting. Structure is [documented below](#nested_data_quality_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_profile_spec`
- Description: (Optional) DataProfileScan related setting. Structure is [documented below](#nested_data_profile_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_discovery_spec`
- Description: (Optional) DataDiscoveryScan related setting. Structure is [documented below](#nested_data_discovery_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_data"></a>The `data` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entity`
- Description: (Optional) The Dataplex entity that represents the data source(e.g. BigQuery table) for Datascan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource`
- Description: (Optional) The service-qualified full resource name of the cloud resource for a DataScan job to scan against. The field could be: Cloud Storage bucket (//storage.googleapis.com/projects/PROJECT_ID/buckets/BUCKET_ID) for DataDiscoveryScan OR BigQuery table of type "TABLE" (/bigquery.googleapis.com/projects/PROJECT_ID/datasets/DATASET_ID/tables/TABLE_ID) for DataProfileScan/DataQualityScan. <a name="nested_execution_spec"></a>The `execution_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger`
- Description: (Required) Spec related to how often and when a scan should be triggered. Structure is [documented below](#nested_execution_spec_trigger).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field`
- Description: (Optional) The unnested field (of type Date or Timestamp) that contains values which monotonically increase over time. If not specified, a data scan will run for all data in the table. <a name="nested_execution_spec_trigger"></a>The `trigger` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_demand`
- Description: (Optional) The scan runs once via dataScans.run API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Optional) The scan is scheduled to run periodically. Structure is [documented below](#nested_execution_spec_trigger_schedule). <a name="nested_execution_spec_trigger_schedule"></a>The `schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cron`
- Description: (Required) Cron schedule for running scans periodically. This field is required for Schedule scans. <a name="nested_data_quality_spec"></a>The `data_quality_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sampling_percent`
- Description: (Optional) The percentage of the records to be selected from the dataset for DataScan. Value can range between 0.0 and 100.0 with up to 3 significant decimal digits. Sampling is not applied if `sampling_percent` is not specified, 0 or 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `row_filter`
- Description: (Optional) A filter applied to all rows in a single DataScan job. The filter needs to be a valid SQL expression for a WHERE clause in BigQuery standard SQL syntax. Example: col1 >= 0 AND col2 < 10
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_scan_actions`
- Description: (Optional) Actions to take upon job completion. Structure is [documented below](#nested_data_quality_spec_post_scan_actions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Optional) The list of rules to evaluate against a data source. At least one rule is required. Structure is [documented below](#nested_data_quality_spec_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `catalog_publishing_enabled`
- Description: (Optional) If set, the latest DataScan job result will be published to Dataplex Catalog. <a name="nested_data_quality_spec_post_scan_actions"></a>The `post_scan_actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigquery_export`
- Description: (Optional) If set, results will be exported to the provided BigQuery table. Structure is [documented below](#nested_data_quality_spec_post_scan_actions_bigquery_export).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notification_report`
- Description: (Optional) The configuration of notification report post scan action. Structure is [documented below](#nested_data_quality_spec_post_scan_actions_notification_report). <a name="nested_data_quality_spec_post_scan_actions_bigquery_export"></a>The `bigquery_export` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `results_table`
- Description: (Optional) The BigQuery table to export DataQualityScan results to. Format://bigquery.googleapis.com/projects/PROJECT_ID/datasets/DATASET_ID/tables/TABLE_ID <a name="nested_data_quality_spec_post_scan_actions_notification_report"></a>The `notification_report` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recipients`
- Description: (Required) The individuals or groups who are designated to receive notifications upon triggers. Structure is [documented below](#nested_data_quality_spec_post_scan_actions_notification_report_recipients).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score_threshold_trigger`
- Description: (Optional) This trigger is triggered when the DQ score in the job result is less than a specified input score. Structure is [documented below](#nested_data_quality_spec_post_scan_actions_notification_report_score_threshold_trigger).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `job_failure_trigger`
- Description: (Optional) This trigger is triggered when the scan job itself fails, regardless of the result.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `job_end_trigger`
- Description: (Optional) This trigger is triggered whenever a scan job run ends, regardless of the result. <a name="nested_data_quality_spec_post_scan_actions_notification_report_recipients"></a>The `recipients` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `emails`
- Description: (Optional) The email recipients who will receive the DataQualityScan results report. <a name="nested_data_quality_spec_post_scan_actions_notification_report_score_threshold_trigger"></a>The `score_threshold_trigger` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score_threshold`
- Description: (Optional) The score range is in [0,100]. <a name="nested_data_quality_spec_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) The unnested column which this rule is evaluated against.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_null`
- Description: (Optional) Rows with null values will automatically fail a rule, unless ignoreNull is true. In that case, such null rows are trivially considered passing. Only applicable to ColumnMap rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dimension`
- Description: (Required) The dimension name a rule belongs to. Custom dimension name is supported with all uppercase letters and maximum length of 30 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threshold`
- Description: (Optional) The minimum ratio of passing_rows / total_rows required to pass this rule, with a range of [0.0, 1.0]. 0 indicates default value (i.e. 1.0).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) A mutable name for the rule. The name must contain only letters (a-z, A-Z), numbers (0-9), or hyphens (-). The maximum length is 63 characters. Must start with a letter. Must end with a number or a letter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `suspended`
- Description: (Optional) Whether the Rule is active or suspended. Default = false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the rule. The maximum length is 1,024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range_expectation`
- Description: (Optional) ColumnMap rule which evaluates whether each column value lies between a specified range. Structure is [documented below](#nested_data_quality_spec_rules_rules_range_expectation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `non_null_expectation`
- Description: (Optional) ColumnMap rule which evaluates whether each column value is null.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `set_expectation`
- Description: (Optional) ColumnMap rule which evaluates whether each column value is contained by a specified set. Structure is [documented below](#nested_data_quality_spec_rules_rules_set_expectation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_expectation`
- Description: (Optional) ColumnMap rule which evaluates whether each column value matches a specified regex. Structure is [documented below](#nested_data_quality_spec_rules_rules_regex_expectation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uniqueness_expectation`
- Description: (Optional) Row-level rule which evaluates whether each column value is unique.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `statistic_range_expectation`
- Description: (Optional) ColumnAggregate rule which evaluates whether the column aggregate statistic lies between a specified range. Structure is [documented below](#nested_data_quality_spec_rules_rules_statistic_range_expectation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `row_condition_expectation`
- Description: (Optional) Table rule which evaluates whether each row passes the specified condition. Structure is [documented below](#nested_data_quality_spec_rules_rules_row_condition_expectation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_condition_expectation`
- Description: (Optional) Table rule which evaluates whether the provided expression is true. Structure is [documented below](#nested_data_quality_spec_rules_rules_table_condition_expectation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_assertion`
- Description: (Optional) Table rule which evaluates whether any row matches invalid state. Structure is [documented below](#nested_data_quality_spec_rules_rules_sql_assertion). <a name="nested_data_quality_spec_rules_rules_range_expectation"></a>The `range_expectation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_value`
- Description: (Optional) The minimum column value allowed for a row to pass this validation. At least one of minValue and maxValue need to be provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_value`
- Description: (Optional) The maximum column value allowed for a row to pass this validation. At least one of minValue and maxValue need to be provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strict_min_enabled`
- Description: (Optional) Whether each value needs to be strictly greater than ('>') the minimum, or if equality is allowed. Only relevant if a minValue has been defined. Default = false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strict_max_enabled`
- Description: (Optional) Whether each value needs to be strictly lesser than ('<') the maximum, or if equality is allowed. Only relevant if a maxValue has been defined. Default = false. <a name="nested_data_quality_spec_rules_rules_set_expectation"></a>The `set_expectation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Required) Expected values for the column value. <a name="nested_data_quality_spec_rules_rules_regex_expectation"></a>The `regex_expectation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Required) A regular expression the column value is expected to match. <a name="nested_data_quality_spec_rules_rules_statistic_range_expectation"></a>The `statistic_range_expectation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `statistic`
- Description: (Required) column statistics. Possible values are: `STATISTIC_UNDEFINED`, `MEAN`, `MIN`, `MAX`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_value`
- Description: (Optional) The minimum column statistic value allowed for a row to pass this validation. At least one of minValue and maxValue need to be provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_value`
- Description: (Optional) The maximum column statistic value allowed for a row to pass this validation. At least one of minValue and maxValue need to be provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strict_min_enabled`
- Description: (Optional) Whether column statistic needs to be strictly greater than ('>') the minimum, or if equality is allowed. Only relevant if a minValue has been defined. Default = false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strict_max_enabled`
- Description: (Optional) Whether column statistic needs to be strictly lesser than ('<') the maximum, or if equality is allowed. Only relevant if a maxValue has been defined. Default = false. <a name="nested_data_quality_spec_rules_rules_row_condition_expectation"></a>The `row_condition_expectation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_expression`
- Description: (Required) The SQL expression. <a name="nested_data_quality_spec_rules_rules_table_condition_expectation"></a>The `table_condition_expectation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_expression`
- Description: (Required) The SQL expression. <a name="nested_data_quality_spec_rules_rules_sql_assertion"></a>The `sql_assertion` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_statement`
- Description: (Required) The SQL statement. <a name="nested_data_profile_spec"></a>The `data_profile_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sampling_percent`
- Description: (Optional) The percentage of the records to be selected from the dataset for DataScan. Value can range between 0.0 and 100.0 with up to 3 significant decimal digits. Sampling is not applied if `sampling_percent` is not specified, 0 or 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `row_filter`
- Description: (Optional) A filter applied to all rows in a single DataScan job. The filter needs to be a valid SQL expression for a WHERE clause in BigQuery standard SQL syntax. Example: col1 >= 0 AND col2 < 10
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_scan_actions`
- Description: (Optional) Actions to take upon job completion. Structure is [documented below](#nested_data_profile_spec_post_scan_actions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_fields`
- Description: (Optional) The fields to include in data profile. If not specified, all fields at the time of profile scan job execution are included, except for ones listed in `exclude_fields`. Structure is [documented below](#nested_data_profile_spec_include_fields).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_fields`
- Description: (Optional) The fields to exclude from data profile. If specified, the fields will be excluded from data profile, regardless of `include_fields` value. Structure is [documented below](#nested_data_profile_spec_exclude_fields). <a name="nested_data_profile_spec_post_scan_actions"></a>The `post_scan_actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigquery_export`
- Description: (Optional) If set, results will be exported to the provided BigQuery table. Structure is [documented below](#nested_data_profile_spec_post_scan_actions_bigquery_export). <a name="nested_data_profile_spec_post_scan_actions_bigquery_export"></a>The `bigquery_export` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `results_table`
- Description: (Optional) The BigQuery table to export DataProfileScan results to. Format://bigquery.googleapis.com/projects/PROJECT_ID/datasets/DATASET_ID/tables/TABLE_ID <a name="nested_data_profile_spec_include_fields"></a>The `include_fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_names`
- Description: (Optional) Expected input is a list of fully qualified names of fields as in the schema. Only top-level field names for nested fields are supported. For instance, if 'x' is of nested field type, listing 'x' is supported but 'x.y.z' is not supported. Here 'y' and 'y.z' are nested fields of 'x'. <a name="nested_data_profile_spec_exclude_fields"></a>The `exclude_fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_names`
- Description: (Optional) Expected input is a list of fully qualified names of fields as in the schema. Only top-level field names for nested fields are supported. For instance, if 'x' is of nested field type, listing 'x' is supported but 'x.y.z' is not supported. Here 'y' and 'y.z' are nested fields of 'x'. <a name="nested_data_discovery_spec"></a>The `data_discovery_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigquery_publishing_config`
- Description: (Optional) Configuration for metadata publishing. Structure is [documented below](#nested_data_discovery_spec_bigquery_publishing_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_config`
- Description: (Optional) Configurations related to Cloud Storage as the data source. Structure is [documented below](#nested_data_discovery_spec_storage_config). <a name="nested_data_discovery_spec_bigquery_publishing_config"></a>The `bigquery_publishing_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_type`
- Description: (Optional) Determines whether to publish discovered tables as BigLake external tables or non-BigLake external tables. Possible values are: `TABLE_TYPE_UNSPECIFIED`, `EXTERNAL`, `BIGLAKE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection`
- Description: (Optional) The BigQuery connection used to create BigLake tables. Must be in the form `projects/{projectId}/locations/{locationId}/connections/{connection_id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the BigQuery dataset to publish BigLake external or non-BigLake external tables to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project of the BigQuery dataset to publish BigLake external or non-BigLake external tables to. If not specified, the project of the Cloud Storage bucket will be used. The format is "projects/{project_id_or_number}". <a name="nested_data_discovery_spec_storage_config"></a>The `storage_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_patterns`
- Description: (Optional) Defines the data to include during discovery when only a subset of the data should be considered. Provide a list of patterns that identify the data to include. For Cloud Storage bucket assets, these patterns are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these patterns are interpreted as patterns to match table names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_patterns`
- Description: (Optional) Defines the data to exclude during discovery. Provide a list of patterns that identify the data to exclude. For Cloud Storage bucket assets, these patterns are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these patterns are interpreted as patterns to match table names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `csv_options`
- Description: (Optional) Configuration for CSV data. Structure is [documented below](#nested_data_discovery_spec_storage_config_csv_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_options`
- Description: (Optional) Configuration for JSON data. Structure is [documented below](#nested_data_discovery_spec_storage_config_json_options). <a name="nested_data_discovery_spec_storage_config_csv_options"></a>The `csv_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_rows`
- Description: (Optional) The number of rows to interpret as header rows that should be skipped when reading data rows.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delimiter`
- Description: (Optional) The delimiter that is used to separate values. The default is `,` (comma).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Optional) The character encoding of the data. The default is UTF-8.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type_inference_disabled`
- Description: (Optional) Whether to disable the inference of data types for CSV data. If true, all columns are registered as strings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quote`
- Description: (Optional) The character used to quote column values. Accepts `"` (double quotation mark) or `'` (single quotation mark). If unspecified, defaults to `"` (double quotation mark). <a name="nested_data_discovery_spec_storage_config_json_options"></a>The `json_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Optional) The character encoding of the data. The default is UTF-8.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type_inference_disabled`
- Description: (Optional) Whether to disable the inference of data types for JSON data. If true, all columns are registered as their primitive types (strings, number, or boolean).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
