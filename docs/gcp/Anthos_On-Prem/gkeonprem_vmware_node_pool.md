## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_node_pool`

This section provides a concise policy evaluation for the `gkeonprem_vmware_node_pool` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_node_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The vmware node pool name. | true | None | None |
| `vmware_cluster` | The cluster this node pool belongs to. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `display_name` | The display name for the node pool. | false | None | None |
| `annotations` | Annotations on the node Pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpus` | The number of CPUs for each node in the node pool. | false | None | None |
| `memory_mb` | The megabytes of memory for each node in the node pool. | false | None | None |
| `replicas` | The number of nodes in the node pool. | false | None | None |
| `image_type` | The OS image to be used for each node in a node pool. Currently `cos`, `cos_cgv2`, `ubuntu`, `ubuntu_cgv2`, `ubuntu_containerd` and `windows` are supported. | true | None | None |
| `image` | The OS image name in vCenter, only valid when using Windows. | false | None | None |
| `boot_disk_size_gb` | VMware disk size to be used during creation. | false | None | None |
| `taints` | The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_config_taints). | false | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. | false | None | None |
| `vsphere_config` | Specifies the vSphere config for node pool. Structure is [documented below](#nested_config_vsphere_config). | false | None | None |
| `enable_load_balancer` | Allow node pool traffic to be load balanced. Only works for clusters with MetalLB load balancers. | false | None | None |

### node_pool_autoscaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_replicas` | Minimum number of replicas in the NodePool. | true | None | None |
| `max_replicas` | Maximum number of replicas in the NodePool. | true | None | None |

### taints Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Key associated with the effect. | true | None | None |
| `value` | Value associated with the effect. | true | None | None |
| `effect` | Available taint effects. Possible values are: `EFFECT_UNSPECIFIED`, `NO_SCHEDULE`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. | false | None | None |

### vsphere_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `datastore` | The name of the vCenter datastore. Inherited from the user cluster. | false | None | None |
| `tags` | Tags to apply to VMs. Structure is [documented below](#nested_config_vsphere_config_tags). | false | None | None |
| `host_groups` | Vsphere host groups to apply to all VMs in the node pool | false | None | None |

### tags Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `category` | The Vsphere tag category. | false | None | None |
| `tag` | The Vsphere tag name. | false | None | None |
