## 🛡️ Policy Deployment Engine: `container_aws_cluster`

This section provides a concise policy evaluation for the `container_aws_cluster` resource in GCP.

Reference: [Terraform Registry – container_aws_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_aws_cluster)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `authorization` | Configuration related to the cluster RBAC settings. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `aws_region` | The AWS region where the cluster runs. | true | true | The AWS region determines where cluster workloads run and is a data residency control. It should be restricted to approved Australia AWS regions to meet data residency and sovereignty requirements. | ap-southeast-2 | us-west-2 |
| `control_plane` | Configuration related to the cluster control plane. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `fleet` | Fleet configuration. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `location` | The location for the resource | true | true | The Google Cloud location determines where cluster metadata is stored and is a data residency control. It should be restricted to approved Australia regions. | australia-southeast1 | us-west1 |
| `name` | The name of this resource. | true | false | The resource name identifies the cluster but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `networking` | Cluster-wide networking configuration. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `annotations` | Optional. Annotations on the cluster. | false | false | Annotations provide metadata for the cluster and do not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `binary_authorization` | Configuration options for the Binary Authorization feature. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `description` | Optional. A human readable description of this cluster. | false | false | The description is metadata for humans and does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `logging_config` | Optional. Logging configuration. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `project` | The project for the resource | false | false | The project identifies where the resource is created. It affects placement and ownership but does not directly define access, encryption, network exposure, or privileged permissions. | None | None |

### authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_groups` | Groups of users that can perform operations as a cluster admin. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `admin_users` | Users to perform operations as a cluster admin. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |

###   admin_groups Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `group` | The name of the group, e.g. `my-group@domain.com`. | true | true | The group email determines which group receives cluster-admin permissions and should belong to an approved organisation-managed domain. | group@deakin.edu.au | group@domain.com |

###   admin_users Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | true | The username identifies a user granted cluster-admin permissions and should belong to an approved organisation-managed identity. | user@deakin.edu.au | user@gmail.com |

### control_plane Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `aws_services_authentication` | Authentication configuration for management of AWS resources. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `config_encryption` | The ARN of the AWS KMS key used to encrypt cluster configuration. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `database_encryption` | The ARN of the AWS KMS key used to encrypt cluster secrets. | true | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `iam_instance_profile` | The name of the AWS IAM instance profile to assign to each control plane replica. | true | true | The IAM instance profile controls permissions granted to control plane replicas and should be limited to approved least-privilege profiles. | approved-control-plane-profile | unapproved-profile |
| `instance_placement` | Optional. Details of placement information for an instance. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `instance_type` | Optional. The AWS instance type. When unspecified, it defaults to `m5.large`. | false | false | The instance type affects capacity and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
| `main_volume` | Optional. Configuration related to the main volume provisioned for each control plane replica. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `proxy_config` | Proxy configuration for outbound HTTP(S) traffic. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `root_volume` | Optional. Configuration related to the root volume provisioned for each control plane replica. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `security_group_ids` | Optional. The IDs of additional security groups to add to control plane replicas. | false | true | Security groups control network access to control plane replicas and should be restricted to approved groups. | sg-approved-control-plane | sg-unapproved-open-access |
| `ssh_config` | Optional. SSH configuration for how to access the underlying control plane machines. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |
| `subnet_ids` | The list of subnets where control plane replicas will run. | true | true | Subnets determine network placement for control plane replicas and should be restricted to approved private subnets. | ['subnet-approved-private-a', 'subnet-approved-private-b'] | ['subnet-public-unapproved'] |
| `tags` | Optional. A set of AWS resource tags to propagate to all underlying managed AWS resources. | false | false | Tags support resource identification, ownership, and cost allocation but do not directly grant access or permissions. | None | None |
| `version` | The Kubernetes version to run on control plane replicas. | true | true | The Kubernetes version can affect exposure to known vulnerabilities and should be kept within approved supported versions. | 1.29.0-gke.1000 | 1.19.10-gke.1000 |

###   aws_services_authentication Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `role_arn` | The Amazon Resource Name (ARN) of the role that the Anthos Multi-Cloud API will assume when managing AWS resources on your account. | true | true | The role ARN determines which AWS IAM role is assumed to manage AWS resources and should be restricted to approved roles. | arn:aws:iam::012345678910:role/approved-multicloud-role | arn:aws:iam::012345678910:role/unapproved-admin-role |
  | `role_session_name` | Optional. An identifier for the assumed role session. | false | false | This value identifies the assumed role session for logging and traceability but does not directly grant permissions. | None | None |

###   config_encryption Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `kms_key_arn` | The ARN of the AWS KMS key used to encrypt cluster configuration. | true | true | The KMS key ARN controls which key protects cluster configuration and should be restricted to approved keys. | arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id | arn:aws:kms:ap-southeast-2:012345678910:key/unapproved-key-id |

