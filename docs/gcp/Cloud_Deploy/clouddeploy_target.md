## 🛡️ Policy Deployment Engine: `clouddeploy_target`

This section provides a concise policy evaluation for the `clouddeploy_target` resource in GCP.

Reference: [Terraform Registry – clouddeploy_target](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_target)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location for the resource | true | false | A geographic identifier for resource placement. It does not affect the security of the target or its connectivity. | None | None |
| `name` | Name of the `Target`. Format is `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. - - - | true | false | An identifier for the target resource. It has no bearing on the target's security posture or access controls. | None | None |
| `annotations` | Optional. User annotations. These attributes can only be set and used by the user, and not by Google Cloud Deploy. See https://google.aip.dev/128#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Key-value pairs for user-defined metadata. While secrets should not be stored here, the annotations themselves do not influence the target's security configuration or connectivity. | None | None |
| `anthos_cluster` | Information specifying an Anthos Cluster. | false | false | Define where to deploy Anthos cluster and are therefore connectivity and operational details. The security of these underlying resources is managed by their own respective IAM policies and security configurations, not by the Cloud Deploy target definition. | None | None |
| `associated_entities` | Optional. Map of entity IDs to their associated entities. Associated entities allows specifying places other than the deployment target for specific features. For example, the Gateway API canary can be configured to deploy the HTTPRoute to a different cluster(s) than the deployment cluster using associated entities. An entity ID must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. | false | false | None | None | None |
| `custom_target` | Optional. Information specifying a Custom Target. | false | false | None | None | None |
| `deploy_parameters` | Optional. The deploy parameters to use for this target. | false | false | Environment-specific deployment parameters are typically configuration values, not security controls. Validation should be handled at the application level. | None | None |
| `description` | Optional. Description of the `Target`. Max length is 255 characters. | false | false | Purely descriptive metadata for human readers. Has no functional impact on the target's security or operation. | None | None |
| `execution_configs` | Configurations for all execution that relates to this `Target`. Each `ExecutionEnvironmentUsage` value may only be used in a single configuration; using the same value multiple times is an error. When one or more configurations are specified, they must include the `RENDER` and `DEPLOY` `ExecutionEnvironmentUsage` values. When no configurations are specified, execution will use the default specified in `DefaultPool`. | false | false | Defines execution environments and service accounts used for deployment. While wrong execution configuration could theoretically lead to issues, the real security control is at the IAM level, not the service account naming pattern. | None | None |
| `gke` | Information specifying a GKE Cluster. | false | false | None | None | None |
| `labels` | Optional. Labels are attributes that can be set and used by both the user and by Google Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 128 bytes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Used for organizing and filtering resources. They do not affect the target's security or operational behavior. | None | None |
| `multi_target` | Information specifying a multiTarget. | false | false | Enables parallel deployment to multiple targets simultaneously. While misconfiguration could deploy to unintended environments, this is primarily a deployment process risk rather than a direct security vulnerability. The actual security controls should be enforced at the individual target level (require_approval, proper cluster configurations, etc.).  | None | None |
| `project` | The project for the resource | false | false | Specifies the project that will contain the target resource. The project's IAM policies control who can manage the target, but this argument itself is just an identifier. | None | None |
| `require_approval` | Optional. Whether or not the `Target` requires approval. | false | true | This is a governance control that enforces a manual approval step before any deployment can proceed to this target. For critical environments like production, setting this to 'false' could allow unauthorized or unreviewed deployments to proceed automatically, bypassing a key safety check. | True | False |
| `run` | Information specifying a Cloud Run deployment target. | false | true | This block defines the Cloud Run service to target. The location of the service can have compliance and data residency implications. | None | None |
| `anthos_clusters` |  | false | false | None | None | None |
| `gke_clusters` |  | false | false | None | None | None |

### anthos_cluster Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `membership` | Membership of the GKE Hub-registered cluster to which to apply the Skaffold configuration. Format is `projects/{project}/locations/{location}/memberships/{membership_name}`. | false | false | None | None | None |

### associated_entities Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `anthos_clusters` | Optional. Information specifying Anthos clusters as associated entities. | false | false | None | None | None |
| `entity_id` | The name for the key in the map for which this object is mapped to in the API | true | false | None | None | None |
| `gke_clusters` | Optional. Information specifying GKE clusters as associated entities. | false | false | None | None | None |

### custom_target Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `custom_target_type` | Required. The name of the CustomTargetType. Format must be `projects/{project}/locations/{location}/customTargetTypes/{custom_target_type}`. | true | false | None | None | None |

### execution_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `artifact_storage` | Optional. Cloud Storage location in which to store execution outputs. This can either be a bucket ("gs://my-bucket") or a path within a bucket ("gs://my-bucket/my-dir"). If unspecified, a default bucket located in the same region will be used. | false | false | None | None | None |
| `execution_timeout` | Optional. Execution timeout for a Cloud Build Execution. This must be between 10m and 24h in seconds format. If unspecified, a default timeout of 1h is used. | false | false | None | None | None |
| `service_account` | Optional. Google service account to use for execution. If unspecified, the project execution service account (-compute@developer.gserviceaccount.com) is used. | false | false | None | None | None |
| `usages` | Required. Usages when this configuration should be applied. | true | false | None | None | None |
| `verbose` | Optional. If true, additional logging will be enabled when running builds in this execution environment. | false | false | None | None | None |
| `worker_pool` | Optional. The resource name of the `WorkerPool`, with the format `projects/{project}/locations/{location}/workerPools/{worker_pool}`. If this optional field is unspecified, the default Cloud Build pool will be used. | false | false | None | None | None |

### gke Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster` | Information specifying a GKE Cluster. Format is `projects/{project_id}/locations/{location_id}/clusters/{cluster_id}. | false | false | None | None | None |
| `dns_endpoint` | Optional. If set, the cluster will be accessed using the DNS endpoint. Note that both `dns_endpoint` and `internal_ip` cannot be set to true. | false | false | None | None | None |
| `internal_ip` | Optional. If true, `cluster` is accessed using the private IP address of the control plane endpoint. Otherwise, the default IP address of the control plane endpoint is used. The default IP address is the private IP address for clusters with private control-plane endpoints and the public IP address otherwise. Only specify this option when `cluster` is a [private GKE cluster](https://cloud.google.com/kubernetes-engine/docs/concepts/private-cluster-concept). | false | true | This block defines connectivity to a GKE cluster. The security of the connection is critical. Using a public endpoint (`internal_ip = false`) is a security risk | True | False |
| `proxy_url` | Optional. If set, used to configure a [proxy](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/#proxy) to the Kubernetes server. | false | false | None | None | None |

### multi_target Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_ids` | Required. The target_ids of this multiTarget. | true | false | None | None | None |

