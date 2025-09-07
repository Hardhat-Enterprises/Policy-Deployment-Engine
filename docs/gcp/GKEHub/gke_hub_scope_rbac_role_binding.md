## 🛡️ Policy Deployment Engine: `gke_hub_scope_rbac_role_binding`

This section provides a concise policy evaluation for the `gke_hub_scope_rbac_role_binding` resource in GCP.

Reference: [Terraform Registry – gke_hub_scope_rbac_role_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_scope_rbac_role_binding)

---

## 1. Argument Reference

### `scope_rbac_role_binding_id`
- Description: (Required) The client-provided identifier of the RBAC Role Binding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Required) Role to bind to the principal. Structure is [documented below](#nested_role).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope_id`
- Description: (Required) Id of the scope
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user`
- Description: (Optional) Principal that is be authorized in the cluster (at least of one the oneof is required). Updating one will unset the other automatically. user is the name of the user as seen by the kubernetes cluster, example "alice" or "alice@domain.tld"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group`
- Description: (Optional) Principal that is be authorized in the cluster (at least of one the oneof is required). Updating one will unset the other automatically. group is the group, as seen by the kubernetes cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels for this ScopeRBACRoleBinding. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_role"></a>The `role` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predefined_role`
- Description: (Optional) PredefinedRole is an ENUM representation of the default Kubernetes Roles Possible values are: `UNKNOWN`, `ADMIN`, `EDIT`, `VIEW`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_role`
- Description: (Optional) CustomRole is the custom Kubernetes ClusterRole to be used. The custom role format must be allowlisted in the rbacrolebindingactuation feature and RFC 1123 compliant.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
