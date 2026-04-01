## 🛡️ Policy Deployment Engine: `bigquery_job`

This section provides a concise policy evaluation for the `bigquery_job` resource in GCP.

Reference: [Terraform Registry – bigquery_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `job_id` | The ID of the job. The ID must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), or dashes (-). The maximum length is 1,024 characters. | true | false | None | None | None |
| `job_timeout_ms` | Job timeout in milliseconds. If this time limit is exceeded, BigQuery may attempt to terminate the job. | false | false | None | None | None |
| `labels` | The labels associated with this job. You can use these to organize and group your jobs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `query` | Configures a query job. Structure is [documented below](#nested_configuration_query). | false | false | None | None | None |
| `load` | Configures a load job. Structure is [documented below](#nested_configuration_load). | false | false | None | None | None |
| `copy` | Copies a table. Structure is [documented below](#nested_configuration_copy). | false | false | None | None | None |
| `extract` | Configures an extract job. Structure is [documented below](#nested_configuration_extract). | false | false | None | None | None |
| `location` | The geographic location of the job. The default value is US. | false | true | location determines access | australia-southeast1 | global |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `destination_table` |  | false | false | None | None | None |
| `user_defined_function_resources` |  | false | false | None | None | None |
| `default_dataset` |  | false | false | None | None | None |
| `destination_encryption_configuration` |  | false | false | None | None | None |
| `script_options` |  | false | false | None | None | None |
| `time_partitioning` |  | false | false | None | None | None |
| `parquet_options` |  | false | false | None | None | None |
| `source_tables` |  | false | false | None | None | None |
| `source_table` |  | false | false | None | None | None |
| `source_model` |  | false | false | None | None | None |

### query Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query` | SQL query text to execute. The useLegacySql field can be used to indicate whether the query uses legacy SQL or standard SQL. *NOTE*: queries containing [DML language](https://cloud.google.com/bigquery/docs/reference/standard-sql/data-manipulation-language) (`DELETE`, `UPDATE`, `MERGE`, `INSERT`) must specify `create_disposition = ""` and `write_disposition = ""`. | true | false | None | None | None |
| `destination_table` | Describes the table where the query results should be stored. This property must be set for large results that exceed the maximum response size. For queries that produce anonymous (cached) results, this field will be populated by BigQuery. Structure is [documented below](#nested_configuration_query_destination_table). | false | false | None | None | None |
| `user_defined_function_resources` | Describes user-defined function resources used in the query. Structure is [documented below](#nested_configuration_query_user_defined_function_resources). | false | false | None | None | None |
| `create_disposition` | Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. Creation, truncation and append actions occur as one atomic update upon job completion Default value is `CREATE_IF_NEEDED`. Possible values are: `CREATE_IF_NEEDED`, `CREATE_NEVER`. | false | false | None | None | None |
| `write_disposition` | Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data and uses the schema from the query result. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. Default value is `WRITE_EMPTY`. Possible values are: `WRITE_TRUNCATE`, `WRITE_APPEND`, `WRITE_EMPTY`. | false | false | None | None | None |
| `default_dataset` | Specifies the default dataset to use for unqualified table names in the query. Note that this does not alter behavior of unqualified dataset names. Structure is [documented below](#nested_configuration_query_default_dataset). | false | false | None | None | None |
| `priority` | Specifies a priority for the query. Default value is `INTERACTIVE`. Possible values are: `INTERACTIVE`, `BATCH`. | false | false | None | None | None |
| `allow_large_results` | If true and query uses legacy SQL dialect, allows the query to produce arbitrarily large result tables at a slight cost in performance. Requires destinationTable to be set. For standard SQL queries, this flag is ignored and large results are always allowed. However, you must still set destinationTable when result size exceeds the allowed maximum response size. | false | false | None | None | None |
| `use_query_cache` | Whether to look for the result in the query cache. The query cache is a best-effort cache that will be flushed whenever tables in the query are modified. Moreover, the query cache is only available when a query does not have a destination table specified. The default value is true. | false | false | None | None | None |
| `flatten_results` | If true and query uses legacy SQL dialect, flattens all nested and repeated fields in the query results. allowLargeResults must be true if this is set to false. For standard SQL queries, this flag is ignored and results are never flattened. | false | false | None | None | None |
| `maximum_billing_tier` | Limits the billing tier for this job. Queries that have resource usage beyond this tier will fail (without incurring a charge). If unspecified, this will be set to your project default. | false | false | None | None | None |
| `maximum_bytes_billed` | Limits the bytes billed for this job. Queries that will have bytes billed beyond this limit will fail (without incurring a charge). If unspecified, this will be set to your project default. | false | false | None | None | None |
| `use_legacy_sql` | Specifies whether to use BigQuery's legacy SQL dialect for this query. The default value is true. If set to false, the query will use BigQuery's standard SQL. | false | false | None | None | None |
| `parameter_mode` | Standard SQL only. Set to POSITIONAL to use positional (?) query parameters or to NAMED to use named (@myparam) query parameters in this query. | false | false | None | None | None |
| `schema_update_options` | Allows the schema of the destination table to be updated as a side effect of the query job. Schema update options are supported in two cases: when writeDisposition is WRITE_APPEND; when writeDisposition is WRITE_TRUNCATE and the destination table is a partition of a table, specified by partition decorators. For normal tables, WRITE_TRUNCATE will always overwrite the schema. One or more of the following values are specified: ALLOW_FIELD_ADDITION: allow adding a nullable field to the schema. ALLOW_FIELD_RELAXATION: allow relaxing a required field in the original schema to nullable. | false | false | None | None | None |
| `destination_encryption_configuration` | Custom encryption configuration (e.g., Cloud KMS keys) Structure is [documented below](#nested_configuration_query_destination_encryption_configuration). | false | false | None | None | None |
| `script_options` | Options controlling the execution of scripts. Structure is [documented below](#nested_configuration_query_script_options). | false | false | None | None | None |
| `continuous` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Whether to run the query as continuous or a regular query. | false | false | None | None | None |

### load Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_uris` | The fully-qualified URIs that point to your data in Google Cloud. For Google Cloud Storage URIs: Each URI can contain one '\*' wildcard character and it must come after the 'bucket' name. Size limits related to load jobs apply to external data sources. For Google Cloud Bigtable URIs: Exactly one URI can be specified and it has be a fully specified and valid HTTPS URL for a Google Cloud Bigtable table. For Google Cloud Datastore backups: Exactly one URI can be specified. Also, the '\*' wildcard character is not allowed. | true | false | None | None | None |
| `destination_table` | The destination table to load the data into. Structure is [documented below](#nested_configuration_load_destination_table). | true | false | None | None | None |
| `create_disposition` | Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. Creation, truncation and append actions occur as one atomic update upon job completion Default value is `CREATE_IF_NEEDED`. Possible values are: `CREATE_IF_NEEDED`, `CREATE_NEVER`. | false | false | None | None | None |
| `write_disposition` | Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data and uses the schema from the query result. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. Default value is `WRITE_EMPTY`. Possible values are: `WRITE_TRUNCATE`, `WRITE_APPEND`, `WRITE_EMPTY`. | false | false | None | None | None |
| `null_marker` | Specifies a string that represents a null value in a CSV file. For example, if you specify "\N", BigQuery interprets "\N" as a null value when loading a CSV file. The default value is the empty string. If you set this property to a custom value, BigQuery throws an error if an empty string is present for all data types except for STRING and BYTE. For STRING and BYTE columns, BigQuery interprets the empty string as an empty value. | false | false | None | None | None |
| `field_delimiter` | The separator for fields in a CSV file. The separator can be any ISO-8859-1 single-byte character. To use a character in the range 128-255, you must encode the character as UTF8. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. BigQuery also supports the escape sequence "\t" to specify a tab separator. The default value is a comma (','). | false | false | None | None | None |
| `skip_leading_rows` | The number of rows at the top of a CSV file that BigQuery will skip when loading the data. The default value is 0. This property is useful if you have header rows in the file that should be skipped. When autodetect is on, the behavior is the following: skipLeadingRows unspecified - Autodetect tries to detect headers in the first row. If they are not detected, the row is read as data. Otherwise data is read starting from the second row. skipLeadingRows is 0 - Instructs autodetect that there are no headers and data should be read starting from the first row. skipLeadingRows = N > 0 - Autodetect skips N-1 rows and tries to detect headers in row N. If headers are not detected, row N is just skipped. Otherwise row N is used to extract column names for the detected schema. | false | false | None | None | None |
| `encoding` | The character encoding of the data. The supported values are UTF-8 or ISO-8859-1. The default value is UTF-8. BigQuery decodes the data after the raw, binary data has been split using the values of the quote and fieldDelimiter properties. | false | false | None | None | None |
| `quote` | The value that is used to quote data sections in a CSV file. BigQuery converts the string to ISO-8859-1 encoding, and then uses the first byte of the encoded string to split the data in its raw, binary state. The default value is a double-quote ('"'). If your data does not contain quoted sections, set the property value to an empty string. If your data contains quoted newline characters, you must also set the allowQuotedNewlines property to true. | false | false | None | None | None |
| `max_bad_records` | The maximum number of bad records that BigQuery can ignore when running the job. If the number of bad records exceeds this value, an invalid error is returned in the job result. The default value is 0, which requires that all records are valid. | false | true | max_bad_records defines the tolerance for bad data during load | 10 | None |
| `allow_quoted_newlines` | Indicates if BigQuery should allow quoted data sections that contain newline characters in a CSV file. The default value is false. | false | false | None | None | None |
| `source_format` | The format of the data files. For CSV files, specify "CSV". For datastore backups, specify "DATASTORE_BACKUP". For newline-delimited JSON, specify "NEWLINE_DELIMITED_JSON". For Avro, specify "AVRO". For parquet, specify "PARQUET". For orc, specify "ORC". [Beta] For Bigtable, specify "BIGTABLE". The default value is CSV. | false | false | None | None | None |
| `json_extension` | If sourceFormat is set to newline-delimited JSON, indicates whether it should be processed as a JSON variant such as GeoJSON. For a sourceFormat other than JSON, omit this field. If the sourceFormat is newline-delimited JSON: - for newline-delimited GeoJSON: set to GEOJSON. | false | false | None | None | None |
| `allow_jagged_rows` | Accept rows that are missing trailing optional columns. The missing values are treated as nulls. If false, records with missing trailing columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. Only applicable to CSV, ignored for other formats. | false | false | None | None | None |
| `ignore_unknown_values` | Indicates if BigQuery should allow extra values that are not represented in the table schema. If true, the extra values are ignored. If false, records with extra columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. The sourceFormat property determines what BigQuery treats as an extra value: CSV: Trailing columns JSON: Named values that don't match any column names | false | false | None | None | None |
| `projection_fields` | If sourceFormat is set to "DATASTORE_BACKUP", indicates which entity properties to load into BigQuery from a Cloud Datastore backup. Property names are case sensitive and must be top-level properties. If no properties are specified, BigQuery loads all properties. If any named property isn't found in the Cloud Datastore backup, an invalid error is returned in the job result. | false | false | None | None | None |
| `autodetect` | Indicates if we should automatically infer the options and schema for CSV and JSON sources. | false | false | None | None | None |
| `schema_update_options` | Allows the schema of the destination table to be updated as a side effect of the load job if a schema is autodetected or supplied in the job configuration. Schema update options are supported in two cases: when writeDisposition is WRITE_APPEND; when writeDisposition is WRITE_TRUNCATE and the destination table is a partition of a table, specified by partition decorators. For normal tables, WRITE_TRUNCATE will always overwrite the schema. One or more of the following values are specified: ALLOW_FIELD_ADDITION: allow adding a nullable field to the schema. ALLOW_FIELD_RELAXATION: allow relaxing a required field in the original schema to nullable. | false | false | None | None | None |
| `time_partitioning` | Time-based partitioning specification for the destination table. Structure is [documented below](#nested_configuration_load_time_partitioning). | false | false | None | None | None |
| `destination_encryption_configuration` | Custom encryption configuration (e.g., Cloud KMS keys) Structure is [documented below](#nested_configuration_load_destination_encryption_configuration). | false | false | None | None | None |
| `parquet_options` | Parquet Options for load and make external tables. Structure is [documented below](#nested_configuration_load_parquet_options). | false | false | None | None | None |

### copy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_tables` | Source tables to copy. Structure is [documented below](#nested_configuration_copy_source_tables). | true | false | None | None | None |
| `destination_table` | The destination table. Structure is [documented below](#nested_configuration_copy_destination_table). | false | false | None | None | None |
| `create_disposition` | Specifies whether the job is allowed to create new tables. The following values are supported: CREATE_IF_NEEDED: If the table does not exist, BigQuery creates the table. CREATE_NEVER: The table must already exist. If it does not, a 'notFound' error is returned in the job result. Creation, truncation and append actions occur as one atomic update upon job completion Default value is `CREATE_IF_NEEDED`. Possible values are: `CREATE_IF_NEEDED`, `CREATE_NEVER`. | false | false | None | None | None |
| `write_disposition` | Specifies the action that occurs if the destination table already exists. The following values are supported: WRITE_TRUNCATE: If the table already exists, BigQuery overwrites the table data and uses the schema from the query result. WRITE_APPEND: If the table already exists, BigQuery appends the data to the table. WRITE_EMPTY: If the table already exists and contains data, a 'duplicate' error is returned in the job result. Each action is atomic and only occurs if BigQuery is able to complete the job successfully. Creation, truncation and append actions occur as one atomic update upon job completion. Default value is `WRITE_EMPTY`. Possible values are: `WRITE_TRUNCATE`, `WRITE_APPEND`, `WRITE_EMPTY`. | false | false | None | None | None |
| `destination_encryption_configuration` | Custom encryption configuration (e.g., Cloud KMS keys) Structure is [documented below](#nested_configuration_copy_destination_encryption_configuration). | false | false | None | None | None |

### extract Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `destination_uris` | A list of fully-qualified Google Cloud Storage URIs where the extracted table should be written. | true | false | None | None | None |
| `print_header` | Whether to print out a header row in the results. Default is true. | false | false | None | None | None |
| `field_delimiter` | When extracting data in CSV format, this defines the delimiter to use between fields in the exported data. Default is ',' | false | false | None | None | None |
| `destination_format` | The exported file format. Possible values include CSV, NEWLINE_DELIMITED_JSON and AVRO for tables and SAVED_MODEL for models. The default value for tables is CSV. Tables with nested or repeated fields cannot be exported as CSV. The default value for models is SAVED_MODEL. | false | false | None | None | None |
| `compression` | The compression type to use for exported files. Possible values include GZIP, DEFLATE, SNAPPY, and NONE. The default value is NONE. DEFLATE and SNAPPY are only supported for Avro. | false | false | None | None | None |
| `use_avro_logical_types` | Whether to use logical types when extracting to AVRO format. | false | false | None | None | None |
| `source_table` | A reference to the table being exported. Structure is [documented below](#nested_configuration_extract_source_table). | false | false | None | None | None |
| `source_model` | A reference to the model being exported. Structure is [documented below](#nested_configuration_extract_source_model). | false | false | None | None | None |

### destination_table Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The ID of the project containing this table. | false | false | None | None | None |
| `dataset_id` | The ID of the dataset containing this table. | false | false | None | None | None |
| `table_id` | The table. Can be specified `{{table_id}}` if `project_id` and `dataset_id` are also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}/tables/{{table_id}}` if not. | true | false | None | None | None |

### user_defined_function_resources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_uri` | A code resource to load from a Google Cloud Storage URI (gs://bucket/path). | false | false | None | None | None |
| `inline_code` | An inline resource that contains code for a user-defined function (UDF). Providing a inline code resource is equivalent to providing a URI for a file containing the same code. | false | false | None | None | None |

### default_dataset Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | The dataset. Can be specified `{{dataset_id}}` if `project_id` is also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}` if not. | true | false | None | None | None |
| `project_id` | The ID of the project containing this table. | false | false | None | None | None |

### destination_encryption_configuration Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_name` | Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key. | true | false | None | None | None |
| `kms_key_version` | (Output) Describes the Cloud KMS encryption key version used to protect destination BigQuery table. | false | false | None | None | None |

### script_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `statement_timeout_ms` | Timeout period for each statement in a script. | false | false | None | None | None |
| `statement_byte_budget` | Limit on the number of bytes billed per statement. Exceeding this budget results in an error. | false | false | None | None | None |
| `key_result_statement` | Determines which statement in the script represents the "key result", used to populate the schema and query results of the script job. Possible values are: `LAST`, `FIRST_SELECT`. | false | false | None | None | None |

### time_partitioning Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The only type supported is DAY, which will generate one partition per day. Providing an empty string used to cause an error, but in OnePlatform the field will be treated as unset. | true | false | None | None | None |
| `expiration_ms` | Number of milliseconds for which to keep the storage for a partition. A wrapper is used here because 0 is an invalid value. | false | false | None | None | None |
| `field` | If not set, the table is partitioned by pseudo column '_PARTITIONTIME'; if set, the table is partitioned by this field. The field must be a top-level TIMESTAMP or DATE field. Its mode must be NULLABLE or REQUIRED. A wrapper is used here because an empty string is an invalid value. | false | false | None | None | None |

### parquet_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enum_as_string` | If sourceFormat is set to PARQUET, indicates whether to infer Parquet ENUM logical type as STRING instead of BYTES by default. | false | false | None | None | None |
| `enable_list_inference` | If sourceFormat is set to PARQUET, indicates whether to use schema inference specifically for Parquet LIST logical type. | false | false | None | None | None |

### source_tables Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The ID of the project containing this table. | false | false | None | None | None |
| `dataset_id` | The ID of the dataset containing this table. | false | false | None | None | None |
| `table_id` | The table. Can be specified `{{table_id}}` if `project_id` and `dataset_id` are also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}/tables/{{table_id}}` if not. | true | false | None | None | None |

### source_table Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The ID of the project containing this table. | false | false | None | None | None |
| `dataset_id` | The ID of the dataset containing this table. | false | false | None | None | None |
| `table_id` | The table. Can be specified `{{table_id}}` if `project_id` and `dataset_id` are also set, or of the form `projects/{{project}}/datasets/{{dataset_id}}/tables/{{table_id}}` if not. | true | false | None | None | None |

### source_model Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The ID of the project containing this model. | true | false | None | None | None |
| `dataset_id` | The ID of the dataset containing this model. | true | false | None | None | None |
| `model_id` | The ID of the model. | true | false | None | None | None |
