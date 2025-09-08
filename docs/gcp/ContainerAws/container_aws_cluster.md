## 🛡️ Policy Deployment Engine: `container_aws_cluster`

This section provides a concise policy evaluation for the `container_aws_cluster` resource in GCP.

Reference: [Terraform Registry – container_aws_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_aws_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `aws_region` | The AWS region where the cluster runs. Each Google Cloud region supports a subset of nearby AWS regions. You can call to list all supported AWS regions within a given Google Cloud region. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `name` | The name of this resource. | true | None | None |

### authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_groups` | Groups of users that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the groups. Up to ten admin groups can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | false | None | None |
| `admin_users` | Users to perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the users. Up to ten admin users can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | true | None | None |

### control_plane Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `aws_services_authentication` | Authentication configuration for management of AWS resources. | true | None | None |
| `config_encryption` | The ARN of the AWS KMS key used to encrypt cluster configuration. | true | None | None |
| `database_encryption` | The ARN of the AWS KMS key used to encrypt cluster secrets. | true | None | None |
| `iam_instance_profile` | The name of the AWS IAM instance pofile to assign to each control plane replica. | true | None | None |
| `instance_placement` | (Beta only) Details of placement information for an instance. | false | None | None |
| `instance_type` | Optional. The AWS instance type. When unspecified, it defaults to `m5.large`. | false | None | None |
| `main_volume` | Optional. Configuration related to the main volume provisioned for each control plane replica. The main volume is in charge of storing all of the cluster's etcd state. Volumes will be provisioned in the availability zone associated with the corresponding subnet. When unspecified, it defaults to 8 GiB with the GP2 volume type. | false | None | None |
| `proxy_config` | Proxy configuration for outbound HTTP(S) traffic. | false | None | None |
| `root_volume` | Optional. Configuration related to the root volume provisioned for each control plane replica. Volumes will be provisioned in the availability zone associated with the corresponding subnet. When unspecified, it defaults to 32 GiB with the GP2 volume type. | false | None | None |
| `security_group_ids` | Optional. The IDs of additional security groups to add to control plane replicas. The Anthos Multi-Cloud API will automatically create and manage security groups with the minimum rules needed for a functioning cluster. | false | None | None |
| `ssh_config` | Optional. SSH configuration for how to access the underlying control plane machines. | false | None | None |
| `subnet_ids` | The list of subnets where control plane replicas will run. A replica will be provisioned on each subnet and up to three values can be provided. Each subnet must be in a different AWS Availability Zone (AZ). | true | None | None |
| `tags` | Optional. A set of AWS resource tags to propagate to all underlying managed AWS resources. Specify at most 50 pairs containing alphanumerics, spaces, and symbols (.+-=_:@/). Keys can be up to 127 Unicode characters. Values can be up to 255 Unicode characters. | false | None | None |
| `version` | The Kubernetes version to run on control plane replicas (e.g. `1.19.10-gke.1000`). You can list all supported versions on a given Google Cloud region by calling . | true | None | None |

### fleet Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `membership` | The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as projects/<project-number>/locations/global/membership/<cluster-id>. | none | None | None |
| `project` | The number of the Fleet host project where this cluster will be registered. | false | None | None |

### networking Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `per_node_pool_sg_rules_disabled` | Disable the per node pool subnet security group rules on the control plane security group. When set to true, you must also provide one or more security groups that ensure node pools are able to send requests to the control plane on TCP/443 and TCP/8132. Failure to do so may result in unavailable node pools. | false | None | None |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | None | None |
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | None | None |
| `vpc_id` | The VPC associated with the cluster. All component clusters (i.e. control plane and node pools) run on a single VPC. This field cannot be changed after creation. - - - | true | None | None |
| `annotations` | Optional. Annotations on the cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `binary_authorization` | Configuration options for the Binary Authorization feature. | false | None | None |
| `description` | Optional. A human readable description of this cluster. Cannot be longer than 255 UTF-8 encoded bytes. | false | None | None |
| `logging_config` | (Beta only) Logging configuration. | false | None | None |
| `project` | The project for the resource | false | None | None |

### admin_groups Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `group` | The name of the group, e.g. `my-group@domain.com`. | true | None | None |

### admin_users Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | None | None |

### binary_authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `evaluation_mode` | Mode of operation for Binary Authorization policy evaluation. Possible values: DISABLED, PROJECT_SINGLETON_POLICY_ENFORCE | false | None | None |

### aws_services_authentication Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `role_arn` | The Amazon Resource Name (ARN) of the role that the Anthos Multi-Cloud API will assume when managing AWS resources on your account. | true | None | None |
| `role_session_name` | Optional. An identifier for the assumed role session. When unspecified, it defaults to `multicloud-service-agent`. | false | None | None |

### config_encryption Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_arn` | The ARN of the AWS KMS key used to encrypt cluster configuration. | true | None | None |

### database_encryption Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_arn` | The ARN of the AWS KMS key used to encrypt cluster secrets. | true | None | None |

### instance_placement Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `tenancy` | The tenancy for the instance. Possible values: TENANCY_UNSPECIFIED, DEFAULT, DEDICATED, HOST | false | None | None |

### main_volume Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `iops` | Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume. | false | None | None |
| `kms_key_arn` | Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. If not specified, the default Amazon managed key associated to the AWS region where this cluster runs will be used. | false | None | None |
| `size_gib` | Optional. The size of the volume, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource. | false | None | None |
| `throughput` | Optional. The throughput to provision for the volume, in MiB/s. Only valid if the volume type is GP3. If volume type is gp3 and throughput is not specified, the throughput will defaults to 125. | false | None | None |
| `volume_type` | Optional. Type of the EBS volume. When unspecified, it defaults to GP2 volume. Possible values: VOLUME_TYPE_UNSPECIFIED, GP2, GP3 | false | None | None |

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

### ssh_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ec2_key_pair` | The name of the EC2 key pair used to login into cluster machines. | true | None | None |

### logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `component_config` | Configuration of the logging components. | false | None | None |

### component_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_components` | Components of the logging configuration to be enabled. | false | None | None |
