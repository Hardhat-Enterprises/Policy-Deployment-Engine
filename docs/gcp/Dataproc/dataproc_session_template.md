## 🛡️ Policy Deployment Engine: `dataproc_session_template`

This section provides a concise policy evaluation for the `dataproc_session_template` resource in GCP.

Reference: [Terraform Registry – dataproc_session_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_session_template)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the session template in the following format: projects/{project}/locations/{location}/sessionTemplates/{template_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this session template. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_config`
- Description: (Optional) Runtime configuration for the session template. Structure is [documented below](#nested_runtime_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment_config`
- Description: (Optional) Environment configuration for the session execution. Structure is [documented below](#nested_environment_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jupyter_session`
- Description: (Optional) Jupyter configuration for an interactive session. Structure is [documented below](#nested_jupyter_session).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spark_connect_session`
- Description: (Optional) Spark connect configuration for an interactive session.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location in which the session template will be created in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_runtime_config"></a>The `runtime_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of the session runtime.
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
- Description: (Output) A mapping of property names to values, which are used to configure workload execution. <a name="nested_environment_config"></a>The `environment_config` block supports:
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

### `idle_ttl`
- Description: (Optional) The duration to keep the session alive while it's idling. Exceeding this threshold causes the session to terminate. Minimum value is 10 minutes; maximum value is 14 day. Defaults to 1 hour if not set. If both ttl and idleTtl are specified for an interactive session, the conditions are treated as OR conditions: the workload will be terminated when it has been idle for idleTtl or when ttl has been exceeded, whichever occurs first.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Optional) The duration after which the workload will be terminated. When the workload exceeds this duration, it will be unconditionally terminated without waiting for ongoing work to finish. If ttl is not specified for a session workload, the workload will be allowed to run until it exits naturally (or run forever without exiting). If ttl is not specified for an interactive session, it defaults to 24 hours. If ttl is not specified for a batch that uses 2.1+ runtime version, it defaults to 4 hours. Minimum value is 10 minutes; maximum value is 14 days. If both ttl and idleTtl are specified (for an interactive session), the conditions are treated as OR conditions: the workload will be terminated when it has been idle for idleTtl or when ttl has been exceeded, whichever occurs first.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `staging_bucket`
- Description: (Optional) A Cloud Storage bucket used to stage workload dependencies, config files, and store workload output and other ephemeral data, such as Spark history files. If you do not specify a staging bucket, Cloud Dataproc will determine a Cloud Storage location according to the region where your workload is running, and then create and manage project-level, per-location staging and temporary buckets. This field requires a Cloud Storage bucket name, not a gs://... URI to a Cloud Storage bucket.
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
- Description: (Optional) Resource name of an existing Dataproc Cluster to act as a Spark History Server for the workload. <a name="nested_jupyter_session"></a>The `jupyter_session` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kernel`
- Description: (Optional) Kernel to be used with Jupyter interactive session. Possible values are: `PYTHON`, `SCALA`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Display name, shown in the Jupyter kernelspec card.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
