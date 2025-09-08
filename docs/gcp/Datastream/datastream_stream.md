## 🛡️ Policy Deployment Engine: `datastream_stream`

This section provides a concise policy evaluation for the `datastream_stream` resource in GCP.

Reference: [Terraform Registry – datastream_stream](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/datastream_stream)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | Display name. | true | None | None |
| `stream_id` | The stream identifier. | true | None | None |
| `location` | The name of the location this stream is located in. | true | None | None |
| `labels` | Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `backfill_none` | Backfill strategy to disable automatic backfill for the Stream's objects. | false | None | None |
| `customer_managed_encryption_key` | A reference to a KMS encryption key. If provided, it will be used to encrypt the data. If left blank, data will be encrypted using an internal Stream-specific encryption key provisioned through KMS. | false | None | None |
| `create_without_validation` | Create the stream without validating it. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `desired_state` | `NOT_STARTED` to create the stream without starting and `PAUSED` to pause the stream from a `RUNNING` state. Possible values: NOT_STARTED, RUNNING, PAUSED. Default: NOT_STARTED | none | None | None |

### source_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_connection_profile` | Source connection profile resource. Format: projects/{project}/locations/{location}/connectionProfiles/{name} | true | None | None |
| `mysql_source_config` | MySQL data source configuration. Structure is [documented below](#nested_source_config_mysql_source_config). | false | None | None |
| `oracle_source_config` | MySQL data source configuration. Structure is [documented below](#nested_source_config_oracle_source_config). | false | None | None |
| `postgresql_source_config` | PostgreSQL data source configuration. Structure is [documented below](#nested_source_config_postgresql_source_config). | false | None | None |
| `sql_server_source_config` | SQL Server data source configuration. Structure is [documented below](#nested_source_config_sql_server_source_config). | false | None | None |
| `salesforce_source_config` | Salesforce data source configuration. Structure is [documented below](#nested_source_config_salesforce_source_config). | false | None | None |

### destination_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `destination_connection_profile` | Destination connection profile resource. Format: projects/{project}/locations/{location}/connectionProfiles/{name} | true | None | None |
| `gcs_destination_config` | A configuration for how data should be loaded to Cloud Storage. Structure is [documented below](#nested_destination_config_gcs_destination_config). | false | None | None |
| `bigquery_destination_config` | A configuration for how data should be loaded to Google BigQuery. Structure is [documented below](#nested_destination_config_bigquery_destination_config). | false | None | None |

### backfill_all Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mysql_excluded_objects` | MySQL data source objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_mysql_excluded_objects). | false | None | None |
| `postgresql_excluded_objects` | PostgreSQL data source objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_postgresql_excluded_objects). | false | None | None |
| `oracle_excluded_objects` | PostgreSQL data source objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_oracle_excluded_objects). | false | None | None |
| `sql_server_excluded_objects` | SQL Server data source objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_sql_server_excluded_objects). | false | None | None |
| `salesforce_excluded_objects` | Salesforce objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_salesforce_excluded_objects). | false | None | None |

### mysql_source_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `include_objects` | MySQL objects to retrieve from the source. Structure is [documented below](#nested_source_config_mysql_source_config_include_objects). | false | None | None |
| `exclude_objects` | MySQL objects to exclude from the stream. Structure is [documented below](#nested_source_config_mysql_source_config_exclude_objects). | false | None | None |
| `max_concurrent_cdc_tasks` | Maximum number of concurrent CDC tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used. | false | None | None |
| `max_concurrent_backfill_tasks` | Maximum number of concurrent backfill tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used. | false | None | None |
| `binary_log_position` | CDC reader reads from binary logs replication cdc method. | false | None | None |
| `gtid` | CDC reader reads from gtid based replication. | false | None | None |

### include_objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mysql_databases` | MySQL databases on the server Structure is [documented below](#nested_source_config_mysql_source_config_include_objects_mysql_databases). | true | None | None |
| `oracle_schemas` | Oracle schemas/databases in the database server Structure is [documented below](#nested_source_config_oracle_source_config_include_objects_oracle_schemas). | true | None | None |
| `postgresql_schemas` | PostgreSQL schemas on the server Structure is [documented below](#nested_source_config_postgresql_source_config_include_objects_postgresql_schemas). | true | None | None |
| `schemas` | SQL Server schemas/databases in the database server Structure is [documented below](#nested_source_config_sql_server_source_config_include_objects_schemas). | true | None | None |
| `objects` | Salesforce objects in Salesforce Org. Structure is [documented below](#nested_source_config_salesforce_source_config_include_objects_objects). | true | None | None |

### mysql_databases Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `database` | Database name. | true | None | None |
| `mysql_tables` | Tables in the database. Structure is [documented below](#nested_backfill_all_mysql_excluded_objects_mysql_databases_mysql_databases_mysql_tables). | false | None | None |

### mysql_tables Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` | Table name. | true | None | None |
| `mysql_columns` | MySQL columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_backfill_all_mysql_excluded_objects_mysql_databases_mysql_databases_mysql_tables_mysql_tables_mysql_columns). | false | None | None |

### mysql_columns Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `column` | Column name. | false | None | None |
| `data_type` | The MySQL data type. Full data types list can be found here: https://dev.mysql.com/doc/refman/8.0/en/data-types.html | false | None | None |
| `length` | (Output) Column length. | none | None | None |
| `collation` | Column collation. | false | None | None |
| `primary_key` | Whether or not the column represents a primary key. | false | None | None |
| `nullable` | Whether or not the column can accept a null value. | false | None | None |
| `ordinal_position` | The ordinal position of the column in the table. | false | None | None |

### exclude_objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mysql_databases` | MySQL databases on the server Structure is [documented below](#nested_source_config_mysql_source_config_exclude_objects_mysql_databases). | true | None | None |
| `oracle_schemas` | Oracle schemas/databases in the database server Structure is [documented below](#nested_source_config_oracle_source_config_exclude_objects_oracle_schemas). | true | None | None |
| `postgresql_schemas` | PostgreSQL schemas on the server Structure is [documented below](#nested_source_config_postgresql_source_config_exclude_objects_postgresql_schemas). | true | None | None |
| `schemas` | SQL Server schemas/databases in the database server Structure is [documented below](#nested_source_config_sql_server_source_config_exclude_objects_schemas). | true | None | None |
| `objects` | Salesforce objects in data source. Structure is [documented below](#nested_source_config_salesforce_source_config_exclude_objects_objects). | true | None | None |

### oracle_source_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `include_objects` | Oracle objects to retrieve from the source. Structure is [documented below](#nested_source_config_oracle_source_config_include_objects). | false | None | None |
| `exclude_objects` | Oracle objects to exclude from the stream. Structure is [documented below](#nested_source_config_oracle_source_config_exclude_objects). | false | None | None |
| `max_concurrent_cdc_tasks` | Maximum number of concurrent CDC tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used. | false | None | None |
| `max_concurrent_backfill_tasks` | Maximum number of concurrent backfill tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used. | false | None | None |
| `drop_large_objects` | Configuration to drop large object values. | false | None | None |
| `stream_large_objects` | Configuration to drop large object values. | false | None | None |

### oracle_schemas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schema` | Schema name. | true | None | None |
| `oracle_tables` | Tables in the database. Structure is [documented below](#nested_backfill_all_oracle_excluded_objects_oracle_schemas_oracle_schemas_oracle_tables). | false | None | None |

### oracle_tables Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` | Table name. | true | None | None |
| `oracle_columns` | Oracle columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_backfill_all_oracle_excluded_objects_oracle_schemas_oracle_schemas_oracle_tables_oracle_tables_oracle_columns). | false | None | None |

### oracle_columns Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `column` | Column name. | false | None | None |
| `data_type` | The Oracle data type. Full data types list can be found here: https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/Data-Types.html | false | None | None |
| `length` | (Output) Column length. | none | None | None |
| `precision` | (Output) Column precision. | none | None | None |
| `scale` | (Output) Column scale. | none | None | None |
| `encoding` | (Output) Column encoding. | none | None | None |
| `primary_key` | (Output) Whether or not the column represents a primary key. | none | None | None |
| `nullable` | (Output) Whether or not the column can accept a null value. | none | None | None |
| `ordinal_position` | (Output) The ordinal position of the column in the table. | none | None | None |

### postgresql_source_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `include_objects` | PostgreSQL objects to retrieve from the source. Structure is [documented below](#nested_source_config_postgresql_source_config_include_objects). | false | None | None |
| `exclude_objects` | PostgreSQL objects to exclude from the stream. Structure is [documented below](#nested_source_config_postgresql_source_config_exclude_objects). | false | None | None |
| `replication_slot` | The name of the logical replication slot that's configured with the pgoutput plugin. | true | None | None |
| `publication` | The name of the publication that includes the set of all tables that are defined in the stream's include_objects. | true | None | None |
| `max_concurrent_backfill_tasks` | Maximum number of concurrent backfill tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used. | false | None | None |

### postgresql_schemas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schema` | Database name. | true | None | None |
| `postgresql_tables` | Tables in the schema. Structure is [documented below](#nested_backfill_all_postgresql_excluded_objects_postgresql_schemas_postgresql_schemas_postgresql_tables). | false | None | None |

### postgresql_tables Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` | Table name. | true | None | None |
| `postgresql_columns` | PostgreSQL columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_backfill_all_postgresql_excluded_objects_postgresql_schemas_postgresql_schemas_postgresql_tables_postgresql_tables_postgresql_columns). | false | None | None |

### postgresql_columns Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `column` | Column name. | false | None | None |
| `data_type` | The PostgreSQL data type. Full data types list can be found here: https://www.postgresql.org/docs/current/datatype.html | false | None | None |
| `length` | (Output) Column length. | none | None | None |
| `precision` | (Output) Column precision. | none | None | None |
| `scale` | (Output) Column scale. | none | None | None |
| `primary_key` | Whether or not the column represents a primary key. | false | None | None |
| `nullable` | Whether or not the column can accept a null value. | false | None | None |
| `ordinal_position` | The ordinal position of the column in the table. | false | None | None |

### sql_server_source_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `include_objects` | SQL Server objects to retrieve from the source. Structure is [documented below](#nested_source_config_sql_server_source_config_include_objects). | false | None | None |
| `exclude_objects` | SQL Server objects to exclude from the stream. Structure is [documented below](#nested_source_config_sql_server_source_config_exclude_objects). | false | None | None |
| `max_concurrent_cdc_tasks` | Max concurrent CDC tasks. | false | None | None |
| `max_concurrent_backfill_tasks` | Max concurrent backfill tasks. | false | None | None |
| `transaction_logs` | CDC reader reads from transaction logs. | false | None | None |
| `change_tables` | CDC reader reads from change tables. | false | None | None |

### schemas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schema` | Schema name. | true | None | None |
| `tables` | Tables in the database. Structure is [documented below](#nested_backfill_all_sql_server_excluded_objects_schemas_schemas_tables). | false | None | None |

### tables Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` | Table name. | true | None | None |
| `columns` | SQL Server columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_backfill_all_sql_server_excluded_objects_schemas_schemas_tables_tables_columns). | false | None | None |

### columns Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `column` | Column name. | false | None | None |
| `data_type` | The SQL Server data type. Full data types list can be found here: https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16 | false | None | None |
| `length` | (Output) Column length. | none | None | None |
| `precision` | (Output) Column precision. | none | None | None |
| `scale` | (Output) Column scale. | none | None | None |
| `primary_key` | (Output) Whether or not the column represents a primary key. | none | None | None |
| `nullable` | (Output) Whether or not the column can accept a null value. | none | None | None |
| `ordinal_position` | (Output) The ordinal position of the column in the table. | none | None | None |

### salesforce_source_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `include_objects` | Salesforce objects to retrieve from the source. Structure is [documented below](#nested_source_config_salesforce_source_config_include_objects). | false | None | None |
| `exclude_objects` | Salesforce objects to exclude from the stream. Structure is [documented below](#nested_source_config_salesforce_source_config_exclude_objects). | false | None | None |
| `polling_interval` | Salesforce objects polling interval. The interval at which new changes will be polled for each object. The duration must be between 5 minutes and 24 hours. | true | None | None |

### objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `object_name` | Name of object in Salesforce Org. | false | None | None |
| `fields` | Fields in the Salesforce object. When unspecified as part of include/exclude objects, includes/excludes everything/nothing. Structure is [documented below](#nested_backfill_all_salesforce_excluded_objects_objects_objects_fields). | false | None | None |

### fields Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Field name. | false | None | None |

### gcs_destination_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | Path inside the Cloud Storage bucket to write data to. | false | None | None |
| `file_rotation_mb` | The maximum file size to be saved in the bucket. | false | None | None |
| `file_rotation_interval` | The maximum duration for which new events are added before a file is closed and a new file is created. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Defaults to 900s. | false | None | None |
| `avro_file_format` | AVRO file format configuration. | false | None | None |
| `json_file_format` | JSON file format configuration. Structure is [documented below](#nested_destination_config_gcs_destination_config_json_file_format). | false | None | None |

### json_file_format Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schema_file_format` | The schema file format along JSON data files. Possible values are: `NO_SCHEMA_FILE`, `AVRO_SCHEMA_FILE`. | false | None | None |
| `compression` | Compression of the loaded JSON file. Possible values are: `NO_COMPRESSION`, `GZIP`. | false | None | None |

### bigquery_destination_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_freshness` | The guaranteed data freshness (in seconds) when querying tables created by the stream. Editing this field will only affect new tables created in the future, but existing tables will not be impacted. Lower values mean that queries will return fresher data, but may result in higher cost. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Defaults to 900s. | false | None | None |
| `single_target_dataset` | A single target dataset to which all data will be streamed. Structure is [documented below](#nested_destination_config_bigquery_destination_config_single_target_dataset). | false | None | None |
| `source_hierarchy_datasets` | Destination datasets are created so that hierarchy of the destination data objects matches the source hierarchy. Structure is [documented below](#nested_destination_config_bigquery_destination_config_source_hierarchy_datasets). | false | None | None |
| `blmt_config` | BigLake Managed Tables configuration for BigQuery streams. Structure is [documented below](#nested_destination_config_bigquery_destination_config_blmt_config). | false | None | None |
| `merge` | Merge mode defines that all changes to a table will be merged at the destination Google BigQuery table. This is the default write mode. When selected, BigQuery reflects the way the data is stored in the source database. With Merge mode, no historical record of the change events is kept. | false | None | None |
| `append_only` | AppendOnly mode defines that the stream of changes (INSERT, UPDATE-INSERT, UPDATE-DELETE and DELETE events) to a source table will be written to the destination Google BigQuery table, retaining the historical state of the data. | false | None | None |

### single_target_dataset Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset_id` | Dataset ID in the format projects/{project}/datasets/{dataset_id} or {project}:{dataset_id} | true | None | None |

### source_hierarchy_datasets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset_template` | Dataset template used for dynamic dataset creation. Structure is [documented below](#nested_destination_config_bigquery_destination_config_source_hierarchy_datasets_dataset_template). | true | None | None |

### dataset_template Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The geographic location where the dataset should reside. See https://cloud.google.com/bigquery/docs/locations for supported locations. | true | None | None |
| `dataset_id_prefix` | If supplied, every created dataset will have its name prefixed by the provided value. The prefix and name will be separated by an underscore. i.e. _. | false | None | None |
| `kms_key_name` | Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key. i.e. projects/{project}/locations/{location}/keyRings/{key_ring}/cryptoKeys/{cryptoKey}. See https://cloud.google.com/bigquery/docs/customer-managed-encryption for more information. | false | None | None |

### blmt_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | The Cloud Storage bucket name. | true | None | None |
| `connection_name` | The bigquery connection. Format: `{project}.{location}.{name}` | true | None | None |
| `file_format` | The file format. | true | None | None |
| `table_format` | The table format. | true | None | None |
| `root_path` | The root path inside the Cloud Storage bucket. | false | None | None |

### mysql_excluded_objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mysql_databases` | MySQL databases on the server Structure is [documented below](#nested_backfill_all_mysql_excluded_objects_mysql_databases). | true | None | None |

### postgresql_excluded_objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `postgresql_schemas` | PostgreSQL schemas on the server Structure is [documented below](#nested_backfill_all_postgresql_excluded_objects_postgresql_schemas). | true | None | None |

### oracle_excluded_objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `oracle_schemas` | Oracle schemas/databases in the database server Structure is [documented below](#nested_backfill_all_oracle_excluded_objects_oracle_schemas). | true | None | None |

### sql_server_excluded_objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schemas` | SQL Server schemas/databases in the database server Structure is [documented below](#nested_backfill_all_sql_server_excluded_objects_schemas). | true | None | None |

### salesforce_excluded_objects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `objects` | Salesforce objects in Salesforce Org. Structure is [documented below](#nested_backfill_all_salesforce_excluded_objects_objects). | true | None | None |
