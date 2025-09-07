## 🛡️ Policy Deployment Engine: `sql_database_instance`

This section provides a concise policy evaluation for the `sql_database_instance` resource in GCP.

Reference: [Terraform Registry – sql_database_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance)

---

## 1. Argument Reference

### `region`
- Description: the provider region will be used instead. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `settings`
- Description: configuration is detailed below. Required if `clone` is not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_version`
- Description: SQL Server version to use. Supported values include `MYSQL_5_6`, `MYSQL_5_7`, `MYSQL_8_0`, `MYSQL_8_4`, `POSTGRES_9_6`,`POSTGRES_10`, `POSTGRES_11`, `POSTGRES_12`, `POSTGRES_13`, `POSTGRES_14`, `POSTGRES_15`, `POSTGRES_16`, `POSTGRES_17`, `SQLSERVER_2017_STANDARD`, `SQLSERVER_2017_ENTERPRISE`, `SQLSERVER_2017_EXPRESS`, `SQLSERVER_2017_WEB`. `SQLSERVER_2019_STANDARD`, `SQLSERVER_2019_ENTERPRISE`, `SQLSERVER_2019_EXPRESS`, `SQLSERVER_2019_WEB`. [Database Version Policies](https://cloud.google.com/sql/docs/db-versions) includes an up-to-date reference of supported versions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: blank, Terraform will randomly generate one when the instance is first created. This is done because after a name is used, it cannot be reused for up to [one week](https://cloud.google.com/sql/docs/delete-instance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_version`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `master_instance_name`
- Description: act as the master in the replication setup. Note, this requires the master to have `binary_log_enabled` set, as well as existing backups.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_configuration`
- Description: configuration is detailed below.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_names`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_password`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key_name`
- Description: The full path to the encryption key used for the CMEK disk encryption.  Setting up disk encryption currently requires manual steps outside of Terraform. The provided key must be in the same region as the SQL instance.  In order to use this feature, a special kind of service account must be created and granted permission on this key.  This step can currently only be done manually, please see [this step](https://cloud.google.com/sql/docs/mysql/configure-cmek#service-account). That service account needs the `Cloud KMS > Cloud KMS CryptoKey Encrypter/Decrypter` role on your key - please see [this step](https://cloud.google.com/sql/docs/mysql/configure-cmek#grantkey).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the instance will fail. When the field is set to false, deleting the instance is allowed. ~> **NOTE:** This flag only protects instances from deletion within Terraform. To protect your instances from accidental deletion across all surfaces (API, gcloud, Cloud Console and Terraform), use the API flag `settings.deletion_protection_enabled`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restore_backup_context`
- Description: cause Terraform to trigger the database to restore from the backup run indicated. The configuration is detailed below. **NOTE:** Restoring from a backup is an imperative action and not recommended via Terraform. Adding or modifying this block during resource creation/update will trigger the restore action after the resource is created/updated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `clone`
- Description: resource creation, Terraform will attempt to clone another instance as indicated in the context. The configuration is detailed below.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `settings` Block

### `tier`
- Description: for more details and supported versions. Postgres supports only shared-core machine types, and custom machine types such as `db-custom-2-13312`. See the [Custom Machine Type Documentation](https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#create) to learn about specifying custom machine types.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edition`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_labels`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `activation_policy`
- Description: active. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `availability_type`
- Description: instance, high availability (`REGIONAL`) or single zone (`ZONAL`).' For all instances, ensure that `settings.backup_configuration.enabled` is set to `true`. For MySQL instances, ensure that `settings.backup_configuration.binary_log_enabled` is set to `true`. For Postgres and SQL Server instances, ensure that `settings.backup_configuration.point_in_time_recovery_enabled` is set to `true`. Defaults to `ZONAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collation`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connector_enforcement`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection_enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_google_ml_integration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_dataplex_integration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_autoresize`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_autoresize_limit`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disk_provisioned_iops`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disk_provisioned_throughput`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pricing_plan`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retain_backups_on_delete`
- Description: The optional `settings.advanced_machine_features` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threads_per_core`
- Description: The optional `settings.database_flags` sublist supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: The optional `settings.active_directory_config` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: Can only be used with SQL Server. The optional `settings.data_cache_config` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_cache_enabled`
- Description: The optional `settings.deny_maintenance_period` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_date`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_date`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time`
- Description: The optional `settings.sql_server_audit_config` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upload_interval`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_interval`
- Description: The optional `settings.backup_configuration` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_log_enabled`
- Description: Can only be used with MySQL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: configuration starts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `point_in_time_recovery_enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transaction_log_retention_days`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_retention_settings`
- Description: The optional `settings.backup_configuration.backup_retention_settings` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retained_backups`
- Description: is 'COUNT', we will retain this many backups.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_unit`
- Description: The optional `settings.ip_configuration` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv4_enabled`
- Description: a public IPV4 address. At least `ipv4_enabled` must be enabled or a `private_network` must be configured.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_network`
- Description: instance is accessible for private IP. For example, projects/myProject/global/networks/default. Specifying a network enables private IP. At least `ipv4_enabled` must be enabled or a `private_network` must be configured. This setting can be updated, but it cannot be removed after it is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_mode`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_ca_mode`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_ca_pool`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_subject_alternative_names`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocated_ip_range`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_private_path_for_google_cloud_services`
- Description: The optional `settings.ip_configuration.authorized_networks[]` sublist supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration_time`
- Description: formatted date time string indicating when this whitelist expires.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: access this instance. Must be set even if other two attributes are not for the whitelist to become active. The optional `settings.ip_configuration.psc_config` sublist supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_consumer_projects`
- Description: * The optional `psc_config.psc_auto_connections` subblock - (Optional) A comma-separated list of networks or a comma-separated list of network-project pairs. Each project in this list is represented by a project number (numeric) or by a project ID (alphanumeric). This allows Private Service Connect connections to be created automatically for the specified networks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_network`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumer_service_project_id`
- Description: The optional `settings.location_preference` subblock supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `follow_gae_application`
- Description: in. Must be in the same region as this instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: [zone](https://cloud.google.com/compute/docs/zones?hl=en).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_zone`
- Description: The optional `settings.maintenance_window` subblock for instances declares a one-hour [maintenance window](https://cloud.google.com/sql/docs/instance-settings?hl=en#maintenance-window-2ndgen) when an Instance can automatically restart to apply updates. The maintenance window is specified in UTC time. It supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hour`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_track`
- Description: The optional `settings.insights_config` subblock for instances declares Query Insights([MySQL](https://cloud.google.com/sql/docs/mysql/using-query-insights), [PostgreSQL](https://cloud.google.com/sql/docs/postgres/using-query-insights)) configuration. It contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_insights_enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_string_length`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `record_application_tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `record_client_address`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_plans_per_minute`
- Description: The optional `settings.password_validation_policy` subblock for instances declares [Password Validation Policy](https://cloud.google.com/sql/docs/postgres/built-in-authentication) configuration. It contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_length`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `complexity`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reuse_interval`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disallow_username_substring`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_change_interval`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_password_policy`
- Description: The optional `replica_configuration` block must have `master_instance_name` set to work, cannot be updated and supports: ~> **Note:** `replica_configuration` field is not meant to be used if the master instance is a source representation instance. The configuration provided by this field can be set on the source representation instance directly. If this field is present when the master instance is a source representation instance, `dump_file_path` must be provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cascadable_replica`
- Description: ~> **NOTE:** Only supported for SQL Server database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_certificate`
- Description: certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate`
- Description: certificate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_key`
- Description: corresponding public key in encoded in the `client_certificate`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connect_retry_interval`
- Description: between connect retries. MySQL's default is 60 seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dump_file_path`
- Description: instances are created. Format is `gs://bucket/filename`. Note, if the master instance is a source representation instance this field must be present.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failover_target`
- Description: If the field is set to true the replica will be designated as a failover replica. If the master instance fails, the replica instance will be promoted as the new master instance. ~> **NOTE:** Not supported for Postgres database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `master_heartbeat_period`
- Description: heartbeats.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_cipher`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `verify_server_certificate`
- Description: value is checked during the SSL handshake. The optional `clone` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_instance_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `point_in_time`
- Description: A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preferred_zone`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_names`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocated_ip_range`
- Description: The optional `restore_backup_context` block supports: **NOTE:** Restoring from a backup is an imperative action and not recommended via Terraform. Adding or modifying this block during resource creation/update will trigger the restore action after the resource is created/updated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_run_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: this instance's ID will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: The optional, computed `replication_cluster` block represents a primary instance and disaster recovery replica pair. Applicable to MySQL and PostgreSQL. This field can be set only after both the primary and replica are created. This block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
