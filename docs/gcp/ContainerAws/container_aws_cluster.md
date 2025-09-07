## 🛡️ Policy Deployment Engine: `container_aws_cluster`

This section provides a concise policy evaluation for the `container_aws_cluster` resource in GCP.

Reference: [Terraform Registry – container_aws_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_aws_cluster)

---

## 1. Argument Reference

### `authorization`
- Description: (Required) Configuration related to the cluster RBAC settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws_region`
- Description: (Required) The AWS region where the cluster runs. Each Google Cloud region supports a subset of nearby AWS regions. You can call to list all supported AWS regions within a given Google Cloud region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane`
- Description: (Required) Configuration related to the cluster control plane.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fleet`
- Description: (Required) Fleet configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networking`
- Description: (Required) Cluster-wide networking configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `authorization` Block

### `admin_groups`
- Description: (Optional) Groups of users that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the groups. Up to ten admin groups can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_users`
- Description: (Required) Users to perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the users. Up to ten admin users can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `control_plane` Block

### `aws_services_authentication`
- Description: (Required) Authentication configuration for management of AWS resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_encryption`
- Description: (Required) The ARN of the AWS KMS key used to encrypt cluster configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_encryption`
- Description: (Required) The ARN of the AWS KMS key used to encrypt cluster secrets.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `iam_instance_profile`
- Description: (Required) The name of the AWS IAM instance pofile to assign to each control plane replica.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_placement`
- Description: (Optional) (Beta only) Details of placement information for an instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_type`
- Description: (Optional) Optional. The AWS instance type. When unspecified, it defaults to `m5.large`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_volume`
- Description: (Optional) Optional. Configuration related to the main volume provisioned for each control plane replica. The main volume is in charge of storing all of the cluster's etcd state. Volumes will be provisioned in the availability zone associated with the corresponding subnet. When unspecified, it defaults to 8 GiB with the GP2 volume type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_config`
- Description: (Optional) Proxy configuration for outbound HTTP(S) traffic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_volume`
- Description: (Optional) Optional. Configuration related to the root volume provisioned for each control plane replica. Volumes will be provisioned in the availability zone associated with the corresponding subnet. When unspecified, it defaults to 32 GiB with the GP2 volume type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_group_ids`
- Description: (Optional) Optional. The IDs of additional security groups to add to control plane replicas. The Anthos Multi-Cloud API will automatically create and manage security groups with the minimum rules needed for a functioning cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_config`
- Description: (Optional) Optional. SSH configuration for how to access the underlying control plane machines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet_ids`
- Description: (Required) The list of subnets where control plane replicas will run. A replica will be provisioned on each subnet and up to three values can be provided. Each subnet must be in a different AWS Availability Zone (AZ).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Optional. A set of AWS resource tags to propagate to all underlying managed AWS resources. Specify at most 50 pairs containing alphanumerics, spaces, and symbols (.+-=_:@/). Keys can be up to 127 Unicode characters. Values can be up to 255 Unicode characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) The Kubernetes version to run on control plane replicas (e.g. `1.19.10-gke.1000`). You can list all supported versions on a given Google Cloud region by calling .
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `fleet` Block

### `membership`
- Description: The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as projects/<project-number>/locations/global/membership/<cluster-id>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The number of the Fleet host project where this cluster will be registered.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `networking` Block

### `per_node_pool_sg_rules_disabled`
- Description: (Optional) Disable the per node pool subnet security group rules on the control plane security group. When set to true, you must also provide one or more security groups that ensure node pools are able to send requests to the control plane on TCP/443 and TCP/8132. Failure to do so may result in unavailable node pools.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_address_cidr_blocks`
- Description: (Required) All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_address_cidr_blocks`
- Description: (Required) All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_id`
- Description: (Required) The VPC associated with the cluster. All component clusters (i.e. control plane and node pools) run on a single VPC. This field cannot be changed after creation. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. Annotations on the cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_authorization`
- Description: (Optional) Configuration options for the Binary Authorization feature.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. A human readable description of this cluster. Cannot be longer than 255 UTF-8 encoded bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) (Beta only) Logging configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `admin_groups` Block

### `group`
- Description: (Required) The name of the group, e.g. `my-group@domain.com`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `admin_users` Block

### `username`
- Description: (Required) The name of the user, e.g. `my-gcp-id@gmail.com`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `binary_authorization` Block

### `evaluation_mode`
- Description: (Optional) Mode of operation for Binary Authorization policy evaluation. Possible values: DISABLED, PROJECT_SINGLETON_POLICY_ENFORCE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `aws_services_authentication` Block

### `role_arn`
- Description: (Required) The Amazon Resource Name (ARN) of the role that the Anthos Multi-Cloud API will assume when managing AWS resources on your account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role_session_name`
- Description: (Optional) Optional. An identifier for the assumed role session. When unspecified, it defaults to `multicloud-service-agent`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `config_encryption` Block

### `kms_key_arn`
- Description: (Required) The ARN of the AWS KMS key used to encrypt cluster configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `database_encryption` Block

### `kms_key_arn`
- Description: (Required) The ARN of the AWS KMS key used to encrypt cluster secrets.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `instance_placement` Block

### `tenancy`
- Description: (Optional) The tenancy for the instance. Possible values: TENANCY_UNSPECIFIED, DEFAULT, DEDICATED, HOST
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `main_volume` Block

### `iops`
- Description: (Optional) Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_arn`
- Description: (Optional) Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. If not specified, the default Amazon managed key associated to the AWS region where this cluster runs will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size_gib`
- Description: (Optional) Optional. The size of the volume, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `throughput`
- Description: (Optional) Optional. The throughput to provision for the volume, in MiB/s. Only valid if the volume type is GP3. If volume type is gp3 and throughput is not specified, the throughput will defaults to 125.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_type`
- Description: (Optional) Optional. Type of the EBS volume. When unspecified, it defaults to GP2 volume. Possible values: VOLUME_TYPE_UNSPECIFIED, GP2, GP3
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `proxy_config` Block

### `secret_arn`
- Description: (Required) The ARN of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The version string of the AWS Secret Manager secret that contains the HTTP(S) proxy configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `root_volume` Block

### `iops`
- Description: (Optional) Optional. The number of I/O operations per second (IOPS) to provision for GP3 volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_arn`
- Description: (Optional) Optional. The Amazon Resource Name (ARN) of the Customer Managed Key (CMK) used to encrypt AWS EBS volumes. If not specified, the default Amazon managed key associated to the AWS region where this cluster runs will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size_gib`
- Description: (Optional) Optional. The size of the volume, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `throughput`
- Description: (Optional) Optional. The throughput to provision for the volume, in MiB/s. Only valid if the volume type is GP3. If volume type is gp3 and throughput is not specified, the throughput will defaults to 125.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_type`
- Description: (Optional) Optional. Type of the EBS volume. When unspecified, it defaults to GP2 volume. Possible values: VOLUME_TYPE_UNSPECIFIED, GP2, GP3
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `ssh_config` Block

### `ec2_key_pair`
- Description: (Required) The name of the EC2 key pair used to login into cluster machines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `logging_config` Block

### `component_config`
- Description: (Optional) Configuration of the logging components.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `component_config` Block

### `enable_components`
- Description: (Optional) Components of the logging configuration to be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
