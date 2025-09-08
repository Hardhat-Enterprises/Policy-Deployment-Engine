## 🛡️ Policy Deployment Engine: `compute_node_group`

This section provides a concise policy evaluation for the `compute_node_group` resource in GCP.

Reference: [Terraform Registry – compute_node_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_node_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. | true | None | None |
| `node_template` | The URL of the node template to which this node group belongs. | true | None | None |
| `description` | An optional textual description of the resource. | false | None | None |
| `initial_size` | The initial number of nodes in the node group. One of `initial_size` or `autoscaling_policy` must be configured on resource creation. | false | None | None |
| `maintenance_policy` | Specifies how to handle instances when a node in the group undergoes maintenance. Set to one of: DEFAULT, RESTART_IN_PLACE, or MIGRATE_WITHIN_NODE_GROUP. The default value is DEFAULT. | false | None | None |
| `maintenance_interval` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies the frequency of planned maintenance events. Set to one of the following: - AS_NEEDED: Hosts are eligible to receive infrastructure and hypervisor updates as they become available. - RECURRENT: Hosts receive planned infrastructure and hypervisor updates on a periodic basis, but not more frequently than every 28 days. This minimizes the number of planned maintenance operations on individual hosts and reduces the frequency of disruptions, both live migrations and terminations, on individual VMs. Possible values are: `AS_NEEDED`, `RECURRENT`. | false | None | None |
| `zone` | Zone where this node group is located | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### maintenance_window Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start_time` | instances.start time of the window. This must be in UTC format that resolves to one of 00:00, 04:00, 08:00, 12:00, 16:00, or 20:00. For example, both 13:00-5 and 08:00 are valid. | true | None | None |

### autoscaling_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` | The autoscaling mode. Set to one of the following: - OFF: Disables the autoscaler. - ON: Enables scaling in and scaling out. - ONLY_SCALE_OUT: Enables only scaling out. You must use this mode if your node groups are configured to restart their hosted VMs on minimal servers. Possible values are: `OFF`, `ON`, `ONLY_SCALE_OUT`. | true | None | None |
| `min_nodes` | Minimum size of the node group. Must be less than or equal to max-nodes. The default value is 0. | false | None | None |
| `max_nodes` | Maximum size of the node group. Set to a value less than or equal to 100 and greater than or equal to min-nodes. | true | None | None |

### share_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `share_type` | Node group sharing type. Possible values are: `ORGANIZATION`, `SPECIFIC_PROJECTS`, `LOCAL`. | true | None | None |
| `project_map` | A map of project id and project config. This is only valid when shareType's value is SPECIFIC_PROJECTS. Structure is [documented below](#nested_share_settings_project_map). | false | None | None |

### project_map Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` |  | none | None | None |
| `project_id` | The project id/number should be the same as the key of this project config in the project map. | true | None | None |
