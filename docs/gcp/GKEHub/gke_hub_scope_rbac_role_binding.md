## 🛡️ Policy Deployment Engine: `gke_hub_scope_rbac_role_binding`

This section provides a concise policy evaluation for the `gke_hub_scope_rbac_role_binding` resource in GCP.

Reference: [Terraform Registry – gke_hub_scope_rbac_role_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_scope_rbac_role_binding)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scope_rbac_role_binding_id` | The client-provided identifier of the RBAC Role Binding. | true | None | None |
| `scope_id` | Id of the scope | true | None | None |
| `user` | Principal that is be authorized in the cluster (at least of one the oneof is required). Updating one will unset the other automatically. user is the name of the user as seen by the kubernetes cluster, example "alice" or "alice@domain.tld" | false | None | None |
| `group` | Principal that is be authorized in the cluster (at least of one the oneof is required). Updating one will unset the other automatically. group is the group, as seen by the kubernetes cluster. | false | None | None |
| `labels` | Labels for this ScopeRBACRoleBinding. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### role Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `predefined_role` | PredefinedRole is an ENUM representation of the default Kubernetes Roles Possible values are: `UNKNOWN`, `ADMIN`, `EDIT`, `VIEW`. | false | None | None |
| `custom_role` | CustomRole is the custom Kubernetes ClusterRole to be used. The custom role format must be allowlisted in the rbacrolebindingactuation feature and RFC 1123 compliant. | false | None | None |