###   database_encryption Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `kms_key_arn` | The ARN of the AWS KMS key used to encrypt cluster secrets. | true | true | The KMS key ARN controls which key protects cluster secrets and should be restricted to approved keys. | arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id | arn:aws:kms:ap-southeast-2:012345678910:key/unapproved-key-id |

###   instance_placement Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `tenancy` | The tenancy for the instance. Possible values: TENANCY_UNSPECIFIED, DEFAULT, DEDICATED, HOST | false | false | Tenancy affects instance placement but does not directly grant access or permissions. | None | None |

###   main_volume Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `iops` | Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume. | false | false | IOPS affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `kms_key_arn` | Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. | false | true | The KMS key controls encryption for the main EBS volume and should use an approved customer-managed key where required. | arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id | arn:aws:kms:ap-southeast-2:012345678910:key/unapproved-key-id |
  | `size_gib` | Optional. The size of the volume, in GiBs. | false | false | Volume size affects capacity and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `throughput` | Optional. The throughput to provision for the volume, in MiB/s. | false | false | Throughput affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `volume_type` | Optional. Type of the EBS volume. | false | false | Volume type affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |

###   proxy_config Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `secret_arn` | The ARN of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration. | true | true | The secret ARN references proxy configuration stored in AWS Secrets Manager and should be restricted to approved secrets. | arn:aws:secretsmanager:ap-southeast-2:012345678910:secret:approved-proxy-secret | arn:aws:secretsmanager:ap-southeast-2:012345678910:secret:unapproved-proxy-secret |
  | `secret_version` | The version string of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration. | true | false | The secret version selects a version of an approved proxy secret but does not independently grant access or permissions. | None | None |

###   root_volume Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `iops` | Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume. | false | false | IOPS affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `kms_key_arn` | Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. | false | true | The KMS key controls encryption for the root EBS volume and should use an approved customer-managed key where required. | arn:aws:kms:ap-southeast-2:012345678910:key/approved-key-id | arn:aws:kms:ap-southeast-2:012345678910:key/unapproved-key-id |
  | `size_gib` | Optional. The size of the volume, in GiBs. | false | false | Volume size affects capacity and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `throughput` | Optional. The throughput to provision for the volume, in MiB/s. | false | false | Throughput affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |
  | `volume_type` | Optional. Type of the EBS volume. | false | false | Volume type affects performance and cost but does not directly control access, encryption, network exposure, or privileged permissions. | None | None |

###   ssh_config Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `ec2_key_pair` | The name of the EC2 key pair used to login into cluster machines. | true | true | The EC2 key pair controls SSH access to cluster machines and should be restricted to approved managed keys. | approved-ec2-key-pair | personal-ec2-key-pair |

### fleet Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `membership` | The name of the managed Hub Membership resource associated to this cluster. | false | false | Membership identifies the Fleet association for the cluster but does not directly grant access or permissions. | None | None |
| `project` | The number of the Fleet host project where this cluster will be registered. | false | false | The Fleet host project determines registration location but does not directly control cluster access, encryption, or network exposure. | None | None |

### networking Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `per_node_pool_sg_rules_disabled` | Disable the per node pool subnet security group rules on the control plane security group. | false | true | Disabling managed per-node-pool security group rules can affect control plane connectivity and may require carefully approved replacement security groups. | False | True |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. | true | false | Pod CIDR ranges define internal pod addressing. They should be planned to avoid overlap, but they do not directly grant permissions. | None | None |
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. | true | false | Service CIDR ranges define internal service addressing. They should be planned to avoid overlap, but they do not directly grant permissions. | None | None |
| `vpc_id` | The VPC associated with the cluster. | true | true | The VPC controls the network boundary for the cluster and should be restricted to approved VPCs. | vpc-approved | vpc-unapproved |

### binary_authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `evaluation_mode` | Mode of operation for Binary Authorization policy evaluation. Possible values: DISABLED, PROJECT_SINGLETON_POLICY_ENFORCE | false | true | The evaluation mode determines whether Binary Authorization enforcement is enabled and should be set to enforce approved policy. | PROJECT_SINGLETON_POLICY_ENFORCE | DISABLED |

### logging_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `component_config` | Configuration of the logging components. | false | false | This block groups related settings. Security impact is assessed on specific child attributes. | None | None |

###   component_config Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `enable_components` | Components of the logging configuration to be enabled. | false | true | Enabled logging components determine which cluster logs are collected and should include approved audit-relevant components. | ['SYSTEM_COMPONENTS', 'WORKLOADS'] | ['APISERVER'] |
