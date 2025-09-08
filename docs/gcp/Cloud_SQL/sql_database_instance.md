## 🛡️ Policy Deployment Engine: `sql_database_instance`

This section provides a concise policy evaluation for the `sql_database_instance` resource in GCP.

Reference: [Terraform Registry – sql_database_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `region` | the provider region will be used instead. - - - | none | None | None |
| `database_version` | SQL Server version to use. Supported values include `MYSQL_5_6`, `MYSQL_5_7`, `MYSQL_8_0`, `MYSQL_8_4`, `POSTGRES_9_6`,`POSTGRES_10`, `POSTGRES_11`, `POSTGRES_12`, `POSTGRES_13`, `POSTGRES_14`, `POSTGRES_15`, `POSTGRES_16`, `POSTGRES_17`, `SQLSERVER_2017_STANDARD`, `SQLSERVER_2017_ENTERPRISE`, `SQLSERVER_2017_EXPRESS`, `SQLSERVER_2017_WEB`. `SQLSERVER_2019_STANDARD`, `SQLSERVER_2019_ENTERPRISE`, `SQLSERVER_2019_EXPRESS`, `SQLSERVER_2019_WEB`. [Database Version Policies](https://cloud.google.com/sql/docs/db-versions) includes an up-to-date reference of supported versions. | none | None | None |
| `name` | blank, Terraform will randomly generate one when the instance is first created. This is done because after a name is used, it cannot be reused for up to [one week](https://cloud.google.com/sql/docs/delete-instance). | none | None | None |
| `maintenance_version` |  | none | None | None |
| `master_instance_name` | act as the master in the replication setup. Note, this requires the master to have `binary_log_enabled` set, as well as existing backups. | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `replica_configuration` | configuration is detailed below. | none | None | None |
| `replica_names` |  | none | None | None |
| `root_password` |  | none | None | None |
| `encryption_key_name` | The full path to the encryption key used for the CMEK disk encryption.  Setting up disk encryption currently requires manual steps outside of Terraform. The provided key must be in the same region as the SQL instance.  In order to use this feature, a special kind of service account must be created and granted permission on this key.  This step can currently only be done manually, please see [this step](https://cloud.google.com/sql/docs/mysql/configure-cmek#service-account). That service account needs the `Cloud KMS > Cloud KMS CryptoKey Encrypter/Decrypter` role on your key - please see [this step](https://cloud.google.com/sql/docs/mysql/configure-cmek#grantkey). | none | None | None |
| `deletion_protection` | When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the instance will fail. When the field is set to false, deleting the instance is allowed. ~> **NOTE:** This flag only protects instances from deletion within Terraform. To protect your instances from accidental deletion across all surfaces (API, gcloud, Cloud Console and Terraform), use the API flag `settings.deletion_protection_enabled`. | none | None | None |
| `restore_backup_context` | cause Terraform to trigger the database to restore from the backup run indicated. The configuration is detailed below. **NOTE:** Restoring from a backup is an imperative action and not recommended via Terraform. Adding or modifying this block during resource creation/update will trigger the restore action after the resource is created/updated. | none | None | None |
| `clone` | resource creation, Terraform will attempt to clone another instance as indicated in the context. The configuration is detailed below. | none | None | None |

### settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tier` | for more details and supported versions. Postgres supports only shared-core machine types, and custom machine types such as `db-custom-2-13312`. See the [Custom Machine Type Documentation](https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#create) to learn about specifying custom machine types. | none | None | None |
| `edition` |  | none | None | None |
| `user_labels` |  | none | None | None |
| `activation_policy` | active. Can be either `ALWAYS`, `NEVER` or `ON_DEMAND`. | none | None | None |
| `availability_type` | instance, high availability (`REGIONAL`) or single zone (`ZONAL`).' For all instances, ensure that `settings.backup_configuration.enabled` is set to `true`. For MySQL instances, ensure that `settings.backup_configuration.binary_log_enabled` is set to `true`. For Postgres and SQL Server instances, ensure that `settings.backup_configuration.point_in_time_recovery_enabled` is set to `true`. Defaults to `ZONAL`. | none | None | None |
| `collation` |  | none | None | None |
| `connector_enforcement` |  | none | None | None |
| `deletion_protection_enabled` |  | none | None | None |
| `enable_google_ml_integration` |  | none | None | None |
| `enable_dataplex_integration` |  | none | None | None |
| `disk_autoresize` |  | none | None | None |
| `disk_autoresize_limit` |  | none | None | None |
| `disk_size` |  | none | None | None |
| `disk_type` |  | none | None | None |
| `data_disk_provisioned_iops` |  | none | None | None |
| `data_disk_provisioned_throughput` |  | none | None | None |
| `pricing_plan` |  | none | None | None |
| `time_zone` |  | none | None | None |
| `retain_backups_on_delete` | The optional `settings.advanced_machine_features` subblock supports: | none | None | None |
| `threads_per_core` | The optional `settings.database_flags` sublist supports: | none | None | None |
| `name` |  | none | None | None |
| `value` |  | none | None | None |
| `domain` | Can only be used with SQL Server. The optional `settings.data_cache_config` subblock supports: | none | None | None |
| `data_cache_enabled` | The optional `settings.deny_maintenance_period` subblock supports: | none | None | None |
| `end_date` |  | none | None | None |
| `start_date` |  | none | None | None |
| `time` | The optional `settings.sql_server_audit_config` subblock supports: | none | None | None |
| `bucket` |  | none | None | None |
| `upload_interval` |  | none | None | None |
| `retention_interval` | The optional `settings.backup_configuration` subblock supports: | none | None | None |
| `binary_log_enabled` | Can only be used with MySQL. | none | None | None |
| `enabled` |  | none | None | None |
| `start_time` | configuration starts. | none | None | None |
| `point_in_time_recovery_enabled` |  | none | None | None |
| `location` |  | none | None | None |
| `transaction_log_retention_days` |  | none | None | None |
| `backup_retention_settings` | The optional `settings.backup_configuration.backup_retention_settings` subblock supports: | none | None | None |
| `retained_backups` | is 'COUNT', we will retain this many backups. | none | None | None |
| `retention_unit` | The optional `settings.ip_configuration` subblock supports: | none | None | None |
| `ipv4_enabled` | a public IPV4 address. At least `ipv4_enabled` must be enabled or a `private_network` must be configured. | none | None | None |
| `private_network` | instance is accessible for private IP. For example, projects/myProject/global/networks/default. Specifying a network enables private IP. At least `ipv4_enabled` must be enabled or a `private_network` must be configured. This setting can be updated, but it cannot be removed after it is set. | none | None | None |
| `ssl_mode` |  | none | None | None |
| `server_ca_mode` |  | none | None | None |
| `server_ca_pool` |  | none | None | None |
| `custom_subject_alternative_names` |  | none | None | None |
| `allocated_ip_range` | The optional `restore_backup_context` block supports: **NOTE:** Restoring from a backup is an imperative action and not recommended via Terraform. Adding or modifying this block during resource creation/update will trigger the restore action after the resource is created/updated. | none | None | None |
| `enable_private_path_for_google_cloud_services` | The optional `settings.ip_configuration.authorized_networks[]` sublist supports: | none | None | None |
| `expiration_time` | formatted date time string indicating when this whitelist expires. | none | None | None |
| `psc_enabled` |  | none | None | None |
| `allowed_consumer_projects` | * The optional `psc_config.psc_auto_connections` subblock - (Optional) A comma-separated list of networks or a comma-separated list of network-project pairs. Each project in this list is represented by a project number (numeric) or by a project ID (alphanumeric). This allows Private Service Connect connections to be created automatically for the specified networks. | none | None | None |
| `consumer_network` |  | none | None | None |
| `consumer_service_project_id` | The optional `settings.location_preference` subblock supports: | none | None | None |
| `follow_gae_application` | in. Must be in the same region as this instance. | none | None | None |
| `zone` | [zone](https://cloud.google.com/compute/docs/zones?hl=en). | none | None | None |
| `secondary_zone` | The optional `settings.maintenance_window` subblock for instances declares a one-hour [maintenance window](https://cloud.google.com/sql/docs/instance-settings?hl=en#maintenance-window-2ndgen) when an Instance can automatically restart to apply updates. The maintenance window is specified in UTC time. It supports: | none | None | None |
| `day` |  | none | None | None |
| `hour` |  | none | None | None |
| `update_track` | The optional `settings.insights_config` subblock for instances declares Query Insights([MySQL](https://cloud.google.com/sql/docs/mysql/using-query-insights), [PostgreSQL](https://cloud.google.com/sql/docs/postgres/using-query-insights)) configuration. It contains: | none | None | None |
| `query_insights_enabled` |  | none | None | None |
| `query_string_length` |  | none | None | None |
| `record_application_tags` |  | none | None | None |
| `record_client_address` |  | none | None | None |
| `query_plans_per_minute` | The optional `settings.password_validation_policy` subblock for instances declares [Password Validation Policy](https://cloud.google.com/sql/docs/postgres/built-in-authentication) configuration. It contains: | none | None | None |
| `min_length` |  | none | None | None |
| `complexity` |  | none | None | None |
| `reuse_interval` |  | none | None | None |
| `disallow_username_substring` |  | none | None | None |
| `password_change_interval` |  | none | None | None |
| `enable_password_policy` | The optional `replica_configuration` block must have `master_instance_name` set to work, cannot be updated and supports: ~> **Note:** `replica_configuration` field is not meant to be used if the master instance is a source representation instance. The configuration provided by this field can be set on the source representation instance directly. If this field is present when the master instance is a source representation instance, `dump_file_path` must be provided. | none | None | None |
| `cascadable_replica` | ~> **NOTE:** Only supported for SQL Server database. | none | None | None |
| `ca_certificate` | certificate. | none | None | None |
| `client_certificate` | certificate. | none | None | None |
| `client_key` | corresponding public key in encoded in the `client_certificate`. | none | None | None |
| `connect_retry_interval` | between connect retries. MySQL's default is 60 seconds. | none | None | None |
| `dump_file_path` | instances are created. Format is `gs://bucket/filename`. Note, if the master instance is a source representation instance this field must be present. | none | None | None |
| `failover_target` | If the field is set to true the replica will be designated as a failover replica. If the master instance fails, the replica instance will be promoted as the new master instance. ~> **NOTE:** Not supported for Postgres database. | none | None | None |
| `master_heartbeat_period` | heartbeats. | none | None | None |
| `password` |  | none | None | None |
| `ssl_cipher` |  | none | None | None |
| `username` |  | none | None | None |
| `verify_server_certificate` | value is checked during the SSL handshake. The optional `clone` block supports: | none | None | None |
| `source_instance_name` |  | none | None | None |
| `point_in_time` | A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | none | None | None |
| `preferred_zone` |  | none | None | None |
| `database_names` |  | none | None | None |
| `backup_run_id` |  | none | None | None |
| `instance_id` | this instance's ID will be used. | none | None | None |
| `project` | The optional, computed `replication_cluster` block represents a primary instance and disaster recovery replica pair. Applicable to MySQL and PostgreSQL. This field can be set only after both the primary and replica are created. This block supports: * `psa_write_endpoint`: Read-only field which if set, indicates this instance has a private service access (PSA) DNS endpoint that is pointing to the primary instance of the cluster. If this instance is the primary, then the DNS endpoint points to this instance. After a switchover or replica failover operation, this DNS endpoint points to the promoted instance. This is a read-only field, returned to the user as information. This field can exist even if a standalone instance doesn't have a DR replica yet or the DR replica is deleted. * `failover_dr_replica_name`: (Optional) If the instance is a primary instance, then this field identifies the disaster recovery (DR) replica. The standard format of this field is "your-project:your-instance". You can also set this field to "your-instance", but cloud SQL backend will convert it to the aforementioned standard format. * `dr_replica`: Read-only field that indicates whether the replica is a DR replica. The optional `settings.connection_pool_config` subblock supports: * `connection_pooling_enabled`: (Optional) True if the manager connection pooling configuration is enabled. The optional `settings.connection_pool_config.flags` sublist supports: | none | None | None |
