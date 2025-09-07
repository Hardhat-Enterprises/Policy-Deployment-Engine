## 🛡️ Policy Deployment Engine: `container_azure_node_pool`

This section provides a concise policy evaluation for the `container_azure_node_pool` resource in GCP.

Reference: [Terraform Registry – container_azure_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_azure_node_pool)

---

## 1. Argument Reference

### `autoscaling`
- Description: (Required) Autoscaler configuration for this node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) The azureCluster for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Required) The node configuration of the node pool.
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
- Description: (Required) The ARM ID of the subnet where the node pool VMs run. Make sure it's a subnet under the virtual network in the cluster configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) The Kubernetes version (e.g. `1.19.10-gke.1000`) running on this node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `autoscaling` Block

### `max_node_count`
- Description: (Required) Maximum number of nodes in the node pool. Must be >= min_node_count.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_node_count`
- Description: (Required) Minimum number of nodes in the node pool. Must be >= 1 and <= max_node_count.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `config` Block

### `image_type`
- Description: (Optional) (Beta only) The OS image type to use on node pool instances.
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
- Description: (Optional) Optional. Configuration related to the root volume provisioned for each node pool machine. When unspecified, it defaults to a 32-GiB Azure Disk.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_config`
- Description: (Required) SSH configuration for how to access the node pool machines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Optional. A set of tags to apply to all underlying Azure resources for this node pool. This currently only includes Virtual Machine Scale Sets. Specify at most 50 pairs containing alphanumerics, spaces, and symbols (.+-=_:@/). Keys can be up to 127 Unicode characters. Values can be up to 255 Unicode characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_size`
- Description: (Optional) Optional. The Azure VM size name. Example: `Standard_DS2_v2`. See (/anthos/clusters/docs/azure/reference/supported-vms) for options. When unspecified, it defaults to `Standard_DS2_v2`.
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
- Description: (Optional) Optional. Annotations on the node pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Keys can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `azure_availability_zone`
- Description: (Optional) Optional. The Azure availability zone of the nodes in this nodepool. When unspecified, it defaults to `1`.
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

---

## 2. `proxy_config` Block

### `resource_group_id`
- Description: (Required) The ARM ID the of the resource group containing proxy keyvault. Resource group ids are formatted as `/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_id`
- Description: (Required) The URL the of the proxy setting secret with its version. Secret ids are formatted as `https:<key-vault-name>.vault.azure.net/secrets/<secret-name>/<secret-version>`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `root_volume` Block

### `size_gib`
- Description: (Optional) Optional. The size of the disk, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `ssh_config` Block

### `authorized_key`
- Description: (Required) The SSH public key data for VMs managed by Anthos. This accepts the authorized_keys file format used in OpenSSH according to the sshd(8) manual page.
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
