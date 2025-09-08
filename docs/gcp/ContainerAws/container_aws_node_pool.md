## 🛡️ Policy Deployment Engine: `container_aws_node_pool`

This section provides a concise policy evaluation for the `container_aws_node_pool` resource in GCP.

Reference: [Terraform Registry – container_aws_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_aws_node_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster` | The awsCluster for the resource | true | None | None |
| `location` | The location for the resource | true | None | None |
| `name` | The name of this resource. | true | None | None |
| `subnet_id` | The subnet where the node pool node run. | true | None | None |
| `version` | The Kubernetes version to run on this node pool (e.g. `1.19.10-gke.1000`). You can list all supported versions on a given Google Cloud region by calling GetAwsServerConfig. | true | None | None |

### autoscaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_node_count` | Maximum number of nodes in the NodePool. Must be >= min_node_count. | true | None | None |
| `min_node_count` | Minimum number of nodes in the NodePool. Must be >= 1 and <= max_node_count. | true | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `autoscaling_metrics_collection` | Optional. Configuration related to CloudWatch metrics collection on the Auto Scaling group of the node pool. When unspecified, metrics collection is disabled. | false | None | None |
| `config_encryption` | The ARN of the AWS KMS key used to encrypt node pool configuration. | true | None | None |
| `iam_instance_profile` | The name of the AWS IAM role assigned to nodes in the pool. | true | None | None |
| `image_type` | (Beta only) The OS image type to use on node pool instances. | false | None | None |
| `instance_placement` | (Beta only) Details of placement information for an instance. | false | None | None |
| `instance_type` | Optional. The AWS instance type. When unspecified, it defaults to `m5.large`. | false | None | None |
| `labels` | Optional. The initial labels assigned to nodes of this node pool. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |
| `proxy_config` | Proxy configuration for outbound HTTP(S) traffic. | false | None | None |
| `root_volume` | Optional. Template for the root volume provisioned for node pool nodes. Volumes will be provisioned in the availability zone assigned to the node pool subnet. When unspecified, it defaults to 32 GiB with the GP2 volume type. | false | None | None |
| `security_group_ids` | Optional. The IDs of additional security groups to add to nodes in this pool. The manager will automatically create security groups with minimum rules needed for a functioning cluster. | false | None | None |
| `spot_config` | (Beta only) Optional. When specified, the node pool will provision Spot instances from the set of spot_config.instance_types. This field is mutually exclusive with `instance_type` | false | None | None |
| `ssh_config` | Optional. The SSH configuration. | false | None | None |
| `tags` | Optional. Key/value metadata to assign to each underlying AWS resource. Specify at most 50 pairs containing alphanumerics, spaces, and symbols (.+-=_:@/). Keys can be up to 127 Unicode characters. Values can be up to 255 Unicode characters. | false | None | None |
| `taints` | Optional. The initial taints assigned to nodes of this node pool. | false | None | None |

### max_pods_constraint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_pods_per_node` | The maximum number of pods to schedule on a single node. - - - | true | None | None |
| `annotations` | Optional. Annotations on the node pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `kubelet_config` | The kubelet configuration for the node pool. | false | None | None |
| `management` | The Management configuration for this node pool. | false | None | None |
| `project` | The project for the resource | false | None | None |
| `update_settings` | Optional. Update settings control the speed and disruption of the node pool update. | false | None | None |

### autoscaling_metrics_collection Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `granularity` | The frequency at which EC2 Auto Scaling sends aggregated data to AWS CloudWatch. The only valid value is "1Minute". | true | None | None |
| `metrics` | The metrics to enable. For a list of valid metrics, see https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_EnableMetricsCollection.html. If you specify granularity and don't specify any metrics, all metrics are enabled. | false | None | None |

### config_encryption Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_arn` | The ARN of the AWS KMS key used to encrypt node pool configuration. | true | None | None |

### instance_placement Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tenancy` | The tenancy for the instance. Possible values: TENANCY_UNSPECIFIED, DEFAULT, DEDICATED, HOST | false | None | None |

### proxy_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_arn` | The ARN of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration. | true | None | None |
| `secret_version` | The version string of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration. | true | None | None |

### root_volume Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `iops` | Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume. | false | None | None |
| `kms_key_arn` | Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. If not specified, the default Amazon managed key associated to the AWS region where this cluster runs will be used. | false | None | None |
| `size_gib` | Optional. The size of the volume, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource. | false | None | None |
| `throughput` | Optional. The throughput to provision for the volume, in MiB/s. Only valid if the volume type is GP3. If volume type is gp3 and throughput is not specified, the throughput will defaults to 125. | false | None | None |
| `volume_type` | Optional. Type of the EBS volume. When unspecified, it defaults to GP2 volume. Possible values: VOLUME_TYPE_UNSPECIFIED, GP2, GP3 | false | None | None |

### spot_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_types` | List of AWS EC2 instance types for creating a spot node pool's nodes. The specified instance types must have the same number of CPUs and memory. You can use the Amazon EC2 Instance Selector tool (https://github.com/aws/amazon-ec2-instance-selector) to choose instance types with matching CPU and memory | true | None | None |

### ssh_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ec2_key_pair` | The name of the EC2 key pair used to login into cluster machines. | true | None | None |

### taints Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `effect` | The taint effect. Possible values: EFFECT_UNSPECIFIED, NO_SCHEDULE, PREFER_NO_SCHEDULE, NO_EXECUTE | true | None | None |
| `key` | Key for the taint. | true | None | None |
| `value` | Value for the taint. | true | None | None |

### kubelet_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu_cfs_quota` | Whether or not to enable CPU CFS quota. Defaults to true. | false | None | None |
| `cpu_cfs_quota_period` | Optional. The CPU CFS quota period to use for the node. Defaults to "100ms". | false | None | None |
| `cpu_manager_policy` | The CpuManagerPolicy to use for the node. Defaults to "none". | false | None | None |
| `pod_pids_limit` | Optional. The maximum number of PIDs in each pod running on the node. The limit scales automatically based on underlying machine size if left unset. | false | None | None |

### management Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_repair` | Optional. Whether or not the nodes will be automatically repaired. | false | None | None |

### update_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `surge_settings` | Optional. Settings for surge update. | false | None | None |

### surge_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_surge` | Optional. The maximum number of nodes that can be created beyond the current size of the node pool during the update process. | false | None | None |
| `max_unavailable` | Optional. The maximum number of nodes that can be simultaneously unavailable during the update process. A node is considered unavailable if its status is not Ready. | false | None | None |
