## 🛡️ Policy Deployment Engine: `container_aws_node_pool`

This section provides a concise policy evaluation for the `container_aws_node_pool` resource in GCP.

Reference: [Terraform Registry – container_aws_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_aws_node_pool)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autoscaling` | Autoscaler configuration for this node pool. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `cluster` | The awsCluster for the resource | true | false | This field identifies the parent cluster for the node pool. It controls placement but does not directly grant access, encryption, network exposure, or privileged permissions. | None | None |
| `config` | The configuration of the node pool. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `location` | The location for the resource | true | true | The Google Cloud location determines where node pool metadata is stored and should be restricted to approved Australia regions to meet data residency requirements. | australia-southeast1 | us-west1 |
| `max_pods_constraint` | The constraint on the maximum number of pods that can be run simultaneously on a node in the node pool. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `name` | The name of this resource. | true | false | The resource name identifies the node pool but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `subnet_id` | The subnet where the node pool node run. | true | true | The subnet determines network placement for node pool nodes and should be restricted to approved private subnets to avoid exposing nodes on public networks. | subnet-approved-private-a | subnet-public-unapproved |
| `version` | The Kubernetes version to run on this node pool. | true | true | The Kubernetes version can affect exposure to known vulnerabilities and should be kept within approved supported versions. | 1.29.0-gke.1000 | 1.19.10-gke.1000 |
| `annotations` | Optional. Annotations on the node pool. | false | false | Annotations provide metadata for the node pool and do not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `kubelet_config` | The kubelet configuration for the node pool. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `management` | The Management configuration for this node pool. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `project` | The project for the resource | false | false | The project identifies where the resource is created. It affects placement and ownership but does not directly define access, encryption, network exposure, or privileged permissions. | None | None |
| `update_settings` | Optional. Update settings control the speed and disruption of the node pool update. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |

### autoscaling Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `max_node_count` | Maximum number of nodes in the NodePool. Must be >= min_node_count. | true | false | This setting affects capacity, density, availability, or cost, but does not directly control access, encryption, network exposure, privileged permissions, data residency, or vulnerability posture. | None | None |
| `min_node_count` | Minimum number of nodes in the NodePool. Must be >= 1 and <= max_node_count. | true | false | Minimum node count affects baseline capacity and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |

### config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autoscaling_metrics_collection` | Optional. Configuration related to CloudWatch metrics collection on the Auto Scaling group of the node pool. When unspecified, metrics collection is disabled. | false | false | CloudWatch metrics collection supports observability of the auto scaling group but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `config_encryption` | The ARN of the AWS KMS key used to encrypt node pool configuration. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `iam_instance_profile` | The name of the AWS IAM role assigned to nodes in the pool. | true | true | The IAM instance profile controls the permissions granted to node pool instances. Unapproved profiles may grant excessive or unauthorised permissions. | approved-profile | unapproved-profile |
| `image_type` | Optional. The OS image type to use on node pool instances. | false | false | This beta-only field is not assessed in the current policy scope. Node security posture is covered by supported policy-backed fields such as version, IAM instance profile, KMS keys, security groups, SSH key pair, subnet, and location. | None | None |
| `instance_placement` | Optional.Details of placement information for an instance. | false | false | Instance placement controls tenancy and physical placement but does not directly grant access, encryption, network exposure, or privileged permissions in the current policy scope. | None | None |
| `instance_type` | Optional. The AWS instance type. When unspecified, it defaults to `m5.large`. | false | false | The instance type affects capacity and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `labels` | Optional. The initial labels assigned to nodes of this node pool. | false | false | Labels provide metadata for nodes and support workload scheduling but do not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `proxy_config` | Proxy configuration for outbound HTTP(S) traffic. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `root_volume` | Optional. Template for the root volume provisioned for node pool nodes. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `security_group_ids` | Optional. The IDs of additional security groups to add to nodes in this pool. | false | true | Security groups control network access to node pool instances and should be restricted to approved groups. | sg-approved-node-pool | sg-unapproved-open-access |
| `spot_config` | Optional. When specified, the node pool will provision Spot instances from the set of spot_config.instance_types. | false | false | Spot instance configuration affects availability and cost characteristics but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `ssh_config` | Optional. The SSH configuration. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `tags` | Optional. Key/value metadata to assign to each underlying AWS resource. | false | false | Tags support resource identification, ownership, and cost allocation but do not directly grant access or permissions. | None | None |
| `taints` | Optional. The initial taints assigned to nodes of this node pool. | false | false | Taints affect workload scheduling but do not directly control access, encryption, network exposure, or privileged permissions. | None | None |

