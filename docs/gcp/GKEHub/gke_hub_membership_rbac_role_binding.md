## 🛡️ Policy Deployment Engine: `gke_hub_membership_rbac_role_binding`

This section provides a concise policy evaluation for the `gke_hub_membership_rbac_role_binding` resource in GCP.

Reference: [Terraform Registry – gke_hub_membership_rbac_role_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_membership_rbac_role_binding)

---

## 1. Argument Reference

### `membership_rbac_role_binding_id`
- Description: (Required) The client-provided identifier of the RBAC Role Binding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user`
- Description: (Required) Principal that is be authorized in the cluster (at least of one the oneof is required). Updating one will unset the other automatically. user is the name of the user as seen by the kubernetes cluster, example "alice" or "alice@domain.tld"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Required) Role to bind to the principal. Structure is [documented below](#nested_role).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `membership_id`
- Description: (Required) Id of the membership
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location of the Membership
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_role"></a>The `role` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predefined_role`
- Description: (Required) PredefinedRole is an ENUM representation of the default Kubernetes Roles Possible values are: `UNKNOWN`, `ADMIN`, `EDIT`, `VIEW`, `ANTHOS_SUPPORT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
