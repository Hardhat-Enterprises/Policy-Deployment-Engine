## 🛡️ Policy Deployment Engine: `gkeonprem_bare_metal_node_pool`

This section provides a concise policy evaluation for the `gkeonprem_bare_metal_node_pool` resource in GCP.

Reference: [Terraform Registry – gkeonprem_bare_metal_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_bare_metal_node_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The bare metal node pool name. | true | None | None |
| `bare_metal_cluster` | The cluster this node pool belongs to. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `display_name` | The display name for the Bare Metal Node Pool. | false | None | None |
| `annotations` | Annotations on the Bare Metal Node Pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### node_pool_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_configs` | The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_node_pool_config_node_configs). | true | None | None |
| `operating_system` | Specifies the nodes operating system (default: LINUX). | false | None | None |
| `taints` | The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_node_pool_config_taints). | false | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |

### node_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_ip` | The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1 | false | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |

### taints Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Key associated with the effect. | false | None | None |
| `value` | Value associated with the effect. | false | None | None |
| `effect` | Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. | false | None | None |
