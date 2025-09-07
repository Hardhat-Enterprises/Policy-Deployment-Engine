## 🛡️ Policy Deployment Engine: `container_aws_node_pool`

This section provides a concise policy evaluation for the `container_aws_node_pool` resource in GCP.

Reference: [Terraform Registry – container_aws_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_aws_node_pool)

---

## 1. Argument Reference

### `autoscaling`
- Description: (Required) Autoscaler configuration for this node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) The awsCluster for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Required) The configuration of the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_pods_constraint`
- Description: (Required) The constraint on the maximum number of pods that can be run simultaneously on a node in the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet_id`
- Description: (Required) The subnet where the node pool node run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) The Kubernetes version to run on this node pool (e.g. `1.19.10-gke.1000`). You can list all supported versions on a given Google Cloud region by calling GetAwsServerConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `autoscaling` Block

### `max_node_count`
- Description: (Required) Maximum number of nodes in the NodePool. Must be >= min_node_count.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_node_count`
- Description: (Required) Minimum number of nodes in the NodePool. Must be >= 1 and <= max_node_count.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `config` Block

### `autoscaling_metrics_collection`
- Description: (Optional) Optional. Configuration related to CloudWatch metrics collection on the Auto Scaling group of the node pool. When unspecified, metrics collection is disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_encryption`
- Description: (Required) The ARN of the AWS KMS key used to encrypt node pool configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `iam_instance_profile`
- Description: (Required) The name of the AWS IAM role assigned to nodes in the pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_type`
- Description: (Optional) (Beta only) The OS image type to use on node pool instances.
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

### `labels`
- Description: (Optional) Optional. The initial labels assigned to nodes of this node pool. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_config`
- Description: (Optional) Proxy configuration for outbound HTTP(S) traffic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_volume`
- Description: (Optional) Optional. Template for the root volume provisioned for node pool nodes. Volumes will be provisioned in the availability zone assigned to the node pool subnet. When unspecified, it defaults to 32 GiB with the GP2 volume type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_group_ids`
- Description: (Optional) Optional. The IDs of additional security groups to add to nodes in this pool. The manager will automatically create security groups with minimum rules needed for a functioning cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spot_config`
- Description: (Optional) (Beta only) Optional. When specified, the node pool will provision Spot instances from the set of spot_config.instance_types. This field is mutually exclusive with `instance_type`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_config`
- Description: (Optional) Optional. The SSH configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Optional. Key/value metadata to assign to each underlying AWS resource. Specify at most 50 pairs containing alphanumerics, spaces, and symbols (.+-=_:@/). Keys can be up to 127 Unicode characters. Values can be up to 255 Unicode characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `taints`
- Description: (Optional) Optional. The initial taints assigned to nodes of this node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `max_pods_constraint` Block

### `max_pods_per_node`
- Description: (Required) The maximum number of pods to schedule on a single node. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. Annotations on the node pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kubelet_config`
- Description: (Optional) The kubelet configuration for the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `management`
- Description: (Optional) The Management configuration for this node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_settings`
- Description: (Optional) Optional. Update settings control the speed and disruption of the node pool update.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `autoscaling_metrics_collection` Block

### `granularity`
- Description: (Required) The frequency at which EC2 Auto Scaling sends aggregated data to AWS CloudWatch. The only valid value is "1Minute".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metrics`
- Description: (Optional) The metrics to enable. For a list of valid metrics, see https://docs.aws.amazon.com/autoscaling/ec2/APIReference/API_EnableMetricsCollection.html. If you specify granularity and don't specify any metrics, all metrics are enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `config_encryption` Block

### `kms_key_arn`
- Description: (Required) The ARN of the AWS KMS key used to encrypt node pool configuration.
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

## 2. `spot_config` Block

### `instance_types`
- Description: (Required) List of AWS EC2 instance types for creating a spot node pool's nodes. The specified instance types must have the same number of CPUs and memory. You can use the Amazon EC2 Instance Selector tool (https://github.com/aws/amazon-ec2-instance-selector) to choose instance types with matching CPU and memory
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

## 2. `taints` Block

### `effect`
- Description: (Required) The taint effect. Possible values: EFFECT_UNSPECIFIED, NO_SCHEDULE, PREFER_NO_SCHEDULE, NO_EXECUTE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Key for the taint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Value for the taint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `kubelet_config` Block

### `cpu_cfs_quota`
- Description: (Optional) Whether or not to enable CPU CFS quota. Defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_cfs_quota_period`
- Description: (Optional) Optional. The CPU CFS quota period to use for the node. Defaults to "100ms".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_manager_policy`
- Description: (Optional) The CpuManagerPolicy to use for the node. Defaults to "none".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_pids_limit`
- Description: (Optional) Optional. The maximum number of PIDs in each pod running on the node. The limit scales automatically based on underlying machine size if left unset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `management` Block

### `auto_repair`
- Description: (Optional) Optional. Whether or not the nodes will be automatically repaired.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `update_settings` Block

### `surge_settings`
- Description: (Optional) Optional. Settings for surge update.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `surge_settings` Block

### `max_surge`
- Description: (Optional) Optional. The maximum number of nodes that can be created beyond the current size of the node pool during the update process.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_unavailable`
- Description: (Optional) Optional. The maximum number of nodes that can be simultaneously unavailable during the update process. A node is considered unavailable if its status is not Ready.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
