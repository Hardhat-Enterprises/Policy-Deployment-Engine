## 🛡️ Policy Deployment Engine: `cloud_run_v2_service`

This section provides a concise policy evaluation for the `cloud_run_v2_service` resource in GCP.

Reference: [Terraform Registry – cloud_run_v2_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the Service. | true | false | This field only defines the service name and does not affect security, access control, or data handling. | None | None |
| `template` | The template used to create revisions for this Service. Structure is [documented below](#nested_template). | true | true | Defines how Cloud Run service revisions are created and ensures all workloads run with secure configuration settings that control execution, access, and deployment behavior. | Refer to child argument | Refer to child argument |
| `location` | The location of the cloud run service | true | true | Ensures Cloud Run services are deployed only in approved Australian regions to meet compliance requirements. | australia-southeast1 | us-west1 |
| `description` | User-provided description of the Service. This field currently has a 512-character limit. | false | false | This field is just for user-provided text and does not impact security or system behavior. | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with  `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 Service. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | This field is used for organizing resources and does not affect access control or security. | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected in new resources. All system annotations in v1 now have a corresponding field in v2 Service. This field follows Kubernetes annotations' namespacing, limits, and rules. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | This field stores metadata and does not influence security or runtime behavior. | None | None |
| `client` | Arbitrary identifier for the API client. | false | false | This is just an identifier for the API client and has no impact on security. | None | None |
| `client_version` | Arbitrary version identifier for the API client. | false | false | This only tracks version info and does not affect any security controls. | None | None |
| `ingress` | Provides the ingress settings for this Service. On output, returns the currently observed ingress settings, or INGRESS_TRAFFIC_UNSPECIFIED if no revision is active. Possible values are: `INGRESS_TRAFFIC_ALL`, `INGRESS_TRAFFIC_INTERNAL_ONLY`, `INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER`. | false | true | Restricts external access to Cloud Run services to prevent unauthorized exposure and reduce attack surface by limiting inbound traffic sources. | INGRESS_TRAFFIC_INTERNAL_ONLY | INGRESS_TRAFFIC_ALL |
| `launch_stage` | The launch stage as defined by [Google Cloud Platform Launch Stages](https://cloud.google.com/products#product-launch-stages). Cloud Run supports ALPHA, BETA, and GA. If no value is specified, GA is assumed. Set the launch stage to a preview stage on input to allow use of preview features in that stage. On read (or output), describes whether the resource uses preview features. For example, if ALPHA is provided as input, but only BETA and GA-level features are used, this field will be BETA on output. Possible values are: `UNIMPLEMENTED`, `PRELAUNCH`, `EARLY_ACCESS`, `ALPHA`, `BETA`, `GA`, `DEPRECATED`. | false | false | This defines feature maturity level, and restricting it does not influence access control. | None | None |
| `binary_authorization` | Settings for the Binary Authorization feature. Structure is [documented below](#nested_binary_authorization). | false | true | Ensures only verified and trusted container images are deployed, protecting against untrusted or tampered workloads. | Refer to child argument | Refer to child argument |
| `custom_audiences` | One or more custom audiences that you want this service to support. Specify each custom audience as the full URL in a string. The custom audiences are encoded in the token and used to authenticate requests. For more information, see https://cloud.google.com/run/docs/configuring/custom-audiences. | false | false | This field defines audiences for tokens but does not directly enforce or bypass security controls. | None | None |
| `scaling` | Scaling settings that apply to the whole service Structure is [documented below](#nested_scaling). | false | false | This is just a parent grouping for scaling settings and does not directly impact | None | None |
| `default_uri_disabled` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Disables public resolution of the default URI of this service. | false | false | This only affects URL behavior and does not directly control authentication or authorization. | None | None |
| `traffic` | Specifies how to distribute traffic over a collection of Revisions belonging to the Service. If traffic is empty or not provided, defaults to 100% traffic to the latest Ready Revision. Structure is [documented below](#nested_traffic). | false | false | This is just a grouping for traffic distribution and does not directly affect security. | None | None |
| `invoker_iam_disabled` | Disables IAM permission check for run.routes.invoke for callers of this service. For more information, visit https://cloud.google.com/run/docs/securing/managing-access#invoker_check. | false | true | Ensures Cloud Run services require IAM authentication for invocation to prevent unauthorized or public access. | False | True |
| `build_config` | Configuration for building a Cloud Run function. Structure is [documented below](#nested_build_config). | false | false | This is a grouping for build settings and does not directly impact security. | None | None |
| `iap_enabled` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Used to enable/disable IAP for the service. | false | false | This toggles IAP usage, but restricting this flag alone is not needed to enforce security. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | This just specifies the project context and does not directly impact security. | None | None |
| `deletion_protection` | When a`terraform destroy` or `terraform apply` would delete the service, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the service will fail. When the field is set to false, deleting the service is allowed. | false | true | Prevents accidental or unauthorized deletion of Cloud Run services by enforcing deletion protection. | True | False |
| `vpc_access` | VPC Access configuration to use for this Task. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_vpc_access). | false | true | Controls network connectivity for Cloud Run services to restrict outbound traffic and reduce the risk of data exposure or unauthorized access. | Refer to child argument | Refer to child argument |
| `network_interfaces` | Direct VPC egress settings. Currently only single network interface is supported. Structure is documented below. | false | false | This is a grouping field and does not directly affect security. | None | None |
| `containers` | Holds the containers that define the unit of execution for this Service. Structure is [documented below](#nested_template_containers). | false | true | Defines the application runtime environment and helps ensure only secure and approved workloads are executed in the service. | Refer to child argument | Refer to child argument |
| `env` | List of environment variables to set in the container. Structure is [documented below](#nested_template_containers_containers_env). | false | true | Manages environment variables in the container and helps prevent accidental exposure of sensitive configuration or credentials. | Refer to child argument | Refer to child argument |
| `value_source` | Source for the environment variable's value. Structure is [documented below](#nested_template_containers_containers_env_env_value_source). | false | true | Ensures environment variables are securely sourced from trusted systems instead of being hardcoded in configuration. | Refer to child argument | Refer to child argument |
| `secret_key_ref` | Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_containers_containers_env_env_value_source_secret_key_ref). | false | true | Ensures sensitive values are securely retrieved from Secret Manager instead of being exposed in plaintext. | Refer to child argument | Refer to child argument |
| `resources` | Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is documented below. | false | false | This block defines compute resource allocation such as CPU and memory, which is related to performance and scaling, not security enforcement, so no policy is needed. | None | None |
| `ports` | List of ports to expose from the container. Only a single port can be specified. The specified ports must be listening on all interfaces (0.0.0.0) within the container to be accessible. If omitted, a port number will be chosen and passed to the container through the PORT environment variable for the container to listen on Structure is documented below. | false | false | This defines which port the container listens on, and since exposure control is handled at networking and ingress levels, this field itself does not require a security policy. | None | None |
| `volume_mounts` | Volume to mount into the container's filesystem. Structure is documented below. | false | false | This describes how volumes are mounted into the container, but the actual security is governed by the source of the volume, so this mapping itself does not need a policy. | None | None |
| `liveness_probe` | Periodic probe of container liveness. Container will be restarted if the probe fails. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes Structure is documented below. | false | false | This monitors container health and determines restarts, which is related to availability and reliability, not security enforcement. | None | None |
| `http_get` | HTTPGet specifies the http request to perform. Structure is documented below. | false | false | This defines HTTP probe behavior for health checking. | None | None |
| `http_headers` | Custom headers to set in the request. HTTP allows repeated headers. Structure is documented below. | false | false | This defines HTTP headers structure and is a generic configuration. | None | None |
| `grpc` | GRPC specifies an action involving a GRPC port. Structure is documented below. | false | false | This defines configuration for gRPC-based probes and is used only for health monitoring. | None | None |
| `tcp_socket` | TCPSocketAction describes an action based on opening a socket Structure is documented below. | false | false | This defines TCP probe configuration for health checks and is not related to enforcing security. | None | None |
| `startup_probe` | Startup probe of application within the container. All other probes are disabled if a startup probe is provided, until it succeeds. Container will not be added to service endpoints if the probe fails. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes Structure is documented below. | false | false | This defines startup health checks and is focused on application readiness, no security enforcement needed. | None | None |
| `volumes` | A list of Volumes to make available to containers. Structure is [documented below](#nested_template_volumes). | false | true | Provides storage access to containers and must be controlled to prevent unauthorized data access or modification. | Refer to child argument | Refer to child argument |
| `secret` | Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is [documented below](#nested_template_volumes_volumes_secret). | false | true | Ensures secrets mounted as volumes are securely managed and restricted to approved sources to prevent data leakage. | Refer to child argument | Refer to child argument |
| `items` | If unspecified, the volume will expose a file whose name is the secret, relative to VolumeMount.mount_path. If specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify a path and a version. Structure is documented below. | false | false | This maps secret data into files and is more about structure | None | None |
| `cloud_sql_instance` | For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is documented below. | false | false | This specifies Cloud SQL connections but does not itself need any security controls | None | None |
| `empty_dir` | Ephemeral storage used as a shared volume. Structure is documented below. | false | false | This defines temporary storage within the container lifecycle, which does not persist or expose data externally, so no policy is required. | None | None |
| `gcs` | Cloud Storage bucket mounted as a volume using GCSFuse. This feature is only supported in the gen2 execution environment. Structure is [documented below](#nested_template_volumes_volumes_gcs). | false | true | Controls access to Cloud Storage buckets mounted as volumes and reduces risk of unauthorized data access or modification. | Refer to child argument | Refer to child argument |
| `nfs` | Represents an NFS mount. Structure is [documented below](#nested_template_volumes_volumes_nfs). | false | true | Manages shared file system access and helps enforce safe mounting to prevent unauthorized changes or data exposure. | Refer to child argument | Refer to child argument |
| `service_mesh` | Enables Cloud Service Mesh for this Revision. Structure is documented below. | false | false | This enables service mesh features, but restricting this flag itself does not enforce or improve security without additional configuration. | None | None |
| `node_selector` | Node Selector describes the hardware requirements of the resources. Structure is documented below. | false | false | This defines infrastructure placement constraints and does not interact with security controls. | None | None |

### template Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `revision` | The unique name for the revision. If this field is omitted, it will be automatically generated based on the Service name. | false | false | This field is only used to assign a name to a revision for tracking deployments and versioning, so it does not introduce any condition where a security policy would need to validate or restrict its value. | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 RevisionTemplate. | false | false | This is metadata for organization and does not affect security. | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system annotations in v1 now have a corresponding field in v2 RevisionTemplate. This field follows Kubernetes annotations' namespacing, limits, and rules. | false | false | This stores metadata and does not influence security behavior. | None | None |
| `scaling` | Scaling settings for this Revision. Structure is [documented below](#nested_template_scaling). | false | false | This is just a grouping for scaling settings and does not directly affect security. | None | None |
| `vpc_access` | VPC Access configuration to use for this Task. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_vpc_access). | false | true | Controls network connectivity for Cloud Run services to restrict outbound traffic and reduce the risk of data exposure or unauthorized access. | Refer to child argument | Refer to child argument |
| `timeout` | Max allowed time for an instance to respond to a request. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | This only controls request duration and does not impact access control or data security. | None | None |
| `service_account` | Email address of the IAM service account associated with the revision of the service. The service account represents the identity of the running revision, and determines what permissions the revision has. If not provided, the revision will use the project's default service account. | false | true | Ensures Cloud Run services use a dedicated least-privileged service account instead of default accounts to reduce risk of excessive permissions and privilege escalation. | my-sa@my-project.iam.gserviceaccount.com |  |
| `containers` | Holds the containers that define the unit of execution for this Service. Structure is [documented below](#nested_template_containers). | false | true | Defines the application runtime environment and helps ensure only secure and approved workloads are executed in the service. | Refer to child argument | Refer to child argument |
| `volumes` | A list of Volumes to make available to containers. Structure is [documented below](#nested_template_volumes). | false | true | Provides storage access to containers and must be controlled to prevent unauthorized data access or modification. | Refer to child argument | Refer to child argument |
| `execution_environment` | The sandbox environment to host this Revision. Possible values are: `EXECUTION_ENVIRONMENT_GEN1`, `EXECUTION_ENVIRONMENT_GEN2`. | false | false | This selects runtime environment version and does not directly affect security controls. | None | None |
| `encryption_key` | A reference to a customer managed encryption key (CMEK) to use to encrypt this container image. For more information, go to https://cloud.google.com/run/docs/securing/using-cmek | false | true | Ensures Cloud Run services use approved customer-managed encryption keys (CMEK) from trusted KMS locations to maintain control over data encryption and prevent unauthorized key usage. | projects/my-project/locations/australia-southeast1/keyRings/my-keyring/cryptoKeys/my-key | projects/my-project/locations/us-central1/keyRings/random-keys/cryptoKeys/random-key |
| `max_instance_request_concurrency` | Sets the maximum number of requests that each serving instance can receive. If not specified or 0, defaults to 80 when requested CPU >= 1 and defaults to 1 when requested CPU < 1. | false | false | This controls how many requests an instance handles and does not affect security. | None | None |
| `session_affinity` | Enables session affinity. For more information, go to https://cloud.google.com/run/docs/configuring/session-affinity | false | false | This controls session routing behavior, and restricting it is not necessary as it does not affect authentication or authorization. | None | None |
| `service_mesh` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Enables Cloud Service Mesh for this Revision. Structure is [documented below](#nested_template_service_mesh). | false | false | This enables service mesh features, but restricting this flag itself does not enforce or improve security | None | None |
| `node_selector` | Node Selector describes the hardware requirements of the resources. Structure is [documented below](#nested_template_node_selector). | false | false | This defines hardware requirements, and restricting it does not contribute to enforcing security policies. | None | None |
| `gpu_zonal_redundancy_disabled` | True if GPU zonal redundancy is disabled on this revision. | false | false | This impacts availability characteristics, and restricting it does not provide any direct security benefit. | None | None |

### binary_authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `breakglass_justification` | If present, indicates to use Breakglass using this justification. If useDefault is False, then it must be empty. For more information on breakglass, see https://cloud.google.com/binary-authorization/docs/using-breakglass | false | false | This only provides a justification string and does not itself enforce or bypass security. | None | None |
| `use_default` | If True, indicates to use the default project's binary authorization policy. If False, binary authorization will be disabled. | false | true | Ensures only verified and trusted container images are deployed by enforcing Binary Authorization for Cloud Run services. | True | False |
| `policy` | The path to a binary authorization policy. Format: projects/{project}/platforms/cloudRun/{policy-name} | false | false | This references a policy but does not directly change enforcement behavior. | None | None |

### scaling Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `min_instance_count` | Minimum number of instances for the service, to be divided among all revisions receiving traffic. | false | false | This controls minimum instances and does not affect security. | None | None |
| `max_instance_count` | Maximum number of serving instances that this resource should have. Must not be less than minimum instance count. If absent, Cloud Run will calculate a default value based on the project's available container instances quota in the region and specified instance size. | false | false | This controls maximum instances and does not affect security. | None | None |
| `scaling_mode` | The [scaling mode](https://cloud.google.com/run/docs/reference/rest/v2/projects.locations.services#scalingmode) for the service. Possible values are: `AUTOMATIC`, `MANUAL`. | false | false | This defines scaling behavior and does not impact access control. | None | None |
| `manual_instance_count` | Total instance count for the service in manual scaling mode. This number of instances is divided among all revisions with specified traffic based on the percent of traffic they are receiving. | false | false | This sets instance count manually and does not affect security. | None | None |

### traffic Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The allocation type for this traffic target. Possible values are: `TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST`, `TRAFFIC_TARGET_ALLOCATION_TYPE_REVISION`. | false | false | This defines how traffic is allocated and does not impact security. | None | None |
| `revision` | Revision to which to send this portion of traffic, if traffic allocation is by revision. | false | false | This selects a revision for traffic and does not affect security. | None | None |
| `percent` | Specifies percent of the traffic to this Revision. This defaults to zero if unspecified. | false | false | This controls traffic percentage and does not impact security. | None | None |
| `tag` | Indicates a string to be part of the URI to exclusively reference this target. | false | false | This is used for routing and does not affect access control. | None | None |

### build_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | (Output) The Cloud Build name of the latest successful deployment of the function. | false | false | This is an output field and does not affect security. | None | None |
| `source_location` | The Cloud Storage bucket URI where the function source code is located. | false | false | This only points to source code location and does not itself enforce security. | None | None |
| `function_target` | The name of the function (as defined in source code) that will be executed. Defaults to the resource name suffix, if not specified. For backward compatibility, if function with given name is not found, then the system will try to use function named "function". | false | false | This defines which function runs and does not impact security controls. | None | None |
| `image_uri` | Artifact Registry URI to store the built image. | false | false | This defines where the image is stored and does not directly affect security. | None | None |
| `base_image` | The base image used to build the function. | false | false | This specifies base image and does not itself enforce security policies. | None | None |
| `enable_automatic_updates` | Sets whether the function will receive automatic base image updates. | false | false | This controls updates and does not directly affect security. | None | None |
| `worker_pool` | Name of the Cloud Build Custom Worker Pool that should be used to build the Cloud Run function. The format of this field is `projects/{project}/locations/{region}/workerPools/{workerPool}` where {project} and {region} are the project id and region respectively where the worker pool is defined and {workerPool} is the short name of the worker pool. | false | false | This selects a worker pool and does not impact security controls directly. | None | None |
| `environment_variables` | User-provided build-time environment variables for the function. | false | false | This defines build-time variables and does not directly enforce security | None | None |
| `service_account` | Service account to be used for building the container. The format of this field is `projects/{projectId}/serviceAccounts/{serviceAccountEmail}`. | false | false | This defines build identity but is not enforced here as a security control. | None | None |

### vpc_access Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `connector` | VPC Access connector name. Format: projects/{project}/locations/{location}/connectors/{connector}, where {project} can be project id or number. | false | false | This specifies a connector and does not itself enforce security rules. | None | None |
| `egress` | Traffic VPC egress settings. Possible values are: `ALL_TRAFFIC`, `PRIVATE_RANGES_ONLY`. | false | true | Restricts outbound network traffic from Cloud Run services to prevent unauthorized external data access and reduce risk of data exfiltration. | PRIVATE_RANGES_ONLY | ALL_TRAFFIC |
| `network_interfaces` | Direct VPC egress settings. Currently only single network interface is supported. Structure is [documented below](#nested_template_vpc_access_network_interfaces). | false | false | This is a grouping field and does not directly impact security. | None | None |

### network_interfaces Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The VPC network that the Cloud Run resource will be able to send traffic to. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If network is not specified, it will be looked up from the subnetwork. | false | false | This defines network reference and does not enforce security controls. | None | None |
| `subnetwork` | The VPC subnetwork that the Cloud Run resource will get IPs from. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If subnetwork is not specified, the subnetwork with the same name with the network will be used. | false | false | This defines subnetwork reference and does not directly affect security. | None | None |
| `tags` | Network tags applied to this Cloud Run service. | false | false | This is metadata for networking and does not impact security directly. | None | None |

### containers Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the container specified as a DNS_LABEL. | false | false | This only defines container name and does not affect security. | None | None |
| `image` | URL of the Container image in Google Container Registry or Google Artifact Registry. More info: https://kubernetes.io/docs/concepts/containers/images | true | true | Ensures Cloud Run services use only approved container images from trusted registries to reduce supply chain and unverified image risks. | us-docker.pkg.dev/cloudrun/container/hello | gcr.io/my-project/unauthorized-image |
| `command` | Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell | false | false | This defines runtime command and does not directly enforce security | None | None |
| `args` | Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references are not supported in Cloud Run. | false | false | This provides arguments and does not impact security. | None | None |
| `env` | List of environment variables to set in the container. Structure is [documented below](#nested_template_containers_containers_env). | false | true | Manages environment variables in the container and helps prevent accidental exposure of sensitive configuration or credentials. | Refer to child argument | Refer to child argument |
| `resources` | Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is [documented below](#nested_template_containers_containers_resources). | false | false | This defines compute resources and does not affect security. | None | None |
| `ports` | List of ports to expose from the container. Only a single port can be specified. The specified ports must be listening on all interfaces (0.0.0.0) within the container to be accessible. If omitted, a port number will be chosen and passed to the container through the PORT environment variable for the container to listen on Structure is [documented below](#nested_template_containers_containers_ports). | false | false | This exposes ports but does not itself control network security. | None | None |
| `volume_mounts` | Volume to mount into the container's filesystem. Structure is [documented below](#nested_template_containers_containers_volume_mounts). | false | false | This mounts volumes but security is controlled at volume level. | None | None |
| `working_dir` | Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. | false | false | This sets working directory and does not impact security. | None | None |
| `liveness_probe` | Periodic probe of container liveness. Container will be restarted if the probe fails. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes Structure is [documented below](#nested_template_containers_containers_liveness_probe). | false | false | This is for health checks and does not affect security. | None | None |
| `startup_probe` | Startup probe of application within the container. All other probes are disabled if a startup probe is provided, until it succeeds. Container will not be added to service endpoints if the probe fails. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes Structure is [documented below](#nested_template_containers_containers_startup_probe). | false | false | This controls startup checks and does not impact security. | None | None |
| `depends_on` | Containers which should be started before this container. If specified the container will wait to start until all containers with the listed names are healthy. | false | false | This controls startup order and does not affect security. | None | None |
| `base_image_uri` | Base image for this container. If set, it indicates that the service is enrolled into automatic base image update. | false | false | This defines base image reference and does not enforce security. | None | None |
| `build_info` | (Output) The build info of the container image. Structure is [documented below](#nested_template_containers_containers_build_info). | false | false | This defines base image reference and does not enforce security. | None | None |

### env Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the environment variable. Must be a C_IDENTIFIER, and may not exceed 32768 characters. | true | false | This defines variable name and does not expose sensitive data. | None | None |
| `value` | Literal value of the environment variable. Defaults to "" and the maximum allowed length is 32768 characters. Variable references are not supported in Cloud Run. | false | false | This is a value field but does not enforce or control security itself. | None | None |
| `value_source` | Source for the environment variable's value. Structure is [documented below](#nested_template_containers_containers_env_env_value_source). | false | true | Ensures environment variables are securely sourced from trusted systems instead of being hardcoded in configuration. | Refer to child argument | Refer to child argument |

### value_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_key_ref` | Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_containers_containers_env_env_value_source_secret_key_ref). | false | true | Ensures sensitive values are securely retrieved from Secret Manager instead of being exposed in plaintext. | Refer to child argument | Refer to child argument |

### secret_key_ref Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret` | The name of the secret in Cloud Secret Manager. Format: {secretName} if the secret is in the same project. projects/{project}/secrets/{secretName} if the secret is in a different project. | true | true | Ensures sensitive environment variables are securely sourced from Secret Manager instead of being stored as plaintext or missing secure references. | projects/my-project/secrets/api-key | None |
| `version` | The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version. | false | false | This selects a version and does not require security policy. | None | None |

### resources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `limits` | Only memory, CPU, and nvidia.com/gpu are supported. Use key `cpu` for CPU limit, `memory` for memory limit, `nvidia.com/gpu` for gpu limit. Note: The only supported values for CPU are '1', '2', '4', and '8'. Setting 4 CPU requires at least 2Gi of memory. The values of the map is string form of the 'quantity' k8s type: https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/apimachinery/pkg/api/resource/quantity.go | false | false | This sets upper bounds on resource usage, which is purely operational and does not affect access control or data protection, so no security policy is required. | None | None |
| `cpu_idle` | Determines whether CPU is only allocated during requests. True by default if the parent `resources` field is not set. However, if `resources` is set, this field must be explicitly set to true to preserve the default behavior. | false | false | This controls CPU allocation behavior during idle periods, which is a performance optimization and does not introduce any security concerns needing policy enforcement. | None | None |
| `startup_cpu_boost` | Determines whether CPU should be boosted on startup of a new container instance above the requested CPU threshold, this can help reduce cold-start latency. | false | false | This improves startup performance by temporarily increasing CPU, and since it does not interact with access or sensitive data, no security policy is needed. | None | None |

### ports Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | If specified, used to specify which protocol to use. Allowed values are "http1" and "h2c". | false | false | This specifies the protocol type used on the port, which is a configuration detail and does not influence security boundaries, so no policy is needed. | None | None |
| `container_port` | Port number the container listens on. This must be a valid TCP port number, 0 < containerPort < 65536. | false | false | This defines the numeric port value, and since it does not determine who can access the service, it does not require a security policy. | None | None |

### volume_mounts Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | This must match the Name of a Volume. | true | false | This is just a reference to a volume identifier and does not need security policy. | None | None |
| `mount_path` | Path within the container at which the volume should be mounted. Must not contain ':'. For Cloud SQL volumes, it can be left empty, or must otherwise be /cloudsql. All instances defined in the Volume will be available as /cloudsql/[instance]. For more information on Cloud SQL volumes, visit https://cloud.google.com/sql/docs/mysql/connect-run | true | false | This defines where the volume is mounted inside the container, which is a filesystem detail and does not enforce or bypass any access control, so no policy is needed. | None | None |

### liveness_probe Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `initial_delay_seconds` | Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes | false | false | This controls timing of health checks and does not interact with access or sensitive data, so no security policy is required. | None | None |
| `timeout_seconds` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than periodSeconds. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes | false | false | This defines how long to wait for probe responses, which is operational behavior and not security-related. | None | None |
| `period_seconds` | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. Must be greater or equal than timeoutSeconds | false | false | This sets how frequently checks run, and since it does not affect access or data exposure, no policy is needed. | None | None |
| `failure_threshold` | Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1. | false | false | This defines retry logic for health checks and does not influence security controls. | None | None |
| `http_get` | HTTPGet specifies the http request to perform. Structure is [documented below](#nested_template_containers_containers_liveness_probe_http_get). | false | false | This defines how HTTP checks are performed for health monitoring | None | None |
| `grpc` | GRPC specifies an action involving a GRPC port. Structure is [documented below](#nested_template_containers_containers_liveness_probe_grpc). | false | false | This defines gRPC-based health checks and does not introduce any situations requiring a policy. | None | None |
| `tcp_socket` | TCPSocketAction describes an action based on opening a socket Structure is [documented below](#nested_template_containers_containers_liveness_probe_tcp_socket). | false | false | This defines TCP-level checks for availability and does not affect security. | None | None |

### http_get Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | Path to access on the HTTP server. Defaults to '/'. | false | false | This just specifies the endpoint path used for checks | None | None |
| `port` | Port number to access on the container. Must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | false | This just defines which port to use for probes | None | None |
| `http_headers` | Custom headers to set in the request. HTTP allows repeated headers. Structure is [documented below](#nested_template_containers_containers_startup_probe_http_get_http_headers). | false | false | This allows adding headers to health check requests, they do not require security policy enforcement. | None | None |

### http_headers Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The header field name | true | false | This is simply the name of a header and does not impact security. | None | None |
| `value` | The header field value | false | false | This is the value of a header used in probes and does not introduce a need for security validation. | None | None |

### grpc Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `port` | Port number to access on the container. Number must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | false | This specifies the port used for gRPC checks. | None | None |
| `service` | The name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md). If this is not specified, the default behavior is defined by gRPC. The `build_info` block contains: | false | false | This defines the service name for health checks and does not introduce any security enforcement requirement. | None | None |
| `function_target` | (Output) Entry point of the function when the image is a Cloud Run function. | false | false | This is an output-only metadata field and does not influence security. | None | None |
| `source_location` | (Output) Source code location of the image. | false | false | This provides metadata about source location and does not affect security. | None | None |

### tcp_socket Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `port` | Port number to access on the container. Must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | false | This specifies the port used for TCP checks and does not impact security. | None | None |

### startup_probe Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `initial_delay_seconds` | Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes | false | false | This controls when startup checks begin and does not affect security. | None | None |
| `timeout_seconds` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than periodSeconds. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes | false | false | This defines probe timeout behavior and is not related to security. | None | None |
| `period_seconds` | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value for liveness probe is 3600. Maximum value for startup probe is 240. Must be greater or equal than timeoutSeconds | false | false | This sets frequency of checks and does not impact security. | None | None |
| `failure_threshold` | Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1. | false | false | This defines failure handling logic and does not introduce any security concerns. | None | None |
| `http_get` | HTTPGet specifies the http request to perform. Exactly one of HTTPGet or TCPSocket must be specified. Structure is [documented below](#nested_template_containers_containers_startup_probe_http_get). | false | false | This defines HTTP-based startup checks and no need for enforcing secure policy. | None | None |
| `tcp_socket` | TCPSocket specifies an action involving a TCP port. Exactly one of HTTPGet or TCPSocket must be specified. Structure is [documented below](#nested_template_containers_containers_startup_probe_tcp_socket). | false | false | This defines TCP-based startup checks and no need for security policy. | None | None |
| `grpc` | GRPC specifies an action involving a GRPC port. Structure is [documented below](#nested_template_containers_containers_startup_probe_grpc). | false | false | This defines gRPC-based startup checks and no need for security policy. | None | None |

### volumes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Volume's name. | true | false | This is just an identifier for the volume | None | None |
| `secret` | Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is [documented below](#nested_template_volumes_volumes_secret). | false | true | Ensures secrets mounted as volumes are securely managed and restricted to approved sources to prevent data leakage. | Refer to child argument | Refer to child argument |
| `cloud_sql_instance` | For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is [documented below](#nested_template_volumes_volumes_cloud_sql_instance). | false | false | This specifies connectivity configuration to Cloud SQL, while actual access is controlled through IAM and database authentication, so this field itself does not require a policy. | None | None |
| `empty_dir` | Ephemeral storage used as a shared volume. Structure is [documented below](#nested_template_volumes_volumes_empty_dir). | false | false | This defines temporary storage within the container lifecycle, which does not persist or expose data externally, so no policy is required. | None | None |
| `gcs` | Cloud Storage bucket mounted as a volume using GCSFuse. This feature is only supported in the gen2 execution environment. Structure is [documented below](#nested_template_volumes_volumes_gcs). | false | true | Controls access to Cloud Storage buckets mounted as volumes and reduces risk of unauthorized data access or modification. | Refer to child argument | Refer to child argument |
| `nfs` | Represents an NFS mount. Structure is [documented below](#nested_template_volumes_volumes_nfs). | false | true | Manages shared file system access and helps enforce safe mounting to prevent unauthorized changes or data exposure. | Refer to child argument | Refer to child argument |

### secret Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret` | The name of the secret in Cloud Secret Manager. Format: {secret} if the secret is in the same project. projects/{project}/secrets/{secret} if the secret is in a different project. | true | true | Ensures only approved Secret Manager secrets are mounted in Cloud Run service volumes to prevent unauthorized access to sensitive data and reduce secret exposure risks. | projects/my-project/secrets/api-key | projects/untrusted-project/secrets/unknown-secret |
| `default_mode` | Integer representation of mode bits to use on created files by default. Must be a value between 0000 and 0777 (octal), defaulting to 0444. Directories within the path are not affected by this setting. | false | false | This defines file permission defaults but does not need to be enforced with security policies. | None | None |
| `items` | If unspecified, the volume will expose a file whose name is the secret, relative to VolumeMount.mount_path. If specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify a path and a version. Structure is [documented below](#nested_template_volumes_volumes_secret_items). | false | false | This maps secret data into files and is more about structure | None | None |

### items Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The relative path of the secret in the container. | true | false | This just specifies file location for secrets | None | None |
| `version` | The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version | false | false | This just selects versions, does not require security policy | None | None |
| `mode` | Integer octal mode bits to use on this file, must be a value between 01 and 0777 (octal). If 0 or not set, the Volume's default mode will be used. | false | false | This defines permissions and does not require any security policy. | None | None |

### cloud_sql_instance Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `instances` | The Cloud SQL instance connection names, as can be found in https://console.cloud.google.com/sql/instances. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Format: {project}:{location}:{instance} | false | false | This lists database instances and does not need security enforcement | None | None |

### empty_dir Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `medium` | The different types of medium supported for EmptyDir. Default value is `MEMORY`. Possible values are: `MEMORY`. | false | false | This defines the storage medium type and does not need a security policy | None | None |
| `size_limit` | Limit on the storage usable by this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. This field's values are of the 'Quantity' k8s type: https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/quantity/. The default is nil which means that the limit is undefined. More info: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir. | false | false | This sets storage limits and is purely operational, not security-related. | None | None |

### gcs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | GCS Bucket name | true | false | This specifies a bucket name and does not require policies here. | None | None |
| `read_only` | If true, mount the GCS bucket as read-only | false | true | Ensures Cloud Run services mount Cloud Storage volumes in read-only mode to prevent unauthorized or accidental modification of stored data. | True | False |
| `mount_options` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A list of flags to pass to the gcsfuse command for configuring this volume. Flags should be passed without leading dashes. | false | false | This configures how the bucket is mounted, but does not define access permissions, so it does not require a security policy. | None | None |

### nfs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `server` | Hostname or IP address of the NFS server | true | false | This specifies the server endpoint and does not require policy since network-level controls handle security. | None | None |
| `path` | Path that is exported by the NFS server. | true | false | This defines the shared path and does not need policy as it does not enforce access policies | None | None |
| `read_only` | If true, mount the NFS volume as read only | false | true | Ensures NFS-mounted volumes in Cloud Run services are set to read-only mode to prevent unauthorized or accidental modifications to shared file storage, reducing risk of data tampering. | True | False |

### service_mesh Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mesh` | The Mesh resource name. For more information see https://cloud.google.com/service-mesh/docs/reference/network-services/rest/v1/projects.locations.meshes#resource:-mesh. | false | false | This is just an identifier for the mesh and does not need a security policy. | None | None |

### node_selector Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `accelerator` | The GPU to attach to an instance. See https://cloud.google.com/run/docs/configuring/services/gpu for configuring GPU. | true | false | This specifies GPU usage and is purely a hardware configuration detail with no impact on security. | None | None |
