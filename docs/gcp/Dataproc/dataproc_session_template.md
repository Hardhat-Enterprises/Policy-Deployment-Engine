## 🛡️ Policy Deployment Engine: `dataproc_session_template`

This section provides a concise policy evaluation for the `dataproc_session_template` resource in GCP.

Reference: [Terraform Registry – dataproc_session_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_session_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the session template in the following format: projects/{project}/locations/{location}/sessionTemplates/{template_id} | true | None | None |
| `labels` | The labels to associate with this session template. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `spark_connect_session` | Spark connect configuration for an interactive session. | false | None | None |
| `location` | The location in which the session template will be created in. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### runtime_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | Version of the session runtime. | false | None | None |
| `container_image` | Optional custom container image for the job runtime environment. If not specified, a default container image will be used. | false | None | None |
| `properties` | A mapping of property names to values, which are used to configure workload execution. | false | None | None |
| `effective_properties` | (Output) A mapping of property names to values, which are used to configure workload execution. | none | None | None |

### environment_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `execution_config` | Execution configuration for a workload. Structure is [documented below](#nested_environment_config_execution_config). | false | None | None |
| `peripherals_config` | Peripherals configuration that workload has access to. Structure is [documented below](#nested_environment_config_peripherals_config). | false | None | None |

### jupyter_session Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kernel` | Kernel to be used with Jupyter interactive session. Possible values are: `PYTHON`, `SCALA`. | false | None | None |
| `display_name` | Display name, shown in the Jupyter kernelspec card. | false | None | None |

### execution_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account` | Service account that used to execute workload. | false | None | None |
| `network_tags` | Tags used for network traffic control. | false | None | None |
| `kms_key` | The Cloud KMS key to use for encryption. | false | None | None |
| `idle_ttl` | The duration to keep the session alive while it's idling. Exceeding this threshold causes the session to terminate. Minimum value is 10 minutes; maximum value is 14 day. Defaults to 1 hour if not set. If both ttl and idleTtl are specified for an interactive session, the conditions are treated as OR conditions: the workload will be terminated when it has been idle for idleTtl or when ttl has been exceeded, whichever occurs first. | false | None | None |
| `ttl` | The duration after which the workload will be terminated. When the workload exceeds this duration, it will be unconditionally terminated without waiting for ongoing work to finish. If ttl is not specified for a session workload, the workload will be allowed to run until it exits naturally (or run forever without exiting). If ttl is not specified for an interactive session, it defaults to 24 hours. If ttl is not specified for a batch that uses 2.1+ runtime version, it defaults to 4 hours. Minimum value is 10 minutes; maximum value is 14 days. If both ttl and idleTtl are specified (for an interactive session), the conditions are treated as OR conditions: the workload will be terminated when it has been idle for idleTtl or when ttl has been exceeded, whichever occurs first. | false | None | None |
| `staging_bucket` | A Cloud Storage bucket used to stage workload dependencies, config files, and store workload output and other ephemeral data, such as Spark history files. If you do not specify a staging bucket, Cloud Dataproc will determine a Cloud Storage location according to the region where your workload is running, and then create and manage project-level, per-location staging and temporary buckets. This field requires a Cloud Storage bucket name, not a gs://... URI to a Cloud Storage bucket. | false | None | None |
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
