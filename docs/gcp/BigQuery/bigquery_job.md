## 🛡️ Policy Deployment Engine: `bigquery_job`

This section provides a concise policy evaluation for the `bigquery_job` resource in GCP.

Reference: [Terraform Registry – bigquery_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_job)

---

## 1. Argument Reference

### `job_id`
- Description: (Required) The ID of the job. The ID must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). The maximum length is 1,024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `job_timeout_ms`
- Description: (Optional) Job timeout in milliseconds. If this time limit is exceeded, BigQuery may attempt to terminate the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels associated with this job. You can use these to organize and group your jobs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query`
- Description: (Optional) Configures a query job. Structure is [documented below](#nested_configuration_query).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load`
- Description: (Optional) Configures a load job. Structure is [documented below](#nested_configuration_load).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `copy`
- Description: (Optional) Copies a table. Structure is [documented below](#nested_configuration_copy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extract`
- Description: (Optional) Configures an extract job. Structure is [documented below](#nested_configuration_extract).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The geographic location of the job. The default value is US.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_configuration_query"></a>The `query` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query`
- Description: (Required) SQL query text to execute. The useLegacySql field can be used to indicate whether the query uses legacy SQL or standard SQL. *NOTE*: queries containing [DML language](https://cloud.google.com/bigquery/docs/reference/standard-sql/data-manipulation-language) (`DELETE`, `UPDATE`, `MERGE`, `INSERT`) must specify `create_disposition = ""` and `write_disposition = ""`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_table`
- Description: (Optional) Describes the table where the query results should be stored. This property must be set for large results that exceed the maximum response size. For queries that produce anonymous (cached) results, this field will be populated by BigQuery. Structure is [documented below](#nested_configuration_query_destination_table).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_defined_function_resources`
- Description: (Optional) Describes user-defined function resources used in the query. Structure is [documented below](#nested_configuration_query_user_defined_function_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_disposition`
- Description: (Optional) Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. Creation, truncation and append actions occur as one atomic update upon job completion Default value is `CREATE_IF_NEEDED`. Possible values are: `CREATE_IF_NEEDED`, `CREATE_NEVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `write_disposition`
- Description: (Optional) Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data and uses the schema from the query result. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. Default value is `WRITE_EMPTY`. Possible values are: `WRITE_TRUNCATE`, `WRITE_APPEND`, `WRITE_EMPTY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_dataset`
- Description: (Optional) Specifies the default dataset to use for unqualified table names in the query. Note that this does not alter behavior of unqualified dataset names. Structure is [documented below](#nested_configuration_query_default_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Optional) Specifies a priority for the query. Default value is `INTERACTIVE`. Possible values are: `INTERACTIVE`, `BATCH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_large_results`
- Description: (Optional) If true and query uses legacy SQL dialect, allows the query to produce arbitrarily large result tables at a slight cost in performance. Requires destinationTable to be set. For standard SQL queries, this flag is ignored and large results are always allowed. However, you must still set destinationTable when result size exceeds the allowed maximum response size.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_query_cache`
- Description: (Optional) Whether to look for the result in the query cache. The query cache is a best-effort cache that will be flushed whenever tables in the query are modified. Moreover, the query cache is only available when a query does not have a destination table specified. The default value is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flatten_results`
- Description: (Optional) If true and query uses legacy SQL dialect, flattens all nested and repeated fields in the query results. allowLargeResults must be true if this is set to false. For standard SQL queries, this flag is ignored and results are never flattened.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maximum_billing_tier`
- Description: (Optional) Limits the billing tier for this job. Queries that have resource usage beyond this tier will fail (without incurring a charge). If unspecified, this will be set to your project default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maximum_bytes_billed`
- Description: (Optional) Limits the bytes billed for this job. Queries that will have bytes billed beyond this limit will fail (without incurring a charge). If unspecified, this will be set to your project default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_legacy_sql`
- Description: (Optional) Specifies whether to use BigQuery's legacy SQL dialect for this query. The default value is true. If set to false, the query will use BigQuery's standard SQL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameter_mode`
- Description: (Optional) Standard SQL only. Set to POSITIONAL to use positional (?) query parameters or to NAMED to use named (@myparam) query parameters in this query.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_update_options`
- Description: (Optional) Allows the schema of the destination table to be updated as a side effect of the query job. Schema update options are supported in two cases: when writeDisposition is WRITE_APPEND; when writeDisposition is WRITE_TRUNCATE and the destination table is a partition of a table, specified by partition decorators. For normal tables, WRITE_TRUNCATE will always overwrite the schema. One or more of the following values are specified: ALLOW_FIELD_ADDITION: allow adding a nullable field to the schema. ALLOW_FIELD_RELAXATION: allow relaxing a required field in the original schema to nullable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_encryption_configuration`
- Description: (Optional) Custom encryption configuration (e.g., Cloud KMS keys) Structure is [documented below](#nested_configuration_query_destination_encryption_configuration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_options`
- Description: (Optional) Options controlling the execution of scripts. Structure is [documented below](#nested_configuration_query_script_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `continuous`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Whether to run the query as continuous or a regular query. <a name="nested_configuration_query_destination_table"></a>The `destination_table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Optional) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The table. Can be specified `{{table_id}}` if `project_id` and `dataset_id` are also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}/tables/{{table_id}}` if not. <a name="nested_configuration_query_user_defined_function_resources"></a>The `user_defined_function_resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_uri`
- Description: (Optional) A code resource to load from a Google Cloud Storage URI (gs://bucket/path).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inline_code`
- Description: (Optional) An inline resource that contains code for a user-defined function (UDF). Providing a inline code resource is equivalent to providing a URI for a file containing the same code. <a name="nested_configuration_query_default_dataset"></a>The `default_dataset` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The dataset. Can be specified `{{dataset_id}}` if `project_id` is also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}` if not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The ID of the project containing this table. <a name="nested_configuration_query_destination_encryption_configuration"></a>The `destination_encryption_configuration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Required) Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_version`
- Description: (Output) Describes the Cloud KMS encryption key version used to protect destination BigQuery table. <a name="nested_configuration_query_script_options"></a>The `script_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `statement_timeout_ms`
- Description: (Optional) Timeout period for each statement in a script.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `statement_byte_budget`
- Description: (Optional) Limit on the number of bytes billed per statement. Exceeding this budget results in an error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_result_statement`
- Description: (Optional) Determines which statement in the script represents the "key result", used to populate the schema and query results of the script job. Possible values are: `LAST`, `FIRST_SELECT`. <a name="nested_configuration_load"></a>The `load` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_uris`
- Description: (Required) The fully-qualified URIs that point to your data in Google Cloud. For Google Cloud Storage URIs: Each URI can contain one '\*' wildcard character and it must come after the 'bucket' name. Size limits related to load jobs apply to external data sources. For Google Cloud Bigtable URIs: Exactly one URI can be specified and it has be a fully specified and valid HTTPS URL for a Google Cloud Bigtable table. For Google Cloud Datastore backups: Exactly one URI can be specified. Also, the '\*' wildcard character is not allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_table`
- Description: (Required) The destination table to load the data into. Structure is [documented below](#nested_configuration_load_destination_table).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_disposition`
- Description: (Optional) Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. Creation, truncation and append actions occur as one atomic update upon job completion Default value is `CREATE_IF_NEEDED`. Possible values are: `CREATE_IF_NEEDED`, `CREATE_NEVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `write_disposition`
- Description: (Optional) Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data and uses the schema from the query result. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. Default value is `WRITE_EMPTY`. Possible values are: `WRITE_TRUNCATE`, `WRITE_APPEND`, `WRITE_EMPTY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `null_marker`
- Description: (Optional) Specifies a string that represents a null value in a CSV file. For example, if you specify "\N", BigQuery interprets "\N" as a null value when loading a CSV file. The default value is the empty string. If you set this property to a custom value, BigQuery throws an error if an empty string is present for all data types except for STRING and BYTE. For STRING and BYTE columns, BigQuery interprets the empty string as an empty value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_delimiter`
- Description: (Optional) The separator for fields in a CSV file. The separator can be any ISO-8859-1 single-byte character. To use a character in the range 128-255, you must encode the character as UTF8. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. BigQuery also supports the escape sequence "\t" to specify a tab separator. The default value is a comma (',').
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `skip_leading_rows`
- Description: (Optional) The number of rows at the top of a CSV file that BigQuery will skip when loading the data. The default value is 0. This property is useful if you have header rows in the file that should be skipped. When autodetect is on, the behavior is the following: skipLeadingRows unspecified - Autodetect tries to detect headers in the first row. If they are not detected, the row is read as data. Otherwise data is read starting from the second row. skipLeadingRows is 0 - Instructs autodetect that there are no headers and data should be read starting from the first row. skipLeadingRows = N > 0 - Autodetect skips N-1 rows and tries to detect headers in row N. If headers are not detected, row N is just skipped. Otherwise row N is used to extract column names for the detected schema.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Optional) The character encoding of the data. The supported values are UTF-8 or ISO-8859-1. The default value is UTF-8. BigQuery decodes the data after the raw, binary data has been split using the values of the quote and fieldDelimiter properties.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quote`
- Description: (Optional) The value that is used to quote data sections in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. The default value is a double-quote ('"'). If your data does not contain quoted sections, set the property value to an empty string. If your data contains quoted newline characters, you must also set the allowQuotedNewlines property to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_bad_records`
- Description: (Optional) The maximum number of bad records that BigQuery can ignore when running the job. If the number of bad records exceeds this value, an invalid error is returned in the job result. The default value is 0, which requires that all records are valid.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_quoted_newlines`
- Description: (Optional) Indicates if BigQuery should allow quoted data sections that contain newline characters in a CSV file. The default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_format`
- Description: (Optional) The format of the data files. For CSV files, specify "CSV". For datastore backups, specify "DATASTORE_BACKUP". For newline-delimited JSON, specify "NEWLINE_DELIMITED_JSON". For Avro, specify "AVRO". For parquet, specify "PARQUET". For orc, specify "ORC". [Beta] For Bigtable, specify "BIGTABLE". The default value is CSV.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_extension`
- Description: (Optional) If sourceFormat is set to newline-delimited JSON, indicates whether it should be processed as a JSON variant such as GeoJSON. For a sourceFormat other than JSON, omit this field. If the sourceFormat is newline-delimited JSON: - for newline-delimited GeoJSON: set to GEOJSON.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_jagged_rows`
- Description: (Optional) Accept rows that are missing trailing optional columns. The missing values are treated as nulls. If false, records with missing trailing columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. Only applicable to CSV, ignored for other formats.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_unknown_values`
- Description: (Optional) Indicates if BigQuery should allow extra values that are not represented in the table schema. If true, the extra values are ignored. If false, records with extra columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. The sourceFormat property determines what BigQuery treats as an extra value: CSV: Trailing columns JSON: Named values that don't match any column names
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `projection_fields`
- Description: (Optional) If sourceFormat is set to "DATASTORE_BACKUP", indicates which entity properties to load into BigQuery from a Cloud Datastore backup. Property names are case sensitive and must be top-level properties. If no properties are specified, BigQuery loads all properties. If any named property isn't found in the Cloud Datastore backup, an invalid error is returned in the job result.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autodetect`
- Description: (Optional) Indicates if we should automatically infer the options and schema for CSV and JSON sources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_update_options`
- Description: (Optional) Allows the schema of the destination table to be updated as a side effect of the load job if a schema is autodetected or supplied in the job configuration. Schema update options are supported in two cases: when writeDisposition is WRITE_APPEND; when writeDisposition is WRITE_TRUNCATE and the destination table is a partition of a table, specified by partition decorators. For normal tables, WRITE_TRUNCATE will always overwrite the schema. One or more of the following values are specified: ALLOW_FIELD_ADDITION: allow adding a nullable field to the schema. ALLOW_FIELD_RELAXATION: allow relaxing a required field in the original schema to nullable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_partitioning`
- Description: (Optional) Time-based partitioning specification for the destination table. Structure is [documented below](#nested_configuration_load_time_partitioning).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_encryption_configuration`
- Description: (Optional) Custom encryption configuration (e.g., Cloud KMS keys) Structure is [documented below](#nested_configuration_load_destination_encryption_configuration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parquet_options`
- Description: (Optional) Parquet Options for load and make external tables. Structure is [documented below](#nested_configuration_load_parquet_options). <a name="nested_configuration_load_destination_table"></a>The `destination_table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Optional) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The table. Can be specified `{{table_id}}` if `project_id` and `dataset_id` are also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}/tables/{{table_id}}` if not. <a name="nested_configuration_load_time_partitioning"></a>The `time_partitioning` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The only type supported is DAY, which will generate one partition per day. Providing an empty string used to cause an error, but in OnePlatform the field will be treated as unset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration_ms`
- Description: (Optional) Number of milliseconds for which to keep the storage for a partition. A wrapper is used here because 0 is an invalid value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field`
- Description: (Optional) If not set, the table is partitioned by pseudo column '_PARTITIONTIME'; if set, the table is partitioned by this field. The field must be a top-level TIMESTAMP or DATE field. Its mode must be NULLABLE or REQUIRED. A wrapper is used here because an empty string is an invalid value. <a name="nested_configuration_load_destination_encryption_configuration"></a>The `destination_encryption_configuration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Required) Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_version`
- Description: (Output) Describes the Cloud KMS encryption key version used to protect destination BigQuery table. <a name="nested_configuration_load_parquet_options"></a>The `parquet_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enum_as_string`
- Description: (Optional) If sourceFormat is set to PARQUET, indicates whether to infer Parquet ENUM logical type as STRING instead of BYTES by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_list_inference`
- Description: (Optional) If sourceFormat is set to PARQUET, indicates whether to use schema inference specifically for Parquet LIST logical type. <a name="nested_configuration_copy"></a>The `copy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_tables`
- Description: (Required) Source tables to copy. Structure is [documented below](#nested_configuration_copy_source_tables).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_table`
- Description: (Optional) The destination table. Structure is [documented below](#nested_configuration_copy_destination_table).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_disposition`
- Description: (Optional) Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. Creation, truncation and append actions occur as one atomic update upon job completion Default value is `CREATE_IF_NEEDED`. Possible values are: `CREATE_IF_NEEDED`, `CREATE_NEVER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `write_disposition`
- Description: (Optional) Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data and uses the schema from the query result. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. Default value is `WRITE_EMPTY`. Possible values are: `WRITE_TRUNCATE`, `WRITE_APPEND`, `WRITE_EMPTY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_encryption_configuration`
- Description: (Optional) Custom encryption configuration (e.g., Cloud KMS keys) Structure is [documented below](#nested_configuration_copy_destination_encryption_configuration). <a name="nested_configuration_copy_source_tables"></a>The `source_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Optional) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The table. Can be specified `{{table_id}}` if `project_id` and `dataset_id` are also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}/tables/{{table_id}}` if not. <a name="nested_configuration_copy_destination_table"></a>The `destination_table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Optional) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The table. Can be specified `{{table_id}}` if `project_id` and `dataset_id` are also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}/tables/{{table_id}}` if not. <a name="nested_configuration_copy_destination_encryption_configuration"></a>The `destination_encryption_configuration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Required) Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_version`
- Description: (Output) Describes the Cloud KMS encryption key version used to protect destination BigQuery table. <a name="nested_configuration_extract"></a>The `extract` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_uris`
- Description: (Required) A list of fully-qualified Google Cloud Storage URIs where the extracted table should be written.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `print_header`
- Description: (Optional) Whether to print out a header row in the results. Default is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_delimiter`
- Description: (Optional) When extracting data in CSV format, this defines the delimiter to use between fields in the exported data. Default is ','
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_format`
- Description: (Optional) The exported file format. Possible values include CSV, NEWLINE_DELIMITED_JSON and AVRO for tables and SAVED_MODEL for models. The default value for tables is CSV. Tables with nested or repeated fields cannot be exported as CSV. The default value for models is SAVED_MODEL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compression`
- Description: (Optional) The compression type to use for exported files. Possible values include GZIP, DEFLATE, SNAPPY, and NONE. The default value is NONE. DEFLATE and SNAPPY are only supported for Avro.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_avro_logical_types`
- Description: (Optional) Whether to use logical types when extracting to AVRO format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_table`
- Description: (Optional) A reference to the table being exported. Structure is [documented below](#nested_configuration_extract_source_table).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_model`
- Description: (Optional) A reference to the model being exported. Structure is [documented below](#nested_configuration_extract_source_model). <a name="nested_configuration_extract_source_table"></a>The `source_table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Optional) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The table. Can be specified `{{table_id}}` if `project_id` and `dataset_id` are also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}/tables/{{table_id}}` if not. <a name="nested_configuration_extract_source_model"></a>The `source_model` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this model.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The ID of the dataset containing this model.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `model_id`
- Description: (Required) The ID of the model.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
