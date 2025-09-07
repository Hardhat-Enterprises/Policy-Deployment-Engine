## 🛡️ Policy Deployment Engine: `gkeonprem_bare_metal_node_pool`

This section provides a concise policy evaluation for the `gkeonprem_bare_metal_node_pool` resource in GCP.

Reference: [Terraform Registry – gkeonprem_bare_metal_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_bare_metal_node_pool)

---

## 1. Argument Reference

### `node_pool_config`
- Description: (Required) Node pool configuration. Structure is [documented below](#nested_node_pool_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The bare metal node pool name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bare_metal_cluster`
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
- Description: (Optional) The display name for the Bare Metal Node Pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Annotations on the Bare Metal Node Pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_node_pool_config"></a>The `node_pool_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_configs`
- Description: (Required) The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_node_pool_config_node_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operating_system`
- Description: (Optional) Specifies the nodes operating system (default: LINUX).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `taints`
- Description: (Optional) The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_node_pool_config_taints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. <a name="nested_node_pool_config_node_configs"></a>The `node_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_ip`
- Description: (Optional) The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. <a name="nested_node_pool_config_taints"></a>The `taints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Key associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effect`
- Description: (Optional) Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
