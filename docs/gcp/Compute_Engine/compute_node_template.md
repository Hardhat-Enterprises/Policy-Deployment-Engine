## 🛡️ Policy Deployment Engine: `compute_node_template`

This section provides a concise policy evaluation for the `compute_node_template` resource in GCP.

Reference: [Terraform Registry – compute_node_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_node_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. | true | None | None |
| `description` | An optional textual description of the resource. | false | None | None |
| `node_affinity_labels` | Labels to use for node affinity, which will be used in instance scheduling. | false | None | None |
| `node_type` | Node type to use for nodes group that are created from this template. Only one of nodeTypeFlexibility and nodeType can be specified. | false | None | None |
| `cpu_overcommit_type` | CPU overcommit. Default value is `NONE`. Possible values are: `ENABLED`, `NONE`. | false | None | None |
| `region` | Region where nodes using the node template will be created. If it is not provided, the provider region is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### node_type_flexibility Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpus` | Number of virtual CPUs to use. | false | None | None |
| `memory` | Physical memory available to the node, defined in MB. | false | None | None |
| `local_ssd` | (Output) Use local SSD | none | None | None |

### server_binding Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Type of server binding policy. If `RESTART_NODE_ON_ANY_SERVER`, nodes using this template will restart on any physical server following a maintenance event. If `RESTART_NODE_ON_MINIMAL_SERVER`, nodes using this template will restart on the same physical server following a maintenance event, instead of being live migrated to or restarted on a new physical server. This option may be useful if you are using software licenses tied to the underlying server characteristics such as physical sockets or cores, to avoid the need for additional licenses when maintenance occurs. However, VMs on such nodes will experience outages while maintenance is applied. Possible values are: `RESTART_NODE_ON_ANY_SERVER`, `RESTART_NODE_ON_MINIMAL_SERVERS`. | true | None | None |

### accelerators Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator_count` | The number of the guest accelerator cards exposed to this node template. | false | None | None |
| `accelerator_type` | Full or partial URL of the accelerator type resource to expose to this node template. | false | None | None |

### disks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disk_count` | Specifies the number of such disks. | false | None | None |
| `disk_type` | Specifies the desired disk type on the node. This disk type must be a local storage type (e.g.: local-ssd). Note that for nodeTemplates, this should be the name of the disk type and not its URL. | false | None | None |
| `disk_size_gb` | Specifies the size of the disk in base-2 GB. | false | None | None |
