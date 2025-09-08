## 🛡️ Policy Deployment Engine: `dataproc_batch`

This section provides a concise policy evaluation for the `dataproc_batch` resource in GCP.

Reference: [Terraform Registry – dataproc_batch](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_batch)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `labels` | The labels to associate with this batch. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `location` | The location in which the batch will be created in. | false | None | None |
| `batch_id` | The ID to use for the batch, which will become the final component of the batch's resource name. This value must be 4-63 characters. Valid characters are /[a-z][0-9]-/. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### runtime_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | Version of the batch runtime. | false | None | None |
| `container_image` | Optional custom container image for the job runtime environment. If not specified, a default container image will be used. | false | None | None |
| `properties` | A mapping of property names to values, which are used to configure workload execution. | false | None | None |
| `effective_properties` | (Output) A mapping of property names to values, which are used to configure workload execution. | none | None | None |
| `autotuning_config` | Optional. Autotuning configuration of the workload. Structure is [documented below](#nested_runtime_config_autotuning_config). | false | None | None |
| `cohort` | Optional. Cohort identifier. Identifies families of the workloads having the same shape, e.g. daily ETL jobs. | false | None | None |

### environment_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `execution_config` | Execution configuration for a workload. Structure is [documented below](#nested_environment_config_execution_config). | false | None | None |
| `peripherals_config` | Peripherals configuration that workload has access to. Structure is [documented below](#nested_environment_config_peripherals_config). | false | None | None |

### pyspark_batch Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `main_python_file_uri` | The HCFS URI of the main Python file to use as the Spark driver. Must be a .py file. | false | None | None |
| `args` | The arguments to pass to the driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission. | false | None | None |
| `python_file_uris` | HCFS file URIs of Python files to pass to the PySpark framework. Supported file types: .py, .egg, and .zip. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to add to the classpath of the Spark driver and tasks. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. | false | None | None |
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |

### spark_batch Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `args` | The arguments to pass to the driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to add to the classpath of the Spark driver and tasks. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. | false | None | None |
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |
| `main_jar_file_uri` | The HCFS URI of the jar file that contains the main class. | false | None | None |
| `main_class` | The name of the driver main class. The jar file that contains the class must be in the classpath or specified in jarFileUris. | false | None | None |

### spark_r_batch Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `main_r_file_uri` | The HCFS URI of the main R file to use as the driver. Must be a .R or .r file. | false | None | None |
| `args` | The arguments to pass to the driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission. | false | None | None |
| `file_uris` | HCFS URIs of files to be placed in the working directory of each executor. | false | None | None |
| `archive_uris` | HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. | false | None | None |

### spark_sql_batch Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_file_uri` | The HCFS URI of the script that contains Spark SQL queries to execute. | false | None | None |
| `jar_file_uris` | HCFS URIs of jar files to be added to the Spark CLASSPATH. | false | None | None |
| `query_variables` | Mapping of query variable names to values (equivalent to the Spark SQL command: SET name="value";). | false | None | None |

### autotuning_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scenarios` | Optional. Scenarios for which tunings are applied. Each value may be one of: `SCALING`, `BROADCAST_HASH_JOIN`, `MEMORY`. | false | None | None |

### execution_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account` | Service account that used to execute workload. | false | None | None |
| `network_tags` | Tags used for network traffic control. | false | None | None |
| `kms_key` | The Cloud KMS key to use for encryption. | false | None | None |
| `ttl` | The duration after which the workload will be terminated. When the workload exceeds this duration, it will be unconditionally terminated without waiting for ongoing work to finish. If ttl is not specified for a batch workload, the workload will be allowed to run until it exits naturally (or run forever without exiting). If ttl is not specified for an interactive session, it defaults to 24 hours. If ttl is not specified for a batch that uses 2.1+ runtime version, it defaults to 4 hours. Minimum value is 10 minutes; maximum value is 14 days. If both ttl and idleTtl are specified (for an interactive session), the conditions are treated as OR conditions: the workload will be terminated when it has been idle for idleTtl or when ttl has been exceeded, whichever occurs first. | false | None | None |
| `staging_bucket` | A Cloud Storage bucket used to stage workload dependencies, config files, and store workload output and other ephemeral data, such as Spark history files. If you do not specify a staging bucket, Cloud Dataproc will determine a Cloud Storage location according to the region where your workload is running, and then create and manage project-level, per-location staging and temporary buckets. This field requires a Cloud Storage bucket name, not a gs://... URI to a Cloud Storage bucket. | false | None | None |
| `network_uri` | Network configuration for workload execution. | false | None | None |
| `subnetwork_uri` | Subnetwork configuration for workload execution. | false | None | None |
| `authentication_config` | Authentication configuration for a workload is used to set the default identity for the workload execution. Structure is [documented below](#nested_environment_config_execution_config_authentication_config). | false | None | None |

### authentication_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `user_workload_authentication_type` | Authentication type for the user workload running in containers. Possible values are: `SERVICE_ACCOUNT`, `END_USER_CREDENTIALS`. | false | None | None |

### peripherals_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metastore_service` | Resource name of an existing Dataproc Metastore service. | false | None | None |
| `spark_history_server_config` | The Spark History Server configuration for the workload. Structure is [documented below](#nested_environment_config_peripherals_config_spark_history_server_config). | false | None | None |

### spark_history_server_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataproc_cluster` | Resource name of an existing Dataproc Cluster to act as a Spark History Server for the workload. | false | None | None |
