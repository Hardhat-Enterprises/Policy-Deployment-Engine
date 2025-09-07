## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_node_pool`

This section provides a concise policy evaluation for the `gkeonprem_vmware_node_pool` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_node_pool)

---

## 1. Argument Reference

### `config`
- Description: (Required) The node configuration of the node pool. Structure is [documented below](#nested_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The vmware node pool name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vmware_cluster`
- Description: (Required) The cluster this node pool belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name for the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Annotations on the node Pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool_autoscaling`
- Description: (Optional) Node Pool autoscaling config for the node pool. Structure is [documented below](#nested_node_pool_autoscaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpus`
- Description: (Optional) The number of CPUs for each node in the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_mb`
- Description: (Optional) The megabytes of memory for each node in the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replicas`
- Description: (Optional) The number of nodes in the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_type`
- Description: (Required) The OS image to be used for each node in a node pool. Currently `cos`, `cos_cgv2`, `ubuntu`, `ubuntu_cgv2`, `ubuntu_containerd` and `windows` are supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Optional) The OS image name in vCenter, only valid when using Windows.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_size_gb`
- Description: (Optional) VMware disk size to be used during creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `taints`
- Description: (Optional) The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_config_taints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vsphere_config`
- Description: (Optional) Specifies the vSphere config for node pool. Structure is [documented below](#nested_config_vsphere_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_load_balancer`
- Description: (Optional) Allow node pool traffic to be load balanced. Only works for clusters with MetalLB load balancers. <a name="nested_config_taints"></a>The `taints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Key associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Value associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effect`
- Description: (Optional) Available taint effects. Possible values are: `EFFECT_UNSPECIFIED`, `NO_SCHEDULE`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. <a name="nested_config_vsphere_config"></a>The `vsphere_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `datastore`
- Description: (Optional) The name of the vCenter datastore. Inherited from the user cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Tags to apply to VMs. Structure is [documented below](#nested_config_vsphere_config_tags).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_groups`
- Description: (Optional) Vsphere host groups to apply to all VMs in the node pool <a name="nested_config_vsphere_config_tags"></a>The `tags` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `category`
- Description: (Optional) The Vsphere tag category.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The Vsphere tag name. <a name="nested_node_pool_autoscaling"></a>The `node_pool_autoscaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_replicas`
- Description: (Required) Minimum number of replicas in the NodePool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_replicas`
- Description: (Required) Maximum number of replicas in the NodePool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
