## 🛡️ Policy Deployment Engine: `bigquery_table`

This section provides a concise policy evaluation for the `bigquery_table` resource in GCP.

Reference: [Terraform Registry – bigquery_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table)

---

## 1. Argument Reference

### `dataset_id`
- Description: Changing this forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: Changing this forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration_time`
- Description: milliseconds since the epoch. If not present, the table will persist indefinitely. Expired tables will be deleted and their storage reclaimed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_data_configuration`
- Description: location, and other properties of a table stored outside of BigQuery. By defining these properties, the data source can then be queried as if it were a standard BigQuery table. Structure is [documented below](#nested_external_data_configuration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `biglake_configuration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `friendly_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_staleness`
- Description: returned when the table (or stale MV) is queried. Staleness encoded as a string encoding of [SQL IntervalValue type](https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types#interval_type).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_configuration`
- Description: If left blank, the table will be encrypted with a Google-managed key; that process is transparent to the user.  Structure is [documented below](#nested_encryption_configuration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terraform_labels`
- Description: The combination of labels configured directly on the resource and default labels configured on the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_labels`
- Description: All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. * <a name="schema"></a>`schema` - (Optional) A JSON schema for the table. ~>**NOTE:** Because this field expects a JSON string, any changes to the string will create a diff, even if the JSON itself hasn't changed. If the API returns a different value for the same schema, e.g. it switched the order of values or replaced a field data type (`STRUCT` with `RECORD`, `DECIMAL` with `NUMERIC`, etc.), we currently cannot suppress the recurring diff this causes. As a workaround, we recommend using the schema as returned by the API. ~>**NOTE:**  If you use `external_data_configuration` [documented below](#nested_external_data_configuration) and do **not** set `external_data_configuration.connection_id`, schemas must be specified with `external_data_configuration.schema`. Otherwise, schemas must be specified with this top-level field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_schema_changes`
- Description: **NOTE:** Right now only `dataPolicies` field is supported. We might support others in the future.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_auto_generated_schema`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_foreign_type_info`
- Description: type definition in field schema. Structure is [documented below](#nested_schema_foreign_type_info).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_partitioning`
- Description: partitioning for this table. Structure is [documented below](#nested_time_partitioning).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range_partitioning`
- Description: partitioning for this table. Structure is [documented below](#nested_range_partitioning).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_partition_filter`
- Description: require a partition filter that can be used for partition elimination to be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `clustering`
- Description: Up to four top-level columns are allowed, and should be specified in descending priority order.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `view`
- Description: Structure is [documented below](#nested_view).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `materialized_view`
- Description: Structure is [documented below](#nested_materialized_view).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the table will fail. When the field is set to false, deleting the table is allowed..
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_constraints`
- Description: Structure is [documented below](#nested_table_constraints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_replication_info`
- Description: using "AS REPLICA" DDL like: `CREATE MATERIALIZED VIEW mv1 AS REPLICA OF src_mv`. Structure is [documented below](#nested_table_replication_info).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_tags`
- Description: globally unique. Tag key is expected to be in the namespaced format, for example "123456789012/environment" where 123456789012 is the ID of the parent organization or project resource for this tag key. Tag value is expected to be the short name, for example "Production". See [Tag definitions](https://cloud.google.com/iam/docs/tags-access-control#definitions) for more details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_catalog_table_options`
- Description: compatible table. Structure is [documented below](#nested_external_catalog_table_options). <a name="nested_external_data_configuration"></a>The `external_data_configuration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autodetect`
- Description: and format of the table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compression`
- Description: Valid values are "NONE" or "GZIP".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_id`
- Description: external storage, such as Azure Blob, Cloud Storage, or S3. The `connection_id` can have the form `{{project}}.{{location}}.{{connection_id}}` or `projects/{{project}}/locations/{{location}}/connections/{{connection_id}}`. ~>**NOTE:** If you set `external_data_configuration.connection_id`, the table schema must be specified using the top-level `schema` field [documented above](#schema).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `csv_options`
- Description: `source_format` is set to "CSV". Structure is [documented below](#nested_csv_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigtable_options`
- Description: `source_format` is set to "BIGTABLE". Structure is [documented below](#nested_bigtable_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_options`
- Description: `source_format` is set to "JSON". Structure is [documented below](#nested_json_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_extension`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parquet_options`
- Description: `source_format` is set to "PARQUET". Structure is [documented below](#nested_parquet_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_sheets_options`
- Description: `source_format` is set to "GOOGLE_SHEETS". Structure is [documented below](#nested_google_sheets_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hive_partitioning_options`
- Description: support. Not all storage formats support hive partitioning -- requesting hive partitioning on an unsupported format will lead to an error, as will providing an invalid specification. Structure is [documented below](#nested_hive_partitioning_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `avro_options`
- Description: "AVRO".  Structure is [documented below](#nested_avro_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_unknown_values`
- Description: allow extra values that are not represented in the table schema. If true, the extra values are ignored. If false, records with extra columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_bad_records`
- Description: BigQuery can ignore when reading data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: for CSV and JSON formats if autodetect is not on. Schema is disallowed for Google Cloud Bigtable, Cloud Datastore backups, Avro, Iceberg, ORC and Parquet formats. ~>**NOTE:** Because this field expects a JSON string, any changes to the string will create a diff, even if the JSON itself hasn't changed. Furthermore drift for this field cannot not be detected because BigQuery only uses this schema to compute the effective schema for the table, therefore any changes on the configured value will force the table to be recreated. This schema is effectively only applied when creating a table from an external datasource, after creation the computed schema will be stored in `google_bigquery_table.schema` ~>**NOTE:** If you set `external_data_configuration.connection_id`, the table schema must be specified using the top-level `schema` field [documented above](#schema).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_format`
- Description: [ExternalDataConfiguration](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables#externaldataconfiguration) in Bigquery's public API documentation for supported formats. To use "GOOGLE_SHEETS" the `scopes` must include "https://www.googleapis.com/auth/drive.readonly".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_uris`
- Description: your data in Google Cloud.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_set_spec_type`
- Description: By default source URIs are expanded against the underlying storage. Other options include specifying manifest files. Only applicable to object storage systems. [Docs](cloud/bigquery/docs/reference/rest/v2/tables#filesetspectype)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reference_file_schema_uri`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_cache_mode`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_metadata`
- Description: <a name="nested_csv_options"></a>The `csv_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quote`
- Description: CSV file. If your data does not contain quoted sections, set the property value to an empty string. If your data contains quoted newline characters, you must also set the `allow_quoted_newlines` property to true. The API-side default is `"`, specified in Terraform escaped as `\"`. Due to limitations with Terraform default values, this value is required to be explicitly set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_jagged_rows`
- Description: that are missing trailing optional columns.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_quoted_newlines`
- Description: quoted data sections that contain newline characters in a CSV file. The default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: values are UTF-8 or ISO-8859-1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_delimiter`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `skip_leading_rows`
- Description: file that BigQuery will skip when reading the data. <a name="nested_bigtable_options"></a>The `bigtable_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column_family`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_unspecified_column_families`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_rowkey_as_string`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_column_families_as_json`
- Description: <a name="nested_column_family"></a>The `column_family` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `family_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `only_read_latest`
- Description: <a name="nested_column"></a>The `column` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `qualifier_encoded`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `qualifier_string`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `only_read_latest`
- Description: <a name="nested_json_options"></a>The `json_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: <a name="nested_google_sheets_options"></a>The `google_sheets_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: non-empty. At least one of `range` or `skip_leading_rows` must be set. Typical format: "sheet_name!top_left_cell_id:bottom_right_cell_id" For example: "sheet1!A1:B20"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `skip_leading_rows`
- Description: that BigQuery will skip when reading the data. At least one of `range` or `skip_leading_rows` must be set. <a name="nested_hive_partitioning_options"></a>The `hive_partitioning_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: reading data. The following modes are supported. * AUTO: automatically infer partition key name(s) and type(s). * STRINGS: automatically infer partition key name(s). All types are Not all storage formats support hive partitioning. Requesting hive partitioning on an unsupported format will lead to an error. Currently supported formats are: JSON, CSV, ORC, Avro and Parquet. * CUSTOM: when set to `CUSTOM`, you must encode the partition key schema within the `source_uri_prefix` by setting `source_uri_prefix` to `gs://bucket/path_to_table/{key1:TYPE1}/{key2:TYPE2}/{key3:TYPE3}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_partition_filter`
- Description: require a partition filter that can be used for partition elimination to be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_uri_prefix`
- Description: a common for all source uris must be required. The prefix must end immediately before the partition key encoding begins. For example, consider files following this data layout. `gs://bucket/path_to_table/dt=2019-06-01/country=USA/id=7/file.avro` `gs://bucket/path_to_table/dt=2019-05-31/country=CA/id=3/file.avro` When hive partitioning is requested with either AUTO or STRINGS detection, the common prefix can be either of `gs://bucket/path_to_table` or `gs://bucket/path_to_table/`. Note that when `mode` is set to `CUSTOM`, you must encode the partition key schema within the `source_uri_prefix` by setting `source_uri_prefix` to `gs://bucket/path_to_table/{key1:TYPE1}/{key2:TYPE2}/{key3:TYPE3}`. <a name="nested_avro_options"></a>The `avro_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_avro_logical_types`
- Description: to interpret logical types as the corresponding BigQuery data type (for example, TIMESTAMP), instead of using the raw type (for example, INTEGER). <a name="nested_parquet_options"></a>The `parquet_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enum_as_string`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_list_inference`
- Description: <a name="nested_schema_foreign_type_info"></a>The `schema_foreign_type_info` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type_system`
- Description: type. <a name="nested_time_partitioning"></a>The `time_partitioning` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration_ms`
- Description: storage for a partition.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field`
- Description: partition. If time-based partitioning is enabled without this value, the table is partitioned based on the load time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: which will generate one partition per day, hour, month, and year, respectively.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_partition_filter`
- Description: require a partition filter that can be used for partition elimination to be specified. `require_partition_filter` is deprecated and will be removed in a future major release. Use the top level field with the same name instead. <a name="nested_range_partitioning"></a>The `range_partitioning` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `field`
- Description: partition.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range`
- Description: Structure is [documented below](#nested_range). <a name="nested_range"></a>The `range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interval`
- Description: <a name="nested_view"></a>The `view` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_legacy_sql`
- Description: The default value is true. If set to false, the view will use BigQuery's standard SQL. -> **Note**: Starting in provider version `7.0.0`, no default value is provided for this field unless explicitly set in the configuration. <a name="nested_materialized_view"></a>The `materialized_view` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_refresh`
- Description: The default value is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `refresh_interval_ms`
- Description: The default value is 1800000
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_non_incremental_definition`
- Description: The default value is false. <a name="nested_encryption_configuration"></a>The `encryption_configuration` block supports the following arguments:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: encrypt this table.  Note that the default bigquery service account will need to have encrypt/decrypt permissions on this key - you may want to see the `google_bigquery_default_service_account` datasource and the `google_kms_crypto_key_iam_binding` resource. <a name="nested_table_constraints"></a>The `table_constraints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: on a table's columns. Present only if the table has a primary key. The primary key is not enforced. Structure is [documented below](#nested_primary_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `foreign_keys`
- Description: The foreign key is not enforced. Structure is [documented below](#nested_foreign_keys). <a name="nested_primary_key"></a>The `primary_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `columns`
- Description: <a name="nested_foreign_keys"></a>The `foreign_keys` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `referenced_table`
- Description: and is referenced by this foreign key. Structure is [documented below](#nested_referenced_table).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column_references`
- Description: Structure is [documented below](#nested_column_references). <a name="nested_referenced_table"></a>The `referenced_table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. Certain operations allow suffixing of the table ID with a partition decorator, such as sample_table$20190123. <a name="nested_column_references"></a>The `column_references` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `referencing_column`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `referenced_column`
- Description: referenced by the referencingColumn <a name="nested_table_replication_info"></a>The `table_replication_info` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_project_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_dataset_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_table_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replication_interval_ms`
- Description: materialized view is polled for updates. The default is 300000. <a name="nested_biglake_configuration"></a>The `biglake_configuration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_id`
- Description: read and write to external storage, such as Cloud Storage. The connection_id can have the form "&lt;project\_id&gt;.&lt;location\_id&gt;.&lt;connection\_id&gt;" or projects/&lt;project\_id&gt;/locations/&lt;location\_id&gt;/connections/&lt;connection\_id&gt;".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_uri`
- Description: is stored. The '*' wildcard character is not allowed. The URI should be in the format "gs://bucket/path_to_table/"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_format`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_format`
- Description: <a name="nested_external_catalog_table_options"></a>The `external_catalog_table_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: properties of the open source table. Corresponds with hive meta store table parameters. Maximum size of 4Mib.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_descriptor`
- Description: about the physical storage of this table. Structure is [documented below](#nested_storage_descriptor).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_id`
- Description: used to read external storage, such as Azure Blob, Cloud Storage, or S3. The connection is needed to read the open source table from BigQuery Engine. The connection_id can have the form `<project_id>.<location_id>.<connection_id>` or `projects/<project_id>/locations/<location_id>/connections/<connection_id>`. <a name="nested_storage_descriptor"></a>The `storage_descriptor` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location_uri`
- Description: 'gs://spark-dataproc-data/pangea-data/case_sensitive/' or 'gs://spark-dataproc-data/pangea-data/*'). The maximum length is 2056 bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `input_format`
- Description: InputFormat (e.g. "org.apache.hadoop.hive.ql.io.orc.OrcInputFormat"). The maximum length is 128 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_format`
- Description: OutputFormat (e.g. "org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat"). The maximum length is 128 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serde_info`
- Description: is [documented below](#nested_serde_info). <a name="nested_serde_info"></a>The `serde_info` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serialization_library`
- Description: the serialization library that is responsible for the translation of data between table representation and the underlying low-level input and output format structures. The maximum length is 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: parameters for the serialization library. Maximum size 10 Kib.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
