## 🛡️ Policy Deployment Engine: `cloudfunctions2_function`

This section provides a concise policy evaluation for the `cloudfunctions2_function` resource in GCP.

Reference: [Terraform Registry – cloudfunctions2_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | A user-defined name of the function. Function names must be unique globally and match pattern `projects/*/locations/*/functions/*`. | true | false | The function name only identifies the resource and does not impact security. | None | None |
| `location` | The location of this cloud function. | true | true | Choosing the correct region is important for compliance and data residency. An incorrect or non-compliant region can violate organizational security policies or regulatory requirements. | australia-southeast1 |   |
| `description` | User-provided description of a function. | false | false | None | None | None |
| `build_config` | Describes the Build step of the function that builds a container from the given source. Structure is [documented below](#nested_build_config). | false | false | None | None | None |
| `service_config` | Describes the Service being deployed. Structure is [documented below](#nested_service_config). | false | false | None | None | None |
| `event_trigger` | An Eventarc trigger managed by Google Cloud Functions that fires events in response to a condition in another service. Structure is [documented below](#nested_event_trigger). | false | false | None | None | None |
| `labels` | A set of key/value label pairs associated with this Cloud Function. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `kms_key_name` | Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt function resources. It must match the pattern projects/{project}/locations/{location}/keyRings/{key_ring}/cryptoKeys/{crypto_key}. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `source` |  | false | false | None | None | None |
| `storage_source` |  | false | false | None | None | None |
| `repo_source` |  | false | false | None | None | None |
| `on_deploy_update_policy` |  | false | false | None | None | None |
| `secret_environment_variables` |  | false | false | None | None | None |
| `secret_volumes` |  | false | false | None | None | None |
| `versions` |  | false | false | None | None | None |
| `event_filters` |  | false | false | None | None | None |

### build_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `build` | (Output) The Cloud Build name of the latest successful deployment of the function. | false | false | None | None | None |
| `runtime` | The runtime in which to run the function. Required when deploying a new function, optional when updating an existing function. | false | false | None | None | None |
| `entry_point` | The name of the function (as defined in source code) that will be executed. Defaults to the resource name suffix, if not specified. For backward compatibility, if function with given name is not found, then the system will try to use function named "function". For Node.js this is name of a function exported by the module specified in source_location. | false | false | None | None | None |
| `source` | The location of the function source code. Structure is [documented below](#nested_build_config_source). | false | false | None | None | None |
| `worker_pool` | Name of the Cloud Build Custom Worker Pool that should be used to build the function. | false | false | None | None | None |
| `environment_variables` | User-provided build-time environment variables for the function. | false | true | Environment variables can contain secrets or configuration values. They must not expose sensitive information in plain text. | BUILD_CONFIG_TEST | API_KEY |
| `docker_repository` | User managed repository created in Artifact Registry optionally with a customer managed encryption key. | false | false | None | None | None |
| `service_account` | The fully-qualified name of the service account to be used for building the container. | false | false | None | None | None |
| `automatic_update_policy` | Security patches are applied automatically to the runtime without requiring the function to be redeployed. | false | false | None | None | None |
| `on_deploy_update_policy` | Security patches are only applied when a function is redeployed. Structure is [documented below](#nested_build_config_on_deploy_update_policy). | false | false | None | None | None |

### service_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | Name of the service associated with a Function. | false | false | None | None | None |
| `timeout_seconds` | The function execution timeout. Execution is considered failed and can be terminated if the function is not completed at the end of the timeout period. Defaults to 60 seconds. | false | true | Setting an appropriate timeout helps prevent resource exhaustion or denial-of-service scenarios. | 120 | 600 |
| `available_memory` | The amount of memory available for a function. Defaults to 256M. Supported units are k, M, G, Mi, Gi. If no unit is supplied the value is interpreted as bytes. | false | false | None | None | None |
| `max_instance_request_concurrency` | Sets the maximum number of concurrent requests that each instance can receive. Defaults to 1. | false | false | None | None | None |
| `available_cpu` | The number of CPUs used in a single container instance. Default value is calculated from available memory. | false | false | None | None | None |
| `environment_variables` | Environment variables that shall be available during function execution. | false | false | None | None | None |
| `max_instance_count` | The limit on the maximum number of function instances that may coexist at a given time. | false | false | None | None | None |
| `min_instance_count` | The limit on the minimum number of function instances that may coexist at a given time. | false | false | None | None | None |
| `vpc_connector` | The Serverless VPC Access connector that this cloud function can connect to. | false | true | Configuring a VPC connector allows the function to securely access internal resources without exposing them to the public internet. | projects/my-project/locations/us-central1/connectors/my-vpc-connector |   |
| `vpc_connector_egress_settings` | Available egress settings. Possible values are: `VPC_CONNECTOR_EGRESS_SETTINGS_UNSPECIFIED`, `PRIVATE_RANGES_ONLY`, `ALL_TRAFFIC`. | false | false | None | None | None |
| `ingress_settings` | Available ingress settings. Defaults to "ALLOW_ALL" if unspecified. Default value is `ALLOW_ALL`. Possible values are: `ALLOW_ALL`, `ALLOW_INTERNAL_ONLY`, `ALLOW_INTERNAL_AND_GCLB`. | false | true | Restricting ingress reduces exposure to unauthorized external access. | ALLOW_INTERNAL_ONLY | ALLOW_ALL |
| `uri` | (Output) URI of the Service deployed. | false | false | None | None | None |
| `gcf_uri` | (Output) URIs of the Service deployed | false | false | None | None | None |
| `service_account_email` | The email of the service account for this function. | false | false | None | None | None |
| `all_traffic_on_latest_revision` | Whether 100% of traffic is routed to the latest revision. Defaults to true. | false | false | None | None | None |
| `secret_environment_variables` | Secret environment variables configuration. Structure is [documented below](#nested_service_config_secret_environment_variables). | false | false | None | None | None |
| `secret_volumes` | Secret volumes configuration. Structure is [documented below](#nested_service_config_secret_volumes). | false | false | None | None | None |
| `binary_authorization_policy` | The binary authorization policy to be checked when deploying the Cloud Run service. | false | false | None | None | None |

### event_trigger Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `trigger` | (Output) Output only. The resource name of the Eventarc trigger. | false | false | None | None | None |
| `trigger_region` | The region that the trigger will be in. The trigger will only receive events originating in this region. It can be the same region as the function, a different region or multi-region, or the global region. If not provided, defaults to the same region as the function. | false | false | None | None | None |
| `event_type` | Required. The type of event to observe. | false | false | None | None | None |
| `event_filters` | Criteria used to filter events. Structure is [documented below](#nested_event_trigger_event_filters). | false | false | None | None | None |
| `pubsub_topic` | The name of a Pub/Sub topic in the same project that will be used as the transport topic for the event delivery. | false | false | None | None | None |
| `service_account_email` | Optional. The email of the trigger's service account. The service account must have permission to invoke Cloud Run services. If empty, defaults to the Compute Engine default service account: {project_number}-compute@developer.gserviceaccount.com. | false | false | None | None | None |
| `retry_policy` | Describes the retry policy in case of function's execution failure. Retried execution is charged as any other execution. Possible values are: `RETRY_POLICY_UNSPECIFIED`, `RETRY_POLICY_DO_NOT_RETRY`, `RETRY_POLICY_RETRY`. | false | false | None | None | None |

### source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `storage_source` | If provided, get the source from this location in Google Cloud Storage. Structure is [documented below](#nested_build_config_source_storage_source). | false | false | None | None | None |
| `repo_source` | If provided, get the source from this location in a Cloud Source Repository. Structure is [documented below](#nested_build_config_source_repo_source). | false | false | None | None | None |

### storage_source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | Google Cloud Storage bucket containing the source | false | false | None | None | None |
| `object` | Google Cloud Storage object containing the source. | false | false | None | None | None |
| `generation` | Google Cloud Storage generation for the object. If the generation is omitted, the latest generation will be used. | false | false | None | None | None |

### repo_source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed. | false | false | None | None | None |
| `repo_name` | Name of the Cloud Source Repository. | false | false | None | None | None |
| `branch_name` | Regex matching branches to build. | false | false | None | None | None |
| `tag_name` | Regex matching tags to build. | false | false | None | None | None |
| `commit_sha` | Regex matching tags to build. | false | false | None | None | None |
| `dir` | Directory, relative to the source root, in which to run the build. | false | false | None | None | None |
| `invert_regex` | Only trigger a build if the revision regex does NOT match the revision regex. | false | false | None | None | None |

### on_deploy_update_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `runtime_version` | (Output) The runtime version which was used during latest function deployment. | false | false | None | None | None |

### secret_environment_variables Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Name of the environment variable. | true | false | None | None | None |
| `project_id` | Project identifier (preferably project number but can also be the project ID) of the project that contains the secret. If not set, it will be populated with the function's project assuming that the secret exists in the same project as of the function. | true | false | None | None | None |
| `secret` | Name of the secret in secret manager (not the full resource name). | true | false | None | None | None |
| `version` | Version of the secret (version number or the string 'latest'). It is recommended to use a numeric version for secret environment variables as any updates to the secret value is not reflected until new instances start. | true | false | None | None | None |

### secret_volumes Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mount_path` | The path within the container to mount the secret volume. For example, setting the mountPath as /etc/secrets would mount the secret value files under the /etc/secrets directory. This directory will also be completely shadowed and unavailable to mount any other secrets. Recommended mount path: /etc/secrets | true | false | None | None | None |
| `project_id` | Project identifier (preferably project number but can also be the project ID) of the project that contains the secret. If not set, it will be populated with the function's project assuming that the secret exists in the same project as of the function. | true | false | None | None | None |
| `secret` | Name of the secret in secret manager (not the full resource name). | true | false | None | None | None |
| `versions` | List of secret versions to mount for this secret. If empty, the latest version of the secret will be made available in a file named after the secret under the mount point.' Structure is [documented below](#nested_service_config_secret_volumes_secret_volumes_versions). | false | false | None | None | None |

### versions Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `version` | Version of the secret (version number or the string 'latest'). It is preferable to use latest version with secret volumes as secret value changes are reflected immediately. | true | false | None | None | None |
| `path` | Relative path of the file under the mount path where the secret value for this version will be fetched and made available. For example, setting the mountPath as '/etc/secrets' and path as secret_foo would mount the secret value file at /etc/secrets/secret_foo. | true | false | None | None | None |

### event_filters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `attribute` | 'Required. The name of a CloudEvents attribute. Currently, only a subset of attributes are supported for filtering. Use the `gcloud eventarc providers describe` command to learn more about events and their attributes. Do not filter for the 'type' attribute here, as this is already achieved by the resource's `event_type` attribute. | true | false | None | None | None |
| `value` | Required. The value for the attribute. If the operator field is set as `match-path-pattern`, this value can be a path pattern instead of an exact value. | true | false | None | None | None |
| `operator` | Optional. The operator used for matching the events with the value of the filter. If not specified, only events that have an exact key-value pair specified in the filter are matched. The only allowed value is `match-path-pattern`. [See documentation on path patterns here](https://cloud.google.com/eventarc/docs/path-patterns)' | false | false | None | None | None |
