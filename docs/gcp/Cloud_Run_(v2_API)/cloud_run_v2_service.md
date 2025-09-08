## 🛡️ Policy Deployment Engine: `cloud_run_v2_service`

This section provides a concise policy evaluation for the `cloud_run_v2_service` resource in GCP.

Reference: [Terraform Registry – cloud_run_v2_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the Service. | true | None | None |
| `location` | The location of the cloud run service | true | None | None |
| `description` | User-provided description of the Service. This field currently has a 512-character limit. | false | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with  `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 Service. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected in new resources. All system annotations in v1 now have a corresponding field in v2 Service. This field follows Kubernetes annotations' namespacing, limits, and rules. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `client` | Arbitrary identifier for the API client. | false | None | None |
| `client_version` | Arbitrary version identifier for the API client. | false | None | None |
| `ingress` | Provides the ingress settings for this Service. On output, returns the currently observed ingress settings, or INGRESS_TRAFFIC_UNSPECIFIED if no revision is active. Possible values are: `INGRESS_TRAFFIC_ALL`, `INGRESS_TRAFFIC_INTERNAL_ONLY`, `INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER`. | false | None | None |
| `launch_stage` | The launch stage as defined by [Google Cloud Platform Launch Stages](https://cloud.google.com/products#product-launch-stages). Cloud Run supports ALPHA, BETA, and GA. If no value is specified, GA is assumed. Set the launch stage to a preview stage on input to allow use of preview features in that stage. On read (or output), describes whether the resource uses preview features. For example, if ALPHA is provided as input, but only BETA and GA-level features are used, this field will be BETA on output. Possible values are: `UNIMPLEMENTED`, `PRELAUNCH`, `EARLY_ACCESS`, `ALPHA`, `BETA`, `GA`, `DEPRECATED`. | false | None | None |
| `custom_audiences` | One or more custom audiences that you want this service to support. Specify each custom audience as the full URL in a string. The custom audiences are encoded in the token and used to authenticate requests. For more information, see https://cloud.google.com/run/docs/configuring/custom-audiences. | false | None | None |
| `default_uri_disabled` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Disables public resolution of the default URI of this service. | false | None | None |
| `invoker_iam_disabled` | Disables IAM permission check for run.routes.invoke for callers of this service. For more information, visit https://cloud.google.com/run/docs/securing/managing-access#invoker_check. | false | None | None |
| `iap_enabled` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Used to enable/disable IAP for the service. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` | When a`terraform destroy` or `terraform apply` would delete the service, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the service will fail. When the field is set to false, deleting the service is allowed. | none | None | None |

### template Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `revision` | The unique name for the revision. If this field is omitted, it will be automatically generated based on the Service name. | false | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 RevisionTemplate. | false | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system annotations in v1 now have a corresponding field in v2 RevisionTemplate. This field follows Kubernetes annotations' namespacing, limits, and rules. | false | None | None |
| `scaling` | Scaling settings for this Revision. Structure is [documented below](#nested_template_scaling). | false | None | None |
| `vpc_access` | VPC Access configuration to use for this Task. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_vpc_access). | false | None | None |
| `timeout` | Max allowed time for an instance to respond to a request. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |
| `service_account` | Email address of the IAM service account associated with the revision of the service. The service account represents the identity of the running revision, and determines what permissions the revision has. If not provided, the revision will use the project's default service account. | false | None | None |
| `containers` | Holds the containers that define the unit of execution for this Service. Structure is [documented below](#nested_template_containers). | false | None | None |
| `volumes` | A list of Volumes to make available to containers. Structure is [documented below](#nested_template_volumes). | false | None | None |
| `execution_environment` | The sandbox environment to host this Revision. Possible values are: `EXECUTION_ENVIRONMENT_GEN1`, `EXECUTION_ENVIRONMENT_GEN2`. | false | None | None |
| `encryption_key` | A reference to a customer managed encryption key (CMEK) to use to encrypt this container image. For more information, go to https://cloud.google.com/run/docs/securing/using-cmek | false | None | None |
| `max_instance_request_concurrency` | Sets the maximum number of requests that each serving instance can receive. If not specified or 0, defaults to 80 when requested CPU >= 1 and defaults to 1 when requested CPU < 1. | false | None | None |
| `session_affinity` | Enables session affinity. For more information, go to https://cloud.google.com/run/docs/configuring/session-affinity | false | None | None |
| `service_mesh` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Enables Cloud Service Mesh for this Revision. Structure is [documented below](#nested_template_service_mesh). | false | None | None |
| `node_selector` | Node Selector describes the hardware requirements of the resources. Structure is [documented below](#nested_template_node_selector). | false | None | None |
| `gpu_zonal_redundancy_disabled` | True if GPU zonal redundancy is disabled on this revision. | false | None | None |

### binary_authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `breakglass_justification` | If present, indicates to use Breakglass using this justification. If useDefault is False, then it must be empty. For more information on breakglass, see https://cloud.google.com/binary-authorization/docs/using-breakglass | false | None | None |
| `use_default` | If True, indicates to use the default project's binary authorization policy. If False, binary authorization will be disabled. | false | None | None |
| `policy` | The path to a binary authorization policy. Format: projects/{project}/platforms/cloudRun/{policy-name} | false | None | None |

### scaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_instance_count` | Minimum number of instances for the service, to be divided among all revisions receiving traffic. | false | None | None |
| `max_instance_count` | Maximum number of serving instances that this resource should have. Must not be less than minimum instance count. If absent, Cloud Run will calculate a default value based on the project's available container instances quota in the region and specified instance size. | false | None | None |
| `scaling_mode` | The [scaling mode](https://cloud.google.com/run/docs/reference/rest/v2/projects.locations.services#scalingmode) for the service. Possible values are: `AUTOMATIC`, `MANUAL`. | false | None | None |
| `manual_instance_count` | Total instance count for the service in manual scaling mode. This number of instances is divided among all revisions with specified traffic based on the percent of traffic they are receiving. | false | None | None |

### traffic Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The allocation type for this traffic target. Possible values are: `TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST`, `TRAFFIC_TARGET_ALLOCATION_TYPE_REVISION`. | false | None | None |
| `revision` | Revision to which to send this portion of traffic, if traffic allocation is by revision. | false | None | None |
| `percent` | Specifies percent of the traffic to this Revision. This defaults to zero if unspecified. | false | None | None |
| `tag` | Indicates a string to be part of the URI to exclusively reference this target. | false | None | None |

### build_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | (Output) The Cloud Build name of the latest successful deployment of the function. | none | None | None |
| `source_location` | The Cloud Storage bucket URI where the function source code is located. | false | None | None |
| `function_target` | The name of the function (as defined in source code) that will be executed. Defaults to the resource name suffix, if not specified. For backward compatibility, if function with given name is not found, then the system will try to use function named "function". | false | None | None |
| `image_uri` | Artifact Registry URI to store the built image. | false | None | None |
| `base_image` | The base image used to build the function. | false | None | None |
| `enable_automatic_updates` | Sets whether the function will receive automatic base image updates. | false | None | None |
| `worker_pool` | Name of the Cloud Build Custom Worker Pool that should be used to build the Cloud Run function. The format of this field is `projects/{project}/locations/{region}/workerPools/{workerPool}` where {project} and {region} are the project id and region respectively where the worker pool is defined and {workerPool} is the short name of the worker pool. | false | None | None |
| `environment_variables` | User-provided build-time environment variables for the function. | false | None | None |
| `service_account` | Service account to be used for building the container. The format of this field is `projects/{projectId}/serviceAccounts/{serviceAccountEmail}`. | false | None | None |

### vpc_access Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `connector` | VPC Access connector name. Format: projects/{project}/locations/{location}/connectors/{connector}, where {project} can be project id or number. | false | None | None |
| `egress` | Traffic VPC egress settings. Possible values are: `ALL_TRAFFIC`, `PRIVATE_RANGES_ONLY`. | false | None | None |
| `network_interfaces` | Direct VPC egress settings. Currently only single network interface is supported. Structure is [documented below](#nested_template_vpc_access_network_interfaces). | false | None | None |

### network_interfaces Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The VPC network that the Cloud Run resource will be able to send traffic to. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If network is not specified, it will be looked up from the subnetwork. | false | None | None |
| `subnetwork` | The VPC subnetwork that the Cloud Run resource will get IPs from. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If subnetwork is not specified, the subnetwork with the same name with the network will be used. | false | None | None |
| `tags` | Network tags applied to this Cloud Run service. | false | None | None |

### containers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the container specified as a DNS_LABEL. | false | None | None |
| `image` | URL of the Container image in Google Container Registry or Google Artifact Registry. More info: https://kubernetes.io/docs/concepts/containers/images | true | None | None |
| `command` | Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell | false | None | None |
| `args` | Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references are not supported in Cloud Run. | false | None | None |
| `env` | List of environment variables to set in the container. Structure is [documented below](#nested_template_containers_containers_env). | false | None | None |
| `resources` | Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is [documented below](#nested_template_containers_containers_resources). | false | None | None |
| `ports` | List of ports to expose from the container. Only a single port can be specified. The specified ports must be listening on all interfaces (0.0.0.0) within the container to be accessible. If omitted, a port number will be chosen and passed to the container through the PORT environment variable for the container to listen on Structure is [documented below](#nested_template_containers_containers_ports). | false | None | None |
| `volume_mounts` | Volume to mount into the container's filesystem. Structure is [documented below](#nested_template_containers_containers_volume_mounts). | false | None | None |
| `working_dir` | Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. | false | None | None |
| `liveness_probe` | Periodic probe of container liveness. Container will be restarted if the probe fails. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes Structure is [documented below](#nested_template_containers_containers_liveness_probe). | false | None | None |
| `startup_probe` | Startup probe of application within the container. All other probes are disabled if a startup probe is provided, until it succeeds. Container will not be added to service endpoints if the probe fails. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes Structure is [documented below](#nested_template_containers_containers_startup_probe). | false | None | None |
| `depends_on` | Containers which should be started before this container. If specified the container will wait to start until all containers with the listed names are healthy. | false | None | None |
| `base_image_uri` | Base image for this container. If set, it indicates that the service is enrolled into automatic base image update. | false | None | None |
| `build_info` | (Output) The build info of the container image. Structure is [documented below](#nested_template_containers_containers_build_info). | none | None | None |

### env Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the environment variable. Must be a C_IDENTIFIER, and may not exceed 32768 characters. | true | None | None |
| `value` | Literal value of the environment variable. Defaults to "" and the maximum allowed length is 32768 characters. Variable references are not supported in Cloud Run. | false | None | None |
| `value_source` | Source for the environment variable's value. Structure is [documented below](#nested_template_containers_containers_env_env_value_source). | false | None | None |

### value_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_key_ref` | Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_containers_containers_env_env_value_source_secret_key_ref). | false | None | None |

### secret_key_ref Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret` | The name of the secret in Cloud Secret Manager. Format: {secretName} if the secret is in the same project. projects/{project}/secrets/{secretName} if the secret is in a different project. | true | None | None |
| `version` | The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version. | false | None | None |

### resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `limits` | Only memory, CPU, and nvidia.com/gpu are supported. Use key `cpu` for CPU limit, `memory` for memory limit, `nvidia.com/gpu` for gpu limit. Note: The only supported values for CPU are '1', '2', '4', and '8'. Setting 4 CPU requires at least 2Gi of memory. The values of the map is string form of the 'quantity' k8s type: https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/apimachinery/pkg/api/resource/quantity.go | false | None | None |
| `cpu_idle` | Determines whether CPU is only allocated during requests. True by default if the parent `resources` field is not set. However, if `resources` is set, this field must be explicitly set to true to preserve the default behavior. | false | None | None |
| `startup_cpu_boost` | Determines whether CPU should be boosted on startup of a new container instance above the requested CPU threshold, this can help reduce cold-start latency. | false | None | None |

### ports Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | If specified, used to specify which protocol to use. Allowed values are "http1" and "h2c". | false | None | None |
| `container_port` | Port number the container listens on. This must be a valid TCP port number, 0 < containerPort < 65536. | false | None | None |

### volume_mounts Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | This must match the Name of a Volume. | true | None | None |
| `mount_path` | Path within the container at which the volume should be mounted. Must not contain ':'. For Cloud SQL volumes, it can be left empty, or must otherwise be /cloudsql. All instances defined in the Volume will be available as /cloudsql/[instance]. For more information on Cloud SQL volumes, visit https://cloud.google.com/sql/docs/mysql/connect-run | true | None | None |

### liveness_probe Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `initial_delay_seconds` | Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes | false | None | None |
| `timeout_seconds` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than periodSeconds. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes | false | None | None |
| `period_seconds` | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. Must be greater or equal than timeoutSeconds | false | None | None |
| `failure_threshold` | Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1. | false | None | None |
| `http_get` | HTTPGet specifies the http request to perform. Structure is [documented below](#nested_template_containers_containers_liveness_probe_http_get). | false | None | None |
| `grpc` | GRPC specifies an action involving a GRPC port. Structure is [documented below](#nested_template_containers_containers_liveness_probe_grpc). | false | None | None |
| `tcp_socket` | TCPSocketAction describes an action based on opening a socket Structure is [documented below](#nested_template_containers_containers_liveness_probe_tcp_socket). | false | None | None |

### http_get Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | Path to access on the HTTP server. Defaults to '/'. | false | None | None |
| `port` | Port number to access on the container. Must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | None | None |
| `http_headers` | Custom headers to set in the request. HTTP allows repeated headers. Structure is [documented below](#nested_template_containers_containers_startup_probe_http_get_http_headers). | false | None | None |

### http_headers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The header field name | true | None | None |
| `value` | The header field value | false | None | None |

### grpc Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | Port number to access on the container. Number must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | None | None |
| `service` | The name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md). If this is not specified, the default behavior is defined by gRPC. The `build_info` block contains: | false | None | None |
| `function_target` | (Output) Entry point of the function when the image is a Cloud Run function. | none | None | None |
| `source_location` | (Output) Source code location of the image. | none | None | None |

### tcp_socket Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | Port number to access on the container. Must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | None | None |

### startup_probe Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `initial_delay_seconds` | Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes | false | None | None |
| `timeout_seconds` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than periodSeconds. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes | false | None | None |
| `period_seconds` | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. Must be greater or equal than timeoutSeconds | false | None | None |
| `failure_threshold` | Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1. | false | None | None |
| `http_get` | HTTPGet specifies the http request to perform. Exactly one of HTTPGet or TCPSocket must be specified. Structure is [documented below](#nested_template_containers_containers_startup_probe_http_get). | false | None | None |
| `tcp_socket` | TCPSocket specifies an action involving a TCP port. Exactly one of HTTPGet or TCPSocket must be specified. Structure is [documented below](#nested_template_containers_containers_startup_probe_tcp_socket). | false | None | None |
| `grpc` | GRPC specifies an action involving a GRPC port. Structure is [documented below](#nested_template_containers_containers_startup_probe_grpc). | false | None | None |

### volumes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Volume's name. | true | None | None |
| `secret` | Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is [documented below](#nested_template_volumes_volumes_secret). | false | None | None |
| `cloud_sql_instance` | For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is [documented below](#nested_template_volumes_volumes_cloud_sql_instance). | false | None | None |
| `empty_dir` | Ephemeral storage used as a shared volume. Structure is [documented below](#nested_template_volumes_volumes_empty_dir). | false | None | None |
| `gcs` | Cloud Storage bucket mounted as a volume using GCSFuse. This feature is only supported in the gen2 execution environment. Structure is [documented below](#nested_template_volumes_volumes_gcs). | false | None | None |
| `nfs` | Represents an NFS mount. Structure is [documented below](#nested_template_volumes_volumes_nfs). | false | None | None |

### secret Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret` | The name of the secret in Cloud Secret Manager. Format: {secret} if the secret is in the same project. projects/{project}/secrets/{secret} if the secret is in a different project. | true | None | None |
| `default_mode` | Integer representation of mode bits to use on created files by default. Must be a value between 0000 and 0777 (octal), defaulting to 0444. Directories within the path are not affected by this setting. | false | None | None |
| `items` | If unspecified, the volume will expose a file whose name is the secret, relative to VolumeMount.mount_path. If specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify a path and a version. Structure is [documented below](#nested_template_volumes_volumes_secret_items). | false | None | None |

### items Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | The relative path of the secret in the container. | true | None | None |
| `version` | The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version | false | None | None |
| `mode` | Integer octal mode bits to use on this file, must be a value between 01 and 0777 (octal). If 0 or not set, the Volume's default mode will be used. | false | None | None |

### cloud_sql_instance Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instances` | The Cloud SQL instance connection names, as can be found in https://console.cloud.google.com/sql/instances. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Format: {project}:{location}:{instance} | false | None | None |

### empty_dir Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `medium` | The different types of medium supported for EmptyDir. Default value is `MEMORY`. Possible values are: `MEMORY`. | false | None | None |
| `size_limit` | Limit on the storage usable by this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. This field's values are of the 'Quantity' k8s type: https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/quantity/. The default is nil which means that the limit is undefined. More info: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir. | false | None | None |

### gcs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | GCS Bucket name | true | None | None |
| `read_only` | If true, mount the GCS bucket as read-only | false | None | None |
| `mount_options` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A list of flags to pass to the gcsfuse command for configuring this volume. Flags should be passed without leading dashes. | false | None | None |

### nfs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `server` | Hostname or IP address of the NFS server | true | None | None |
| `path` | Path that is exported by the NFS server. | true | None | None |
| `read_only` | If true, mount the NFS volume as read only | false | None | None |

### service_mesh Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mesh` | The Mesh resource name. For more information see https://cloud.google.com/service-mesh/docs/reference/network-services/rest/v1/projects.locations.meshes#resource:-mesh. | false | None | None |

### node_selector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator` | The GPU to attach to an instance. See https://cloud.google.com/run/docs/configuring/services/gpu for configuring GPU. | true | None | None |
