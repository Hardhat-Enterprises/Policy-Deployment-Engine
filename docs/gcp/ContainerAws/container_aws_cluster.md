## 🛡️ Policy Deployment Engine: `container_aws_cluster`

This section provides a concise policy evaluation for the `container_aws_cluster` resource in GCP.

Reference: [Terraform Registry – container_aws_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_aws_cluster)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `authorization` | Configuration related to the cluster RBAC settings. | true | false | None | None | None |
| `aws_region` | The AWS region where the cluster runs. Each Google Cloud region supports a subset of nearby AWS regions. You can call to list all supported AWS regions within a given Google Cloud region. | true | false | None | None | None |
| `control_plane` | Configuration related to the cluster control plane. | true | false | None | None | None |
| `fleet` | Fleet configuration. | true | false | None | None | None |
| `location` | The location for the resource | true | false | None | None | None |
| `name` | The name of this resource. | true | false | None | None | None |
| `networking` | Cluster-wide networking configuration. | true | false | None | None | None |
| `admin_groups` |  | false | false | None | None | None |
| `admin_users` |  | false | false | None | None | None |
| `binary_authorization` |  | false | false | None | None | None |
| `aws_services_authentication` |  | false | false | None | None | None |
| `config_encryption` |  | false | false | None | None | None |
| `database_encryption` |  | false | false | None | None | None |
| `instance_placement` |  | false | false | None | None | None |
| `main_volume` |  | false | false | None | None | None |
| `proxy_config` |  | false | false | None | None | None |
| `root_volume` |  | false | false | None | None | None |
| `ssh_config` |  | false | false | None | None | None |
| `logging_config` |  | false | false | None | None | None |
| `component_config` |  | false | false | None | None | None |

### authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_groups` | Groups of users that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the groups. Up to ten admin groups can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | false | true | Admin groups control privileged cluster access. Unapproved groups may grant cluster-admin permissions to users outside the organisation. | group@deakin.edu.au | group@domain.com |
| `admin_users` | Users to perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the users. Up to ten admin users can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | true | false | None | None | None |

### control_plane Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `aws_services_authentication` | Authentication configuration for management of AWS resources. | true | false | None | None | None |
| `config_encryption` | The ARN of the AWS KMS key used to encrypt cluster configuration. | true | false | None | None | None |
| `database_encryption` | The ARN of the AWS KMS key used to encrypt cluster secrets. | true | false | None | None | None |
| `iam_instance_profile` | The name of the AWS IAM instance pofile to assign to each control plane replica. | true | false | None | None | None |
| `instance_placement` | (Beta only) Details of placement information for an instance. | false | false | None | None | None |
| `instance_type` | Optional. The AWS instance type. When unspecified, it defaults to `m5.large`. | false | false | None | None | None |
| `main_volume` | Optional. Configuration related to the main volume provisioned for each control plane replica. The main volume is in charge of storing all of the cluster's etcd state. Volumes will be provisioned in the availability zone associated with the corresponding subnet. When unspecified, it defaults to 8 GiB with the GP2 volume type. | false | false | None | None | None |
| `proxy_config` | Proxy configuration for outbound HTTP(S) traffic. | false | false | None | None | None |
| `root_volume` | Optional. Configuration related to the root volume provisioned for each control plane replica. Volumes will be provisioned in the availability zone associated with the corresponding subnet. When unspecified, it defaults to 32 GiB with the GP2 volume type. | false | false | None | None | None |
| `security_group_ids` | Optional. The IDs of additional security groups to add to control plane replicas. The Anthos Multi-Cloud API will automatically create and manage security groups with the minimum rules needed for a functioning cluster. | false | false | None | None | None |
| `ssh_config` | Optional. SSH configuration for how to access the underlying control plane machines. | false | false | None | None | None |
| `subnet_ids` | The list of subnets where control plane replicas will run. A replica will be provisioned on each subnet and up to three values can be provided. Each subnet must be in a different AWS Availability Zone (AZ). | true | false | None | None | None |
| `tags` | Optional. A set of AWS resource tags to propagate to all underlying managed AWS resources. Specify at most 50 pairs containing alphanumerics, spaces, and symbols (.+-=_:@/). Keys can be up to 127 Unicode characters. Values can be up to 255 Unicode characters. | false | false | None | None | None |
| `version` | The Kubernetes version to run on control plane replicas (e.g. `1.19.10-gke.1000`). You can list all supported versions on a given Google Cloud region by calling . | true | false | None | None | None |

