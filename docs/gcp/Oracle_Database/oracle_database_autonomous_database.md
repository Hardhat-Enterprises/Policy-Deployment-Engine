## 🛡️ Policy Deployment Engine: `oracle_database_autonomous_database`

This section provides a concise policy evaluation for the `oracle_database_autonomous_database` resource in GCP.

Reference: [Terraform Registry – oracle_database_autonomous_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_autonomous_database)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `database` | The name of the Autonomous Database. The database name must be unique in the project. The name must begin with a letter and can contain a maximum of 30 alphanumeric characters. | true | None | None |
| `location` | Resource ID segment making up resource `name`. See documentation for resource type `oracledatabase.googleapis.com/AutonomousDatabaseBackup`. | true | None | None |
| `autonomous_database_id` | The ID of the Autonomous Database to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number. | true | None | None |
| `display_name` | The display name for the Autonomous Database. The name does not have to be unique within your project. | false | None | None |
| `admin_password` | The password for the default ADMIN user. | false | None | None |
| `labels` | The labels or tags associated with the Autonomous Database. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `network` | The name of the VPC network used by the Autonomous Database. Format: projects/{project}/global/networks/{network} | false | None | None |
| `cidr` | The subnet CIDR range for the Autonmous Database. | false | None | None |
| `odb_network` | The name of the OdbNetwork associated with the Autonomous Database. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network} It is optional but if specified, this should match the parent ODBNetwork of the odb_subnet and backup_odb_subnet. | false | None | None |
| `odb_subnet` | The name of the OdbSubnet associated with the Autonomous Database for IP allocation. Format: projects/{project}/locations/{location}/odbNetworks/{odb_network}/odbSubnets/{odb_subnet} | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` |  | none | None | None |

### properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ocid` | (Output) OCID of the Autonomous Database. https://docs.oracle.com/en-us/iaas/Content/General/Concepts/identifiers.htm#Oracle | none | None | None |
| `compute_count` | The number of compute servers for the Autonomous Database. | false | None | None |
| `data_storage_size_tb` | The size of the data stored in the database, in terabytes. | false | None | None |
| `data_storage_size_gb` | The size of the data stored in the database, in gigabytes. | false | None | None |
| `db_workload` | Possible values: DB_WORKLOAD_UNSPECIFIED OLTP DW AJD APEX | true | None | None |
| `db_edition` | The edition of the Autonomous Databases. Possible values: DATABASE_EDITION_UNSPECIFIED STANDARD_EDITION ENTERPRISE_EDITION | false | None | None |
| `character_set` | The character set for the Autonomous Database. The default is AL32UTF8. | false | None | None |
| `n_character_set` | The national character set for the Autonomous Database. The default is AL16UTF16. | false | None | None |
| `private_endpoint_ip` | The private endpoint IP address for the Autonomous Database. | false | None | None |
| `private_endpoint_label` | The private endpoint label for the Autonomous Database. | false | None | None |
| `db_version` | The Oracle Database version for the Autonomous Database. | false | None | None |
| `is_auto_scaling_enabled` | This field indicates if auto scaling is enabled for the Autonomous Database CPU core count. | false | None | None |
| `is_storage_auto_scaling_enabled` | This field indicates if auto scaling is enabled for the Autonomous Database storage. | false | None | None |
| `license_type` | The license type used for the Autonomous Database. Possible values: LICENSE_TYPE_UNSPECIFIED LICENSE_INCLUDED BRING_YOUR_OWN_LICENSE | true | None | None |
| `customer_contacts` | The list of customer contacts. Structure is [documented below](#nested_properties_customer_contacts). | false | None | None |
| `maintenance_schedule_type` | The maintenance schedule of the Autonomous Database. Possible values: MAINTENANCE_SCHEDULE_TYPE_UNSPECIFIED EARLY REGULAR | false | None | None |
| `mtls_connection_required` | This field specifies if the Autonomous Database requires mTLS connections. | false | None | None |
| `backup_retention_period_days` | The retention period for the Autonomous Database. This field is specified in days, can range from 1 day to 60 days, and has a default value of 60 days. | false | None | None |
| `actual_used_data_storage_size_tb` | (Output) The amount of storage currently being used for user and system data, in terabytes. | none | None | None |
| `allocated_storage_size_tb` | (Output) The amount of storage currently allocated for the database tables and billed for, rounded up in terabytes. | none | None | None |
| `apex_details` | (Output) Oracle APEX Application Development. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/AutonomousDatabaseApex Structure is [documented below](#nested_properties_apex_details). | none | None | None |
| `are_primary_allowlisted_ips_used` | (Output) This field indicates the status of Data Guard and Access control for the Autonomous Database. The field's value is null if Data Guard is disabled or Access Control is disabled. The field's value is TRUE if both Data Guard and Access Control are enabled, and the Autonomous Database is using primary IP access control list (ACL) for standby. The field's value is FALSE if both Data Guard and Access Control are enabled, and the Autonomous Database is using a different IP access control list (ACL) for standby compared to primary. | none | None | None |
| `lifecycle_details` | (Output) The details of the current lifestyle state of the Autonomous Database. | none | None | None |
| `state` | (Output) Possible values: STATE_UNSPECIFIED PROVISIONING AVAILABLE STOPPING STOPPED STARTING TERMINATING TERMINATED UNAVAILABLE RESTORE_IN_PROGRESS RESTORE_FAILED BACKUP_IN_PROGRESS SCALE_IN_PROGRESS AVAILABLE_NEEDS_ATTENTION UPDATING MAINTENANCE_IN_PROGRESS RESTARTING RECREATING ROLE_CHANGE_IN_PROGRESS UPGRADING INACCESSIBLE STANDBY | none | None | None |
| `autonomous_container_database_id` | (Output) The Autonomous Container Database OCID. | none | None | None |
| `available_upgrade_versions` | (Output) The list of available Oracle Database upgrade versions for an Autonomous Database. | none | None | None |
| `connection_strings` | (Output) The connection string used to connect to the Autonomous Database. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/AutonomousDatabaseConnectionStrings Structure is [documented below](#nested_properties_connection_strings). | none | None | None |
| `connection_urls` | (Output) The URLs for accessing Oracle Application Express (APEX) and SQL Developer Web with a browser from a Compute instance. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/AutonomousDatabaseConnectionUrls Structure is [documented below](#nested_properties_connection_urls). | none | None | None |
| `failed_data_recovery_duration` | (Output) This field indicates the number of seconds of data loss during a Data Guard failover. | none | None | None |
| `memory_table_gbs` | (Output) The memory assigned to in-memory tables in an Autonomous Database. | none | None | None |
| `is_local_data_guard_enabled` | (Output) This field indicates whether the Autonomous Database has local (in-region) Data Guard enabled. | none | None | None |
| `local_adg_auto_failover_max_data_loss_limit` | (Output) This field indicates the maximum data loss limit for an Autonomous Database, in seconds. | none | None | None |
| `local_standby_db` | (Output) Autonomous Data Guard standby database details. https://docs.oracle.com/en-us/iaas/api/#/en/database/20160918/datatypes/AutonomousDatabaseStandbySummary Structure is [documented below](#nested_properties_local_standby_db). | none | None | None |
| `memory_per_oracle_compute_unit_gbs` | (Output) The amount of memory enabled per ECPU, in gigabytes. | none | None | None |
| `local_disaster_recovery_type` | (Output) This field indicates the local disaster recovery (DR) type of an Autonomous Database. Possible values: LOCAL_DISASTER_RECOVERY_TYPE_UNSPECIFIED ADG BACKUP_BASED | none | None | None |
| `data_safe_state` | (Output) The current state of the Data Safe registration for the Autonomous Database. Possible values: DATA_SAFE_STATE_UNSPECIFIED REGISTERING REGISTERED DEREGISTERING NOT_REGISTERED FAILED | none | None | None |
| `database_management_state` | (Output) The current state of database management for the Autonomous Database. Possible values: DATABASE_MANAGEMENT_STATE_UNSPECIFIED ENABLING ENABLED DISABLING NOT_ENABLED FAILED_ENABLING FAILED_DISABLING | none | None | None |
| `open_mode` | (Output) This field indicates the current mode of the Autonomous Database. Possible values: OPEN_MODE_UNSPECIFIED READ_ONLY READ_WRITE | none | None | None |
| `operations_insights_state` | Possible values: OPERATIONS_INSIGHTS_STATE_UNSPECIFIED ENABLING ENABLED DISABLING NOT_ENABLED FAILED_ENABLING FAILED_DISABLING | false | None | None |
| `peer_db_ids` | (Output) The list of OCIDs of standby databases located in Autonomous Data Guard remote regions that are associated with the source database. | none | None | None |
| `permission_level` | (Output) The permission level of the Autonomous Database. Possible values: PERMISSION_LEVEL_UNSPECIFIED RESTRICTED UNRESTRICTED | none | None | None |
| `private_endpoint` | (Output) The private endpoint for the Autonomous Database. | none | None | None |
| `refreshable_mode` | (Output) The refresh mode of the cloned Autonomous Database. Possible values: REFRESHABLE_MODE_UNSPECIFIED AUTOMATIC MANUAL | none | None | None |
| `refreshable_state` | (Output) The refresh State of the clone. Possible values: REFRESHABLE_STATE_UNSPECIFIED REFRESHING NOT_REFRESHING | none | None | None |
| `role` | (Output) The Data Guard role of the Autonomous Database. Possible values: ROLE_UNSPECIFIED PRIMARY STANDBY DISABLED_STANDBY BACKUP_COPY SNAPSHOT_STANDBY | none | None | None |
| `scheduled_operation_details` | (Output) The list and details of the scheduled operations of the Autonomous Database. Structure is [documented below](#nested_properties_scheduled_operation_details). | none | None | None |
| `sql_web_developer_url` | (Output) The SQL Web Developer URL for the Autonomous Database. | none | None | None |
| `supported_clone_regions` | (Output) The list of available regions that can be used to create a clone for the Autonomous Database. | none | None | None |
| `used_data_storage_size_tbs` | (Output) The storage space used by Autonomous Database, in gigabytes. | none | None | None |
| `oci_url` | (Output) The Oracle Cloud Infrastructure link for the Autonomous Database. | none | None | None |
| `total_auto_backup_storage_size_gbs` | (Output) The storage space used by automatic backups of Autonomous Database, in gigabytes. | none | None | None |
| `next_long_term_backup_time` | (Output) The long term backup schedule of the Autonomous Database. | none | None | None |
| `maintenance_begin_time` | (Output) The date and time when maintenance will begin. | none | None | None |
| `maintenance_end_time` | (Output) The date and time when maintenance will end. | none | None | None |

### customer_contacts Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | The email address used by Oracle to send notifications regarding databases and infrastructure. The `apex_details` block contains: | true | None | None |
| `apex_version` | (Output) The Oracle APEX Application Development version. | none | None | None |
| `ords_version` | (Output) The Oracle REST Data Services (ORDS) version. The `connection_strings` block contains: | none | None | None |
| `all_connection_strings` | (Output) A list of all connection strings that can be used to connect to the Autonomous Database. Structure is [documented below](#nested_properties_connection_strings_all_connection_strings). | none | None | None |
| `dedicated` | (Output) The database service provides the least level of resources to each SQL statement, but supports the most number of concurrent SQL statements. | none | None | None |
| `high` | (Output) The database service provides the highest level of resources to each SQL statement. | none | None | None |
| `low` | (Output) The database service provides the least level of resources to each SQL statement. | none | None | None |
| `medium` | (Output) The database service provides a lower level of resources to each SQL statement. The `profiles` block contains: | none | None | None |
| `profiles` | (Output) A list of connection string profiles to allow clients to group, filter, and select values based on the structured metadata. Structure is [documented below](#nested_properties_connection_strings_profiles). The `all_connection_strings` block contains: | none | None | None |
| `consumer_group` | (Output) The current consumer group being used by the connection. Possible values: CONSUMER_GROUP_UNSPECIFIED HIGH MEDIUM LOW TP TPURGENT | none | None | None |
| `display_name` | (Output) The display name for the database connection. | none | None | None |
| `host_format` | (Output) The host name format being currently used in connection string. Possible values: HOST_FORMAT_UNSPECIFIED FQDN IP | none | None | None |
| `is_regional` | (Output) This field indicates if the connection string is regional and is only applicable for cross-region Data Guard. | none | None | None |
| `protocol` | (Output) The protocol being used by the connection. Possible values: PROTOCOL_UNSPECIFIED TCP TCPS | none | None | None |
| `session_mode` | (Output) The current session mode of the connection. Possible values: SESSION_MODE_UNSPECIFIED DIRECT INDIRECT | none | None | None |
| `syntax_format` | (Output) The syntax of the connection string. Possible values: SYNTAX_FORMAT_UNSPECIFIED LONG EZCONNECT EZCONNECTPLUS | none | None | None |
| `tls_authentication` | (Output) This field indicates the TLS authentication type of the connection. Possible values: TLS_AUTHENTICATION_UNSPECIFIED SERVER MUTUAL | none | None | None |
| `value` | (Output) The value of the connection string. The `connection_urls` block contains: | none | None | None |
| `apex_uri` | (Output) Oracle Application Express (APEX) URL. | none | None | None |
| `database_transforms_uri` | (Output) The URL of the Database Transforms for the Autonomous Database. | none | None | None |
| `graph_studio_uri` | (Output) The URL of the Graph Studio for the Autonomous Database. | none | None | None |
| `machine_learning_notebook_uri` | (Output) The URL of the Oracle Machine Learning (OML) Notebook for the Autonomous Database. | none | None | None |
| `machine_learning_user_management_uri` | (Output) The URL of Machine Learning user management the Autonomous Database. | none | None | None |
| `mongo_db_uri` | (Output) The URL of the MongoDB API for the Autonomous Database. | none | None | None |
| `ords_uri` | (Output) The Oracle REST Data Services (ORDS) URL of the Web Access for the Autonomous Database. | none | None | None |
| `sql_dev_web_uri` | (Output) The URL of the Oracle SQL Developer Web for the Autonomous Database. The `local_standby_db` block contains: | none | None | None |
| `lag_time_duration` | (Output) The amount of time, in seconds, that the data of the standby database lags in comparison to the data of the primary database. | none | None | None |
| `lifecycle_details` | (Output) The additional details about the current lifecycle state of the Autonomous Database. | none | None | None |
| `state` | (Output) Possible values: STATE_UNSPECIFIED PROVISIONING AVAILABLE STOPPING STOPPED STARTING TERMINATING TERMINATED UNAVAILABLE RESTORE_IN_PROGRESS RESTORE_FAILED BACKUP_IN_PROGRESS SCALE_IN_PROGRESS AVAILABLE_NEEDS_ATTENTION UPDATING MAINTENANCE_IN_PROGRESS RESTARTING RECREATING ROLE_CHANGE_IN_PROGRESS UPGRADING INACCESSIBLE STANDBY | none | None | None |
| `data_guard_role_changed_time` | (Output) The date and time the Autonomous Data Guard role was switched for the standby Autonomous Database. | none | None | None |
| `disaster_recovery_role_changed_time` | (Output) The date and time the Disaster Recovery role was switched for the standby Autonomous Database. The `scheduled_operation_details` block contains: | none | None | None |
| `day_of_week` | (Output) Possible values: DAY_OF_WEEK_UNSPECIFIED MONDAY TUESDAY WEDNESDAY THURSDAY FRIDAY SATURDAY SUNDAY | none | None | None |
| `start_time` | (Output) Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`. Structure is [documented below](#nested_properties_scheduled_operation_details_scheduled_operation_details_start_time). | none | None | None |
| `stop_time` | (Output) Represents a time of day. The date and time zone are either not significant or are specified elsewhere. An API may choose to allow leap seconds. Related types are google.type.Date and `google.protobuf.Timestamp`. Structure is [documented below](#nested_properties_scheduled_operation_details_scheduled_operation_details_stop_time). The `start_time` block contains: | none | None | None |
| `hours` | (Output) Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | none | None | None |
| `minutes` | (Output) Minutes of hour of day. Must be from 0 to 59. | none | None | None |
| `seconds` | (Output) Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | none | None | None |
| `nanos` | (Output) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | none | None | None |
