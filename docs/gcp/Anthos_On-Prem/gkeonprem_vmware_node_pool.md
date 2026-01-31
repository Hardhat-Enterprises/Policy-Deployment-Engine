## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_node_pool`

This section provides a concise policy evaluation for the `gkeonprem_vmware_node_pool` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_node_pool)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `config` | The node configuration of the node pool. Structure is [documented below](#nested_config). | true | false | config itself does not require security considerations, but some of its nested parameters might be. | None | None |
| `name` | The vmware node pool name. | true | false | name is not a security sensitive field | None | None |
| `vmware_cluster` | The cluster this node pool belongs to. | true | false | vmware_cluster is not security sensitive enough to require special handling | None | None |
| `location` | The location of the resource. | true | true | location is a security sensitive field | australia | africa-north1 |
| `display_name` | The display name for the node pool. | false | false | display_name is not a security sensitive field | None | None |
| `annotations` | Annotations on the node Pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | annotations is not a security sensitive field | None | None |
| `node_pool_autoscaling` | Node Pool autoscaling config for the node pool. Structure is [documented below](#nested_node_pool_autoscaling). | false | false | node pool autoscaling itself does not require security considerations, but some of its nested parameters might be. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | project is not a security sensitive field | None | None |
| `taints` |  | false | false | None | None | None |
| `vsphere_config` |  | false | false | None | None | None |
| `tags` |  | false | false | None | None | None |

### config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cpus` | The number of CPUs for each node in the node pool. | false | false | cpus is not a security sensitive field | None | None |
| `memory_mb` | The megabytes of memory for each node in the node pool. | false | false | memory_mb is not a security sensitive field | None | None |
| `replicas` | The number of nodes in the node pool. | false | false | replicas is not a security sensitive field | None | None |
| `image_type` | The OS image to be used for each node in a node pool. Currently `cos`, `cos_cgv2`, `ubuntu`, `ubuntu_cgv2`, `ubuntu_containerd` and `windows` are supported. | true | true | image_type is a sensitive field and should be protected | ubuntu_containerd | custom_image |
| `image` | The OS image name in vCenter, only valid when using Windows. | false | false | image does not have significant security implications | None | None |
| `boot_disk_size_gb` | VMware disk size to be used during creation. | false | false | boot_disk_size_gb is not a security sensitive field | None | None |
| `taints` | The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_config_taints). | false | false | taints is not a security sensitive field | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. | false | false | labels is not a security sensitive field | None | None |
| `vsphere_config` | Specifies the vSphere config for node pool. Structure is [documented below](#nested_config_vsphere_config). | false | false | vsphere_config is not a security sensitive field | None | None |
| `enable_load_balancer` | Allow node pool traffic to be load balanced. Only works for clusters with MetalLB load balancers. | false | false | enable_load_balancer is not a security sensitive field | None | None |

### node_pool_autoscaling Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `min_replicas` | Minimum number of replicas in the NodePool. | true | true | min_replicas is a security sensitive field and should be limited to a reasonable number | 1 | 0 |
| `max_replicas` | Maximum number of replicas in the NodePool. | true | true | max_replicas is a security sensitive field and should be limited to a reasonable number | 5 | 10 |

### taints Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key associated with the effect. | true | false | key is not a security sensitive field | None | None |
| `value` | Value associated with the effect. | true | false | value is not a security sensitive field | None | None |
| `effect` | Available taint effects. Possible values are: `EFFECT_UNSPECIFIED`, `NO_SCHEDULE`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. | false | false | effect is not a security sensitive field | None | None |

### vsphere_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `datastore` | The name of the vCenter datastore. Inherited from the user cluster. | false | false | datastore is not a security sensitive field | None | None |
| `tags` | Tags to apply to VMs. Structure is [documented below](#nested_config_vsphere_config_tags). | false | false | tags is not a security sensitive field | None | None |
| `host_groups` | Vsphere host groups to apply to all VMs in the node pool | false | false | host_groups is not a security sensitive field | None | None |

### tags Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `category` | The Vsphere tag category. | false | false | category is not a security sensitive field | None | None |
| `tag` | The Vsphere tag name. | false | false | tag is not a security sensitive field | None | None |
