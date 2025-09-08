## 🛡️ Policy Deployment Engine: `cloud_run_v2_worker_pool`

This section provides a concise policy evaluation for the `cloud_run_v2_worker_pool` resource in GCP.

Reference: [Terraform Registry – cloud_run_v2_worker_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_worker_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the WorkerPool. | true | None | None |
| `location` | The location of the cloud run worker pool | true | None | None |
| `description` | User-provided description of the WorkerPool. This field currently has a 512-character limit. | false | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with  `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 WorkerPool. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected in new resources. All system annotations in v1 now have a corresponding field in v2 WorkerPool. This field follows Kubernetes annotations' namespacing, limits, and rules. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `client` | Arbitrary identifier for the API client. | false | None | None |
| `client_version` | Arbitrary version identifier for the API client. | false | None | None |
| `launch_stage` | The launch stage as defined by [Google Cloud Platform Launch Stages](https://cloud.google.com/products#product-launch-stages). Cloud Run supports ALPHA, BETA, and GA. If no value is specified, GA is assumed. Set the launch stage to a preview stage on input to allow use of preview features in that stage. On read (or output), describes whether the resource uses preview features. For example, if ALPHA is provided as input, but only BETA and GA-level features are used, this field will be BETA on output. Possible values are: `UNIMPLEMENTED`, `PRELAUNCH`, `EARLY_ACCESS`, `ALPHA`, `BETA`, `GA`, `DEPRECATED`. | false | None | None |
| `custom_audiences` | One or more custom audiences that you want this worker pool to support. Specify each custom audience as the full URL in a string. The custom audiences are encoded in the token and used to authenticate requests. For more information, see https://cloud.google.com/run/docs/configuring/custom-audiences. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` | When a`terraform destroy` or `terraform apply` would delete the service, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the WorkerPool will fail. When the field is set to false, deleting the WorkerPool is allowed. | none | None | None |

### template Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `revision` | The unique name for the revision. If this field is omitted, it will be automatically generated based on the WorkerPool name. | false | None | None |
| `labels` | Unstructured key value map that can be used to organize and categorize objects. User-provided labels are shared with Google's billing system, so they can be used to filter, or break down billing charges by team, component, environment, state, etc. For more information, visit https://cloud.google.com/resource-manager/docs/creating-managing-labels or https://cloud.google.com/run/docs/configuring/labels. Cloud Run API v2 does not support labels with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system labels in v1 now have a corresponding field in v2 WorkerPoolRevisionTemplate. | false | None | None |
| `annotations` | Unstructured key value map that may be set by external tools to store and arbitrary metadata. They are not queryable and should be preserved when modifying objects. Cloud Run API v2 does not support annotations with `run.googleapis.com`, `cloud.googleapis.com`, `serving.knative.dev`, or `autoscaling.knative.dev` namespaces, and they will be rejected. All system annotations in v1 now have a corresponding field in v2 WorkerPoolRevisionTemplate. This field follows Kubernetes annotations' namespacing, limits, and rules. | false | None | None |
| `vpc_access` | VPC Access configuration to use for this Revision. For more information, visit https://cloud.google.com/run/docs/configuring/connecting-vpc. Structure is [documented below](#nested_template_vpc_access). | false | None | None |
| `service_account` | Email address of the IAM service account associated with the revision of the WorkerPool. The service account represents the identity of the running revision, and determines what permissions the revision has. If not provided, the revision will use the project's default service account. | false | None | None |
| `containers` | Holds the containers that define the unit of execution for this WorkerPool. Structure is [documented below](#nested_template_containers). | false | None | None |
| `volumes` | A list of Volumes to make available to containers. Structure is [documented below](#nested_template_volumes). | false | None | None |
| `encryption_key` | A reference to a customer managed encryption key (CMEK) to use to encrypt this container image. For more information, go to https://cloud.google.com/run/docs/securing/using-cmek | false | None | None |
| `encryption_key_revocation_action` | The action to take if the encryption key is revoked. Possible values are: `PREVENT_NEW`, `SHUTDOWN`. | false | None | None |
| `encryption_key_shutdown_duration` | If encryptionKeyRevocationAction is SHUTDOWN, the duration before shutting down all instances. The minimum increment is 1 hour. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |
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
| `scaling_mode` | The scaling mode for the worker pool. It defaults to MANUAL. Possible values are: `AUTOMATIC`, `MANUAL`. | false | None | None |
| `min_instance_count` | The minimum count of instances distributed among revisions based on the specified instance split percentages. | false | None | None |
| `max_instance_count` | The maximum count of instances distributed among revisions based on the specified instance split percentages. | false | None | None |
| `manual_instance_count` | The total number of instances in manual scaling mode. | false | None | None |

### instance_splits Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The allocation type for this instance split. Possible values are: `INSTANCE_SPLIT_ALLOCATION_TYPE_LATEST`, `INSTANCE_SPLIT_ALLOCATION_TYPE_REVISION`. | false | None | None |
| `revision` | Revision to which to assign this portion of instances, if split allocation is by revision. | false | None | None |
| `percent` | Specifies percent of the instance split to this Revision. This defaults to zero if unspecified. | false | None | None |

### vpc_access Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `egress` | Traffic VPC egress settings. Possible values are: `ALL_TRAFFIC`, `PRIVATE_RANGES_ONLY`. | false | None | None |
| `network_interfaces` | Direct VPC egress settings. Currently only single network interface is supported. Structure is [documented below](#nested_template_vpc_access_network_interfaces). | false | None | None |

### network_interfaces Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The VPC network that the Cloud Run resource will be able to send traffic to. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If network is not specified, it will be looked up from the subnetwork. | false | None | None |
| `subnetwork` | The VPC subnetwork that the Cloud Run resource will get IPs from. At least one of network or subnetwork must be specified. If both network and subnetwork are specified, the given VPC subnetwork must belong to the given VPC network. If subnetwork is not specified, the subnetwork with the same name with the network will be used. | false | None | None |
| `tags` | Network tags applied to this Cloud Run WorkerPool. | false | None | None |

### containers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the container specified as a DNS_LABEL. | false | None | None |
| `image` | URL of the Container image in Google Container Registry or Google Artifact Registry. More info: https://kubernetes.io/docs/concepts/containers/images | true | None | None |
| `command` | Entrypoint array. Not executed within a shell. The docker image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME). Escaped references will never be expanded, regardless of whether the variable exists or not. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell | false | None | None |
| `args` | Arguments to the entrypoint. The docker image's CMD is used if this is not provided. Variable references are not supported in Cloud Run. | false | None | None |
| `env` | List of environment variables to set in the container. Structure is [documented below](#nested_template_containers_containers_env). | false | None | None |
| `resources` | Compute Resource requirements by this container. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources Structure is [documented below](#nested_template_containers_containers_resources). | false | None | None |
| `volume_mounts` | Volume to mount into the container's filesystem. Structure is [documented below](#nested_template_containers_containers_volume_mounts). | false | None | None |
| `working_dir` | Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. | false | None | None |
| `depends_on` | Containers which should be started before this container. If specified the container will wait to start until all containers with the listed names are healthy. | false | None | None |

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

### volume_mounts Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | This must match the Name of a Volume. | true | None | None |
| `mount_path` | Path within the container at which the volume should be mounted. Must not contain ':'. For Cloud SQL volumes, it can be left empty, or must otherwise be /cloudsql. All instances defined in the Volume will be available as /cloudsql/[instance]. For more information on Cloud SQL volumes, visit https://cloud.google.com/sql/docs/mysql/connect-run | true | None | None |

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

### node_selector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator` | The GPU to attach to an instance. See https://cloud.google.com/run/docs/configuring/services/gpu for configuring GPU. | true | None | None |
