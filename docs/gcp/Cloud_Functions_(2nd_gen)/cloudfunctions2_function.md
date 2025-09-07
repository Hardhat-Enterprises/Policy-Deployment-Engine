## 🛡️ Policy Deployment Engine: `cloudfunctions2_function`

This section provides a concise policy evaluation for the `cloudfunctions2_function` resource in GCP.

Reference: [Terraform Registry – cloudfunctions2_function](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions2_function)

---

## 1. Argument Reference

### `name`
- Description: (Required) A user-defined name of the function. Function names must be unique globally and match pattern `projects/*/locations/*/functions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of this cloud function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description of a function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `build_config`
- Description: (Optional) Describes the Build step of the function that builds a container from the given source. Structure is [documented below](#nested_build_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_config`
- Description: (Optional) Describes the Service being deployed. Structure is [documented below](#nested_service_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_trigger`
- Description: (Optional) An Eventarc trigger managed by Google Cloud Functions that fires events in response to a condition in another service. Structure is [documented below](#nested_event_trigger).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A set of key/value label pairs associated with this Cloud Function. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) Resource name of a KMS crypto key (managed by the user) used to encrypt/decrypt function resources. It must match the pattern projects/{project}/locations/{location}/keyRings/{key_ring}/cryptoKeys/{crypto_key}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_build_config"></a>The `build_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `build`
- Description: (Output) The Cloud Build name of the latest successful deployment of the function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime`
- Description: (Optional) The runtime in which to run the function. Required when deploying a new function, optional when updating an existing function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entry_point`
- Description: (Optional) The name of the function (as defined in source code) that will be executed. Defaults to the resource name suffix, if not specified. For backward compatibility, if function with given name is not found, then the system will try to use function named "function". For Node.js this is name of a function exported by the module specified in source_location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Optional) The location of the function source code. Structure is [documented below](#nested_build_config_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `worker_pool`
- Description: (Optional) Name of the Cloud Build Custom Worker Pool that should be used to build the function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment_variables`
- Description: (Optional) User-provided build-time environment variables for the function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `docker_repository`
- Description: (Optional) User managed repository created in Artifact Registry optionally with a customer managed encryption key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The fully-qualified name of the service account to be used for building the container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automatic_update_policy`
- Description: (Optional) Security patches are applied automatically to the runtime without requiring the function to be redeployed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_deploy_update_policy`
- Description: (Optional) Security patches are only applied when a function is redeployed. Structure is [documented below](#nested_build_config_on_deploy_update_policy). <a name="nested_build_config_source"></a>The `source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_source`
- Description: (Optional) If provided, get the source from this location in Google Cloud Storage. Structure is [documented below](#nested_build_config_source_storage_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_source`
- Description: (Optional) If provided, get the source from this location in a Cloud Source Repository. Structure is [documented below](#nested_build_config_source_repo_source). <a name="nested_build_config_source_storage_source"></a>The `storage_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Optional) Google Cloud Storage bucket containing the source
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: (Optional) Google Cloud Storage object containing the source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generation`
- Description: (Optional) Google Cloud Storage generation for the object. If the generation is omitted, the latest generation will be used. <a name="nested_build_config_source_repo_source"></a>The `repo_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) ID of the project that owns the Cloud Source Repository. If omitted, the project ID requesting the build is assumed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo_name`
- Description: (Optional) Name of the Cloud Source Repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `branch_name`
- Description: (Optional) Regex matching branches to build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_name`
- Description: (Optional) Regex matching tags to build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commit_sha`
- Description: (Optional) Regex matching tags to build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dir`
- Description: (Optional) Directory, relative to the source root, in which to run the build.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_regex`
- Description: (Optional) Only trigger a build if the revision regex does NOT match the revision regex. <a name="nested_build_config_on_deploy_update_policy"></a>The `on_deploy_update_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_version`
- Description: (Output) The runtime version which was used during latest function deployment. <a name="nested_service_config"></a>The `service_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) Name of the service associated with a Function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout_seconds`
- Description: (Optional) The function execution timeout. Execution is considered failed and can be terminated if the function is not completed at the end of the timeout period. Defaults to 60 seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `available_memory`
- Description: (Optional) The amount of memory available for a function. Defaults to 256M. Supported units are k, M, G, Mi, Gi. If no unit is supplied the value is interpreted as bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_instance_request_concurrency`
- Description: (Optional) Sets the maximum number of concurrent requests that each instance can receive. Defaults to 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `available_cpu`
- Description: (Optional) The number of CPUs used in a single container instance. Default value is calculated from available memory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment_variables`
- Description: (Optional) Environment variables that shall be available during function execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_instance_count`
- Description: (Optional) The limit on the maximum number of function instances that may coexist at a given time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_instance_count`
- Description: (Optional) The limit on the minimum number of function instances that may coexist at a given time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_connector`
- Description: (Optional) The Serverless VPC Access connector that this cloud function can connect to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_connector_egress_settings`
- Description: (Optional) Available egress settings. Possible values are: `VPC_CONNECTOR_EGRESS_SETTINGS_UNSPECIFIED`, `PRIVATE_RANGES_ONLY`, `ALL_TRAFFIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress_settings`
- Description: (Optional) Available ingress settings. Defaults to "ALLOW_ALL" if unspecified. Default value is `ALLOW_ALL`. Possible values are: `ALLOW_ALL`, `ALLOW_INTERNAL_ONLY`, `ALLOW_INTERNAL_AND_GCLB`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Output) URI of the Service deployed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcf_uri`
- Description: (Output) URIs of the Service deployed
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) The email of the service account for this function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_traffic_on_latest_revision`
- Description: (Optional) Whether 100% of traffic is routed to the latest revision. Defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_environment_variables`
- Description: (Optional) Secret environment variables configuration. Structure is [documented below](#nested_service_config_secret_environment_variables).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_volumes`
- Description: (Optional) Secret volumes configuration. Structure is [documented below](#nested_service_config_secret_volumes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_authorization_policy`
- Description: (Optional) The binary authorization policy to be checked when deploying the Cloud Run service. <a name="nested_service_config_secret_environment_variables"></a>The `secret_environment_variables` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Name of the environment variable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) Project identifier (preferably project number but can also be the project ID) of the project that contains the secret. If not set, it will be populated with the function's project assuming that the secret exists in the same project as of the function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Required) Name of the secret in secret manager (not the full resource name).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) Version of the secret (version number or the string 'latest'). It is recommended to use a numeric version for secret environment variables as any updates to the secret value is not reflected until new instances start. <a name="nested_service_config_secret_volumes"></a>The `secret_volumes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mount_path`
- Description: (Required) The path within the container to mount the secret volume. For example, setting the mountPath as /etc/secrets would mount the secret value files under the /etc/secrets directory. This directory will also be completely shadowed and unavailable to mount any other secrets. Recommended mount path: /etc/secrets
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) Project identifier (preferably project number but can also be the project ID) of the project that contains the secret. If not set, it will be populated with the function's project assuming that the secret exists in the same project as of the function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Required) Name of the secret in secret manager (not the full resource name).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `versions`
- Description: (Optional) List of secret versions to mount for this secret. If empty, the latest version of the secret will be made available in a file named after the secret under the mount point.' Structure is [documented below](#nested_service_config_secret_volumes_secret_volumes_versions). <a name="nested_service_config_secret_volumes_secret_volumes_versions"></a>The `versions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) Version of the secret (version number or the string 'latest'). It is preferable to use latest version with secret volumes as secret value changes are reflected immediately.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) Relative path of the file under the mount path where the secret value for this version will be fetched and made available. For example, setting the mountPath as '/etc/secrets' and path as secret_foo would mount the secret value file at /etc/secrets/secret_foo. <a name="nested_event_trigger"></a>The `event_trigger` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger`
- Description: (Output) Output only. The resource name of the Eventarc trigger.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_region`
- Description: (Optional) The region that the trigger will be in. The trigger will only receive events originating in this region. It can be the same region as the function, a different region or multi-region, or the global region. If not provided, defaults to the same region as the function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_type`
- Description: (Optional) Required. The type of event to observe.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_filters`
- Description: (Optional) Criteria used to filter events. Structure is [documented below](#nested_event_trigger_event_filters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_topic`
- Description: (Optional) The name of a Pub/Sub topic in the same project that will be used as the transport topic for the event delivery.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) Optional. The email of the trigger's service account. The service account must have permission to invoke Cloud Run services. If empty, defaults to the Compute Engine default service account: {project_number}-compute@developer.gserviceaccount.com.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_policy`
- Description: (Optional) Describes the retry policy in case of function's execution failure. Retried execution is charged as any other execution. Possible values are: `RETRY_POLICY_UNSPECIFIED`, `RETRY_POLICY_DO_NOT_RETRY`, `RETRY_POLICY_RETRY`. <a name="nested_event_trigger_event_filters"></a>The `event_filters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attribute`
- Description: (Required) 'Required. The name of a CloudEvents attribute. Currently, only a subset of attributes are supported for filtering. Use the `gcloud eventarc providers describe` command to learn more about events and their attributes. Do not filter for the 'type' attribute here, as this is already achieved by the resource's `event_type` attribute.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Required. The value for the attribute. If the operator field is set as `match-path-pattern`, this value can be a path pattern instead of an exact value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operator`
- Description: (Optional) Optional. The operator used for matching the events with the value of the filter. If not specified, only events that have an exact key-value pair specified in the filter are matched. The only allowed value is `match-path-pattern`. [See documentation on path patterns here](https://cloud.google.com/eventarc/docs/path-patterns)'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
