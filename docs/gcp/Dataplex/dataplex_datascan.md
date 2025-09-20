## 🛡️ Policy Deployment Engine: `dataplex_datascan`

This section provides a concise policy evaluation for the `dataplex_datascan` resource in GCP.

Reference: [Terraform Registry – dataplex_datascan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_datascan)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data` | The data source for DataScan. Structure is [documented below](#nested_data). | true | false | None | None | None |
| `execution_spec` | DataScan execution settings. Structure is [documented below](#nested_execution_spec). | true | false | None | None | None |
| `location` | The location where the data scan should reside. | true | false | None | None | None |
| `data_scan_id` | DataScan identifier. Must contain only lowercase letters, numbers and hyphens. Must start with a letter. Must end with a number or a letter. | true | false | None | None | None |
| `description` | Description of the scan. | false | false | None | None | None |
| `display_name` | User friendly display name. | false | false | None | None | None |
| `labels` | User-defined labels for the scan. A list of key->value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `data_quality_spec` | DataQualityScan related setting. Structure is [documented below](#nested_data_quality_spec). | false | false | None | None | None |
| `data_profile_spec` | DataProfileScan related setting. Structure is [documented below](#nested_data_profile_spec). | false | false | None | None | None |
| `data_discovery_spec` | DataDiscoveryScan related setting. Structure is [documented below](#nested_data_discovery_spec). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `trigger` |  | false | false | None | None | None |
| `schedule` |  | false | false | None | None | None |
| `post_scan_actions` |  | false | false | None | None | None |
| `bigquery_export` |  | false | false | None | None | None |
| `notification_report` |  | false | false | None | None | None |
| `recipients` |  | false | false | None | None | None |
| `score_threshold_trigger` |  | false | false | None | None | None |
| `rules` |  | false | false | None | None | None |
| `range_expectation` |  | false | false | None | None | None |
| `set_expectation` |  | false | false | None | None | None |
| `regex_expectation` |  | false | false | None | None | None |
| `statistic_range_expectation` |  | false | false | None | None | None |
| `row_condition_expectation` |  | false | false | None | None | None |
| `table_condition_expectation` |  | false | false | None | None | None |
| `sql_assertion` |  | false | false | None | None | None |
| `include_fields` |  | false | false | None | None | None |
| `exclude_fields` |  | false | false | None | None | None |
| `bigquery_publishing_config` |  | false | false | None | None | None |
| `storage_config` |  | false | false | None | None | None |
| `csv_options` |  | false | false | None | None | None |
| `json_options` |  | false | false | None | None | None |

### data Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `entity` | The Dataplex entity that represents the data source(e.g. BigQuery table) for Datascan. | false | false | None | None | None |
| `resource` | The service-qualified full resource name of the cloud resource for a DataScan job to scan against. The field could be: Cloud Storage bucket (//storage.googleapis.com/projects/PROJECT_ID/buckets/BUCKET_ID) for DataDiscoveryScan OR BigQuery table of type "TABLE" (/bigquery.googleapis.com/projects/PROJECT_ID/datasets/DATASET_ID/tables/TABLE_ID) for DataProfileScan/DataQualityScan. | false | false | None | None | None |

### execution_spec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `trigger` | Spec related to how often and when a scan should be triggered. Structure is [documented below](#nested_execution_spec_trigger). | true | false | None | None | None |
| `field` | The unnested field (of type Date or Timestamp) that contains values which monotonically increase over time. If not specified, a data scan will run for all data in the table. | false | false | None | None | None |

### data_quality_spec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sampling_percent` | The percentage of the records to be selected from the dataset for DataScan. Value can range between 0.0 and 100.0 with up to 3 significant decimal digits. Sampling is not applied if `sampling_percent` is not specified, 0 or 100. | false | false | None | None | None |
| `row_filter` | A filter applied to all rows in a single DataScan job. The filter needs to be a valid SQL expression for a WHERE clause in BigQuery standard SQL syntax. Example: col1 >= 0 AND col2 < 10 | false | false | None | None | None |
| `post_scan_actions` | Actions to take upon job completion. Structure is [documented below](#nested_data_quality_spec_post_scan_actions). | false | false | None | None | None |
| `rules` | The list of rules to evaluate against a data source. At least one rule is required. Structure is [documented below](#nested_data_quality_spec_rules). | false | false | None | None | None |
| `catalog_publishing_enabled` | If set, the latest DataScan job result will be published to Dataplex Catalog. | false | false | None | None | None |

### data_profile_spec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sampling_percent` | The percentage of the records to be selected from the dataset for DataScan. Value can range between 0.0 and 100.0 with up to 3 significant decimal digits. Sampling is not applied if `sampling_percent` is not specified, 0 or 100. | false | false | None | None | None |
| `row_filter` | A filter applied to all rows in a single DataScan job. The filter needs to be a valid SQL expression for a WHERE clause in BigQuery standard SQL syntax. Example: col1 >= 0 AND col2 < 10 | false | false | None | None | None |
| `post_scan_actions` | Actions to take upon job completion. Structure is [documented below](#nested_data_profile_spec_post_scan_actions). | false | false | None | None | None |
| `include_fields` | The fields to include in data profile. If not specified, all fields at the time of profile scan job execution are included, except for ones listed in `exclude_fields`. Structure is [documented below](#nested_data_profile_spec_include_fields). | false | false | None | None | None |
| `exclude_fields` | The fields to exclude from data profile. If specified, the fields will be excluded from data profile, regardless of `include_fields` value. Structure is [documented below](#nested_data_profile_spec_exclude_fields). | false | false | None | None | None |

### data_discovery_spec Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bigquery_publishing_config` | Configuration for metadata publishing. Structure is [documented below](#nested_data_discovery_spec_bigquery_publishing_config). | false | false | None | None | None |
| `storage_config` | Configurations related to Cloud Storage as the data source. Structure is [documented below](#nested_data_discovery_spec_storage_config). | false | false | None | None | None |

### trigger Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `on_demand` | The scan runs once via dataScans.run API. | false | false | None | None | None |
| `schedule` | The scan is scheduled to run periodically. Structure is [documented below](#nested_execution_spec_trigger_schedule). | false | false | None | None | None |

### schedule Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cron` | Cron schedule for running scans periodically. This field is required for Schedule scans. | true | false | None | None | None |

### post_scan_actions Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bigquery_export` | If set, results will be exported to the provided BigQuery table. Structure is [documented below](#nested_data_profile_spec_post_scan_actions_bigquery_export). | false | false | None | None | None |
| `notification_report` | The configuration of notification report post scan action. Structure is [documented below](#nested_data_quality_spec_post_scan_actions_notification_report). | false | false | None | None | None |

### bigquery_export Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `results_table` | The BigQuery table to export DataProfileScan results to. Format://bigquery.googleapis.com/projects/PROJECT_ID/datasets/DATASET_ID/tables/TABLE_ID | false | false | None | None | None |

### notification_report Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `recipients` | The individuals or groups who are designated to receive notifications upon triggers. Structure is [documented below](#nested_data_quality_spec_post_scan_actions_notification_report_recipients). | true | false | None | None | None |
| `score_threshold_trigger` | This trigger is triggered when the DQ score in the job result is less than a specified input score. Structure is [documented below](#nested_data_quality_spec_post_scan_actions_notification_report_score_threshold_trigger). | false | false | None | None | None |
| `job_failure_trigger` | This trigger is triggered when the scan job itself fails, regardless of the result. | false | false | None | None | None |
| `job_end_trigger` | This trigger is triggered whenever a scan job run ends, regardless of the result. | false | false | None | None | None |

### recipients Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `emails` | The email recipients who will receive the DataQualityScan results report. | false | false | None | None | None |

### score_threshold_trigger Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `score_threshold` | The score range is in [0,100]. | false | false | None | None | None |

### rules Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `column` | The unnested column which this rule is evaluated against. | false | false | None | None | None |
| `ignore_null` | Rows with null values will automatically fail a rule, unless ignoreNull is true. In that case, such null rows are trivially considered passing. Only applicable to ColumnMap rules. | false | false | None | None | None |
| `dimension` | The dimension name a rule belongs to. Custom dimension name is supported with all uppercase letters and maximum length of 30 characters. | true | false | None | None | None |
| `threshold` | The minimum ratio of passing_rows / total_rows required to pass this rule, with a range of [0.0, 1.0]. 0 indicates default value (i.e. 1.0). | false | false | None | None | None |
| `name` | A mutable name for the rule. The name must contain only letters (a-z, A-Z), numbers (0-9), or hyphens (-). The maximum length is 63 characters. Must start with a letter. Must end with a number or a letter. | false | false | None | None | None |
| `suspended` | Whether the Rule is active or suspended. Default = false. | false | false | None | None | None |
| `description` | Description of the rule. The maximum length is 1,024 characters. | false | false | None | None | None |
| `range_expectation` | ColumnMap rule which evaluates whether each column value lies between a specified range. Structure is [documented below](#nested_data_quality_spec_rules_rules_range_expectation). | false | false | None | None | None |
| `non_null_expectation` | ColumnMap rule which evaluates whether each column value is null. | false | false | None | None | None |
| `set_expectation` | ColumnMap rule which evaluates whether each column value is contained by a specified set. Structure is [documented below](#nested_data_quality_spec_rules_rules_set_expectation). | false | false | None | None | None |
| `regex_expectation` | ColumnMap rule which evaluates whether each column value matches a specified regex. Structure is [documented below](#nested_data_quality_spec_rules_rules_regex_expectation). | false | false | None | None | None |
| `uniqueness_expectation` | Row-level rule which evaluates whether each column value is unique. | false | false | None | None | None |
| `statistic_range_expectation` | ColumnAggregate rule which evaluates whether the column aggregate statistic lies between a specified range. Structure is [documented below](#nested_data_quality_spec_rules_rules_statistic_range_expectation). | false | false | None | None | None |
| `row_condition_expectation` | Table rule which evaluates whether each row passes the specified condition. Structure is [documented below](#nested_data_quality_spec_rules_rules_row_condition_expectation). | false | false | None | None | None |
| `table_condition_expectation` | Table rule which evaluates whether the provided expression is true. Structure is [documented below](#nested_data_quality_spec_rules_rules_table_condition_expectation). | false | false | None | None | None |
| `sql_assertion` | Table rule which evaluates whether any row matches invalid state. Structure is [documented below](#nested_data_quality_spec_rules_rules_sql_assertion). | false | false | None | None | None |

### range_expectation Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `min_value` | The minimum column value allowed for a row to pass this validation. At least one of minValue and maxValue need to be provided. | false | false | None | None | None |
| `max_value` | The maximum column value allowed for a row to pass this validation. At least one of minValue and maxValue need to be provided. | false | false | None | None | None |
| `strict_min_enabled` | Whether each value needs to be strictly greater than ('>') the minimum, or if equality is allowed. Only relevant if a minValue has been defined. Default = false. | false | false | None | None | None |
| `strict_max_enabled` | Whether each value needs to be strictly lesser than ('<') the maximum, or if equality is allowed. Only relevant if a maxValue has been defined. Default = false. | false | false | None | None | None |

### set_expectation Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `values` | Expected values for the column value. | true | false | None | None | None |

### regex_expectation Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `regex` | A regular expression the column value is expected to match. | true | false | None | None | None |

### statistic_range_expectation Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `statistic` | column statistics. Possible values are: `STATISTIC_UNDEFINED`, `MEAN`, `MIN`, `MAX`. | true | false | None | None | None |
| `min_value` | The minimum column statistic value allowed for a row to pass this validation. At least one of minValue and maxValue need to be provided. | false | false | None | None | None |
| `max_value` | The maximum column statistic value allowed for a row to pass this validation. At least one of minValue and maxValue need to be provided. | false | false | None | None | None |
| `strict_min_enabled` | Whether column statistic needs to be strictly greater than ('>') the minimum, or if equality is allowed. Only relevant if a minValue has been defined. Default = false. | false | false | None | None | None |
| `strict_max_enabled` | Whether column statistic needs to be strictly lesser than ('<') the maximum, or if equality is allowed. Only relevant if a maxValue has been defined. Default = false. | false | false | None | None | None |

### row_condition_expectation Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sql_expression` | The SQL expression. | true | false | None | None | None |

### table_condition_expectation Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sql_expression` | The SQL expression. | true | false | None | None | None |

### sql_assertion Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sql_statement` | The SQL statement. | true | false | None | None | None |

### include_fields Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_names` | Expected input is a list of fully qualified names of fields as in the schema. Only top-level field names for nested fields are supported. For instance, if 'x' is of nested field type, listing 'x' is supported but 'x.y.z' is not supported. Here 'y' and 'y.z' are nested fields of 'x'. | false | false | None | None | None |

### exclude_fields Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field_names` | Expected input is a list of fully qualified names of fields as in the schema. Only top-level field names for nested fields are supported. For instance, if 'x' is of nested field type, listing 'x' is supported but 'x.y.z' is not supported. Here 'y' and 'y.z' are nested fields of 'x'. | false | false | None | None | None |

### bigquery_publishing_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `table_type` | Determines whether to publish discovered tables as BigLake external tables or non-BigLake external tables. Possible values are: `TABLE_TYPE_UNSPECIFIED`, `EXTERNAL`, `BIGLAKE`. | false | false | None | None | None |
| `connection` | The BigQuery connection used to create BigLake tables. Must be in the form `projects/{projectId}/locations/{locationId}/connections/{connection_id}`. | false | false | None | None | None |
| `location` | The location of the BigQuery dataset to publish BigLake external or non-BigLake external tables to. | false | false | None | None | None |
| `project` | The project of the BigQuery dataset to publish BigLake external or non-BigLake external tables to. If not specified, the project of the Cloud Storage bucket will be used. The format is "projects/{project_id_or_number}". | false | false | None | None | None |

### storage_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `include_patterns` | Defines the data to include during discovery when only a subset of the data should be considered. Provide a list of patterns that identify the data to include. For Cloud Storage bucket assets, these patterns are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these patterns are interpreted as patterns to match table names. | false | false | None | None | None |
| `exclude_patterns` | Defines the data to exclude during discovery. Provide a list of patterns that identify the data to exclude. For Cloud Storage bucket assets, these patterns are interpreted as glob patterns used to match object names. For BigQuery dataset assets, these patterns are interpreted as patterns to match table names. | false | false | None | None | None |
| `csv_options` | Configuration for CSV data. Structure is [documented below](#nested_data_discovery_spec_storage_config_csv_options). | false | false | None | None | None |
| `json_options` | Configuration for JSON data. Structure is [documented below](#nested_data_discovery_spec_storage_config_json_options). | false | false | None | None | None |

### csv_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `header_rows` | The number of rows to interpret as header rows that should be skipped when reading data rows. | false | false | None | None | None |
| `delimiter` | The delimiter that is used to separate values. The default is `,` (comma). | false | false | None | None | None |
| `encoding` | The character encoding of the data. The default is UTF-8. | false | false | None | None | None |
| `type_inference_disabled` | Whether to disable the inference of data types for CSV data. If true, all columns are registered as strings. | false | false | None | None | None |
| `quote` | The character used to quote column values. Accepts `"` (double quotation mark) or `'` (single quotation mark). If unspecified, defaults to `"` (double quotation mark). | false | false | None | None | None |

### json_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `encoding` | The character encoding of the data. The default is UTF-8. | false | false | None | None | None |
| `type_inference_disabled` | Whether to disable the inference of data types for JSON data. If true, all columns are registered as their primitive types (strings, number, or boolean). | false | false | None | None | None |