###   config_encryption Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `kms_key_arn` | The ARN of the AWS KMS key used to encrypt node pool configuration. | true | true | The KMS key ARN controls which key protects node pool configuration and should be restricted to approved keys. | arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id | arn:aws:kms:ap-southeast-2:012345678910:key/unapproved-key-id |

###   proxy_config Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `secret_arn` | The ARN of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration. | true | true | The secret ARN references proxy configuration stored in AWS Secrets Manager and should be restricted to approved secrets. | arn:aws:secretsmanager:ap-southeast-2:012345678910:secret:approved-proxy-secret | arn:aws:secretsmanager:ap-southeast-2:012345678910:secret:unapproved-proxy-secret |
  | `secret_version` | The version string of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration. | true | false | The secret version selects a version of an approved proxy secret but does not independently grant access or permissions. | None | None |

###   root_volume Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `iops` | Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume. | false | false | IOPS affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `kms_key_arn` | Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. | false | true | The KMS key controls encryption for the node pool root EBS volume and should use an approved customer-managed key. | arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id | arn:aws:kms:ap-southeast-2:012345678910:key/unapproved-key-id |
  | `size_gib` | Optional. The size of the volume, in GiBs. | false | false | Volume size affects capacity and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `throughput` | Optional. The throughput to provision for the volume, in MiB/s. | false | false | Throughput affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `volume_type` | Optional. Type of the EBS volume. When unspecified, it defaults to GP2 volume. | false | false | Volume type affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |

###   ssh_config Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `ec2_key_pair` | The name of the EC2 key pair used to login into cluster machines. | true | true | The EC2 key pair controls SSH access to node pool machines and should be restricted to approved managed keys. | approved-ec2-key-pair | personal-ec2-key-pair |

### max_pods_constraint Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `max_pods_per_node` | The maximum number of pods to schedule on a single node. | true | false | This setting affects capacity, density, availability, or cost, but does not directly control access, encryption, network exposure, privileged permissions, data residency, or vulnerability posture. | None | None |

### kubelet_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cpu_cfs_quota` | Whether or not to enable CPU CFS quota. Defaults to true. | false | false | CPU CFS quota affects scheduling fairness but does not directly grant access or permissions. | None | None |
| `cpu_cfs_quota_period` | Optional. The CPU CFS quota period to use for the node. | false | false | CPU CFS quota period affects scheduling fairness but does not directly grant access or permissions. | None | None |
| `cpu_manager_policy` | The CpuManagerPolicy to use for the node. | false | false | CPU manager policy affects scheduling behaviour but does not directly grant access or permissions. | None | None |
| `pod_pids_limit` | Optional. The maximum number of PIDs in each pod running on the node. | false | false | Pod PID limit affects process accounting but does not directly grant access or permissions. | None | None |

### management Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `auto_repair` | Optional. Whether or not the nodes will be automatically repaired. | false | false | Auto-repair affects node availability but does not directly grant access or permissions. | None | None |

### update_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `surge_settings` | Optional. Settings for surge update. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |

###   surge_settings Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `max_surge` | Optional. The maximum number of nodes that can be created beyond the current size of the node pool during the update process. | false | false | Max surge controls update speed but does not directly grant access or permissions. | None | None |
  | `max_unavailable` | Optional. The maximum number of nodes that can be simultaneously unavailable during the update process. | false | false | Max unavailable controls update disruption but does not directly grant access or permissions. | None | None |
