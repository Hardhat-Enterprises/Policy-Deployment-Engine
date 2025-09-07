## 🛡️ Policy Deployment Engine: `cloud_run_v2_worker_pool`

This section provides a concise policy evaluation for the `cloud_run_v2_worker_pool` resource in GCP.

Reference: [Terraform Registry – cloud_run_v2_worker_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_worker_pool)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the WorkerPool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template`
- Description: (Required) The template used to create revisions for this WorkerPool. Structure is [documented below](#nested_template).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the cloud run worker pool
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description of the WorkerPool. This field currently has a 512-character limit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with  `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 WorkerPool. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected in new resources. All system annotations in v1 now have a corresponding field in v2 WorkerPool. This field follows Kubernetes annotations' namespacing, limits, and rules. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
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

### `custom_audiences`
- Description: (Optional) One or more custom audiences that you want this worker pool to support. Specify each custom audience as the full URL in a string. The custom audiences are encoded in the token and used to authenticate requests. For more information, see https://cloud.google.com/run/docs/configuring/custom-audiences.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scaling`
- Description: (Optional) Scaling settings that apply to the worker pool. Structure is [documented below](#nested_scaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_splits`
- Description: (Optional) Specifies how to distribute instances over a collection of Revisions belonging to the WorkerPool. If instance split is empty or not provided, defaults to 100% instances assigned to the latest Ready Revision. Structure is [documented below](#nested_instance_splits).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: When a`terraform destroy` or `terraform apply` would delete the service, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the WorkerPool will fail. When the field is set to false, deleting the WorkerPool is allowed. <a name="nested_template"></a>The `template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `revision`
- Description: (Optional) The unique name for the revision. If this field is omitted, it will be automatically generated based on the WorkerPool name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 WorkerPoolRevisionTemplate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system annotations in v1 now have a corresponding field in v2 WorkerPoolRevisionTemplate. This field follows Kubernetes annotations' namespacing, limits, and rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_access`
- Description: (Optional) VPC Access configuration to use for this Revision. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_vpc_access).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Email address of the IAM service account associated with the revision of the WorkerPool. The service account represents the identity of the running revision, and determines what permissions the revision has. If not provided, the revision will use the project's default service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `containers`
- Description: (Optional) Holds the containers that define the unit of execution for this WorkerPool. Structure is [documented below](#nested_template_containers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volumes`
- Description: (Optional) A list of Volumes to make available to containers. Structure is [documented below](#nested_template_volumes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key`
- Description: (Optional) A reference to a customer managed encryption key (CMEK) to use to encrypt this container image. For more information, go to https://cloud.google.com/run/docs/securing/using-cmek
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key_revocation_action`
- Description: (Optional) The action to take if the encryption key is revoked. Possible values are: `PREVENT_NEW`, `SHUTDOWN`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key_shutdown_duration`
- Description: (Optional) If encryptionKeyRevocationAction is SHUTDOWN, the duration before shutting down all instances. The minimum increment is 1 hour. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_selector`
- Description: (Optional) Node Selector describes the hardware requirements of the resources. Structure is [documented below](#nested_template_node_selector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpu_zonal_redundancy_disabled`
- Description: (Optional) True if GPU zonal redundancy is disabled on this revision. <a name="nested_template_vpc_access"></a>The `vpc_access` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `egress`
- Description: (Optional) Traffic VPC egress settings. Possible values are: `ALL_TRAFFIC`, `PRIVATE_RANGES_ONLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_interfaces`
- Description: (Optional) Direct VPC egress settings. Currently only single network interface is supported. Structure is [documented below](#nested_template_vpc_access_network_interfaces). <a name="nested_template_vpc_access_network_interfaces"></a>The `network_interfaces` block supports:
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
- Description: (Optional) Network tags applied to this Cloud Run WorkerPool. <a name="nested_template_containers"></a>The `containers` block supports:
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
- Description: (Optional) List of environment variables to set in the container. Structure is [documented below](#nested_template_containers_containers_env).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resources`
- Description: (Optional) Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is [documented below](#nested_template_containers_containers_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_mounts`
- Description: (Optional) Volume to mount into the container's filesystem. Structure is [documented below](#nested_template_containers_containers_volume_mounts).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `working_dir`
- Description: (Optional) Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `depends_on`
- Description: (Optional) Containers which should be started before this container. If specified the container will wait to start until all containers with the listed names are healthy. <a name="nested_template_containers_containers_env"></a>The `env` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the environment variable. Must be a C_IDENTIFIER, and may not exceed 32768 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Literal value of the environment variable. Defaults to "" and the maximum allowed length is 32768 characters. Variable references are not supported in Cloud Run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value_source`
- Description: (Optional) Source for the environment variable's value. Structure is [documented below](#nested_template_containers_containers_env_env_value_source). <a name="nested_template_containers_containers_env_env_value_source"></a>The `value_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_key_ref`
- Description: (Optional) Selects a secret and a specific version from Cloud Secret Manager. Structure is [documented below](#nested_template_containers_containers_env_env_value_source_secret_key_ref). <a name="nested_template_containers_containers_env_env_value_source_secret_key_ref"></a>The `secret_key_ref` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Required) The name of the secret in Cloud Secret Manager. Format: {secretName} if the secret is in the same project. projects/{project}/secrets/{secretName} if the secret is in a different project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version. <a name="nested_template_containers_containers_resources"></a>The `resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limits`
- Description: (Optional) Only memory, CPU, and nvidia.com/gpu are supported. Use key `cpu` for CPU limit, `memory` for memory limit, `nvidia.com/gpu` for gpu limit. Note: The only supported values for CPU are '1', '2', '4', and '8'. Setting 4 CPU requires at least 2Gi of memory. The values of the map is string form of the 'quantity' k8s type: https://github.com/kubernetes/kubernetes/blob/master/staging/src/k8s.io/apimachinery/pkg/api/resource/quantity.go <a name="nested_template_containers_containers_volume_mounts"></a>The `volume_mounts` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) This must match the Name of a Volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mount_path`
- Description: (Required) Path within the container at which the volume should be mounted. Must not contain ':'. For Cloud SQL volumes, it can be left empty, or must otherwise be /cloudsql. All instances defined in the Volume will be available as /cloudsql/[instance]. For more information on Cloud SQL volumes, visit https://cloud.google.com/sql/docs/mysql/connect-run <a name="nested_template_volumes"></a>The `volumes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Volume's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Optional) Secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret Structure is [documented below](#nested_template_volumes_volumes_secret).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_sql_instance`
- Description: (Optional) For Cloud SQL volumes, contains the specific instances that should be mounted. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Structure is [documented below](#nested_template_volumes_volumes_cloud_sql_instance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `empty_dir`
- Description: (Optional) Ephemeral storage used as a shared volume. Structure is [documented below](#nested_template_volumes_volumes_empty_dir).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs`
- Description: (Optional) Cloud Storage bucket mounted as a volume using GCSFuse. This feature is only supported in the gen2 execution environment. Structure is [documented below](#nested_template_volumes_volumes_gcs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nfs`
- Description: (Optional) Represents an NFS mount. Structure is [documented below](#nested_template_volumes_volumes_nfs). <a name="nested_template_volumes_volumes_secret"></a>The `secret` block supports:
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
- Description: (Optional) If unspecified, the volume will expose a file whose name is the secret, relative to VolumeMount.mount_path. If specified, the key will be used as the version to fetch from Cloud Secret Manager and the path will be the name of the file exposed in the volume. When items are defined, they must specify a path and a version. Structure is [documented below](#nested_template_volumes_volumes_secret_items). <a name="nested_template_volumes_volumes_secret_items"></a>The `items` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) The relative path of the secret in the container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) The Cloud Secret Manager secret version. Can be 'latest' for the latest value or an integer for a specific version
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Integer octal mode bits to use on this file, must be a value between 01 and 0777 (octal). If 0 or not set, the Volume's default mode will be used. <a name="nested_template_volumes_volumes_cloud_sql_instance"></a>The `cloud_sql_instance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: (Optional) The Cloud SQL instance connection names, as can be found in https://console.cloud.google.com/sql/instances. Visit https://cloud.google.com/sql/docs/mysql/connect-run for more information on how to connect Cloud SQL and Cloud Run. Format: {project}:{location}:{instance} <a name="nested_template_volumes_volumes_empty_dir"></a>The `empty_dir` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `medium`
- Description: (Optional) The different types of medium supported for EmptyDir. Default value is `MEMORY`. Possible values are: `MEMORY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size_limit`
- Description: (Optional) Limit on the storage usable by this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. This field's values are of the 'Quantity' k8s type: https://kubernetes.io/docs/reference/kubernetes-api/common-definitions/quantity/. The default is nil which means that the limit is undefined. More info: https://kubernetes.io/docs/concepts/storage/volumes/#emptydir. <a name="nested_template_volumes_volumes_gcs"></a>The `gcs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) GCS Bucket name
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_only`
- Description: (Optional) If true, mount the GCS bucket as read-only
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mount_options`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A list of flags to pass to the gcsfuse command for configuring this volume. Flags should be passed without leading dashes. <a name="nested_template_volumes_volumes_nfs"></a>The `nfs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server`
- Description: (Required) Hostname or IP address of the NFS server
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) Path that is exported by the NFS server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_only`
- Description: (Optional) If true, mount the NFS volume as read only <a name="nested_template_node_selector"></a>The `node_selector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator`
- Description: (Required) The GPU to attach to an instance. See https://cloud.google.com/run/docs/configuring/services/gpu for configuring GPU. <a name="nested_binary_authorization"></a>The `binary_authorization` block supports:
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
- Description: (Optional) The path to a binary authorization policy. Format: projects/{project}/platforms/cloudRun/{policy-name} <a name="nested_scaling"></a>The `scaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scaling_mode`
- Description: (Optional) The scaling mode for the worker pool. It defaults to MANUAL. Possible values are: `AUTOMATIC`, `MANUAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_instance_count`
- Description: (Optional) The minimum count of instances distributed among revisions based on the specified instance split percentages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_instance_count`
- Description: (Optional) The maximum count of instances distributed among revisions based on the specified instance split percentages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual_instance_count`
- Description: (Optional) The total number of instances in manual scaling mode. <a name="nested_instance_splits"></a>The `instance_splits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The allocation type for this instance split. Possible values are: `INSTANCE_SPLIT_ALLOCATION_TYPE_LATEST`, `INSTANCE_SPLIT_ALLOCATION_TYPE_REVISION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `revision`
- Description: (Optional) Revision to which to assign this portion of instances, if split allocation is by revision.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percent`
- Description: (Optional) Specifies percent of the instance split to this Revision. This defaults to zero if unspecified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
