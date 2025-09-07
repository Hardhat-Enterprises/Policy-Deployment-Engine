## 🛡️ Policy Deployment Engine: `dataproc_metastore_service`

This section provides a concise policy evaluation for the `dataproc_metastore_service` resource in GCP.

Reference: [Terraform Registry – dataproc_metastore_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_metastore_service)

---

## 1. Argument Reference

### `service_id`
- Description: (Required) The ID of the metastore service. The id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of between 3 and 63 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the metastore service. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form: "projects/{projectNumber}/global/networks/{network_id}".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The TCP port at which the metastore service is reached. Default: 9083.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tier`
- Description: (Optional) The tier of the service. Possible values are: `DEVELOPER`, `ENTERPRISE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scaling_config`
- Description: (Optional) Represents the scaling configuration of a metastore service. Structure is [documented below](#nested_scaling_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduled_backup`
- Description: (Optional) The configuration of scheduled backup for the metastore service. Structure is [documented below](#nested_scheduled_backup).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: (Optional) Indicates if the dataproc metastore should be protected against accidental deletions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_window`
- Description: (Optional) The one hour maintenance window of the metastore service. This specifies when the service can be restarted for maintenance purposes in UTC time. Maintenance window is not needed for services with the `SPANNER` database type. Structure is [documented below](#nested_maintenance_window).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_config`
- Description: (Optional) Information used to configure the Dataproc Metastore service to encrypt customer data at rest. Structure is [documented below](#nested_encryption_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hive_metastore_config`
- Description: (Optional) Configuration information specific to running Hive metastore software as the metastore service. Structure is [documented below](#nested_hive_metastore_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Optional) The configuration specifying the network settings for the Dataproc Metastore service. Structure is [documented below](#nested_network_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_type`
- Description: (Optional) The database type that the Metastore service stores its data. Default value is `MYSQL`. Possible values are: `MYSQL`, `SPANNER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `release_channel`
- Description: (Optional) The release channel of the service. If unspecified, defaults to `STABLE`. Default value is `STABLE`. Possible values are: `CANARY`, `STABLE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_integration`
- Description: (Optional) The setting that defines how metastore metadata should be integrated with external services and systems. Structure is [documented below](#nested_metadata_integration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `telemetry_config`
- Description: (Optional) The configuration specifying telemetry settings for the Dataproc Metastore service. If unspecified defaults to JSON. Structure is [documented below](#nested_telemetry_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location where the metastore service should reside. The default value is `global`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_scaling_config"></a>The `scaling_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_size`
- Description: (Optional) Metastore instance sizes. Possible values are: `EXTRA_SMALL`, `SMALL`, `MEDIUM`, `LARGE`, `EXTRA_LARGE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scaling_factor`
- Description: (Optional) Scaling factor, in increments of 0.1 for values less than 1.0, and increments of 1.0 for values greater than 1.0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_config`
- Description: (Optional) Represents the autoscaling configuration of a metastore service. Structure is [documented below](#nested_scaling_config_autoscaling_config). <a name="nested_scaling_config_autoscaling_config"></a>The `autoscaling_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_enabled`
- Description: (Optional) Defines whether autoscaling is enabled. The default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_factor`
- Description: (Output) Output only. The scaling factor of a service with autoscaling enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limit_config`
- Description: (Optional) Represents the limit configuration of a metastore service. Structure is [documented below](#nested_scaling_config_autoscaling_config_limit_config). <a name="nested_scaling_config_autoscaling_config_limit_config"></a>The `limit_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_scaling_factor`
- Description: (Optional) The minimum scaling factor that the service will autoscale to. The default value is 0.1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_scaling_factor`
- Description: (Optional) The maximum scaling factor that the service will autoscale to. The default value is 6.0. <a name="nested_scheduled_backup"></a>The `scheduled_backup` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Defines whether the scheduled backup is enabled. The default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cron_schedule`
- Description: (Optional) The scheduled interval in Cron format, see https://en.wikipedia.org/wiki/Cron The default is empty: scheduled backup is not enabled. Must be specified to enable scheduled backups.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Optional) Specifies the time zone to be used when interpreting cronSchedule. Must be a time zone name from the time zone database (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones), e.g. America/Los_Angeles or Africa/Abidjan. If left unspecified, the default is UTC.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_location`
- Description: (Required) A Cloud Storage URI of a folder, in the format gs://<bucket_name>/<path_inside_bucket>. A sub-folder <backup_folder> containing backup files will be stored below it. <a name="nested_maintenance_window"></a>The `maintenance_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hour_of_day`
- Description: (Required) The hour of day (0-23) when the window starts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day_of_week`
- Description: (Required) The day of week, when the window starts. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. <a name="nested_encryption_config"></a>The `encryption_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Required) The fully qualified customer provided Cloud KMS key name to use for customer data encryption. Use the following format: `projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+)` <a name="nested_hive_metastore_config"></a>The `hive_metastore_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_protocol`
- Description: (Optional) The protocol to use for the metastore service endpoint. If unspecified, defaults to `THRIFT`. Default value is `THRIFT`. Possible values are: `THRIFT`, `GRPC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) The Hive metastore schema version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_overrides`
- Description: (Optional) A mapping of Hive metastore configuration key-value pairs to apply to the Hive metastore (configured in hive-site.xml). The mappings override system defaults (some keys cannot be overridden)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kerberos_config`
- Description: (Optional) Information used to configure the Hive metastore service as a service principal in a Kerberos realm. Structure is [documented below](#nested_hive_metastore_config_kerberos_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auxiliary_versions`
- Description: (Optional) A mapping of Hive metastore version to the auxiliary version configuration. When specified, a secondary Hive metastore service is created along with the primary service. All auxiliary versions must be less than the service's primary version. The key is the auxiliary service name and it must match the regular expression a-z?. This means that the first character must be a lowercase letter, and all the following characters must be hyphens, lowercase letters, or digits, except the last character, which cannot be a hyphen. Structure is [documented below](#nested_hive_metastore_config_auxiliary_versions). <a name="nested_hive_metastore_config_kerberos_config"></a>The `kerberos_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keytab`
- Description: (Required) A Kerberos keytab file that can be used to authenticate a service principal with a Kerberos Key Distribution Center (KDC). Structure is [documented below](#nested_hive_metastore_config_kerberos_config_keytab).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `principal`
- Description: (Required) A Kerberos principal that exists in the both the keytab the KDC to authenticate as. A typical principal is of the form "primary/instance@REALM", but there is no exact format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `krb5_config_gcs_uri`
- Description: (Required) A Cloud Storage URI that specifies the path to a krb5.conf file. It is of the form gs://{bucket_name}/path/to/krb5.conf, although the file does not need to be named krb5.conf explicitly. <a name="nested_hive_metastore_config_kerberos_config_keytab"></a>The `keytab` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_secret`
- Description: (Required) The relative resource name of a Secret Manager secret version, in the following form: "projects/{projectNumber}/secrets/{secret_id}/versions/{version_id}". <a name="nested_hive_metastore_config_auxiliary_versions"></a>The `auxiliary_versions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) The Hive metastore version of the auxiliary service. It must be less than the primary Hive metastore service's version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_overrides`
- Description: (Optional) A mapping of Hive metastore configuration key-value pairs to apply to the auxiliary Hive metastore (configured in hive-site.xml) in addition to the primary version's overrides. If keys are present in both the auxiliary version's overrides and the primary version's overrides, the value from the auxiliary version's overrides takes precedence. <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consumers`
- Description: (Required) The consumer-side network configuration for the Dataproc Metastore instance. Structure is [documented below](#nested_network_config_consumers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_routes_enabled`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Enables custom routes to be imported and exported for the Dataproc Metastore service's peered VPC network. <a name="nested_network_config_consumers"></a>The `consumers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_uri`
- Description: (Output) The URI of the endpoint used to access the metastore service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Required) The subnetwork of the customer project from which an IP address is reserved and used as the Dataproc Metastore service's endpoint. It is accessible to hosts in the subnet and to all hosts in a subnet in the same region and same network. There must be at least one IP address available in the subnet's primary range. The subnet is specified in the following form: `projects/{projectNumber}/regions/{region_id}/subnetworks/{subnetwork_id} <a name="nested_metadata_integration"></a>The `metadata_integration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_catalog_config`
- Description: (Required) The integration config for the Data Catalog service. Structure is [documented below](#nested_metadata_integration_data_catalog_config). <a name="nested_metadata_integration_data_catalog_config"></a>The `data_catalog_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Defines whether the metastore metadata should be synced to Data Catalog. The default value is to disable syncing metastore metadata to Data Catalog. <a name="nested_telemetry_config"></a>The `telemetry_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_format`
- Description: (Optional) The output format of the Dataproc Metastore service's logs. Default value is `JSON`. Possible values are: `LEGACY`, `JSON`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
