## 🛡️ Policy Deployment Engine: `cloud_run_v2_job`

This section provides a concise policy evaluation for the `cloud_run_v2_job` resource in GCP.

Reference: [Terraform Registry – cloud_run_v2_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the Job. | true | false | This field does not introduce direct security risk as it only defines an identifier. | None | None |
| `template` | The template used to create executions for this Job. Structure is [documented below](#nested_template). | true | true | Defines the overall job execution structure and enforces secure configuration boundaries for Cloud Run Jobs | Refer to child argument | Refer to child argument |
| `location` | The location of the cloud run job | true | true | Ensures Cloud Run Jobs are deployed only in approved Australian regions to meet compliance requirements. | australia-southeast1, australia-southeast2 | us-east1 |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 Job. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | No direct security risk as it only provides organizational metadata  | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected on new resources. All system annotations in v1 now have a corresponding field in v2 Job. This field follows Kubernetes annotations' namespacing, limits, and rules. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | No direct security risk as it stores metadata and does not influence security behavior. | None | None |
| `client` | Arbitrary identifier for the API client. | false | false | No direct security risk as it is an identifier for the client  | None | None |
| `client_version` | Arbitrary version identifier for the API client. | false | false | No direct security risk as it only tracks version information and does not affect security controls. | None | None |
| `launch_stage` | The launch stage as defined by [Google Cloud Platform Launch Stages](https://cloud.google.com/products#product-launch-stages). Cloud Run supports ALPHA, BETA, and GA. If no value is specified, GA is assumed. Set the launch stage to a preview stage on input to allow use of preview features in that stage. On read (or output), describes whether the resource uses preview features. For example, if ALPHA is provided as input, but only BETA and GA-level features are used, this field will be BETA on output. Possible values are: `UNIMPLEMENTED`, `PRELAUNCH`, `EARLY_ACCESS`, `ALPHA`, `BETA`, `GA`, `DEPRECATED`. | false | true | Ensures only stable, production-ready (GA) features are used, reducing the risk of instability from preview (ALPHA/BETA) functionality | GA | ALPHA,BETA |
| `binary_authorization` | Settings for the Binary Authorization feature. Structure is [documented below](#nested_binary_authorization). | false | true | Ensures only trusted, verified container images are deployed, preventing execution of unverified or tampered workloads | Refer to child argument | Refer to child argument |
| `start_execution_token` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A unique string used as a suffix creating a new execution upon job create or update. The Job will become ready when the execution is successfully started. The sum of job name and token length must be fewer than 63 characters. | false | false | No direct security risk as it is used for execution uniqueness and does not impact security | None | None |
| `run_execution_token` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A unique string used as a suffix creating a new execution upon job create or update. The Job will become ready when the execution is successfully completed. The sum of job name and token length must be fewer than 63 characters. | false | false | No direct security risk as it is used for execution tracking and does not affect security. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | No direct security risk as it specifies project context | None | None |
| `deletion_protection` | When a`terraform destroy` or `terraform apply` would delete the job, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the job will fail. When the field is set to false, deleting the job is allowed. | false | true | Prevents accidental deletion of Cloud Run Jobs by enforcing deletion protection. | True | False |
| `containers` | Holds the single container that defines the unit of execution for this task. Structure is [documented below](#nested_template_template_containers). | false | true | Defines the runtime execution unit and enforces secure container configuration to prevent untrusted code execution and supply chain risks. | Refer to child argument | Refer to child argument |
| `env` | List of environment variables to set in the container. Structure is [documented below](#nested_template_template_containers_containers_env). | false | true | Controls environment variables for containers and helps prevent sensitive data exposure through insecure configuration. | Refer to child argument | Refer to child argument |
| `value_source` | Source for the environment variable's value. Structure is [documented below](#nested_template_template_containers_containers_env_env_value_source). | false | true | Ensures environment variable values are securely sourced instead of being hardcoded, reducing secret leakage risk | Refer to child argument | Refer to child argument |
| `secret_key_ref` | Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_template_containers_containers_env_env_value_source_secret_key_ref). | false | true | Enforces retrieval of sensitive values from Secret Manager to prevent exposure of credentials in configuration or code. | Refer to child argument | Refer to child argument |
| `resources` | Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is [documented below](#nested_template_template_containers_containers_resources). | false | false | This defines compute resource allocation such as CPU and memory for the container and does not introduce any direct security control or risk related to access or data protection. | None | None |
| `ports` | List of ports to expose from the container. Only a single port can be specified. The specified ports must be listening on all interfaces (0.0.0.0) within the container to be accessible. If omitted, a port number will be chosen and passed to the container through the PORT environment variable for the container to listen on Structure is documented below. | false | false | This configuration defines which port the container listens on and does not control secure communication by itself. | None | None |
| `volume_mounts` | Volume to mount into the container's filesystem. Structure is documented below. | false | false | This maps storage volumes into the container filesystem. | None | None |
| `startup_probe` | Startup probe of application within the container. All other probes are disabled if a startup probe is provided, until it succeeds. Container will not be added to service endpoints if the probe fails. Structure is documented below. | false | false | This controls container startup health checks and is related to lifecycle management | None | None |
| `tcp_socket` | TcpSocket specifies an action involving a TCP port. Structure is documented below. | false | false | This is used for connectivity checks and does not provide any security risks. | None | None |
| `http_get` | HttpGet specifies the http request to perform. Structure is documented below. | false | false | This defines HTTP probe behavior | None | None |
| `http_headers` | Custom headers to set in the request. HTTP allows repeated headers. Structure is documented below. | false | false | This is used to define headers for requests and does not need any security controls. | None | None |
| `grpc` | GRPC specifies an action involving a GRPC port. Structure is documented below. | false | false | This defines gRPC probe configuration and is related to health monitoring | None | None |
| `volumes` |  A list of Volumes to make available to containers. Structure is documented below. | false | false | This defines available storage volumes | None | None |
| `secret` | Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is documented below. | false | false | This argument enables mounting of secrets within volumes, and no restriction is applied here because the actual security enforcement is handled. | None | None |
| `items` | If unspecified, the volume will expose a file whose name is the secret, relative to VolumeMount.mount_path. If specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify a path and a version. Structure is documented below. | false | false | This maps secret data into files and is more about structure | None | None |
| `cloud_sql_instance` | For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is documented below. | false | false | This specifies Cloud SQL connections but does not itself need any security controls | None | None |
| `empty_dir` | Ephemeral storage used as a shared volume. Structure is documented below. | false | false | This defines ephemeral storage and does not need any security policy | None | None |
| `gcs` | Cloud Storage bucket mounted as a volume using GCSFuse. Structure is documented below. | false | true | Controls access to Cloud Storage buckets mounted as volumes and reduces risk of unauthorized data access or modification. | Refer to child argument | Refer to child argument |
| `nfs` | NFS share mounted as a volume. Structure is documented below. | false | true | Manages shared file system access and helps enforce safe mounting to prevent unauthorized changes or data exposure. | Refer to child argument | Refer to child argument |
| `vpc_access` | VPC Access configuration to use for this Task. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_template_vpc_access). | false | true | Controls network connectivity for Cloud Run Jobs to restrict traffic flow and reduce data exfiltration risk | Refer to child argument | Refer to child argument |
| `network_interfaces` | Direct VPC egress settings. Currently only single network interface is supported. Structure is documented below. | false | false | This defines network configuration and does not require restriction as it does not directly enforce security. | None | None |
| `node_selector` | Node Selector describes the hardware requirements of the resources. Structure is documented below. | false | false | This defines hardware selection and does not require restriction since it does not affect security. | None | None |

### template Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 ExecutionTemplate. | false | false | No direct security risk as it only defines metadata for organization | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system annotations in v1 now have a corresponding field in v2 ExecutionTemplate. This field follows Kubernetes annotations' namespacing, limits, and rules. | false | false | No direct security risk as it only stores arbitrary metadata and does not influence security boundaries | None | None |
| `parallelism` | Specifies the maximum desired number of tasks the execution should run at given time. Must be <= taskCount. When the job is run, if this field is 0 or unset, the maximum possible value will be used for that execution. The actual number of tasks running in steady state will be less than this number when there are fewer tasks waiting to be completed remaining, i.e. when the work left to do is less than max parallelism. | false | false | No direct security risk as it only controls task concurrency  | None | None |
| `task_count` | Specifies the desired number of tasks the execution should run. Setting to 1 means that parallelism is limited to 1 and the success of that task signals the success of the execution. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/ | false | false | No direct security risk as it only defines workload scaling | None | None |
| `template` | Describes the task(s) that will be created when executing an execution Structure is [documented below](#nested_template_template). | true | true | Controls the actual task execution environment, ensuring runtime components are securely configured and follow least-privilege and hardened execution standards. | Refer to child argument | Refer to child argument |
| `containers` | Holds the single container that defines the unit of execution for this task. Structure is [documented below](#nested_template_template_containers). | false | true | Defines the runtime execution unit and enforces secure container configuration to prevent untrusted code execution and supply chain risks. | Refer to child argument | Refer to child argument |
| `volumes` | A list of Volumes to make available to containers. Structure is [documented below](#nested_template_template_volumes). | false | false | No direct security risk directly as configuration details are enforced at child arguments, and this field only groups volume definitions. | None | None |
| `timeout` | Max allowed time duration the Task may be active before the system will actively try to mark it failed and kill associated containers. This applies per attempt of a task, meaning each retry can run for the full timeout. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | No direct security risk as it only defines execution duration limits  | None | None |
| `service_account` | Email address of the IAM service account associated with the Task of a Job. The service account represents the identity of the running task, and determines what permissions the task has. If not provided, the task will use the project's default service account. | false | true | Prevents privilege escalation risks by blocking default service accounts and enforcing least-privileged dedicated identities for Cloud Run Jobs. | my-sa@my-project.iam.gserviceaccount.com |  |
| `execution_environment` | The execution environment being used to host this Task. Possible values are: `EXECUTION_ENVIRONMENT_GEN1`, `EXECUTION_ENVIRONMENT_GEN2`. | false | false | No direct security risk as it selects the runtime environment version without directly affecting security controls. | None | None |
| `encryption_key` | A reference to a customer managed encryption key (CMEK) to use to encrypt this container image. For more information, go to https://cloud.google.com/run/docs/securing/using-cmek | false | true | Enforces use of approved customer-managed encryption keys (CMEK) from authorized KMS key rings and regions to ensure controlled data encryption. | projects/my-project/locations/australia-southeast1/keyRings/run-keys/cryptoKeys/job-key | projects/my-project/locations/us-central1/keyRings/unsafe-keys/cryptoKeys/unsafe-key, projects/my-project/locations/australia-southeast1/keyRings/unsafe-keys/cryptoKeys/unsafe-key |
| `vpc_access` | VPC Access configuration to use for this Task. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_template_vpc_access). | false | true | Controls network connectivity for Cloud Run Jobs to restrict traffic flow and reduce data exfiltration risk | Refer to child argument | Refer to child argument |
| `max_retries` | Number of retries allowed per Task, before marking this Task failed. Defaults to 3. Minimum value is 0. | false | true | Prevents retry-based resource exhaustion and abuse by limiting max retries, reducing the risk of denial-of-service conditions | 3 | 10 |
| `node_selector` | Node Selector describes the hardware requirements of the resources. Structure is [documented below](#nested_template_template_node_selector). | false | false | ot introduce direct security risk as it specifies hardware preferences | None | None |
| `gpu_zonal_redundancy_disabled` | True if GPU zonal redundancy is disabled on this execution. | false | false | No direct security risk as it controls availability characteristics and does not affect security mechanisms. | None | None |

### binary_authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `breakglass_justification` | If present, indicates to use Breakglass using this justification. If useDefault is False, then it must be empty. For more information on breakglass, see https://cloud.google.com/binary-authorization/docs/using-breakglass | false | false | No direct security risk as it only provides a justification string for an override mechanism. | None | None |
| `use_default` | If True, indicates to use the default project's binary authorization policy. If False, binary authorization will be disabled. | false | true | Ensures only trusted and verified container images are deployed by enforcing Binary Authorization. | True | False |
| `policy` | The path to a binary authorization policy. Format: projects/{project}/platforms/cloudRun/{policy-name} | false | false | No direct security risk as it only references a policy resource or the location path | None | None |

### containers Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the container specified as a DNS_LABEL. | false | false | No direct security risk as it only defines a container identifier. | None | None |
| `image` | URL of the Container image in Google Container Registry or Google Artifact Registry. More info: https://kubernetes.io/docs/concepts/containers/images | true | true | Enforces use of approved container registries like Artifact Registry by blocking images from public registries to reduce supply chain risk. | us-docker.pkg.dev/cloudrun/container/job | gcr.io/my-project/unauthorized-image |
| `command` | Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell | false | false | No direct security risk as it defines runtime behavior but does not inherently introduce security control weaknesses | None | None |
| `args` | Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references are not supported in Cloud Run. | false | false | No direct security risk as it provides runtime arguments | None | None |
| `env` | List of environment variables to set in the container. Structure is [documented below](#nested_template_template_containers_containers_env). | false | true | Controls environment variables for containers and helps prevent sensitive data exposure through insecure configuration. | Refer to child argument | Refer to child argument |
| `resources` | Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is [documented below](#nested_template_template_containers_containers_resources). | false | false | No direct security risk as it defines compute allocation | None | None |
| `ports` | List of ports to expose from the container. Only a single port can be specified. The specified ports must be listening on all interfaces (0.0.0.0) within the container to be accessible. If omitted, a port number will be chosen and passed to the container through the PORT environment variable for the container to listen on Structure is [documented below](#nested_template_template_containers_containers_ports). | false | false | No direct security risk as it exposes container ports but does not itself control network security boundaries. | None | None |
| `volume_mounts` | Volume to mount into the container's filesystem. Structure is [documented below](#nested_template_template_containers_containers_volume_mounts). | false | false |  No direct security risk directly as security considerations are handled within the volume configuration itself. | None | None |
| `working_dir` | Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. | false | false | No direct security risk as it defines runtime directory context. | None | None |
| `depends_on` | Names of the containers that must start before this container. | false | false | No direct security risk as it controls startup order. | None | None |
| `startup_probe` | Startup probe of application within the container. All other probes are disabled if a startup probe is provided, until it succeeds. Container will not be added to service endpoints if the probe fails. Structure is [documented below](#nested_template_template_containers_containers_startup_probe). | false | false | No direct security risk as it defines health checks and does not affect access control or data security. | None | None |

### env Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the environment variable. Must be a C_IDENTIFIER, and mnay not exceed 32768 characters. | true | false | No direct security risk as it defines environment variable names without exposing sensitive values. | None | None |
| `value` | Literal value of the environment variable. Defaults to "" and the maximum allowed length is 32768 characters. Variable references are not supported in Cloud Run. | false | true | Prevents exposure of sensitive data by disallowing plaintext environment variables and enforcing use of secure secret sources. | None | hard-coded-secret value, i.e, using this is not secure |
| `value_source` | Source for the environment variable's value. Structure is [documented below](#nested_template_template_containers_containers_env_env_value_source). | false | true | Ensures environment variable values are securely sourced instead of being hardcoded, reducing secret leakage risk | Refer to child argument | Refer to child argument |

### value_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_key_ref` | Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_template_containers_containers_env_env_value_source_secret_key_ref). | false | true | Enforces retrieval of sensitive values from Secret Manager to prevent exposure of credentials in configuration or code. | Refer to child argument | Refer to child argument |

### secret_key_ref Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret` | The name of the secret in Cloud Secret Manager. Format: {secretName} if the secret is in the same project. projects/{project}/secrets/{secretName} if the secret is in a different project. | true | true | Ensures environment variables source sensitive values from Secret Manager, improving security by avoiding hardcoded or exposed secrets. | api-key-secret, i.e., pointer to the secret | None |
| `version` | The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version. | true | false | No direct security risk as it defines only version details without any effect on security. | None | None |

### resources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `limits` | Only memory, CPU, and nvidia.com/gpu are supported. Use key `cpu` for CPU limit, `memory` for memory limit, `nvidia.com/gpu` for gpu limit. Note: The only supported values for CPU are '1', '2', '4', and '8'. Setting 4 CPU requires at least 2Gi of memory. The values of the map is string form of the 'quantity' k8s type: https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/apimachinery/pkg/api/resource/quantity.go | false | false | This only specifies upper limits for CPU, memory, or GPU usage and is related to performance | None | None |

### ports Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | If specified, used to specify which protocol to use. Allowed values are "http1" and "h2c". | false | false | This only indicates the protocol type for the port and does not impact security | None | None |
| `container_port` | Port number the container listens on. This must be a valid TCP port number, 0 < containerPort < 65536. | false | false | defines the port number used by the container and does not introduce any direct security implications. | None | None |

### volume_mounts Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | This must match the Name of a Volume. | true | false | This is just an identifier linking to a defined volume | None | None |
| `mount_path` | Path within the container at which the volume should be mounted. Must not contain ':'. For Cloud SQL volumes, it can be left empty, or must otherwise be /cloudsql. All instances defined in the Volume will be available as /cloudsql/[instance]. For more information on Cloud SQL volumes, visit https://cloud.google.com/sql/docs/mysql/connect-run | true | false | This specifies where the volume is mounted inside the container | None | None |

### startup_probe Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `initial_delay_seconds` | Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value is 240. | false | false | This defines timing behavior for health checks and has no impact on security controls. | None | None |
| `timeout_seconds` | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than periodSeconds. | false | false | This specifies probe timeout settings and does not influence security. | None | None |
| `period_seconds` | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value is 240. | false | false | This controls how frequently probes run and is operational rather than security-related. | None | None |
| `failure_threshold` | Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1. | false | false | This defines retry behavior for probes and does not introduce any security risk | None | None |
| `tcp_socket` | TcpSocket specifies an action involving a TCP port. Structure is [documented below](#nested_template_template_containers_containers_startup_probe_tcp_socket). | false | false | This defines a probe mechanism using TCP and is used for health checking. | None | None |
| `http_get` | HttpGet specifies the http request to perform. Structure is [documented below](#nested_template_template_containers_containers_startup_probe_http_get). | false | false | This defines HTTP-based health checks. | None | None |
| `grpc` | GRPC specifies an action involving a GRPC port. Structure is [documented below](#nested_template_template_containers_containers_startup_probe_grpc). | false | false | This defines gRPC-based health checks and is unrelated to security enforcement. | None | None |

### tcp_socket Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `port` | Port number to access on the container. Number must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | false | This specifies the port used for TCP checks and does not impact security. | None | None |

### http_get Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | Path to access on the HTTP server. If set, it should not be empty string. | false | false | This specifies the endpoint path for health checks and does not introduce security implications. | None | None |
| `port` | Port number to access on the container. Number must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | false | This defines the port for HTTP checks and is not related to security control. | None | None |
| `http_headers` | Custom headers to set in the request. HTTP allows repeated headers. Structure is [documented below](#nested_template_template_containers_containers_startup_probe_http_get_http_headers). | false | false | This allows custom headers for probes | None | None |

### http_headers Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The header field name. | true | false | This specifies the header name and does not need security measures. | None | None |
| `value` | The header field value. | false | false | This specifies the header value and does not need to enforce restrictions | None | None |

### grpc Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `port` | Port number to access on the container. Number must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. | false | false | This specifies the gRPC port | None | None |
| `service` | The name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md). If this is not specified, the default behavior is defined by gRPC. | false | false | This defines the service name for health checks | None | None |

### volumes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Volume's name. | true | false | This is just an identifier for the volume | None | None |
| `secret` | Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is [documented below](#nested_template_template_volumes_volumes_secret). | false | false | This argument enables mounting of secrets within volumes, and no restriction is applied here because the actual security enforcement is handled. | None | None |
| `cloud_sql_instance` | For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is [documented below](#nested_template_template_volumes_volumes_cloud_sql_instance). | false | false | This specifies Cloud SQL connections but does not itself need any security controls | None | None |
| `empty_dir` | Ephemeral storage used as a shared volume. Structure is [documented below](#nested_template_template_volumes_volumes_empty_dir). | false | false | This defines temporary storage and does not involve sensitive data protection mechanisms. | None | None |
| `gcs` | Cloud Storage bucket mounted as a volume using GCSFuse. Structure is [documented below](#nested_template_template_volumes_volumes_gcs). | false | true | Controls access to Cloud Storage buckets mounted as volumes and reduces risk of unauthorized data access or modification. | Refer to child argument | Refer to child argument |
| `nfs` | NFS share mounted as a volume. Structure is [documented below](#nested_template_template_volumes_volumes_nfs). | false | true | Manages shared file system access and helps enforce safe mounting to prevent unauthorized changes or data exposure. | Refer to child argument | Refer to child argument |

### secret Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret` | The name of the secret in Cloud Secret Manager. Format: {secret} if the secret is in the same project. projects/{project}/secrets/{secret} if the secret is in a different project. | true | false | This argument references a Secret Manager secret, and restriction is not applied here because access to the secret is already governed. | None | None |
| `default_mode` | Integer representation of mode bits to use on created files by default. Must be a value between 0000 and 0777 (octal), defaulting to 0444. Directories within the path are not affected by this setting. | false | false | This defines file permission defaults but does not need to be enforced with security policies. | None | None |
| `items` | If unspecified, the volume will expose a file whose name is the secret, relative to VolumeMount.mount_path. If specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify a path and a version. Structure is [documented below](#nested_template_template_volumes_volumes_secret_items). | false | false | This maps secret data into files and is more about structure | None | None |

### items Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The relative path of the secret in the container. | true | false | This just specifies file location for secrets | None | None |
| `version` | The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version | true | false | This just selects versions, does not require security policy | None | None |
| `mode` | Integer octal mode bits to use on this file, must be a value between 01 and 0777 (octal). If 0 or not set, the Volume's default mode will be used. | false | false | This defines permissions and does not require any security policy. | None | None |

### cloud_sql_instance Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `instances` | The Cloud SQL instance connection names, as can be found in https://console.cloud.google.com/sql/instances. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Format: {project}:{location}:{instance} | false | false | This lists database instances and does not need security enforcement | None | None |

### empty_dir Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `medium` | The different types of medium supported for EmptyDir. Default value is `MEMORY`. Possible values are: `MEMORY`. | false | false | This defines storage type and does not need security controls | None | None |
| `size_limit` | Limit on the storage usable by this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. This field's values are of the 'Quantity' k8s type: https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/quantity/. The default is nil which means that the limit is undefined. More info: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir. | false | false | This sets storage limits and is not related to security enforcment | None | None |

### gcs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | Name of the cloud storage bucket to back the volume. The resource service account must have permission to access the bucket. | true | false | This specifies a bucket name and does not require policies here. | None | None |
| `read_only` | If true, mount this volume as read-only in all mounts. If false, mount this volume as read-write. | false | true | Ensures Cloud Run services mount Cloud Storage volumes in read-only mode to prevent unauthorized or accidental modification of stored data. | True | False |
| `mount_options` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A list of flags to pass to the gcsfuse command for configuring this volume. Flags should be passed without leading dashes. | false | false | This defines mount behavior and does not need policy as it does not affect access control. | None | None |

### nfs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `server` | Hostname or IP address of the NFS server. | true | false | This specifies the server endpoint and does not require policy since network-level controls handle security. | None | None |
| `path` | Path that is exported by the NFS server. | false | false | This defines the shared path and does not need policy as it does not enforce access policies | None | None |
| `read_only` | If true, mount this volume as read-only in all mounts. | false | true | Ensures NFS-mounted volumes in Cloud Run services are set to read-only mode to prevent unauthorized or accidental modifications to shared file storage, reducing risk of data tampering. | True | False |

### vpc_access Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `connector` | VPC Access connector name. Format: projects/{project}/locations/{location}/connectors/{connector}, where {project} can be project id or number. | false | false | This specifies the connector to use and does not require restriction because security policies are enforced at the network configuration level. | None | None |
| `egress` | Traffic VPC egress settings. Possible values are: `ALL_TRAFFIC`, `PRIVATE_RANGES_ONLY`. | false | true | Reduces the risk of data being leaked outside the network by preventing Cloud Run Jobs from sending traffic to unrestricted external destinations. | PRIVATE_RANGES_ONLY | ALL_TRAFFIC |
| `network_interfaces` | Direct VPC egress settings. Currently only single network interface is supported. Structure is [documented below](#nested_template_template_vpc_access_network_interfaces). | false | false | This defines networking structure and does not need restriction since access control is managed separately. | None | None |

### network_interfaces Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The VPC network that the Cloud Run resource will be able to send traffic to. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If network is not specified, it will be looked up from the subnetwork. | false | false | This specifies the network and does not need restriction. | None | None |
| `subnetwork` | The VPC subnetwork that the Cloud Run resource will get IPs from. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If subnetwork is not specified, the subnetwork with the same name with the network will be used. | false | false | This defines subnetwork configuration and does not require restriction as it does not enforce security policies. | None | None |
| `tags` | Network tags applied to this Cloud Run job. | false | false | This defines network tags and does not need restriction because they do not directly control access. | None | None |

### node_selector Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `accelerator` | The GPU to attach to an instance. See https://cloud.google.com/run/docs/configuring/jobs/gpu for configuring GPU. | true | false | his specifies GPU usage and does not need restriction as it is not security-sensitive. | None | None |
