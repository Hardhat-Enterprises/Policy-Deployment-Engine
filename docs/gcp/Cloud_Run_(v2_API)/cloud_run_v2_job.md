## 🛡️ Policy Deployment Engine: `cloud_run_v2_job`

This section provides a concise policy evaluation for the `cloud_run_v2_job` resource in GCP.

Reference: [Terraform Registry – cloud_run_v2_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_job)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the Job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template`
- Description: (Required) The template used to create executions for this Job. Structure is [documented below](#nested_template).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the cloud run job
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 Job. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected on new resources. All system annotations in v1 now have a corresponding field in v2 Job. This field follows Kubernetes annotations' namespacing, limits, and rules. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client`
- Description: (Optional) Arbitrary identifier for the API client.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_version`
- Description: (Optional) Arbitrary version identifier for the API client.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `launch_stage`
- Description: (Optional) The launch stage as defined by [Google Cloud Platform Launch Stages](https://cloud.google.com/products#product-launch-stages). Cloud Run supports ALPHA, BETA, and GA. If no value is specified, GA is assumed. Set the launch stage to a preview stage on input to allow use of preview features in that stage. On read (or output), describes whether the resource uses preview features. For example, if ALPHA is provided as input, but only BETA and GA-level features are used, this field will be BETA on output. Possible values are: `UNIMPLEMENTED`, `PRELAUNCH`, `EARLY_ACCESS`, `ALPHA`, `BETA`, `GA`, `DEPRECATED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_authorization`
- Description: (Optional) Settings for the Binary Authorization feature. Structure is [documented below](#nested_binary_authorization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_execution_token`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A unique string used as a suffix creating a new execution upon job create or update. The Job will become ready when the execution is successfully started. The sum of job name and token length must be fewer than 63 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_execution_token`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A unique string used as a suffix creating a new execution upon job create or update. The Job will become ready when the execution is successfully completed. The sum of job name and token length must be fewer than 63 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: When a`terraform destroy` or `terraform apply` would delete the job, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the job will fail. When the field is set to false, deleting the job is allowed. <a name="nested_template"></a>The `template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 ExecutionTemplate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system annotations in v1 now have a corresponding field in v2 ExecutionTemplate. This field follows Kubernetes annotations' namespacing, limits, and rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parallelism`
- Description: (Optional) Specifies the maximum desired number of tasks the execution should run at given time. Must be <= taskCount. When the job is run, if this field is 0 or unset, the maximum possible value will be used for that execution. The actual number of tasks running in steady state will be less than this number when there are fewer tasks waiting to be completed remaining, i.e. when the work left to do is less than max parallelism.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `task_count`
- Description: (Optional) Specifies the desired number of tasks the execution should run. Setting to 1 means that parallelism is limited to 1 and the success of that task signals the success of the execution. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template`
- Description: (Required) Describes the task(s) that will be created when executing an execution Structure is [documented below](#nested_template_template). <a name="nested_template_template"></a>The `template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `containers`
- Description: (Optional) Holds the single container that defines the unit of execution for this task. Structure is [documented below](#nested_template_template_containers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volumes`
- Description: (Optional) A list of Volumes to make available to containers. Structure is [documented below](#nested_template_template_volumes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Max allowed time duration the Task may be active before the system will actively try to mark it failed and kill associated containers. This applies per attempt of a task, meaning each retry can run for the full timeout. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Email address of the IAM service account associated with the Task of a Job. The service account represents the identity of the running task, and determines what permissions the task has. If not provided, the task will use the project's default service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_environment`
- Description: (Optional) The execution environment being used to host this Task. Possible values are: `EXECUTION_ENVIRONMENT_GEN1`, `EXECUTION_ENVIRONMENT_GEN2`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key`
- Description: (Optional) A reference to a customer managed encryption key (CMEK) to use to encrypt this container image. For more information, go to https://cloud.google.com/run/docs/securing/using-cmek
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_access`
- Description: (Optional) VPC Access configuration to use for this Task. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_template_vpc_access).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_retries`
- Description: (Optional) Number of retries allowed per Task, before marking this Task failed. Defaults to 3. Minimum value is 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_selector`
- Description: (Optional) Node Selector describes the hardware requirements of the resources. Structure is [documented below](#nested_template_template_node_selector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpu_zonal_redundancy_disabled`
- Description: (Optional) True if GPU zonal redundancy is disabled on this execution. <a name="nested_template_template_containers"></a>The `containers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the container specified as a DNS_LABEL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Required) URL of the Container image in Google Container Registry or Google Artifact Registry. More info: https://kubernetes.io/docs/concepts/containers/images
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `command`
- Description: (Optional) Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references are not supported in Cloud Run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env`
- Description: (Optional) List of environment variables to set in the container. Structure is [documented below](#nested_template_template_containers_containers_env).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resources`
- Description: (Optional) Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is [documented below](#nested_template_template_containers_containers_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) List of ports to expose from the container. Only a single port can be specified. The specified ports must be listening on all interfaces (0.0.0.0) within the container to be accessible. If omitted, a port number will be chosen and passed to the container through the PORT environment variable for the container to listen on Structure is [documented below](#nested_template_template_containers_containers_ports).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_mounts`
- Description: (Optional) Volume to mount into the container's filesystem. Structure is [documented below](#nested_template_template_containers_containers_volume_mounts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `working_dir`
- Description: (Optional) Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `depends_on`
- Description: (Optional) Names of the containers that must start before this container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `startup_probe`
- Description: (Optional) Startup probe of application within the container. All other probes are disabled if a startup probe is provided, until it succeeds. Container will not be added to service endpoints if the probe fails. Structure is [documented below](#nested_template_template_containers_containers_startup_probe). <a name="nested_template_template_containers_containers_env"></a>The `env` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the environment variable. Must be a C_IDENTIFIER, and mnay not exceed 32768 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Literal value of the environment variable. Defaults to "" and the maximum allowed length is 32768 characters. Variable references are not supported in Cloud Run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value_source`
- Description: (Optional) Source for the environment variable's value. Structure is [documented below](#nested_template_template_containers_containers_env_env_value_source). <a name="nested_template_template_containers_containers_env_env_value_source"></a>The `value_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_key_ref`
- Description: (Optional) Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_template_containers_containers_env_env_value_source_secret_key_ref). <a name="nested_template_template_containers_containers_env_env_value_source_secret_key_ref"></a>The `secret_key_ref` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Required) The name of the secret in Cloud Secret Manager. Format: {secretName} if the secret is in the same project. projects/{project}/secrets/{secretName} if the secret is in a different project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version. <a name="nested_template_template_containers_containers_resources"></a>The `resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limits`
- Description: (Optional) Only memory, CPU, and nvidia.com/gpu are supported. Use key `cpu` for CPU limit, `memory` for memory limit, `nvidia.com/gpu` for gpu limit. Note: The only supported values for CPU are '1', '2', '4', and '8'. Setting 4 CPU requires at least 2Gi of memory. The values of the map is string form of the 'quantity' k8s type: https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/apimachinery/pkg/api/resource/quantity.go <a name="nested_template_template_containers_containers_ports"></a>The `ports` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) If specified, used to specify which protocol to use. Allowed values are "http1" and "h2c".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_port`
- Description: (Optional) Port number the container listens on. This must be a valid TCP port number, 0 < containerPort < 65536. <a name="nested_template_template_containers_containers_volume_mounts"></a>The `volume_mounts` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) This must match the Name of a Volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mount_path`
- Description: (Required) Path within the container at which the volume should be mounted. Must not contain ':'. For Cloud SQL volumes, it can be left empty, or must otherwise be /cloudsql. All instances defined in the Volume will be available as /cloudsql/[instance]. For more information on Cloud SQL volumes, visit https://cloud.google.com/sql/docs/mysql/connect-run <a name="nested_template_template_containers_containers_startup_probe"></a>The `startup_probe` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_delay_seconds`
- Description: (Optional) Number of seconds after the container has started before the probe is initiated. Defaults to 0 seconds. Minimum value is 0. Maximum value is 240.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout_seconds`
- Description: (Optional) Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. Maximum value is 3600. Must be smaller than periodSeconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `period_seconds`
- Description: (Optional) How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1. Maximum value is 240.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failure_threshold`
- Description: (Optional) Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tcp_socket`
- Description: (Optional) TcpSocket specifies an action involving a TCP port. Structure is [documented below](#nested_template_template_containers_containers_startup_probe_tcp_socket).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_get`
- Description: (Optional) HttpGet specifies the http request to perform. Structure is [documented below](#nested_template_template_containers_containers_startup_probe_http_get).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `grpc`
- Description: (Optional) GRPC specifies an action involving a GRPC port. Structure is [documented below](#nested_template_template_containers_containers_startup_probe_grpc). <a name="nested_template_template_containers_containers_startup_probe_tcp_socket"></a>The `tcp_socket` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port number to access on the container. Number must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort. <a name="nested_template_template_containers_containers_startup_probe_http_get"></a>The `http_get` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Path to access on the HTTP server. If set, it should not be empty string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port number to access on the container. Number must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_headers`
- Description: (Optional) Custom headers to set in the request. HTTP allows repeated headers. Structure is [documented below](#nested_template_template_containers_containers_startup_probe_http_get_http_headers). <a name="nested_template_template_containers_containers_startup_probe_http_get_http_headers"></a>The `http_headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The header field name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) The header field value. <a name="nested_template_template_containers_containers_startup_probe_grpc"></a>The `grpc` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port number to access on the container. Number must be in the range 1 to 65535. If not specified, defaults to the same value as container.ports[0].containerPort.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) The name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md). If this is not specified, the default behavior is defined by gRPC. <a name="nested_template_template_volumes"></a>The `volumes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Volume's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Optional) Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is [documented below](#nested_template_template_volumes_volumes_secret).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql_instance`
- Description: (Optional) For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is [documented below](#nested_template_template_volumes_volumes_cloud_sql_instance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `empty_dir`
- Description: (Optional) Ephemeral storage used as a shared volume. Structure is [documented below](#nested_template_template_volumes_volumes_empty_dir).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) Cloud Storage bucket mounted as a volume using GCSFuse. Structure is [documented below](#nested_template_template_volumes_volumes_gcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nfs`
- Description: (Optional) NFS share mounted as a volume. Structure is [documented below](#nested_template_template_volumes_volumes_nfs). <a name="nested_template_template_volumes_volumes_secret"></a>The `secret` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Required) The name of the secret in Cloud Secret Manager. Format: {secret} if the secret is in the same project. projects/{project}/secrets/{secret} if the secret is in a different project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_mode`
- Description: (Optional) Integer representation of mode bits to use on created files by default. Must be a value between 0000 and 0777 (octal), defaulting to 0444. Directories within the path are not affected by this setting.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `items`
- Description: (Optional) If unspecified, the volume will expose a file whose name is the secret, relative to VolumeMount.mount_path. If specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify a path and a version. Structure is [documented below](#nested_template_template_volumes_volumes_secret_items). <a name="nested_template_template_volumes_volumes_secret_items"></a>The `items` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) The relative path of the secret in the container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Integer octal mode bits to use on this file, must be a value between 01 and 0777 (octal). If 0 or not set, the Volume's default mode will be used. <a name="nested_template_template_volumes_volumes_cloud_sql_instance"></a>The `cloud_sql_instance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: (Optional) The Cloud SQL instance connection names, as can be found in https://console.cloud.google.com/sql/instances. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Format: {project}:{location}:{instance} <a name="nested_template_template_volumes_volumes_empty_dir"></a>The `empty_dir` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `medium`
- Description: (Optional) The different types of medium supported for EmptyDir. Default value is `MEMORY`. Possible values are: `MEMORY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size_limit`
- Description: (Optional) Limit on the storage usable by this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. This field's values are of the 'Quantity' k8s type: https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/quantity/. The default is nil which means that the limit is undefined. More info: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir. <a name="nested_template_template_volumes_volumes_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Name of the cloud storage bucket to back the volume. The resource service account must have permission to access the bucket.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_only`
- Description: (Optional) If true, mount this volume as read-only in all mounts. If false, mount this volume as read-write.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mount_options`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A list of flags to pass to the gcsfuse command for configuring this volume. Flags should be passed without leading dashes. <a name="nested_template_template_volumes_volumes_nfs"></a>The `nfs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server`
- Description: (Required) Hostname or IP address of the NFS server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Path that is exported by the NFS server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_only`
- Description: (Optional) If true, mount this volume as read-only in all mounts. <a name="nested_template_template_vpc_access"></a>The `vpc_access` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connector`
- Description: (Optional) VPC Access connector name. Format: projects/{project}/locations/{location}/connectors/{connector}, where {project} can be project id or number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `egress`
- Description: (Optional) Traffic VPC egress settings. Possible values are: `ALL_TRAFFIC`, `PRIVATE_RANGES_ONLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_interfaces`
- Description: (Optional) Direct VPC egress settings. Currently only single network interface is supported. Structure is [documented below](#nested_template_template_vpc_access_network_interfaces). <a name="nested_template_template_vpc_access_network_interfaces"></a>The `network_interfaces` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The VPC network that the Cloud Run resource will be able to send traffic to. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If network is not specified, it will be looked up from the subnetwork.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) The VPC subnetwork that the Cloud Run resource will get IPs from. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If subnetwork is not specified, the subnetwork with the same name with the network will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Network tags applied to this Cloud Run job. <a name="nested_template_template_node_selector"></a>The `node_selector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator`
- Description: (Required) The GPU to attach to an instance. See https://cloud.google.com/run/docs/configuring/jobs/gpu for configuring GPU. <a name="nested_binary_authorization"></a>The `binary_authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `breakglass_justification`
- Description: (Optional) If present, indicates to use Breakglass using this justification. If useDefault is False, then it must be empty. For more information on breakglass, see https://cloud.google.com/binary-authorization/docs/using-breakglass
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_default`
- Description: (Optional) If True, indicates to use the default project's binary authorization policy. If False, binary authorization will be disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy`
- Description: (Optional) The path to a binary authorization policy. Format: projects/{project}/platforms/cloudRun/{policy-name}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
