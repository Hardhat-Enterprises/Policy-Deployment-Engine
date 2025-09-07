## 🛡️ Policy Deployment Engine: `datastream_stream`

This section provides a concise policy evaluation for the `datastream_stream` resource in GCP.

Reference: [Terraform Registry – datastream_stream](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/datastream_stream)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_config`
- Description: (Required) Source connection profile configuration. Structure is [documented below](#nested_source_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_config`
- Description: (Required) Destination connection profile configuration. Structure is [documented below](#nested_destination_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stream_id`
- Description: (Required) The stream identifier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The name of the location this stream is located in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backfill_all`
- Description: (Optional) Backfill strategy to automatically backfill the Stream's objects. Specific objects can be excluded. Structure is [documented below](#nested_backfill_all).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backfill_none`
- Description: (Optional) Backfill strategy to disable automatic backfill for the Stream's objects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `customer_managed_encryption_key`
- Description: (Optional) A reference to a KMS encryption key. If provided, it will be used to encrypt the data. If left blank, data will be encrypted using an internal Stream-specific encryption key provisioned through KMS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_without_validation`
- Description: (Optional) Create the stream without validating it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: `NOT_STARTED` to create the stream without starting and `PAUSED` to pause the stream from a `RUNNING` state. Possible values: NOT_STARTED, RUNNING, PAUSED. Default: NOT_STARTED <a name="nested_source_config"></a>The `source_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_connection_profile`
- Description: (Required) Source connection profile resource. Format: projects/{project}/locations/{location}/connectionProfiles/{name}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_source_config`
- Description: (Optional) MySQL data source configuration. Structure is [documented below](#nested_source_config_mysql_source_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_source_config`
- Description: (Optional) MySQL data source configuration. Structure is [documented below](#nested_source_config_oracle_source_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_source_config`
- Description: (Optional) PostgreSQL data source configuration. Structure is [documented below](#nested_source_config_postgresql_source_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_server_source_config`
- Description: (Optional) SQL Server data source configuration. Structure is [documented below](#nested_source_config_sql_server_source_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `salesforce_source_config`
- Description: (Optional) Salesforce data source configuration. Structure is [documented below](#nested_source_config_salesforce_source_config). <a name="nested_source_config_mysql_source_config"></a>The `mysql_source_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_objects`
- Description: (Optional) MySQL objects to retrieve from the source. Structure is [documented below](#nested_source_config_mysql_source_config_include_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_objects`
- Description: (Optional) MySQL objects to exclude from the stream. Structure is [documented below](#nested_source_config_mysql_source_config_exclude_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_cdc_tasks`
- Description: (Optional) Maximum number of concurrent CDC tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_backfill_tasks`
- Description: (Optional) Maximum number of concurrent backfill tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_log_position`
- Description: (Optional) CDC reader reads from binary logs replication cdc method.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gtid`
- Description: (Optional) CDC reader reads from gtid based replication. <a name="nested_source_config_mysql_source_config_include_objects"></a>The `include_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_databases`
- Description: (Required) MySQL databases on the server Structure is [documented below](#nested_source_config_mysql_source_config_include_objects_mysql_databases). <a name="nested_source_config_mysql_source_config_include_objects_mysql_databases"></a>The `mysql_databases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Required) Database name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_source_config_mysql_source_config_include_objects_mysql_databases_mysql_databases_mysql_tables). <a name="nested_source_config_mysql_source_config_include_objects_mysql_databases_mysql_databases_mysql_tables"></a>The `mysql_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_columns`
- Description: (Optional) MySQL columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_source_config_mysql_source_config_include_objects_mysql_databases_mysql_databases_mysql_tables_mysql_tables_mysql_columns). <a name="nested_source_config_mysql_source_config_include_objects_mysql_databases_mysql_databases_mysql_tables_mysql_tables_mysql_columns"></a>The `mysql_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The MySQL data type. Full data types list can be found here: https://dev.mysql.com/doc/refman/8.0/en/data-types.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collation`
- Description: (Optional) Column collation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Optional) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Optional) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Optional) The ordinal position of the column in the table. <a name="nested_source_config_mysql_source_config_exclude_objects"></a>The `exclude_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_databases`
- Description: (Required) MySQL databases on the server Structure is [documented below](#nested_source_config_mysql_source_config_exclude_objects_mysql_databases). <a name="nested_source_config_mysql_source_config_exclude_objects_mysql_databases"></a>The `mysql_databases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Required) Database name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_source_config_mysql_source_config_exclude_objects_mysql_databases_mysql_databases_mysql_tables). <a name="nested_source_config_mysql_source_config_exclude_objects_mysql_databases_mysql_databases_mysql_tables"></a>The `mysql_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_columns`
- Description: (Optional) MySQL columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_source_config_mysql_source_config_exclude_objects_mysql_databases_mysql_databases_mysql_tables_mysql_tables_mysql_columns). <a name="nested_source_config_mysql_source_config_exclude_objects_mysql_databases_mysql_databases_mysql_tables_mysql_tables_mysql_columns"></a>The `mysql_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The MySQL data type. Full data types list can be found here: https://dev.mysql.com/doc/refman/8.0/en/data-types.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collation`
- Description: (Optional) Column collation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Optional) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Optional) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Optional) The ordinal position of the column in the table. <a name="nested_source_config_oracle_source_config"></a>The `oracle_source_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_objects`
- Description: (Optional) Oracle objects to retrieve from the source. Structure is [documented below](#nested_source_config_oracle_source_config_include_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_objects`
- Description: (Optional) Oracle objects to exclude from the stream. Structure is [documented below](#nested_source_config_oracle_source_config_exclude_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_cdc_tasks`
- Description: (Optional) Maximum number of concurrent CDC tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_backfill_tasks`
- Description: (Optional) Maximum number of concurrent backfill tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `drop_large_objects`
- Description: (Optional) Configuration to drop large object values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stream_large_objects`
- Description: (Optional) Configuration to drop large object values. <a name="nested_source_config_oracle_source_config_include_objects"></a>The `include_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_schemas`
- Description: (Required) Oracle schemas/databases in the database server Structure is [documented below](#nested_source_config_oracle_source_config_include_objects_oracle_schemas). <a name="nested_source_config_oracle_source_config_include_objects_oracle_schemas"></a>The `oracle_schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Schema name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_source_config_oracle_source_config_include_objects_oracle_schemas_oracle_schemas_oracle_tables). <a name="nested_source_config_oracle_source_config_include_objects_oracle_schemas_oracle_schemas_oracle_tables"></a>The `oracle_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_columns`
- Description: (Optional) Oracle columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_source_config_oracle_source_config_include_objects_oracle_schemas_oracle_schemas_oracle_tables_oracle_tables_oracle_columns). <a name="nested_source_config_oracle_source_config_include_objects_oracle_schemas_oracle_schemas_oracle_tables_oracle_tables_oracle_columns"></a>The `oracle_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The Oracle data type. Full data types list can be found here: https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/Data-Types.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Output) Column encoding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Output) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Output) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Output) The ordinal position of the column in the table. <a name="nested_source_config_oracle_source_config_exclude_objects"></a>The `exclude_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_schemas`
- Description: (Required) Oracle schemas/databases in the database server Structure is [documented below](#nested_source_config_oracle_source_config_exclude_objects_oracle_schemas). <a name="nested_source_config_oracle_source_config_exclude_objects_oracle_schemas"></a>The `oracle_schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Schema name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_source_config_oracle_source_config_exclude_objects_oracle_schemas_oracle_schemas_oracle_tables). <a name="nested_source_config_oracle_source_config_exclude_objects_oracle_schemas_oracle_schemas_oracle_tables"></a>The `oracle_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_columns`
- Description: (Optional) Oracle columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_source_config_oracle_source_config_exclude_objects_oracle_schemas_oracle_schemas_oracle_tables_oracle_tables_oracle_columns). <a name="nested_source_config_oracle_source_config_exclude_objects_oracle_schemas_oracle_schemas_oracle_tables_oracle_tables_oracle_columns"></a>The `oracle_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The Oracle data type. Full data types list can be found here: https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/Data-Types.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Output) Column encoding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Output) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Output) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Output) The ordinal position of the column in the table. <a name="nested_source_config_postgresql_source_config"></a>The `postgresql_source_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_objects`
- Description: (Optional) PostgreSQL objects to retrieve from the source. Structure is [documented below](#nested_source_config_postgresql_source_config_include_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_objects`
- Description: (Optional) PostgreSQL objects to exclude from the stream. Structure is [documented below](#nested_source_config_postgresql_source_config_exclude_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replication_slot`
- Description: (Required) The name of the logical replication slot that's configured with the pgoutput plugin.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publication`
- Description: (Required) The name of the publication that includes the set of all tables that are defined in the stream's include_objects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_backfill_tasks`
- Description: (Optional) Maximum number of concurrent backfill tasks. The number should be non negative. If not set (or set to 0), the system's default value will be used. <a name="nested_source_config_postgresql_source_config_include_objects"></a>The `include_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_schemas`
- Description: (Required) PostgreSQL schemas on the server Structure is [documented below](#nested_source_config_postgresql_source_config_include_objects_postgresql_schemas). <a name="nested_source_config_postgresql_source_config_include_objects_postgresql_schemas"></a>The `postgresql_schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Database name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_tables`
- Description: (Optional) Tables in the schema. Structure is [documented below](#nested_source_config_postgresql_source_config_include_objects_postgresql_schemas_postgresql_schemas_postgresql_tables). <a name="nested_source_config_postgresql_source_config_include_objects_postgresql_schemas_postgresql_schemas_postgresql_tables"></a>The `postgresql_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_columns`
- Description: (Optional) PostgreSQL columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_source_config_postgresql_source_config_include_objects_postgresql_schemas_postgresql_schemas_postgresql_tables_postgresql_tables_postgresql_columns). <a name="nested_source_config_postgresql_source_config_include_objects_postgresql_schemas_postgresql_schemas_postgresql_tables_postgresql_tables_postgresql_columns"></a>The `postgresql_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The PostgreSQL data type. Full data types list can be found here: https://www.postgresql.org/docs/current/datatype.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Optional) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Optional) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Optional) The ordinal position of the column in the table. <a name="nested_source_config_postgresql_source_config_exclude_objects"></a>The `exclude_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_schemas`
- Description: (Required) PostgreSQL schemas on the server Structure is [documented below](#nested_source_config_postgresql_source_config_exclude_objects_postgresql_schemas). <a name="nested_source_config_postgresql_source_config_exclude_objects_postgresql_schemas"></a>The `postgresql_schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Database name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_tables`
- Description: (Optional) Tables in the schema. Structure is [documented below](#nested_source_config_postgresql_source_config_exclude_objects_postgresql_schemas_postgresql_schemas_postgresql_tables). <a name="nested_source_config_postgresql_source_config_exclude_objects_postgresql_schemas_postgresql_schemas_postgresql_tables"></a>The `postgresql_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_columns`
- Description: (Optional) PostgreSQL columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_source_config_postgresql_source_config_exclude_objects_postgresql_schemas_postgresql_schemas_postgresql_tables_postgresql_tables_postgresql_columns). <a name="nested_source_config_postgresql_source_config_exclude_objects_postgresql_schemas_postgresql_schemas_postgresql_tables_postgresql_tables_postgresql_columns"></a>The `postgresql_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The PostgreSQL data type. Full data types list can be found here: https://www.postgresql.org/docs/current/datatype.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Optional) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Optional) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Optional) The ordinal position of the column in the table. <a name="nested_source_config_sql_server_source_config"></a>The `sql_server_source_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_objects`
- Description: (Optional) SQL Server objects to retrieve from the source. Structure is [documented below](#nested_source_config_sql_server_source_config_include_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_objects`
- Description: (Optional) SQL Server objects to exclude from the stream. Structure is [documented below](#nested_source_config_sql_server_source_config_exclude_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_cdc_tasks`
- Description: (Optional) Max concurrent CDC tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_backfill_tasks`
- Description: (Optional) Max concurrent backfill tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transaction_logs`
- Description: (Optional) CDC reader reads from transaction logs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `change_tables`
- Description: (Optional) CDC reader reads from change tables. <a name="nested_source_config_sql_server_source_config_include_objects"></a>The `include_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schemas`
- Description: (Required) SQL Server schemas/databases in the database server Structure is [documented below](#nested_source_config_sql_server_source_config_include_objects_schemas). <a name="nested_source_config_sql_server_source_config_include_objects_schemas"></a>The `schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Schema name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_source_config_sql_server_source_config_include_objects_schemas_schemas_tables). <a name="nested_source_config_sql_server_source_config_include_objects_schemas_schemas_tables"></a>The `tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `columns`
- Description: (Optional) SQL Server columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_source_config_sql_server_source_config_include_objects_schemas_schemas_tables_tables_columns). <a name="nested_source_config_sql_server_source_config_include_objects_schemas_schemas_tables_tables_columns"></a>The `columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The SQL Server data type. Full data types list can be found here: https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Output) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Output) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Output) The ordinal position of the column in the table. <a name="nested_source_config_sql_server_source_config_exclude_objects"></a>The `exclude_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schemas`
- Description: (Required) SQL Server schemas/databases in the database server Structure is [documented below](#nested_source_config_sql_server_source_config_exclude_objects_schemas). <a name="nested_source_config_sql_server_source_config_exclude_objects_schemas"></a>The `schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Schema name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_source_config_sql_server_source_config_exclude_objects_schemas_schemas_tables). <a name="nested_source_config_sql_server_source_config_exclude_objects_schemas_schemas_tables"></a>The `tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `columns`
- Description: (Optional) SQL Server columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_source_config_sql_server_source_config_exclude_objects_schemas_schemas_tables_tables_columns). <a name="nested_source_config_sql_server_source_config_exclude_objects_schemas_schemas_tables_tables_columns"></a>The `columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The SQL Server data type. Full data types list can be found here: https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Output) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Output) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Output) The ordinal position of the column in the table. <a name="nested_source_config_salesforce_source_config"></a>The `salesforce_source_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_objects`
- Description: (Optional) Salesforce objects to retrieve from the source. Structure is [documented below](#nested_source_config_salesforce_source_config_include_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_objects`
- Description: (Optional) Salesforce objects to exclude from the stream. Structure is [documented below](#nested_source_config_salesforce_source_config_exclude_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `polling_interval`
- Description: (Required) Salesforce objects polling interval. The interval at which new changes will be polled for each object. The duration must be between 5 minutes and 24 hours. <a name="nested_source_config_salesforce_source_config_include_objects"></a>The `include_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `objects`
- Description: (Required) Salesforce objects in Salesforce Org. Structure is [documented below](#nested_source_config_salesforce_source_config_include_objects_objects). <a name="nested_source_config_salesforce_source_config_include_objects_objects"></a>The `objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_name`
- Description: (Optional) Name of object in Salesforce Org.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fields`
- Description: (Optional) Fields in the Salesforce object. When unspecified as part of include/exclude objects, includes/excludes everything/nothing. Structure is [documented below](#nested_source_config_salesforce_source_config_include_objects_objects_objects_fields). <a name="nested_source_config_salesforce_source_config_include_objects_objects_objects_fields"></a>The `fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Field name. <a name="nested_source_config_salesforce_source_config_exclude_objects"></a>The `exclude_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `objects`
- Description: (Required) Salesforce objects in data source. Structure is [documented below](#nested_source_config_salesforce_source_config_exclude_objects_objects). <a name="nested_source_config_salesforce_source_config_exclude_objects_objects"></a>The `objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_name`
- Description: (Optional) Name of object in Salesforce Org.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fields`
- Description: (Optional) Fields in the Salesforce object. When unspecified as part of include/exclude objects, includes/excludes everything/nothing. Structure is [documented below](#nested_source_config_salesforce_source_config_exclude_objects_objects_objects_fields). <a name="nested_source_config_salesforce_source_config_exclude_objects_objects_objects_fields"></a>The `fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Field name. <a name="nested_destination_config"></a>The `destination_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_connection_profile`
- Description: (Required) Destination connection profile resource. Format: projects/{project}/locations/{location}/connectionProfiles/{name}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_destination_config`
- Description: (Optional) A configuration for how data should be loaded to Cloud Storage. Structure is [documented below](#nested_destination_config_gcs_destination_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigquery_destination_config`
- Description: (Optional) A configuration for how data should be loaded to Google BigQuery. Structure is [documented below](#nested_destination_config_bigquery_destination_config). <a name="nested_destination_config_gcs_destination_config"></a>The `gcs_destination_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Path inside the Cloud Storage bucket to write data to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_rotation_mb`
- Description: (Optional) The maximum file size to be saved in the bucket.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_rotation_interval`
- Description: (Optional) The maximum duration for which new events are added before a file is closed and a new file is created. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Defaults to 900s.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `avro_file_format`
- Description: (Optional) AVRO file format configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_file_format`
- Description: (Optional) JSON file format configuration. Structure is [documented below](#nested_destination_config_gcs_destination_config_json_file_format). <a name="nested_destination_config_gcs_destination_config_json_file_format"></a>The `json_file_format` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_file_format`
- Description: (Optional) The schema file format along JSON data files. Possible values are: `NO_SCHEMA_FILE`, `AVRO_SCHEMA_FILE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compression`
- Description: (Optional) Compression of the loaded JSON file. Possible values are: `NO_COMPRESSION`, `GZIP`. <a name="nested_destination_config_bigquery_destination_config"></a>The `bigquery_destination_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_freshness`
- Description: (Optional) The guaranteed data freshness (in seconds) when querying tables created by the stream. Editing this field will only affect new tables created in the future, but existing tables will not be impacted. Lower values mean that queries will return fresher data, but may result in higher cost. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Defaults to 900s.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `single_target_dataset`
- Description: (Optional) A single target dataset to which all data will be streamed. Structure is [documented below](#nested_destination_config_bigquery_destination_config_single_target_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_hierarchy_datasets`
- Description: (Optional) Destination datasets are created so that hierarchy of the destination data objects matches the source hierarchy. Structure is [documented below](#nested_destination_config_bigquery_destination_config_source_hierarchy_datasets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `blmt_config`
- Description: (Optional) BigLake Managed Tables configuration for BigQuery streams. Structure is [documented below](#nested_destination_config_bigquery_destination_config_blmt_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `merge`
- Description: (Optional) Merge mode defines that all changes to a table will be merged at the destination Google BigQuery table. This is the default write mode. When selected, BigQuery reflects the way the data is stored in the source database. With Merge mode, no historical record of the change events is kept.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `append_only`
- Description: (Optional) AppendOnly mode defines that the stream of changes (INSERT, UPDATE-INSERT, UPDATE-DELETE and DELETE events) to a source table will be written to the destination Google BigQuery table, retaining the historical state of the data. <a name="nested_destination_config_bigquery_destination_config_single_target_dataset"></a>The `single_target_dataset` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) Dataset ID in the format projects/{project}/datasets/{dataset_id} or {project}:{dataset_id} <a name="nested_destination_config_bigquery_destination_config_source_hierarchy_datasets"></a>The `source_hierarchy_datasets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_template`
- Description: (Required) Dataset template used for dynamic dataset creation. Structure is [documented below](#nested_destination_config_bigquery_destination_config_source_hierarchy_datasets_dataset_template). <a name="nested_destination_config_bigquery_destination_config_source_hierarchy_datasets_dataset_template"></a>The `dataset_template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The geographic location where the dataset should reside. See https://cloud.google.com/bigquery/docs/locations for supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id_prefix`
- Description: (Optional) If supplied, every created dataset will have its name prefixed by the provided value. The prefix and name will be separated by an underscore. i.e. _.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key. i.e. projects/{project}/locations/{location}/keyRings/{key_ring}/cryptoKeys/{cryptoKey}. See https://cloud.google.com/bigquery/docs/customer-managed-encryption for more information. <a name="nested_destination_config_bigquery_destination_config_blmt_config"></a>The `blmt_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) The Cloud Storage bucket name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_name`
- Description: (Required) The bigquery connection. Format: `{project}.{location}.{name}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_format`
- Description: (Required) The file format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_format`
- Description: (Required) The table format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_path`
- Description: (Optional) The root path inside the Cloud Storage bucket. <a name="nested_backfill_all"></a>The `backfill_all` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_excluded_objects`
- Description: (Optional) MySQL data source objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_mysql_excluded_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_excluded_objects`
- Description: (Optional) PostgreSQL data source objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_postgresql_excluded_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_excluded_objects`
- Description: (Optional) PostgreSQL data source objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_oracle_excluded_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_server_excluded_objects`
- Description: (Optional) SQL Server data source objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_sql_server_excluded_objects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `salesforce_excluded_objects`
- Description: (Optional) Salesforce objects to avoid backfilling. Structure is [documented below](#nested_backfill_all_salesforce_excluded_objects). <a name="nested_backfill_all_mysql_excluded_objects"></a>The `mysql_excluded_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_databases`
- Description: (Required) MySQL databases on the server Structure is [documented below](#nested_backfill_all_mysql_excluded_objects_mysql_databases). <a name="nested_backfill_all_mysql_excluded_objects_mysql_databases"></a>The `mysql_databases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Required) Database name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_backfill_all_mysql_excluded_objects_mysql_databases_mysql_databases_mysql_tables). <a name="nested_backfill_all_mysql_excluded_objects_mysql_databases_mysql_databases_mysql_tables"></a>The `mysql_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mysql_columns`
- Description: (Optional) MySQL columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_backfill_all_mysql_excluded_objects_mysql_databases_mysql_databases_mysql_tables_mysql_tables_mysql_columns). <a name="nested_backfill_all_mysql_excluded_objects_mysql_databases_mysql_databases_mysql_tables_mysql_tables_mysql_columns"></a>The `mysql_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The MySQL data type. Full data types list can be found here: https://dev.mysql.com/doc/refman/8.0/en/data-types.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collation`
- Description: (Optional) Column collation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Optional) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Optional) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Optional) The ordinal position of the column in the table. <a name="nested_backfill_all_postgresql_excluded_objects"></a>The `postgresql_excluded_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_schemas`
- Description: (Required) PostgreSQL schemas on the server Structure is [documented below](#nested_backfill_all_postgresql_excluded_objects_postgresql_schemas). <a name="nested_backfill_all_postgresql_excluded_objects_postgresql_schemas"></a>The `postgresql_schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Database name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_tables`
- Description: (Optional) Tables in the schema. Structure is [documented below](#nested_backfill_all_postgresql_excluded_objects_postgresql_schemas_postgresql_schemas_postgresql_tables). <a name="nested_backfill_all_postgresql_excluded_objects_postgresql_schemas_postgresql_schemas_postgresql_tables"></a>The `postgresql_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `postgresql_columns`
- Description: (Optional) PostgreSQL columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_backfill_all_postgresql_excluded_objects_postgresql_schemas_postgresql_schemas_postgresql_tables_postgresql_tables_postgresql_columns). <a name="nested_backfill_all_postgresql_excluded_objects_postgresql_schemas_postgresql_schemas_postgresql_tables_postgresql_tables_postgresql_columns"></a>The `postgresql_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The PostgreSQL data type. Full data types list can be found here: https://www.postgresql.org/docs/current/datatype.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Optional) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Optional) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Optional) The ordinal position of the column in the table. <a name="nested_backfill_all_oracle_excluded_objects"></a>The `oracle_excluded_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_schemas`
- Description: (Required) Oracle schemas/databases in the database server Structure is [documented below](#nested_backfill_all_oracle_excluded_objects_oracle_schemas). <a name="nested_backfill_all_oracle_excluded_objects_oracle_schemas"></a>The `oracle_schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Schema name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_backfill_all_oracle_excluded_objects_oracle_schemas_oracle_schemas_oracle_tables). <a name="nested_backfill_all_oracle_excluded_objects_oracle_schemas_oracle_schemas_oracle_tables"></a>The `oracle_tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oracle_columns`
- Description: (Optional) Oracle columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_backfill_all_oracle_excluded_objects_oracle_schemas_oracle_schemas_oracle_tables_oracle_tables_oracle_columns). <a name="nested_backfill_all_oracle_excluded_objects_oracle_schemas_oracle_schemas_oracle_tables_oracle_tables_oracle_columns"></a>The `oracle_columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The Oracle data type. Full data types list can be found here: https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/Data-Types.html
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encoding`
- Description: (Output) Column encoding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Output) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Output) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Output) The ordinal position of the column in the table. <a name="nested_backfill_all_sql_server_excluded_objects"></a>The `sql_server_excluded_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schemas`
- Description: (Required) SQL Server schemas/databases in the database server Structure is [documented below](#nested_backfill_all_sql_server_excluded_objects_schemas). <a name="nested_backfill_all_sql_server_excluded_objects_schemas"></a>The `schemas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Required) Schema name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tables`
- Description: (Optional) Tables in the database. Structure is [documented below](#nested_backfill_all_sql_server_excluded_objects_schemas_schemas_tables). <a name="nested_backfill_all_sql_server_excluded_objects_schemas_schemas_tables"></a>The `tables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Table name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `columns`
- Description: (Optional) SQL Server columns in the schema. When unspecified as part of include/exclude objects, includes/excludes everything. Structure is [documented below](#nested_backfill_all_sql_server_excluded_objects_schemas_schemas_tables_tables_columns). <a name="nested_backfill_all_sql_server_excluded_objects_schemas_schemas_tables_tables_columns"></a>The `columns` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column`
- Description: (Optional) Column name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_type`
- Description: (Optional) The SQL Server data type. Full data types list can be found here: https://learn.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-ver16
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `length`
- Description: (Output) Column length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `precision`
- Description: (Output) Column precision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scale`
- Description: (Output) Column scale.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_key`
- Description: (Output) Whether or not the column represents a primary key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nullable`
- Description: (Output) Whether or not the column can accept a null value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ordinal_position`
- Description: (Output) The ordinal position of the column in the table. <a name="nested_backfill_all_salesforce_excluded_objects"></a>The `salesforce_excluded_objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `objects`
- Description: (Required) Salesforce objects in Salesforce Org. Structure is [documented below](#nested_backfill_all_salesforce_excluded_objects_objects). <a name="nested_backfill_all_salesforce_excluded_objects_objects"></a>The `objects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object_name`
- Description: (Optional) Name of object in Salesforce Org.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fields`
- Description: (Optional) Fields in the Salesforce object. When unspecified as part of include/exclude objects, includes/excludes everything/nothing. Structure is [documented below](#nested_backfill_all_salesforce_excluded_objects_objects_objects_fields). <a name="nested_backfill_all_salesforce_excluded_objects_objects_objects_fields"></a>The `fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Field name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