### run Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Required. The location where the Cloud Run Service should be located. Format is `projects/{project}/locations/{location}`. | true | true | The physical location of the Cloud Run service has implications for data sovereignty, compliance, and latency. Deploying to unapproved regions may violate organizational policy or regulatory requirements. | Must be set to an approved region - projects/my-project-name/locations/us-central1, us-east1, europe-west1, asia-southeast1 | Deploying to a region that is not on the approved list - projects/my-project-name/locations/us-west2 |

### anthos_clusters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `membership` | Optional. Membership of the GKE Hub-registered cluster to which to apply the Skaffold configuration. Format is `projects/{project}/locations/{location}/memberships/{membership_name}`. | false | false | None | None | None |

### gke_clusters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster` | Optional. Information specifying a GKE Cluster. Format is `projects/{project_id}/locations/{location_id}/clusters/{cluster_id}`. | false | false | None | None | None |
| `internal_ip` | Optional. If true, `cluster` is accessed using the private IP address of the control plane endpoint. Otherwise, the default IP address of the control plane endpoint is used. The default IP address is the private IP address for clusters with private control-plane endpoints and the public IP address otherwise. Only specify this option when `cluster` is a [private GKE cluster](https://cloud.google.com/kubernetes-engine/docs/concepts/private-cluster-concept). | false | false | None | None | None |
| `proxy_url` | Optional. If set, used to configure a [proxy](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/#proxy) to the Kubernetes server. | false | false | None | None | None |
