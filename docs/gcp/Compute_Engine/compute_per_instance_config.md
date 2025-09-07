## 🛡️ Policy Deployment Engine: `compute_per_instance_config`

This section provides a concise policy evaluation for the `compute_per_instance_config` resource in GCP.

Reference: [Terraform Registry – compute_per_instance_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_per_instance_config)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name for this per-instance config and its corresponding instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_group_manager`
- Description: (Required) The instance group manager this instance config is part of.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preserved_state`
- Description: (Optional) The preserved state for this instance. Structure is [documented below](#nested_preserved_state).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) Zone where the containing instance group manager is located
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimal_action`
- Description: Default is `NONE`. Possible values are: * REPLACE * RESTART * REFRESH * NONE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `most_disruptive_allowed_action`
- Description: Default is `REPLACE`. Possible values are: * REPLACE * RESTART * REFRESH * NONE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remove_instance_on_destroy`
- Description: When false, deleting this config will use the behavior as determined by remove_instance_on_destroy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remove_instance_state_on_destroy`
- Description: When false, deleting this config will *not* immediately remove any state from the underlying instance. State will be removed on the next instance recreation or update. <a name="nested_preserved_state"></a>The `preserved_state` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) Preserved metadata defined for this instance. This is a list of key->value pairs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk`
- Description: (Optional) Stateful disks for the instance. Structure is [documented below](#nested_preserved_state_disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `internal_ip`
- Description: (Optional) Preserved internal IPs defined for this instance. This map is keyed with the name of the network interface. Structure is [documented below](#nested_preserved_state_internal_ip).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_ip`
- Description: (Optional) Preserved external IPs defined for this instance. This map is keyed with the name of the network interface. Structure is [documented below](#nested_preserved_state_external_ip). <a name="nested_preserved_state_disk"></a>The `disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `device_name`
- Description: (Required) A unique device name that is reflected into the /dev/ tree of a Linux operating system running within the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) The URI of an existing persistent disk to attach under the specified device-name in the format `projects/project-id/zones/zone/disks/disk-name`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) The mode of the disk. Default value is `READ_WRITE`. Possible values are: `READ_ONLY`, `READ_WRITE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_rule`
- Description: (Optional) A value that prescribes what should happen to the stateful disk when the VM instance is deleted. The available options are `NEVER` and `ON_PERMANENT_INSTANCE_DELETION`. `NEVER` - detach the disk when the VM is deleted, but do not delete the disk. `ON_PERMANENT_INSTANCE_DELETION` will delete the stateful disk when the VM is permanently deleted from the instance group. Default value is `NEVER`. Possible values are: `NEVER`, `ON_PERMANENT_INSTANCE_DELETION`. <a name="nested_preserved_state_internal_ip"></a>The `internal_ip` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_delete`
- Description: (Optional) These stateful IPs will never be released during autohealing, update or VM instance recreate operations. This flag is used to configure if the IP reservation should be deleted after it is no longer used by the group, e.g. when the given instance or the whole group is deleted. Default value is `NEVER`. Possible values are: `NEVER`, `ON_PERMANENT_INSTANCE_DELETION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) Ip address representation Structure is [documented below](#nested_preserved_state_internal_ip_internal_ip_ip_address). <a name="nested_preserved_state_internal_ip_internal_ip_ip_address"></a>The `ip_address` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address`
- Description: (Optional) The URL of the reservation for this IP address. <a name="nested_preserved_state_external_ip"></a>The `external_ip` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_delete`
- Description: (Optional) These stateful IPs will never be released during autohealing, update or VM instance recreate operations. This flag is used to configure if the IP reservation should be deleted after it is no longer used by the group, e.g. when the given instance or the whole group is deleted. Default value is `NEVER`. Possible values are: `NEVER`, `ON_PERMANENT_INSTANCE_DELETION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) Ip address representation Structure is [documented below](#nested_preserved_state_external_ip_external_ip_ip_address). <a name="nested_preserved_state_external_ip_external_ip_ip_address"></a>The `ip_address` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address`
- Description: (Optional) The URL of the reservation for this IP address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
