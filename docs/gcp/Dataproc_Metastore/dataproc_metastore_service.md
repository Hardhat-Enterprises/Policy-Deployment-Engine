## 🛡️ Policy Deployment Engine: `dataproc_metastore_service`

This section provides a concise policy evaluation for the `dataproc_metastore_service` resource in GCP.

Reference: [Terraform Registry – dataproc_metastore_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_metastore_service)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_id` | The ID of the metastore service. The id must contain only letters (a-z, A-Z), numbers (0-9), underscores (_), and hyphens (-). Cannot begin or end with underscore or hyphen. Must consist of between 3 and 63 characters. | true | None | None |
| `labels` | User-defined labels for the metastore service. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `network` | The relative resource name of the VPC network on which the instance can be accessed. It is specified in the following form: "projects/{projectNumber}/global/networks/{network_id}". | false | None | None |
| `port` | The TCP port at which the metastore service is reached. Default: 9083. | false | None | None |
| `tier` | The tier of the service. Possible values are: `DEVELOPER`, `ENTERPRISE`. | false | None | None |
| `deletion_protection` | Indicates if the dataproc metastore should be protected against accidental deletions. | false | None | None |
| `database_type` | The database type that the Metastore service stores its data. Default value is `MYSQL`. Possible values are: `MYSQL`, `SPANNER`. | false | None | None |
| `release_channel` | The release channel of the service. If unspecified, defaults to `STABLE`. Default value is `STABLE`. Possible values are: `CANARY`, `STABLE`. | false | None | None |
| `location` | The location where the metastore service should reside. The default value is `global`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### scaling_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_size` | Metastore instance sizes. Possible values are: `EXTRA_SMALL`, `SMALL`, `MEDIUM`, `LARGE`, `EXTRA_LARGE`. | false | None | None |
| `scaling_factor` | Scaling factor, in increments of 0.1 for values less than 1.0, and increments of 1.0 for values greater than 1.0. | false | None | None |
| `autoscaling_config` | Represents the autoscaling configuration of a metastore service. Structure is [documented below](#nested_scaling_config_autoscaling_config). | false | None | None |

### scheduled_backup Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Defines whether the scheduled backup is enabled. The default value is false. | false | None | None |
| `cron_schedule` | The scheduled interval in Cron format, see https://en.wikipedia.org/wiki/Cron The default is empty: scheduled backup is not enabled. Must be specified to enable scheduled backups. | false | None | None |
| `time_zone` | Specifies the time zone to be used when interpreting cronSchedule. Must be a time zone name from the time zone database (https://en.wikipedia.org/wiki/List_of_tz_database_time_zones), e.g. America/Los_Angeles or Africa/Abidjan. If left unspecified, the default is UTC. | false | None | None |
| `backup_location` | A Cloud Storage URI of a folder, in the format gs://<bucket_name>/<path_inside_bucket>. A sub-folder <backup_folder> containing backup files will be stored below it. | true | None | None |

### maintenance_window Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hour_of_day` | The hour of day (0-23) when the window starts. | true | None | None |
| `day_of_week` | The day of week, when the window starts. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | None | None |

### encryption_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key` | The fully qualified customer provided Cloud KMS key name to use for customer data encryption. Use the following format: `projects/([^/]+)/locations/([^/]+)/keyRings/([^/]+)/cryptoKeys/([^/]+)` | true | None | None |

### hive_metastore_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpoint_protocol` | The protocol to use for the metastore service endpoint. If unspecified, defaults to `THRIFT`. Default value is `THRIFT`. Possible values are: `THRIFT`, `GRPC`. | false | None | None |
| `version` | The Hive metastore schema version. | true | None | None |
| `config_overrides` | A mapping of Hive metastore configuration key-value pairs to apply to the Hive metastore (configured in hive-site.xml). The mappings override system defaults (some keys cannot be overridden) | false | None | None |
| `kerberos_config` | Information used to configure the Hive metastore service as a service principal in a Kerberos realm. Structure is [documented below](#nested_hive_metastore_config_kerberos_config). | false | None | None |
| `auxiliary_versions` | A mapping of Hive metastore version to the auxiliary version configuration. When specified, a secondary Hive metastore service is created along with the primary service. All auxiliary versions must be less than the service's primary version. The key is the auxiliary service name and it must match the regular expression a-z?. This means that the first character must be a lowercase letter, and all the following characters must be hyphens, lowercase letters, or digits, except the last character, which cannot be a hyphen. Structure is [documented below](#nested_hive_metastore_config_auxiliary_versions). | false | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `consumers` | The consumer-side network configuration for the Dataproc Metastore instance. Structure is [documented below](#nested_network_config_consumers). | true | None | None |
| `custom_routes_enabled` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Enables custom routes to be imported and exported for the Dataproc Metastore service's peered VPC network. | false | None | None |

### metadata_integration Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_catalog_config` | The integration config for the Data Catalog service. Structure is [documented below](#nested_metadata_integration_data_catalog_config). | true | None | None |

### telemetry_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `log_format` | The output format of the Dataproc Metastore service's logs. Default value is `JSON`. Possible values are: `LEGACY`, `JSON`. | false | None | None |

### autoscaling_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `autoscaling_enabled` | Defines whether autoscaling is enabled. The default value is false. | false | None | None |
| `autoscaling_factor` | (Output) Output only. The scaling factor of a service with autoscaling enabled. | none | None | None |
| `limit_config` | Represents the limit configuration of a metastore service. Structure is [documented below](#nested_scaling_config_autoscaling_config_limit_config). | false | None | None |

### limit_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_scaling_factor` | The minimum scaling factor that the service will autoscale to. The default value is 0.1. | false | None | None |
| `max_scaling_factor` | The maximum scaling factor that the service will autoscale to. The default value is 6.0. | false | None | None |

### kerberos_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `keytab` | A Kerberos keytab file that can be used to authenticate a service principal with a Kerberos Key Distribution Center (KDC). Structure is [documented below](#nested_hive_metastore_config_kerberos_config_keytab). | true | None | None |
| `principal` | A Kerberos principal that exists in the both the keytab the KDC to authenticate as. A typical principal is of the form "primary/instance@REALM", but there is no exact format. | true | None | None |
| `krb5_config_gcs_uri` | A Cloud Storage URI that specifies the path to a krb5.conf file. It is of the form gs://{bucket_name}/path/to/krb5.conf, although the file does not need to be named krb5.conf explicitly. | true | None | None |

### keytab Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_secret` | The relative resource name of a Secret Manager secret version, in the following form: "projects/{projectNumber}/secrets/{secret_id}/versions/{version_id}". | true | None | None |

### auxiliary_versions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` |  | none | None | None |
| `version` | The Hive metastore version of the auxiliary service. It must be less than the primary Hive metastore service's version. | true | None | None |
| `config_overrides` | A mapping of Hive metastore configuration key-value pairs to apply to the auxiliary Hive metastore (configured in hive-site.xml) in addition to the primary version's overrides. If keys are present in both the auxiliary version's overrides and the primary version's overrides, the value from the auxiliary version's overrides takes precedence. | false | None | None |

### consumers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpoint_uri` | (Output) The URI of the endpoint used to access the metastore service. | none | None | None |
| `subnetwork` | The subnetwork of the customer project from which an IP address is reserved and used as the Dataproc Metastore service's endpoint. It is accessible to hosts in the subnet and to all hosts in a subnet in the same region and same network. There must be at least one IP address available in the subnet's primary range. The subnet is specified in the following form: `projects/{projectNumber}/regions/{region_id}/subnetworks/{subnetwork_id} | true | None | None |

### data_catalog_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Defines whether the metastore metadata should be synced to Data Catalog. The default value is to disable syncing metastore metadata to Data Catalog. | true | None | None |
