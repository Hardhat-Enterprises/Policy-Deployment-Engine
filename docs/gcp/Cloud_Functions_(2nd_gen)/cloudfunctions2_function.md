## 🛡️ Policy Deployment Engine: `cloudfunctions2_function`

This section provides a concise policy evaluation for the `cloudfunctions2_function` resource in GCP.

Reference: [Terraform Registry – cloudfunctions2_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | A user-defined name of the function. Function names must be unique globally and match pattern `projects/*/locations/*/functions/*`. | true | None | None |
| `location` | The location of this cloud function. | true | None | None |
| `description` | User-provided description of a function. | false | None | None |
| `labels` | A set of key/value label pairs associated with this Cloud Function. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `kms_key_name` | Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt function resources. It must match the pattern projects/{project}/locations/{location}/keyRings/{key_ring}/cryptoKeys/{crypto_key}. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### build_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `build` | (Output) The Cloud Build name of the latest successful deployment of the function. | none | None | None |
| `runtime` | The runtime in which to run the function. Required when deploying a new function, optional when updating an existing function. | false | None | None |
| `entry_point` | The name of the function (as defined in source code) that will be executed. Defaults to the resource name suffix, if not specified. For backward compatibility, if function with given name is not found, then the system will try to use function named "function". For Node.js this is name of a function exported by the module specified in source_location. | false | None | None |
| `source` | The location of the function source code. Structure is [documented below](#nested_build_config_source). | false | None | None |
| `worker_pool` | Name of the Cloud Build Custom Worker Pool that should be used to build the function. | false | None | None |
| `environment_variables` | User-provided build-time environment variables for the function. | false | None | None |
| `docker_repository` | User managed repository created in Artifact Registry optionally with a customer managed encryption key. | false | None | None |
| `service_account` | The fully-qualified name of the service account to be used for building the container. | false | None | None |
| `automatic_update_policy` | Security patches are applied automatically to the runtime without requiring the function to be redeployed. | false | None | None |
| `on_deploy_update_policy` | Security patches are only applied when a function is redeployed. Structure is [documented below](#nested_build_config_on_deploy_update_policy). | false | None | None |

### service_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | Name of the service associated with a Function. | false | None | None |
| `timeout_seconds` | The function execution timeout. Execution is considered failed and can be terminated if the function is not completed at the end of the timeout period. Defaults to 60 seconds. | false | None | None |
| `available_memory` | The amount of memory available for a function. Defaults to 256M. Supported units are k, M, G, Mi, Gi. If no unit is supplied the value is interpreted as bytes. | false | None | None |
| `max_instance_request_concurrency` | Sets the maximum number of concurrent requests that each instance can receive. Defaults to 1. | false | None | None |
| `available_cpu` | The number of CPUs used in a single container instance. Default value is calculated from available memory. | false | None | None |
| `environment_variables` | Environment variables that shall be available during function execution. | false | None | None |
| `max_instance_count` | The limit on the maximum number of function instances that may coexist at a given time. | false | None | None |
| `min_instance_count` | The limit on the minimum number of function instances that may coexist at a given time. | false | None | None |
| `vpc_connector` | The Serverless VPC Access connector that this cloud function can connect to. | false | None | None |
| `vpc_connector_egress_settings` | Available egress settings. Possible values are: `VPC_CONNECTOR_EGRESS_SETTINGS_UNSPECIFIED`, `PRIVATE_RANGES_ONLY`, `ALL_TRAFFIC`. | false | None | None |
| `ingress_settings` | Available ingress settings. Defaults to "ALLOW_ALL" if unspecified. Default value is `ALLOW_ALL`. Possible values are: `ALLOW_ALL`, `ALLOW_INTERNAL_ONLY`, `ALLOW_INTERNAL_AND_GCLB`. | false | None | None |
| `uri` | (Output) URI of the Service deployed. | none | None | None |
| `gcf_uri` | (Output) URIs of the Service deployed | none | None | None |
| `service_account_email` | The email of the service account for this function. | false | None | None |
| `all_traffic_on_latest_revision` | Whether 100% of traffic is routed to the latest revision. Defaults to true. | false | None | None |
| `secret_environment_variables` | Secret environment variables configuration. Structure is [documented below](#nested_service_config_secret_environment_variables). | false | None | None |
| `secret_volumes` | Secret volumes configuration. Structure is [documented below](#nested_service_config_secret_volumes). | false | None | None |
| `binary_authorization_policy` | The binary authorization policy to be checked when deploying the Cloud Run service. | false | None | None |

### event_trigger Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `trigger` | (Output) Output only. The resource name of the Eventarc trigger. | none | None | None |
| `trigger_region` | The region that the trigger will be in. The trigger will only receive events originating in this region. It can be the same region as the function, a different region or multi-region, or the global region. If not provided, defaults to the same region as the function. | false | None | None |
| `event_type` | Required. The type of event to observe. | false | None | None |
| `event_filters` | Criteria used to filter events. Structure is [documented below](#nested_event_trigger_event_filters). | false | None | None |
| `pubsub_topic` | The name of a Pub/Sub topic in the same project that will be used as the transport topic for the event delivery. | false | None | None |
| `service_account_email` | Optional. The email of the trigger's service account. The service account must have permission to invoke Cloud Run services. If empty, defaults to the Compute Engine default service account: {project_number}-compute@developer.gserviceaccount.com. | false | None | None |
| `retry_policy` | Describes the retry policy in case of function's execution failure. Retried execution is charged as any other execution. Possible values are: `RETRY_POLICY_UNSPECIFIED`, `RETRY_POLICY_DO_NOT_RETRY`, `RETRY_POLICY_RETRY`. | false | None | None |

### source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `storage_source` | If provided, get the source from this location in Google Cloud Storage. Structure is [documented below](#nested_build_config_source_storage_source). | false | None | None |
| `repo_source` | If provided, get the source from this location in a Cloud Source Repository. Structure is [documented below](#nested_build_config_source_repo_source). | false | None | None |

### storage_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | Google Cloud Storage bucket containing the source | false | None | None |
| `object` | Google Cloud Storage object containing the source. | false | None | None |
| `generation` | Google Cloud Storage generation for the object. If the generation is omitted, the latest generation will be used. | false | None | None |

### repo_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed. | false | None | None |
| `repo_name` | Name of the Cloud Source Repository. | false | None | None |
| `branch_name` | Regex matching branches to build. | false | None | None |
| `tag_name` | Regex matching tags to build. | false | None | None |
| `commit_sha` | Regex matching tags to build. | false | None | None |
| `dir` | Directory, relative to the source root, in which to run the build. | false | None | None |
| `invert_regex` | Only trigger a build if the revision regex does NOT match the revision regex. | false | None | None |

### on_deploy_update_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `runtime_version` | (Output) The runtime version which was used during latest function deployment. | none | None | None |

### secret_environment_variables Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Name of the environment variable. | true | None | None |
| `project_id` | Project identifier (preferably project number but can also be the project ID) of the project that contains the secret. If not set, it will be populated with the function's project assuming that the secret exists in the same project as of the function. | true | None | None |
| `secret` | Name of the secret in secret manager (not the full resource name). | true | None | None |
| `version` | Version of the secret (version number or the string 'latest'). It is recommended to use a numeric version for secret environment variables as any updates to the secret value is not reflected until new instances start. | true | None | None |

### secret_volumes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mount_path` | The path within the container to mount the secret volume. For example, setting the mountPath as /etc/secrets would mount the secret value files under the /etc/secrets directory. This directory will also be completely shadowed and unavailable to mount any other secrets. Recommended mount path: /etc/secrets | true | None | None |
| `project_id` | Project identifier (preferably project number but can also be the project ID) of the project that contains the secret. If not set, it will be populated with the function's project assuming that the secret exists in the same project as of the function. | true | None | None |
| `secret` | Name of the secret in secret manager (not the full resource name). | true | None | None |
| `versions` | List of secret versions to mount for this secret. If empty, the latest version of the secret will be made available in a file named after the secret under the mount point.' Structure is [documented below](#nested_service_config_secret_volumes_secret_volumes_versions). | false | None | None |

### versions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | Version of the secret (version number or the string 'latest'). It is preferable to use latest version with secret volumes as secret value changes are reflected immediately. | true | None | None |
| `path` | Relative path of the file under the mount path where the secret value for this version will be fetched and made available. For example, setting the mountPath as '/etc/secrets' and path as secret_foo would mount the secret value file at /etc/secrets/secret_foo. | true | None | None |

### event_filters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `attribute` | 'Required. The name of a CloudEvents attribute. Currently, only a subset of attributes are supported for filtering. Use the `gcloud eventarc providers describe` command to learn more about events and their attributes. Do not filter for the 'type' attribute here, as this is already achieved by the resource's `event_type` attribute. | true | None | None |
| `value` | Required. The value for the attribute. If the operator field is set as `match-path-pattern`, this value can be a path pattern instead of an exact value. | true | None | None |
| `operator` | Optional. The operator used for matching the events with the value of the filter. If not specified, only events that have an exact key-value pair specified in the filter are matched. The only allowed value is `match-path-pattern`. [See documentation on path patterns here](https://cloud.google.com/eventarc/docs/path-patterns)' | false | None | None |
