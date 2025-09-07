## 🛡️ Policy Deployment Engine: `compute_node_template`

This section provides a concise policy evaluation for the `compute_node_template` resource in GCP.

Reference: [Terraform Registry – compute_node_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_node_template)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional textual description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_affinity_labels`
- Description: (Optional) Labels to use for node affinity, which will be used in instance scheduling.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type`
- Description: (Optional) Node type to use for nodes group that are created from this template. Only one of nodeTypeFlexibility and nodeType can be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type_flexibility`
- Description: (Optional) Flexible properties for the desired node type. Node groups that use this node template will create nodes of a type that matches these properties. Only one of nodeTypeFlexibility and nodeType can be specified. Structure is [documented below](#nested_node_type_flexibility).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_binding`
- Description: (Optional) The server binding policy for nodes using this template. Determines where the nodes should restart following a maintenance event. Structure is [documented below](#nested_server_binding).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerators`
- Description: (Optional) List of the type and count of accelerator cards attached to the node template Structure is [documented below](#nested_accelerators).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_overcommit_type`
- Description: (Optional) CPU overcommit. Default value is `NONE`. Possible values are: `ENABLED`, `NONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disks`
- Description: (Optional) List of the type, size and count of disks attached to the node template Structure is [documented below](#nested_disks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where nodes using the node template will be created. If it is not provided, the provider region is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_node_type_flexibility"></a>The `node_type_flexibility` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpus`
- Description: (Optional) Number of virtual CPUs to use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory`
- Description: (Optional) Physical memory available to the node, defined in MB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssd`
- Description: (Output) Use local SSD <a name="nested_server_binding"></a>The `server_binding` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of server binding policy. If `RESTART_NODE_ON_ANY_SERVER`, nodes using this template will restart on any physical server following a maintenance event. If `RESTART_NODE_ON_MINIMAL_SERVER`, nodes using this template will restart on the same physical server following a maintenance event, instead of being live migrated to or restarted on a new physical server. This option may be useful if you are using software licenses tied to the underlying server characteristics such as physical sockets or cores, to avoid the need for additional licenses when maintenance occurs. However, VMs on such nodes will experience outages while maintenance is applied. Possible values are: `RESTART_NODE_ON_ANY_SERVER`, `RESTART_NODE_ON_MINIMAL_SERVERS`. <a name="nested_accelerators"></a>The `accelerators` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: (Optional) The number of the guest accelerator cards exposed to this node template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) Full or partial URL of the accelerator type resource to expose to this node template. <a name="nested_disks"></a>The `disks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_count`
- Description: (Optional) Specifies the number of such disks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (Optional) Specifies the desired disk type on the node. This disk type must be a local storage type (e.g.: local-ssd). Note that for nodeTemplates, this should be the name of the disk type and not its URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Optional) Specifies the size of the disk in base-2 GB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
