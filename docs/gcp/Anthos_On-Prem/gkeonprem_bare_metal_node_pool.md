## 🛡️ Policy Deployment Engine: `gkeonprem_bare_metal_node_pool`

This section provides a concise policy evaluation for the `gkeonprem_bare_metal_node_pool` resource in GCP.

Reference: [Terraform Registry – gkeonprem_bare_metal_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_bare_metal_node_pool)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_pool_config` | Node pool configuration. Structure is [documented below](#nested_node_pool_config). | true | false | Node pool configuration itself does not require specific security considerations. | None | None |
| `name` | The bare metal node pool name. | true | false | name is not impact the security of the resource. | None | None |
| `bare_metal_cluster` | The cluster this node pool belongs to. | true | true | bare_metal_cluster is a critical security parameter that determines the cluster this node pool belongs to. | google_gkeonprem_bare_metal_cluster.default-full.name | google_gkeonprem_bare_metal_cluster.default-full-nc.name |
| `location` | The location of the resource. | true | true | location is a critical security parameter that determines the geographic location of the resource. | australia | asia1 |
| `display_name` | The display name for the Bare Metal Node Pool. | false | false | display name does not impact the security of the resource. | None | None |
| `annotations` | Annotations on the Bare Metal Node Pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | annotations are not security related configurations. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | project is not a security related configuration. | None | None |
| `node_configs` |  | false | false | None | None | None |
| `taints` |  | false | false | None | None | None |

### node_pool_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_configs` | The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_node_pool_config_node_configs). | true | false | Node configurations itself does not require specific security considerations. | None | None |
| `operating_system` | Specifies the nodes operating system (default: LINUX). | false | true | Using outdated operating system can impact security compliance and vulnerability management. | LINUX | WINDOWS |
| `taints` | The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_node_pool_config_taints). | false | false | taints are not security related configurations. | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | false | labels are not security related configurations. | None | None |

### node_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_ip` | The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1 | false | true | node_ip is a critical security parameter that determines the IP address for SSH access and Kubernetes node. | 10.200.0.11 | 8.8.8.8 |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | false | labels are not security related configurations. | None | None |

### taints Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key associated with the effect. | false | false | taints key is not a security related configuration. | None | None |
| `value` | Value associated with the effect. | false | false | taints value is not a security related configuration. | None | None |
| `effect` | Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. | false | false | taints effect is not a security related configuration. | None | None |
