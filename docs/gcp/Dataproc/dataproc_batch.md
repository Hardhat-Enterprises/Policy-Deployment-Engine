## 🛡️ Policy Deployment Engine: `dataproc_batch`

This section provides a concise policy evaluation for the `dataproc_batch` resource in GCP.

Reference: [Terraform Registry – dataproc_batch](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_batch)

---

## 1. Argument Reference

### `labels`
- Description: (Optional) The labels to associate with this batch. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_config`
- Description: (Optional) Runtime configuration for the batch execution. Structure is [documented below](#nested_runtime_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment_config`
- Description: (Optional) Environment configuration for the batch execution. Structure is [documented below](#nested_environment_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pyspark_batch`
- Description: (Optional) PySpark batch config. Structure is [documented below](#nested_pyspark_batch).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_batch`
- Description: (Optional) Spark batch config. Structure is [documented below](#nested_spark_batch).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_r_batch`
- Description: (Optional) SparkR batch config. Structure is [documented below](#nested_spark_r_batch).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_sql_batch`
- Description: (Optional) Spark SQL batch config. Structure is [documented below](#nested_spark_sql_batch).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location in which the batch will be created in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `batch_id`
- Description: (Optional) The ID to use for the batch, which will become the final component of the batch's resource name. This value must be 4-63 characters. Valid characters are /[a-z][0-9]-/.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_runtime_config"></a>The `runtime_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of the batch runtime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_image`
- Description: (Optional) Optional custom container image for the job runtime environment. If not specified, a default container image will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A mapping of property names to values, which are used to configure workload execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_properties`
- Description: (Output) A mapping of property names to values, which are used to configure workload execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autotuning_config`
- Description: (Optional) Optional. Autotuning configuration of the workload. Structure is [documented below](#nested_runtime_config_autotuning_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cohort`
- Description: (Optional) Optional. Cohort identifier. Identifies families of the workloads having the same shape, e.g. daily ETL jobs. <a name="nested_runtime_config_autotuning_config"></a>The `autotuning_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scenarios`
- Description: (Optional) Optional. Scenarios for which tunings are applied. Each value may be one of: `SCALING`, `BROADCAST_HASH_JOIN`, `MEMORY`. <a name="nested_environment_config"></a>The `environment_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_config`
- Description: (Optional) Execution configuration for a workload. Structure is [documented below](#nested_environment_config_execution_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peripherals_config`
- Description: (Optional) Peripherals configuration that workload has access to. Structure is [documented below](#nested_environment_config_peripherals_config). <a name="nested_environment_config_execution_config"></a>The `execution_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Service account that used to execute workload.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tags`
- Description: (Optional) Tags used for network traffic control.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The Cloud KMS key to use for encryption.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Optional) The duration after which the workload will be terminated. When the workload exceeds this duration, it will be unconditionally terminated without waiting for ongoing work to finish. If ttl is not specified for a batch workload, the workload will be allowed to run until it exits naturally (or run forever without exiting). If ttl is not specified for an interactive session, it defaults to 24 hours. If ttl is not specified for a batch that uses 2.1+ runtime version, it defaults to 4 hours. Minimum value is 10 minutes; maximum value is 14 days. If both ttl and idleTtl are specified (for an interactive session), the conditions are treated as OR conditions: the workload will be terminated when it has been idle for idleTtl or when ttl has been exceeded, whichever occurs first.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `staging_bucket`
- Description: (Optional) A Cloud Storage bucket used to stage workload dependencies, config files, and store workload output and other ephemeral data, such as Spark history files. If you do not specify a staging bucket, Cloud Dataproc will determine a Cloud Storage location according to the region where your workload is running, and then create and manage project-level, per-location staging and temporary buckets. This field requires a Cloud Storage bucket name, not a gs://... URI to a Cloud Storage bucket.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_uri`
- Description: (Optional) Network configuration for workload execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork_uri`
- Description: (Optional) Subnetwork configuration for workload execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authentication_config`
- Description: (Optional) Authentication configuration for a workload is used to set the default identity for the workload execution. Structure is [documented below](#nested_environment_config_execution_config_authentication_config). <a name="nested_environment_config_execution_config_authentication_config"></a>The `authentication_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_workload_authentication_type`
- Description: (Optional) Authentication type for the user workload running in containers. Possible values are: `SERVICE_ACCOUNT`, `END_USER_CREDENTIALS`. <a name="nested_environment_config_peripherals_config"></a>The `peripherals_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metastore_service`
- Description: (Optional) Resource name of an existing Dataproc Metastore service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_history_server_config`
- Description: (Optional) The Spark History Server configuration for the workload. Structure is [documented below](#nested_environment_config_peripherals_config_spark_history_server_config). <a name="nested_environment_config_peripherals_config_spark_history_server_config"></a>The `spark_history_server_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataproc_cluster`
- Description: (Optional) Resource name of an existing Dataproc Cluster to act as a Spark History Server for the workload. <a name="nested_pyspark_batch"></a>The `pyspark_batch` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_python_file_uri`
- Description: (Optional) The HCFS URI of the main Python file to use as the Spark driver. Must be a .py file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `python_file_uris`
- Description: (Optional) HCFS file URIs of Python files to pass to the PySpark framework. Supported file types: .py, .egg, and .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to add to the classpath of the Spark driver and tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. <a name="nested_spark_batch"></a>The `spark_batch` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to add to the classpath of the Spark driver and tasks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_jar_file_uri`
- Description: (Optional) The HCFS URI of the jar file that contains the main class.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_class`
- Description: (Optional) The name of the driver main class. The jar file that contains the class must be in the classpath or specified in jarFileUris. <a name="nested_spark_r_batch"></a>The `spark_r_batch` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_r_file_uri`
- Description: (Optional) The HCFS URI of the main R file to use as the driver. Must be a .R or .r file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) The arguments to pass to the driver. Do not include arguments that can be set as batch properties, such as --conf, since a collision can occur that causes an incorrect batch submission.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_uris`
- Description: (Optional) HCFS URIs of files to be placed in the working directory of each executor.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archive_uris`
- Description: (Optional) HCFS URIs of archives to be extracted into the working directory of each executor. Supported file types: .jar, .tar, .tar.gz, .tgz, and .zip. <a name="nested_spark_sql_batch"></a>The `spark_sql_batch` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_file_uri`
- Description: (Optional) The HCFS URI of the script that contains Spark SQL queries to execute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jar_file_uris`
- Description: (Optional) HCFS URIs of jar files to be added to the Spark CLASSPATH.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_variables`
- Description: (Optional) Mapping of query variable names to values (equivalent to the Spark SQL command: SET name="value";).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
