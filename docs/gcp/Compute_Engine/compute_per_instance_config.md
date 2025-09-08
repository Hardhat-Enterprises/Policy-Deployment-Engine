## 🛡️ Policy Deployment Engine: `compute_per_instance_config`

This section provides a concise policy evaluation for the `compute_per_instance_config` resource in GCP.

Reference: [Terraform Registry – compute_per_instance_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_per_instance_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name for this per-instance config and its corresponding instance. | true | None | None |
| `instance_group_manager` | The instance group manager this instance config is part of. | true | None | None |
| `zone` | Zone where the containing instance group manager is located | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `minimal_action` | Default is `NONE`. Possible values are: * REPLACE * RESTART * REFRESH * NONE | none | None | None |
| `most_disruptive_allowed_action` | Default is `REPLACE`. Possible values are: * REPLACE * RESTART * REFRESH * NONE | none | None | None |
| `remove_instance_on_destroy` | When false, deleting this config will use the behavior as determined by remove_instance_on_destroy. | none | None | None |
| `remove_instance_state_on_destroy` | When false, deleting this config will *not* immediately remove any state from the underlying instance. State will be removed on the next instance recreation or update. | none | None | None |

### preserved_state Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `metadata` | Preserved metadata defined for this instance. This is a list of key->value pairs. | false | None | None |
| `disk` | Stateful disks for the instance. Structure is [documented below](#nested_preserved_state_disk). | false | None | None |
| `internal_ip` | Preserved internal IPs defined for this instance. This map is keyed with the name of the network interface. Structure is [documented below](#nested_preserved_state_internal_ip). | false | None | None |
| `external_ip` | Preserved external IPs defined for this instance. This map is keyed with the name of the network interface. Structure is [documented below](#nested_preserved_state_external_ip). | false | None | None |

### disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `device_name` | A unique device name that is reflected into the /dev/ tree of a Linux operating system running within the instance. | true | None | None |
| `source` | The URI of an existing persistent disk to attach under the specified device-name in the format `projects/project-id/zones/zone/disks/disk-name`. | true | None | None |
| `mode` | The mode of the disk. Default value is `READ_WRITE`. Possible values are: `READ_ONLY`, `READ_WRITE`. | false | None | None |
| `delete_rule` | A value that prescribes what should happen to the stateful disk when the VM instance is deleted. The available options are `NEVER` and `ON_PERMANENT_INSTANCE_DELETION`. `NEVER` - detach the disk when the VM is deleted, but do not delete the disk. `ON_PERMANENT_INSTANCE_DELETION` will delete the stateful disk when the VM is permanently deleted from the instance group. Default value is `NEVER`. Possible values are: `NEVER`, `ON_PERMANENT_INSTANCE_DELETION`. | false | None | None |

### internal_ip Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `interface_name` |  | none | None | None |
| `auto_delete` | These stateful IPs will never be released during autohealing, update or VM instance recreate operations. This flag is used to configure if the IP reservation should be deleted after it is no longer used by the group, e.g. when the given instance or the whole group is deleted. Default value is `NEVER`. Possible values are: `NEVER`, `ON_PERMANENT_INSTANCE_DELETION`. | false | None | None |
| `ip_address` | Ip address representation Structure is [documented below](#nested_preserved_state_internal_ip_internal_ip_ip_address). | false | None | None |

### ip_address Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `address` | The URL of the reservation for this IP address. | false | None | None |

### external_ip Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `interface_name` |  | none | None | None |
| `auto_delete` | These stateful IPs will never be released during autohealing, update or VM instance recreate operations. This flag is used to configure if the IP reservation should be deleted after it is no longer used by the group, e.g. when the given instance or the whole group is deleted. Default value is `NEVER`. Possible values are: `NEVER`, `ON_PERMANENT_INSTANCE_DELETION`. | false | None | None |
| `ip_address` | Ip address representation Structure is [documented below](#nested_preserved_state_external_ip_external_ip_ip_address). | false | None | None |