### fleet Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `membership` | The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as projects/<project-number>/locations/global/membership/<cluster-id>. | false | false | None | None | None |
| `project` | The number of the Fleet host project where this cluster will be registered. | false | false | None | None | None |

### networking Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `per_node_pool_sg_rules_disabled` | Disable the per node pool subnet security group rules on the control plane security group. When set to true, you must also provide one or more security groups that ensure node pools are able to send requests to the control plane on TCP/443 and TCP/8132. Failure to do so may result in unavailable node pools. | false | false | None | None | None |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | false | None | None | None |
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | false | None | None | None |
| `vpc_id` | The VPC associated with the cluster. All component clusters (i.e. control plane and node pools) run on a single VPC. This field cannot be changed after creation. - - - | true | false | None | None | None |
| `annotations` | Optional. Annotations on the cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | None | None | None |
| `binary_authorization` | Configuration options for the Binary Authorization feature. | false | false | None | None | None |
| `description` | Optional. A human readable description of this cluster. Cannot be longer than 255 UTF-8 encoded bytes. | false | false | None | None | None |
| `logging_config` | (Beta only) Logging configuration. | false | false | None | None | None |
| `project` | The project for the resource | false | false | None | None | None |

### admin_groups Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `group` | The name of the group, e.g. `my-group@domain.com`. | true | true | Admin group emails should belong to approved organisation-managed domains | group@deakin.edu.au | group@domain.com |

### admin_users Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | false | None | None | None |

### binary_authorization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `evaluation_mode` | Mode of operation for Binary Authorization policy evaluation. Possible values: DISABLED, PROJECT_SINGLETON_POLICY_ENFORCE | false | false | None | None | None |

### aws_services_authentication Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `role_arn` | The Amazon Resource Name (ARN) of the role that the Anthos Multi-Cloud API will assume when managing AWS resources on your account. | true | false | None | None | None |
| `role_session_name` | Optional. An identifier for the assumed role session. When unspecified, it defaults to `multicloud-service-agent`. | false | false | None | None | None |

### config_encryption Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_arn` | The ARN of the AWS KMS key used to encrypt cluster configuration. | true | false | None | None | None |

### database_encryption Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_arn` | The ARN of the AWS KMS key used to encrypt cluster secrets. | true | false | None | None | None |

### instance_placement Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `tenancy` | The tenancy for the instance. Possible values: TENANCY_UNSPECIFIED, DEFAULT, DEDICATED, HOST | false | false | None | None | None |

### main_volume Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `iops` | Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume. | false | false | None | None | None |
| `kms_key_arn` | Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. If not specified, the default Amazon managed key associated to the AWS region where this cluster runs will be used. | false | false | None | None | None |
| `size_gib` | Optional. The size of the volume, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource. | false | false | None | None | None |
| `throughput` | Optional. The throughput to provision for the volume, in MiB/s. Only valid if the volume type is GP3. If volume type is gp3 and throughput is not specified, the throughput will defaults to 125. | false | false | None | None | None |
| `volume_type` | Optional. Type of the EBS volume. When unspecified, it defaults to GP2 volume. Possible values: VOLUME_TYPE_UNSPECIFIED, GP2, GP3 | false | false | None | None | None |

### proxy_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_arn` | The ARN of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration. | true | false | None | None | None |
| `secret_version` | The version string of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration. | true | false | None | None | None |

### root_volume Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `iops` | Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume. | false | false | None | None | None |
| `kms_key_arn` | Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. If not specified, the default Amazon managed key associated to the AWS region where this cluster runs will be used. | false | false | None | None | None |
| `size_gib` | Optional. The size of the volume, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource. | false | false | None | None | None |
| `throughput` | Optional. The throughput to provision for the volume, in MiB/s. Only valid if the volume type is GP3. If volume type is gp3 and throughput is not specified, the throughput will defaults to 125. | false | false | None | None | None |
| `volume_type` | Optional. Type of the EBS volume. When unspecified, it defaults to GP2 volume. Possible values: VOLUME_TYPE_UNSPECIFIED, GP2, GP3 | false | false | None | None | None |

### ssh_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ec2_key_pair` | The name of the EC2 key pair used to login into cluster machines. | true | false | None | None | None |

### logging_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `component_config` | Configuration of the logging components. | false | false | None | None | None |

### component_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_components` | Components of the logging configuration to be enabled. | false | false | None | None | None |
