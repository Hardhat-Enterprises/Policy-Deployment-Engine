## 🛡️ Policy Deployment Engine: `bigquery_table`

This section provides a concise policy evaluation for the `bigquery_table` resource in GCP.

Reference: [Terraform Registry – bigquery_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | Changing this forces a new resource to be created. | false | false | None | None | None |
| `table_id` | Changing this forces a new resource to be created. | false | false | None | None | None |
| `project` | is not provided, the provider project is used. | false | false | None | None | None |
| `description` |  | false | false | None | None | None |
| `expiration_time` | milliseconds since the epoch. If not present, the table will persist indefinitely. Expired tables will be deleted and their storage reclaimed. | false | false | None | None | None |
| `external_data_configuration` | location, and other properties of a table stored outside of BigQuery. By defining these properties, the data source can then be queried as if it were a standard BigQuery table. Structure is [documented below](#nested_external_data_configuration). | false | false | None | None | None |
| `biglake_configuration` |  | false | false | None | None | None |
| `friendly_name` |  | false | false | None | None | None |
| `max_staleness` | returned when the table (or stale MV) is queried. Staleness encoded as a string encoding of [SQL IntervalValue type](https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types#interval_type). | false | true | max_staleness defines the freshness of the data returned when queried | 0 | 3600 |
| `encryption_configuration` | If left blank, the table will be encrypted with a Google-managed key; that process is transparent to the user.  Structure is [documented below](#nested_encryption_configuration). | false | false | None | None | None |
| `labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | false | false | None | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | false | false | None | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. * <a name="schema"></a>`schema` - (Optional) A JSON schema for the table. ~>**NOTE:** Because this field expects a JSON string, any changes to the string will create a diff, even if the JSON itself hasn't changed. If the API returns a different value for the same schema, e.g. it switched the order of values or replaced a field data type (`STRUCT` with `RECORD`, `DECIMAL` with `NUMERIC`, etc.), we currently cannot suppress the recurring diff this causes. As a workaround, we recommend using the schema as returned by the API. ~>**NOTE:**  If you use `external_data_configuration` [documented below](#nested_external_data_configuration) and do **not** set `external_data_configuration.connection_id`, schemas must be specified with `external_data_configuration.schema`. Otherwise, schemas must be specified with this top-level field. | false | false | None | None | None |
| `ignore_schema_changes` | **NOTE:** Right now only `dataPolicies` field is supported. We might support others in the future. | false | false | None | None | None |
| `ignore_auto_generated_schema` |  | false | false | None | None | None |
| `schema_foreign_type_info` | type definition in field schema. Structure is [documented below](#nested_schema_foreign_type_info). | false | false | None | None | None |
| `time_partitioning` | partitioning for this table. Structure is [documented below](#nested_time_partitioning). | false | false | None | None | None |
| `range_partitioning` | partitioning for this table. Structure is [documented below](#nested_range_partitioning). | false | false | None | None | None |
| `require_partition_filter` | require a partition filter that can be used for partition elimination to be specified. | false | false | None | None | None |
| `clustering` | Up to four top-level columns are allowed, and should be specified in descending priority order. | false | false | None | None | None |
| `view` | Structure is [documented below](#nested_view). | false | false | None | None | None |
| `materialized_view` | Structure is [documented below](#nested_materialized_view). | false | false | None | None | None |
| `deletion_protection` | When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the table will fail. When the field is set to false, deleting the table is allowed.. | false | true | deletion_protection prevents accidental deletion of the table | True | False |
| `table_constraints` | Structure is [documented below](#nested_table_constraints). | false | false | None | None | None |
| `table_replication_info` | using "AS REPLICA" DDL like: `CREATE MATERIALIZED VIEW mv1 AS REPLICA OF src_mv`. Structure is [documented below](#nested_table_replication_info). | false | false | None | None | None |
| `resource_tags` | globally unique. Tag key is expected to be in the namespaced format, for example "123456789012/environment" where 123456789012 is the ID of the parent organization or project resource for this tag key. Tag value is expected to be the short name, for example "Production". See [Tag definitions](https://cloud.google.com/iam/docs/tags-access-control#definitions) for more details. | false | false | None | None | None |
| `external_catalog_table_options` | compatible table. Structure is [documented below](#nested_external_catalog_table_options). | false | false | None | None | None |
| `csv_options` |  | false | false | None | None | None |
| `bigtable_options` |  | false | false | None | None | None |
| `column_family` |  | false | false | None | None | None |
| `column` |  | false | false | None | None | None |
| `json_options` |  | false | false | None | None | None |
| `google_sheets_options` |  | false | false | None | None | None |
| `hive_partitioning_options` |  | false | false | None | None | None |
| `avro_options` |  | false | false | None | None | None |
| `parquet_options` |  | false | false | None | None | None |
| `range` |  | false | false | None | None | None |
| `primary_key` |  | false | false | None | None | None |
| `foreign_keys` |  | false | false | None | None | None |
| `referenced_table` |  | false | false | None | None | None |
| `column_references` |  | false | false | None | None | None |
| `storage_descriptor` |  | false | false | None | None | None |
| `serde_info` |  | false | false | None | None | None |

### external_data_configuration Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autodetect` | and format of the table. | false | false | None | None | None |
| `compression` | Valid values are "NONE" or "GZIP". | false | false | None | None | None |
| `connection_id` | external storage, such as Azure Blob, Cloud Storage, or S3. The `connection_id` can have the form `{{project}}.{{location}}.{{connection_id}}` or `projects/{{project}}/locations/{{location}}/connections/{{connection_id}}`. ~>**NOTE:** If you set `external_data_configuration.connection_id`, the table schema must be specified using the top-level `schema` field [documented above](#schema). | true | true | connection_id specifies the external storage connection | valid_connection_id | invalid_connection_id |
| `csv_options` | `source_format` is set to "CSV". Structure is [documented below](#nested_csv_options). | false | false | None | None | None |
| `bigtable_options` | `source_format` is set to "BIGTABLE". Structure is [documented below](#nested_bigtable_options). | false | false | None | None | None |
| `json_options` | `source_format` is set to "JSON". Structure is [documented below](#nested_json_options). | false | false | None | None | None |
| `json_extension` |  | false | false | None | None | None |
| `parquet_options` | `source_format` is set to "PARQUET". Structure is [documented below](#nested_parquet_options). | false | false | None | None | None |
| `google_sheets_options` | `source_format` is set to "GOOGLE_SHEETS". Structure is [documented below](#nested_google_sheets_options). | false | false | None | None | None |
| `hive_partitioning_options` | support. Not all storage formats support hive partitioning -- requesting hive partitioning on an unsupported format will lead to an error, as will providing an invalid specification. Structure is [documented below](#nested_hive_partitioning_options). | false | false | None | None | None |
| `avro_options` | "AVRO".  Structure is [documented below](#nested_avro_options). | false | false | None | None | None |
| `ignore_unknown_values` | allow extra values that are not represented in the table schema. If true, the extra values are ignored. If false, records with extra columns are treated as bad records, and if there are too many bad records, an invalid error is returned in the job result. The default value is false. | false | false | None | None | None |
| `max_bad_records` | BigQuery can ignore when reading data. | false | false | None | None | None |
| `schema` | for CSV and JSON formats if autodetect is not on. Schema is disallowed for Google Cloud Bigtable, Cloud Datastore backups, Avro, Iceberg, ORC and Parquet formats. ~>**NOTE:** Because this field expects a JSON string, any changes to the string will create a diff, even if the JSON itself hasn't changed. Furthermore drift for this field cannot not be detected because BigQuery only uses this schema to compute the effective schema for the table, therefore any changes on the configured value will force the table to be recreated. This schema is effectively only applied when creating a table from an external datasource, after creation the computed schema will be stored in `google_bigquery_table.schema` ~>**NOTE:** If you set `external_data_configuration.connection_id`, the table schema must be specified using the top-level `schema` field [documented above](#schema). | false | false | None | None | None |
| `source_format` | [ExternalDataConfiguration](https://cloud.google.com/bigquery/docs/reference/rest/v2/tables#externaldataconfiguration) in Bigquery's public API documentation for supported formats. To use "GOOGLE_SHEETS" the `scopes` must include "https://www.googleapis.com/auth/drive.readonly". | false | false | None | None | None |
| `source_uris` | your data in Google Cloud. | false | true | source_uris specify the location of the external data | valid_uris | invalid_uris |
| `file_set_spec_type` | By default source URIs are expanded against the underlying storage. Other options include specifying manifest files. Only applicable to object storage systems. [Docs](cloud/bigquery/docs/reference/rest/v2/tables#filesetspectype) | false | false | None | None | None |
| `reference_file_schema_uri` |  | false | false | None | None | None |
| `metadata_cache_mode` |  | false | false | None | None | None |
| `object_metadata` |  | false | false | None | None | None |

### biglake_configuration Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `connection_id` | read and write to external storage, such as Cloud Storage. The connection_id can have the form "&lt;project\_id&gt;.&lt;location\_id&gt;.&lt;connection\_id&gt;" or projects/&lt;project\_id&gt;/locations/&lt;location\_id&gt;/connections/&lt;connection\_id&gt;". | false | false | None | None | None |
| `storage_uri` | is stored. The '*' wildcard character is not allowed. The URI should be in the format "gs://bucket/path_to_table/" | false | false | None | None | None |
| `file_format` |  | false | false | None | None | None |
| `table_format` |  | false | false | None | None | None |

### schema_foreign_type_info Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type_system` | type. | false | false | None | None | None |

### time_partitioning Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expiration_ms` | storage for a partition. | false | false | None | None | None |
| `field` | partition. If time-based partitioning is enabled without this value, the table is partitioned based on the load time. | false | false | None | None | None |
| `type` | which will generate one partition per day, hour, month, and year, respectively. | false | false | None | None | None |
| `require_partition_filter` | require a partition filter that can be used for partition elimination to be specified. `require_partition_filter` is deprecated and will be removed in a future major release. Use the top level field with the same name instead. | false | true | require_partition_filter improves security by mandating partition filters | True | False |

### range_partitioning Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `field` | partition. | false | false | None | None | None |
| `range` | Structure is [documented below](#nested_range). | false | false | None | None | None |

### view Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query` |  | false | false | None | None | None |
| `use_legacy_sql` | The default value is true. If set to false, the view will use BigQuery's standard SQL. -> **Note**: Starting in provider version `7.0.0`, no default value is provided for this field unless explicitly set in the configuration. | false | false | None | None | None |

### materialized_view Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query` |  | false | false | None | None | None |
| `enable_refresh` | The default value is true. | false | false | None | None | None |
| `refresh_interval_ms` | The default value is 1800000 | false | false | None | None | None |
| `allow_non_incremental_definition` | The default value is false. The `encryption_configuration` block supports the following arguments: | false | false | None | None | None |
| `kms_key_name` | encrypt this table.  Note that the default bigquery service account will need to have encrypt/decrypt permissions on this key - you may want to see the `google_bigquery_default_service_account` datasource and the `google_kms_crypto_key_iam_binding` resource. | false | true | kms_key_name specifies the encryption key for the table | valid_kms_key_name | None |

### table_constraints Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `primary_key` | on a table's columns. Present only if the table has a primary key. The primary key is not enforced. Structure is [documented below](#nested_primary_key). | false | false | None | None | None |
| `foreign_keys` | The foreign key is not enforced. Structure is [documented below](#nested_foreign_keys). | false | false | None | None | None |

### table_replication_info Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_project_id` |  | false | false | None | None | None |
| `source_dataset_id` |  | false | false | None | None | None |
| `source_table_id` |  | false | false | None | None | None |
| `replication_interval_ms` | materialized view is polled for updates. The default is 300000. | false | false | None | None | None |

### external_catalog_table_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `parameters` | properties of the open source table. Corresponds with hive meta store table parameters. Maximum size of 4Mib. | false | false | None | None | None |
| `storage_descriptor` | about the physical storage of this table. Structure is [documented below](#nested_storage_descriptor). | false | false | None | None | None |
| `connection_id` | used to read external storage, such as Azure Blob, Cloud Storage, or S3. The connection is needed to read the open source table from BigQuery Engine. The connection_id can have the form `<project_id>.<location_id>.<connection_id>` or `projects/<project_id>/locations/<location_id>/connections/<connection_id>`. | false | false | None | None | None |

### csv_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `quote` | CSV file. If your data does not contain quoted sections, set the property value to an empty string. If your data contains quoted newline characters, you must also set the `allow_quoted_newlines` property to true. The API-side default is `"`, specified in Terraform escaped as `\"`. Due to limitations with Terraform default values, this value is required to be explicitly set. | false | false | None | None | None |
| `allow_jagged_rows` | that are missing trailing optional columns. | false | false | None | None | None |
| `allow_quoted_newlines` | quoted data sections that contain newline characters in a CSV file. The default value is false. | false | false | None | None | None |
| `encoding` | values are UTF-8 or ISO-8859-1. | false | false | None | None | None |
| `field_delimiter` |  | false | false | None | None | None |
| `skip_leading_rows` | file that BigQuery will skip when reading the data. | false | false | None | None | None |

### bigtable_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `column_family` |  | false | false | None | None | None |
| `ignore_unspecified_column_families` |  | false | false | None | None | None |
| `read_rowkey_as_string` |  | false | false | None | None | None |
| `output_column_families_as_json` |  | false | false | None | None | None |

### column_family Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `column` |  | false | false | None | None | None |
| `family_id` |  | false | false | None | None | None |
| `type` |  | false | false | None | None | None |
| `encoding` |  | false | false | None | None | None |
| `only_read_latest` |  | false | false | None | None | None |

### column Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `qualifier_encoded` |  | false | false | None | None | None |
| `qualifier_string` |  | false | false | None | None | None |
| `field_name` |  | false | false | None | None | None |
| `type` |  | false | false | None | None | None |
| `encoding` |  | false | false | None | None | None |
| `only_read_latest` |  | false | false | None | None | None |

### json_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `encoding` |  | false | false | None | None | None |

### google_sheets_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `range` | non-empty. At least one of `range` or `skip_leading_rows` must be set. Typical format: "sheet_name!top_left_cell_id:bottom_right_cell_id" For example: "sheet1!A1:B20" | false | false | None | None | None |
| `skip_leading_rows` | that BigQuery will skip when reading the data. At least one of `range` or `skip_leading_rows` must be set. | false | false | None | None | None |

### hive_partitioning_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mode` | reading data. The following modes are supported. * AUTO: automatically infer partition key name(s) and type(s). * STRINGS: automatically infer partition key name(s). All types are Not all storage formats support hive partitioning. Requesting hive partitioning on an unsupported format will lead to an error. Currently supported formats are: JSON, CSV, ORC, Avro and Parquet. * CUSTOM: when set to `CUSTOM`, you must encode the partition key schema within the `source_uri_prefix` by setting `source_uri_prefix` to `gs://bucket/path_to_table/{key1:TYPE1}/{key2:TYPE2}/{key3:TYPE3}`. | false | false | None | None | None |
| `require_partition_filter` | require a partition filter that can be used for partition elimination to be specified. | false | false | None | None | None |
| `source_uri_prefix` | a common for all source uris must be required. The prefix must end immediately before the partition key encoding begins. For example, consider files following this data layout. `gs://bucket/path_to_table/dt=2019-06-01/country=USA/id=7/file.avro` `gs://bucket/path_to_table/dt=2019-05-31/country=CA/id=3/file.avro` When hive partitioning is requested with either AUTO or STRINGS detection, the common prefix can be either of `gs://bucket/path_to_table` or `gs://bucket/path_to_table/`. Note that when `mode` is set to `CUSTOM`, you must encode the partition key schema within the `source_uri_prefix` by setting `source_uri_prefix` to `gs://bucket/path_to_table/{key1:TYPE1}/{key2:TYPE2}/{key3:TYPE3}`. | false | false | None | None | None |

### avro_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `use_avro_logical_types` | to interpret logical types as the corresponding BigQuery data type (for example, TIMESTAMP), instead of using the raw type (for example, INTEGER). | false | false | None | None | None |

### parquet_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enum_as_string` |  | false | false | None | None | None |
| `enable_list_inference` |  | false | false | None | None | None |

### range Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `start` |  | false | false | None | None | None |
| `end` |  | false | false | None | None | None |
| `interval` |  | false | false | None | None | None |

### primary_key Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `columns` |  | false | false | None | None | None |

### foreign_keys Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` |  | false | false | None | None | None |
| `referenced_table` | and is referenced by this foreign key. Structure is [documented below](#nested_referenced_table). | false | false | None | None | None |
| `column_references` | Structure is [documented below](#nested_column_references). | false | false | None | None | None |

### referenced_table Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` |  | false | false | None | None | None |
| `dataset_id` |  | false | false | None | None | None |
| `table_id` | letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. Certain operations allow suffixing of the table ID with a partition decorator, such as sample_table$20190123. | false | false | None | None | None |

### column_references Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `referencing_column` |  | false | false | None | None | None |
| `referenced_column` | referenced by the referencingColumn | false | false | None | None | None |

### storage_descriptor Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location_uri` | 'gs://spark-dataproc-data/pangea-data/case_sensitive/' or 'gs://spark-dataproc-data/pangea-data/*'). The maximum length is 2056 bytes. | false | false | None | None | None |
| `input_format` | InputFormat (e.g. "org.apache.hadoop.hive.ql.io.orc.OrcInputFormat"). The maximum length is 128 characters. | false | false | None | None | None |
| `output_format` | OutputFormat (e.g. "org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat"). The maximum length is 128 characters. | false | false | None | None | None |
| `serde_info` | is [documented below](#nested_serde_info). | false | false | None | None | None |

### serde_info Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` |  | false | false | None | None | None |
| `serialization_library` | the serialization library that is responsible for the translation of data between table representation and the underlying low-level input and output format structures. The maximum length is 256 characters. | false | false | None | None | None |
| `parameters` | parameters for the serialization library. Maximum size 10 Kib. | false | false | None | None | None |
