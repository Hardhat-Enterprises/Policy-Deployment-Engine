## 🛡️ Policy Deployment Engine: `cloud_run_v2_worker_pool`

This section provides a concise policy evaluation for the `cloud_run_v2_worker_pool` resource in GCP.

Reference: [Terraform Registry – cloud_run_v2_worker_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_worker_pool)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the WorkerPool. | true | false | This field only defines the resource name and does not affect security or access | None | None |
| `template` | The template used to create revisions for this WorkerPool. Structure is [documented below](#nested_template). | true | true | Ensures all revision configurations follow enforced security controls to prevent insecure workload deployment. | Refer to child argument | Refer to child argument |
| `location` | The location of the cloud run worker pool | true | true | Ensures Cloud Run WorkerPool runs only in approved Australian regions to meet compliance requirements while preventing deployment in unapproved locations. | australia-southeast1 | us-central1 |
| `description` | User-provided description of the WorkerPool. This field currently has a 512-character limit. | false | false | This is just user-provided text and does not impact security. | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with  `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 WorkerPool. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | This field is used for organizing resources and does not affect security. | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected in new resources. All system annotations in v1 now have a corresponding field in v2 WorkerPool. This field follows Kubernetes annotations' namespacing, limits, and rules. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | This stores metadata and does not influence security behavior. | None | None |
| `client` | Arbitrary identifier for the API client. | false | false | This is only an identifier for the API client and has no impact on security. | None | None |
| `client_version` | Arbitrary version identifier for the API client. | false | false | This tracks version information and does not affect security controls. | None | None |
| `launch_stage` | The launch stage as defined by [Google Cloud Platform Launch Stages](https://cloud.google.com/products#product-launch-stages). Cloud Run supports ALPHA, BETA, and GA. If no value is specified, GA is assumed. Set the launch stage to a preview stage on input to allow use of preview features in that stage. On read (or output), describes whether the resource uses preview features. For example, if ALPHA is provided as input, but only BETA and GA-level features are used, this field will be BETA on output. Possible values are: `UNIMPLEMENTED`, `PRELAUNCH`, `EARLY_ACCESS`, `ALPHA`, `BETA`, `GA`, `DEPRECATED`. | false | false | This defines feature release stage and does not directly impact security. | None | None |
| `binary_authorization` | Settings for the Binary Authorization feature. Structure is [documented below](#nested_binary_authorization). | false | true | Ensures only trusted and verified container images are deployed, preventing execution of malicious or unapproved code. | Refer to child argument | Refer to child argument |
| `custom_audiences` | One or more custom audiences that you want this worker pool to support. Specify each custom audience as the full URL in a string. The custom audiences are encoded in the token and used to authenticate requests. For more information, see https://cloud.google.com/run/docs/configuring/custom-audiences. | false | false | This defines token audiences but does not directly enforce or bypass security. | None | None |
| `scaling` | Scaling settings that apply to the worker pool. Structure is [documented below](#nested_scaling). | false | false | This is a grouping for scaling settings and does not directly affect security. | None | None |
| `instance_splits` | Specifies how to distribute instances over a collection of Revisions belonging to the WorkerPool. If instance split is empty or not provided, defaults to 100% instances assigned to the latest Ready Revision. Structure is [documented below](#nested_instance_splits). | false | false | This is a grouping for traffic distribution and does not impact security. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | This only specifies project context and does not directly affect security. | None | None |
| `deletion_protection` | When a`terraform destroy` or `terraform apply` would delete the service, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the WorkerPool will fail. When the field is set to false, deleting the WorkerPool is allowed. | false | true | Ensures that deletion protection is enabled to prevent accidental or unauthorized removal of the Worker Pool, protecting from unintended destruction during operations | True | False |
| `vpc_access` | VPC Access configuration to use for this Revision. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_vpc_access). | false | true | Ensures network connectivity is controlled to prevent unauthorized access and reduce exposure to external threats. | Refer to child argument | Refer to child argument |
| `network_interfaces` | Direct VPC egress settings. Currently only single network interface is supported. Structure is documented below. | false | false | This is a grouping field and does not directly impact security. | None | None |
| `containers` | Holds the containers that define the unit of execution for this WorkerPool. Structure is [documented below](#nested_template_containers). | false | true | Ensures container configurations enforce security best practices to prevent vulnerabilities and unauthorized execution. | Refer to child argument | Refer to child argument |
| `env` | List of environment variables to set in the container. Structure is [documented below](#nested_template_containers_containers_env). | false | true | Ensures sensitive values are sourced securely, preventing hardcoding and reducing the risk of data leakage. | Refer to child argument | Refer to child argument |
| `value_source` | Source for the environment variable's value. Structure is [documented below](#nested_template_containers_containers_env_env_value_source). | false | true | Ensures environment variables are securely sourced from trusted systems instead of being hardcoded in configuration. | Refer to child argument | Refer to child argument |
| `secret_key_ref` | Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_containers_containers_env_env_value_source_secret_key_ref). | false | true | Ensures secrets are retrieved securely from Secret Manager to prevent credential leakage. | Refer to child argument | Refer to child argument |
| `resources` | Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is documented below. | false | false | This block defines compute resource allocation such as CPU and memory, which is related to performance and scaling, not security enforcement, so no policy is needed. | None | None |
| `volume_mounts` | Volume to mount into the container's filesystem. Structure is documented below. | false | false | This describes how volumes are mounted into the container, but the actual security is governed by the source of the volume, so this mapping itself does not need a policy. | None | None |
| `volumes` | A list of Volumes to make available to containers. Structure is [documented below](#nested_template_volumes). | false | true | Ensures mounted storage is securely configured to prevent unauthorized data access or leakage. | Refer to child argument | Refer to child argument |
| `secret` | Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is [documented below](#nested_template_volumes_volumes_secret). | false | true | Ensures only authorized secrets are mounted, preventing exposure of sensitive data to unauthorized workloads. | Refer to child argument | Refer to child argument |
| `items` | If unspecified, the volume will expose a file whose name is the secret, relative to VolumeMount.mount_path. If specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify a path and a version. Structure is documented below. | false | false | This maps secret data into files and is more about structure | None | None |
| `cloud_sql_instance` | For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is documented below. | false | false | This specifies Cloud SQL connections but does not itself need any security controls | None | None |
| `empty_dir` | Ephemeral storage used as a shared volume. Structure is [documented below](#nested_template_volumes_volumes_empty_dir). | false | true | Ensures ephemeral storage usage is controlled to prevent resource abuse and unintended data persistence risks. | Refer to child argument | Refer to child argument |
| `gcs` | Cloud Storage bucket mounted as a volume using GCSFuse. This feature is only supported in the gen2 execution environment. Structure is documented below. | false | true | Controls access to Cloud Storage buckets mounted as volumes and reduces risk of unauthorized data access or modification. | Refer to child argument | Refer to child argument |
| `nfs` | Represents an NFS mount. Structure is documented below. | false | true | Manages shared file system access and helps enforce safe mounting to prevent unauthorized changes or data exposure. | Refer to child argument | Refer to child argument |
| `node_selector` | Node Selector describes the hardware requirements of the resources. Structure is documented below. | false | false | This defines infrastructure placement constraints and does not interact with security controls. | None | None |

### template Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `revision` | The unique name for the revision. If this field is omitted, it will be automatically generated based on the WorkerPool name. | false | false | This defines a revision name and does not affect security. | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 WorkerPoolRevisionTemplate. | false | false | This is metadata and does not impact security. | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system annotations in v1 now have a corresponding field in v2 WorkerPoolRevisionTemplate. This field follows Kubernetes annotations' namespacing, limits, and rules. | false | false | This stores metadata and does not influence security. | None | None |
| `vpc_access` | VPC Access configuration to use for this Revision. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_vpc_access). | false | true | Ensures network connectivity is controlled to prevent unauthorized access and reduce exposure to external threats. | Refer to child argument | Refer to child argument |
| `service_account` | Email address of the IAM service account associated with the revision of the WorkerPool. The service account represents the identity of the running revision, and determines what permissions the revision has. If not provided, the revision will use the project's default service account. | false | true | Enforces use of a dedicated least-privileged service account instead of the default one to reduce the risk of excessive permissions and limit potential blast radius from compromise. | my-sa@my-project.iam.gserviceaccount.com |  |
| `containers` | Holds the containers that define the unit of execution for this WorkerPool. Structure is [documented below](#nested_template_containers). | false | true | Ensures container configurations enforce security best practices to prevent vulnerabilities and unauthorized execution. | Refer to child argument | Refer to child argument |
| `volumes` | A list of Volumes to make available to containers. Structure is [documented below](#nested_template_volumes). | false | true | Ensures mounted storage is securely configured to prevent unauthorized data access or leakage. | Refer to child argument | Refer to child argument |
| `encryption_key` | A reference to a customer managed encryption key (CMEK) to use to encrypt this container image. For more information, go to https://cloud.google.com/run/docs/securing/using-cmek | false | true | Enforces use of a customer-managed encryption key (CMEK) to ensure container images are encrypted with organization-approved keys, supporting centralized key control, security, and compliance with data residency requirements. | projects/my-project/locations/australia-southeast1/keyRings/my-keyring/cryptoKeys/my-key | projects/my-project/locations/us-central1/keyRings/random-keys/cryptoKeys/random-key |
| `encryption_key_revocation_action` | The action to take if the encryption key is revoked. Possible values are: `PREVENT_NEW`, `SHUTDOWN`. | false | true | Ensures workloads are shut down when the CMEK is revoked to prevent running on unencrypted or unauthorized keys, maintaining encryption enforcement and data security. | SHUTDOWN | PREVENT_NEW |
| `encryption_key_shutdown_duration` | If encryptionKeyRevocationAction is SHUTDOWN, the duration before shutting down all instances. The minimum increment is 1 hour. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | This defines shutdown timing and does not directly affect security. | None | None |
| `node_selector` | Node Selector describes the hardware requirements of the resources. Structure is [documented below](#nested_template_node_selector). | false | false | This specifies hardware requirements and does not impact security. | None | None |
| `gpu_zonal_redundancy_disabled` | True if GPU zonal redundancy is disabled on this revision. | false | false | This affects availability and does not impact security. | None | None |

### binary_authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `breakglass_justification` | If present, indicates to use Breakglass using this justification. If useDefault is False, then it must be empty. For more information on breakglass, see https://cloud.google.com/binary-authorization/docs/using-breakglass | false | false | This only provides a justification string and does not itself enforce or bypass security. | None | None |
| `use_default` | If True, indicates to use the default project's binary authorization policy. If False, binary authorization will be disabled. | false | true | Ensures that the default Binary Authorization policy is enabled to enforce verification. | True | False |
| `policy` | The path to a binary authorization policy. Format: projects/{project}/platforms/cloudRun/{policy-name} | false | false | This references a policy and does not directly enforce security behavior. | None | None |

### scaling Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scaling_mode` | The scaling mode for the worker pool. It defaults to MANUAL. Possible values are: `AUTOMATIC`, `MANUAL`. | false | false | This defines scaling behavior and does not affect security. | None | None |
| `min_instance_count` | The minimum count of instances distributed among revisions based on the specified instance split percentages. | false | false | This controls minimum instances and does not impact security. | None | None |
| `max_instance_count` | The maximum count of instances distributed among revisions based on the specified instance split percentages. | false | false | This controls maximum instances and does not impact security. | None | None |
| `manual_instance_count` | The total number of instances in manual scaling mode. | false | false | This sets instance count and does not affect security. | None | None |

### instance_splits Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The allocation type for this instance split. Possible values are: `INSTANCE_SPLIT_ALLOCATION_TYPE_LATEST`, `INSTANCE_SPLIT_ALLOCATION_TYPE_REVISION`. | false | false | This defines allocation type and does not affect security. | None | None |
| `revision` | Revision to which to assign this portion of instances, if split allocation is by revision. | false | false | This selects a revision and does not impact security. | None | None |
| `percent` | Specifies percent of the instance split to this Revision. This defaults to zero if unspecified. | false | false | This controls distribution percentage and does not affect security. | None | None |

### vpc_access Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `egress` | Traffic VPC egress settings. Possible values are: `ALL_TRAFFIC`, `PRIVATE_RANGES_ONLY`. | false | true | Ensures network traffic is restricted to private ranges only, reducing the risk of unauthorized external communication and limiting potential data exfiltration paths from the workload. | PRIVATE_RANGES_ONLY | ALL_TRAFFIC |
| `network_interfaces` | Direct VPC egress settings. Currently only single network interface is supported. Structure is [documented below](#nested_template_vpc_access_network_interfaces). | false | false | This is a grouping field and does not directly impact security. | None | None |

### network_interfaces Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The VPC network that the Cloud Run resource will be able to send traffic to. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If network is not specified, it will be looked up from the subnetwork. | false | false | This defines network reference and does not enforce security. | None | None |
| `subnetwork` | The VPC subnetwork that the Cloud Run resource will get IPs from. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If subnetwork is not specified, the subnetwork with the same name with the network will be used. | false | false | This defines subnetwork reference and does not directly affect security. | None | None |
| `tags` | Network tags applied to this Cloud Run WorkerPool. | false | false | This is metadata for networking and does not impact security. | None | None |

### containers Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the container specified as a DNS_LABEL. | false | false | This defines container name and does not impact security. | None | None |
| `image` | URL of the Container image in Google Container Registry or Google Artifact Registry. More info: https://kubernetes.io/docs/concepts/containers/images | true | true | Restricts use of public container registries to prevent unverified images and enforce secure images from approved Artifact Registry. | us-docker.pkg.dev/cloudrun/container/worker-pool | gcr.io/my-project/unauthorized-image |
| `command` | Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell | false | false | This defines runtime command and does not directly affect security. | None | None |
| `args` | Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references are not supported in Cloud Run. | false | false | This provides arguments and does not impact security. | None | None |
| `env` | List of environment variables to set in the container. Structure is [documented below](#nested_template_containers_containers_env). | false | true | Ensures sensitive values are sourced securely, preventing hardcoding and reducing the risk of data leakage. | Refer to child argument | Refer to child argument |
| `resources` | Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is [documented below](#nested_template_containers_containers_resources). | false | false | This defines compute resources and does not affect security. | None | None |
| `volume_mounts` | Volume to mount into the container's filesystem. Structure is [documented below](#nested_template_containers_containers_volume_mounts). | false | false | This mounts volumes but security is handled at volume level. | None | None |
| `working_dir` | Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. | false | false | This sets working directory and does not affect security. | None | None |
| `depends_on` | Containers which should be started before this container. If specified the container will wait to start until all containers with the listed names are healthy. | false | false | This controls startup order and does not impact security. | None | None |

### env Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the environment variable. Must be a C_IDENTIFIER, and may not exceed 32768 characters. | true | false | This defines environment variable name and does not expose sensitive data. | None | None |
| `value` | Literal value of the environment variable. Defaults to "" and the maximum allowed length is 32768 characters. Variable references are not supported in Cloud Run. | false | false | This is a value field but does not enforce or control security itself. | None | None |
| `value_source` | Source for the environment variable's value. Structure is [documented below](#nested_template_containers_containers_env_env_value_source). | false | true | Ensures environment variables are securely sourced from trusted systems instead of being hardcoded in configuration. | Refer to child argument | Refer to child argument |

### value_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_key_ref` | Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_containers_containers_env_env_value_source_secret_key_ref). | false | true | Ensures secrets are retrieved securely from Secret Manager to prevent credential leakage. | Refer to child argument | Refer to child argument |

### secret_key_ref Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret` | The name of the secret in Cloud Secret Manager. Format: {secretName} if the secret is in the same project. projects/{project}/secrets/{secretName} if the secret is in a different project. | true | true | Ensures sensitive environment variables are securely retrieved from Secret Manager instead of being hardcoded or exposed in configuration, reducing the risk of credential leakage. | projects/my-project/secrets/api-key | None |
| `version` | The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version. | false | false | This selects a version and does not require security policy. | None | None |

### resources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `limits` | Only memory, CPU, and nvidia.com/gpu are supported. Use key `cpu` for CPU limit, `memory` for memory limit, `nvidia.com/gpu` for gpu limit. Note: The only supported values for CPU are '1', '2', '4', and '8'. Setting 4 CPU requires at least 2Gi of memory. The values of the map is string form of the 'quantity' k8s type: https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/apimachinery/pkg/api/resource/quantity.go | false | false | This sets upper bounds on resource usage, which is purely operational and does not affect access control or data protection, so no security policy is required. | None | None |

### volume_mounts Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | This must match the Name of a Volume. | true | false | This is just a reference to a volume identifier and does not need security policy. | None | None |
| `mount_path` | Path within the container at which the volume should be mounted. Must not contain ':'. For Cloud SQL volumes, it can be left empty, or must otherwise be /cloudsql. All instances defined in the Volume will be available as /cloudsql/[instance]. For more information on Cloud SQL volumes, visit https://cloud.google.com/sql/docs/mysql/connect-run | true | false | This defines where the volume is mounted inside the container, which is a filesystem detail and does not enforce or bypass any access control, so no policy is needed. | None | None |

### volumes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Volume's name. | true | false | This is just an identifier for the volume | None | None |
| `secret` | Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is [documented below](#nested_template_volumes_volumes_secret). | false | true | Ensures only authorized secrets are mounted, preventing exposure of sensitive data to unauthorized workloads. | Refer to child argument | Refer to child argument |
| `cloud_sql_instance` | For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is [documented below](#nested_template_volumes_volumes_cloud_sql_instance). | false | false | This specifies connectivity configuration to Cloud SQL, while actual access is controlled through IAM and database authentication, so this field itself does not require a policy. | None | None |
| `empty_dir` | Ephemeral storage used as a shared volume. Structure is [documented below](#nested_template_volumes_volumes_empty_dir). | false | true | Ensures ephemeral storage usage is controlled to prevent resource abuse and unintended data persistence risks. | Refer to child argument | Refer to child argument |
| `gcs` | Cloud Storage bucket mounted as a volume using GCSFuse. This feature is only supported in the gen2 execution environment. Structure is [documented below](#nested_template_volumes_volumes_gcs). | false | true | Controls access to Cloud Storage buckets mounted as volumes and reduces risk of unauthorized data access or modification. | Refer to child argument | Refer to child argument |
| `nfs` | Represents an NFS mount. Structure is [documented below](#nested_template_volumes_volumes_nfs). | false | true | Manages shared file system access and helps enforce safe mounting to prevent unauthorized changes or data exposure. | Refer to child argument | Refer to child argument |

### secret Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret` | The name of the secret in Cloud Secret Manager. Format: {secret} if the secret is in the same project. projects/{project}/secrets/{secret} if the secret is in a different project. | true | true | Ensure only approved Secret Manager secrets are mounted in volumes to prevent exposure of unauthorized data. | projects/my-project/secrets/api-key | projects/untrusted-project/secrets/unknown-secret |
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
| `medium` | The different types of medium supported for EmptyDir. Default value is `MEMORY`. Possible values are: `MEMORY`. | false | false | This defines temporary storage within the container lifecycle, which does not persist or expose data externally, so no policy is required. | None | None |
| `size_limit` | Limit on the storage usable by this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. This field's values are of the 'Quantity' k8s type: https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/quantity/. The default is nil which means that the limit is undefined. More info: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir. | false | true | Limits EmptyDir storage size to approved thresholds to prevent resource exhaustion, and potential denial-of-service risks. | 256Mi | 2Gi |

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

### node_selector Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `accelerator` | The GPU to attach to an instance. See https://cloud.google.com/run/docs/configuring/services/gpu for configuring GPU. | true | false | This specifies GPU usage and is purely a hardware configuration detail with no impact on security. | None | None |
