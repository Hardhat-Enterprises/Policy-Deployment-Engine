## 🛡️ Policy Deployment Engine: `oracle_database_autonomous_database`

This section provides a concise policy evaluation for the `oracle_database_autonomous_database` resource in GCP.

Reference: [Terraform Registry – oracle_database_autonomous_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_autonomous_database)

---

## 1. Argument Reference

### `database`
- Description: (Required) The name of the Autonomous Database. The database name must be unique in the project. The name must begin with a letter and can contain a maximum of 30 alphanumeric characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Required) The properties of an Autonomous Database. Structure is [documented below](#nested_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. See documentation for resource type `oracledatabase.googleapis.com/AutonomousDatabaseBackup`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autonomous_database_id`
- Description: (Required) The ID of the Autonomous Database to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name for the Autonomous Database. The name does not have to be unique within your project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_password`
- Description: (Optional) The password for the default ADMIN user.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels or tags associated with the Autonomous Database. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The name of the VPC network used by the Autonomous Database. Format: projects/{project}/global/networks/{network}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cidr`
- Description: (Optional) The subnet CIDR range for the Autonmous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `odb_network`
- Description: (Optional) The name of the OdbNetwork associated with the Autonomous Database. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network} It is optional but if specified, this should match the parent ODBNetwork of the odb_subnet and backup_odb_subnet.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `odb_subnet`
- Description: (Optional) The name of the OdbSubnet associated with the Autonomous Database for IP allocation. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network}/odbSubnets/{odb_subnet}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: <a name="nested_properties"></a>The `properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ocid`
- Description: (Output) OCID of the Autonomous Database. https://docs.oracle.com/en-us/iaas/Content/General/Concepts/identifiers.htm#Oracle
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compute_count`
- Description: (Optional) The number of compute servers for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_storage_size_tb`
- Description: (Optional) The size of the data stored in the database, in terabytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_storage_size_gb`
- Description: (Optional) The size of the data stored in the database, in gigabytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `db_workload`
- Description: (Required) Possible values: DB_WORKLOAD_UNSPECIFIED OLTP DW AJD APEX
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `db_edition`
- Description: (Optional) The edition of the Autonomous Databases. Possible values: DATABASE_EDITION_UNSPECIFIED STANDARD_EDITION ENTERPRISE_EDITION
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `character_set`
- Description: (Optional) The character set for the Autonomous Database. The default is AL32UTF8.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `n_character_set`
- Description: (Optional) The national character set for the Autonomous Database. The default is AL16UTF16.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_endpoint_ip`
- Description: (Optional) The private endpoint IP address for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_endpoint_label`
- Description: (Optional) The private endpoint label for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `db_version`
- Description: (Optional) The Oracle Database version for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_auto_scaling_enabled`
- Description: (Optional) This field indicates if auto scaling is enabled for the Autonomous Database CPU core count.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_storage_auto_scaling_enabled`
- Description: (Optional) This field indicates if auto scaling is enabled for the Autonomous Database storage.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `license_type`
- Description: (Required) The license type used for the Autonomous Database. Possible values: LICENSE_TYPE_UNSPECIFIED LICENSE_INCLUDED BRING_YOUR_OWN_LICENSE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `customer_contacts`
- Description: (Optional) The list of customer contacts. Structure is [documented below](#nested_properties_customer_contacts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_schedule_type`
- Description: (Optional) The maintenance schedule of the Autonomous Database. Possible values: MAINTENANCE_SCHEDULE_TYPE_UNSPECIFIED EARLY REGULAR
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mtls_connection_required`
- Description: (Optional) This field specifies if the Autonomous Database requires mTLS connections.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_retention_period_days`
- Description: (Optional) The retention period for the Autonomous Database. This field is specified in days, can range from 1 day to 60 days, and has a default value of 60 days.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actual_used_data_storage_size_tb`
- Description: (Output) The amount of storage currently being used for user and system data, in terabytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocated_storage_size_tb`
- Description: (Output) The amount of storage currently allocated for the database tables and billed for, rounded up in terabytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `apex_details`
- Description: (Output) Oracle APEX Application Development. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/AutonomousDatabaseApex Structure is [documented below](#nested_properties_apex_details).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `are_primary_allowlisted_ips_used`
- Description: (Output) This field indicates the status of Data Guard and Access control for the Autonomous Database. The field's value is null if Data Guard is disabled or Access Control is disabled. The field's value is TRUE if both Data Guard and Access Control are enabled, and the Autonomous Database is using primary IP access control list (ACL) for standby. The field's value is FALSE if both Data Guard and Access Control are enabled, and the Autonomous Database is using a different IP access control list (ACL) for standby compared to primary.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lifecycle_details`
- Description: (Output) The details of the current lifestyle state of the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) Possible values: STATE_UNSPECIFIED PROVISIONING AVAILABLE STOPPING STOPPED STARTING TERMINATING TERMINATED UNAVAILABLE RESTORE_IN_PROGRESS RESTORE_FAILED BACKUP_IN_PROGRESS SCALE_IN_PROGRESS AVAILABLE_NEEDS_ATTENTION UPDATING MAINTENANCE_IN_PROGRESS RESTARTING RECREATING ROLE_CHANGE_IN_PROGRESS UPGRADING INACCESSIBLE STANDBY
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autonomous_container_database_id`
- Description: (Output) The Autonomous Container Database OCID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `available_upgrade_versions`
- Description: (Output) The list of available Oracle Database upgrade versions for an Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_strings`
- Description: (Output) The connection string used to connect to the Autonomous Database. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/AutonomousDatabaseConnectionStrings Structure is [documented below](#nested_properties_connection_strings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_urls`
- Description: (Output) The URLs for accessing Oracle Application Express (APEX) and SQL Developer Web with a browser from a Compute instance. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/AutonomousDatabaseConnectionUrls Structure is [documented below](#nested_properties_connection_urls).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failed_data_recovery_duration`
- Description: (Output) This field indicates the number of seconds of data loss during a Data Guard failover.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_table_gbs`
- Description: (Output) The memory assigned to in-memory tables in an Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_local_data_guard_enabled`
- Description: (Output) This field indicates whether the Autonomous Database has local (in-region) Data Guard enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_adg_auto_failover_max_data_loss_limit`
- Description: (Output) This field indicates the maximum data loss limit for an Autonomous Database, in seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_standby_db`
- Description: (Output) Autonomous Data Guard standby database details. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/AutonomousDatabaseStandbySummary Structure is [documented below](#nested_properties_local_standby_db).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_per_oracle_compute_unit_gbs`
- Description: (Output) The amount of memory enabled per ECPU, in gigabytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_disaster_recovery_type`
- Description: (Output) This field indicates the local disaster recovery (DR) type of an Autonomous Database. Possible values: LOCAL_DISASTER_RECOVERY_TYPE_UNSPECIFIED ADG BACKUP_BASED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_safe_state`
- Description: (Output) The current state of the Data Safe registration for the Autonomous Database. Possible values: DATA_SAFE_STATE_UNSPECIFIED REGISTERING REGISTERED DEREGISTERING NOT_REGISTERED FAILED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_management_state`
- Description: (Output) The current state of database management for the Autonomous Database. Possible values: DATABASE_MANAGEMENT_STATE_UNSPECIFIED ENABLING ENABLED DISABLING NOT_ENABLED FAILED_ENABLING FAILED_DISABLING
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `open_mode`
- Description: (Output) This field indicates the current mode of the Autonomous Database. Possible values: OPEN_MODE_UNSPECIFIED READ_ONLY READ_WRITE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operations_insights_state`
- Description: (Optional) Possible values: OPERATIONS_INSIGHTS_STATE_UNSPECIFIED ENABLING ENABLED DISABLING NOT_ENABLED FAILED_ENABLING FAILED_DISABLING
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_db_ids`
- Description: (Output) The list of OCIDs of standby databases located in Autonomous Data Guard remote regions that are associated with the source database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permission_level`
- Description: (Output) The permission level of the Autonomous Database. Possible values: PERMISSION_LEVEL_UNSPECIFIED RESTRICTED UNRESTRICTED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_endpoint`
- Description: (Output) The private endpoint for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `refreshable_mode`
- Description: (Output) The refresh mode of the cloned Autonomous Database. Possible values: REFRESHABLE_MODE_UNSPECIFIED AUTOMATIC MANUAL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `refreshable_state`
- Description: (Output) The refresh State of the clone. Possible values: REFRESHABLE_STATE_UNSPECIFIED REFRESHING NOT_REFRESHING
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Output) The Data Guard role of the Autonomous Database. Possible values: ROLE_UNSPECIFIED PRIMARY STANDBY DISABLED_STANDBY BACKUP_COPY SNAPSHOT_STANDBY
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduled_operation_details`
- Description: (Output) The list and details of the scheduled operations of the Autonomous Database. Structure is [documented below](#nested_properties_scheduled_operation_details).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_web_developer_url`
- Description: (Output) The SQL Web Developer URL for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `supported_clone_regions`
- Description: (Output) The list of available regions that can be used to create a clone for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `used_data_storage_size_tbs`
- Description: (Output) The storage space used by Autonomous Database, in gigabytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oci_url`
- Description: (Output) The Oracle Cloud Infrastructure link for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_auto_backup_storage_size_gbs`
- Description: (Output) The storage space used by automatic backups of Autonomous Database, in gigabytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `next_long_term_backup_time`
- Description: (Output) The long term backup schedule of the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_begin_time`
- Description: (Output) The date and time when maintenance will begin.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_end_time`
- Description: (Output) The date and time when maintenance will end. <a name="nested_properties_customer_contacts"></a>The `customer_contacts` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) The email address used by Oracle to send notifications regarding databases and infrastructure. <a name="nested_properties_apex_details"></a>The `apex_details` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `apex_version`
- Description: (Output) The Oracle APEX Application Development version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ords_version`
- Description: (Output) The Oracle REST Data Services (ORDS) version. <a name="nested_properties_connection_strings"></a>The `connection_strings` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_connection_strings`
- Description: (Output) A list of all connection strings that can be used to connect to the Autonomous Database. Structure is [documented below](#nested_properties_connection_strings_all_connection_strings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dedicated`
- Description: (Output) The database service provides the least level of resources to each SQL statement, but supports the most number of concurrent SQL statements.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `high`
- Description: (Output) The database service provides the highest level of resources to each SQL statement.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `low`
- Description: (Output) The database service provides the least level of resources to each SQL statement.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `medium`
- Description: (Output) The database service provides a lower level of resources to each SQL statement.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `profiles`
- Description: (Output) A list of connection string profiles to allow clients to group, filter, and select values based on the structured metadata. Structure is [documented below](#nested_properties_connection_strings_profiles). <a name="nested_properties_connection_strings_all_connection_strings"></a>The `all_connection_strings` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `high`
- Description: (Output) The database service provides the highest level of resources to each SQL statement.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `low`
- Description: (Output) The database service provides the least level of resources to each SQL statement.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `medium`
- Description: (Output) The database service provides a lower level of resources to each SQL statement. <a name="nested_properties_connection_strings_profiles"></a>The `profiles` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_group`
- Description: (Output) The current consumer group being used by the connection. Possible values: CONSUMER_GROUP_UNSPECIFIED HIGH MEDIUM LOW TP TPURGENT
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Output) The display name for the database connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_format`
- Description: (Output) The host name format being currently used in connection string. Possible values: HOST_FORMAT_UNSPECIFIED FQDN IP
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_regional`
- Description: (Output) This field indicates if the connection string is regional and is only applicable for cross-region Data Guard.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol`
- Description: (Output) The protocol being used by the connection. Possible values: PROTOCOL_UNSPECIFIED TCP TCPS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_mode`
- Description: (Output) The current session mode of the connection. Possible values: SESSION_MODE_UNSPECIFIED DIRECT INDIRECT
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `syntax_format`
- Description: (Output) The syntax of the connection string. Possible values: SYNTAX_FORMAT_UNSPECIFIED LONG EZCONNECT EZCONNECTPLUS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_authentication`
- Description: (Output) This field indicates the TLS authentication type of the connection. Possible values: TLS_AUTHENTICATION_UNSPECIFIED SERVER MUTUAL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Output) The value of the connection string. <a name="nested_properties_connection_urls"></a>The `connection_urls` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `apex_uri`
- Description: (Output) Oracle Application Express (APEX) URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_transforms_uri`
- Description: (Output) The URL of the Database Transforms for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `graph_studio_uri`
- Description: (Output) The URL of the Graph Studio for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_learning_notebook_uri`
- Description: (Output) The URL of the Oracle Machine Learning (OML) Notebook for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_learning_user_management_uri`
- Description: (Output) The URL of Machine Learning user management the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mongo_db_uri`
- Description: (Output) The URL of the MongoDB API for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ords_uri`
- Description: (Output) The Oracle REST Data Services (ORDS) URL of the Web Access for the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sql_dev_web_uri`
- Description: (Output) The URL of the Oracle SQL Developer Web for the Autonomous Database. <a name="nested_properties_local_standby_db"></a>The `local_standby_db` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lag_time_duration`
- Description: (Output) The amount of time, in seconds, that the data of the standby database lags in comparison to the data of the primary database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lifecycle_details`
- Description: (Output) The additional details about the current lifecycle state of the Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) Possible values: STATE_UNSPECIFIED PROVISIONING AVAILABLE STOPPING STOPPED STARTING TERMINATING TERMINATED UNAVAILABLE RESTORE_IN_PROGRESS RESTORE_FAILED BACKUP_IN_PROGRESS SCALE_IN_PROGRESS AVAILABLE_NEEDS_ATTENTION UPDATING MAINTENANCE_IN_PROGRESS RESTARTING RECREATING ROLE_CHANGE_IN_PROGRESS UPGRADING INACCESSIBLE STANDBY
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_guard_role_changed_time`
- Description: (Output) The date and time the Autonomous Data Guard role was switched for the standby Autonomous Database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disaster_recovery_role_changed_time`
- Description: (Output) The date and time the Disaster Recovery role was switched for the standby Autonomous Database. <a name="nested_properties_scheduled_operation_details"></a>The `scheduled_operation_details` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day_of_week`
- Description: (Output) Possible values: DAY_OF_WEEK_UNSPECIFIED MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY SUNDAY
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Output) Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`. Structure is [documented below](#nested_properties_scheduled_operation_details_scheduled_operation_details_start_time).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stop_time`
- Description: (Output) Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`. Structure is [documented below](#nested_properties_scheduled_operation_details_scheduled_operation_details_stop_time). <a name="nested_properties_scheduled_operation_details_scheduled_operation_details_start_time"></a>The `start_time` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Output) Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Output) Minutes of hour of day. Must be from 0 to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Output) Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Output) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. <a name="nested_properties_scheduled_operation_details_scheduled_operation_details_stop_time"></a>The `stop_time` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Output) Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Output) Minutes of hour of day. Must be from 0 to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Output) Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Output) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
