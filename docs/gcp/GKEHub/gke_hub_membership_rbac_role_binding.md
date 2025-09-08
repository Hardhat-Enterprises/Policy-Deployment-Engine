## 🛡️ Policy Deployment Engine: `gke_hub_membership_rbac_role_binding`

This section provides a concise policy evaluation for the `gke_hub_membership_rbac_role_binding` resource in GCP.

Reference: [Terraform Registry – gke_hub_membership_rbac_role_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_membership_rbac_role_binding)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `membership_rbac_role_binding_id` | The client-provided identifier of the RBAC Role Binding. | true | None | None |
| `user` | Principal that is be authorized in the cluster (at least of one the oneof is required). Updating one will unset the other automatically. user is the name of the user as seen by the kubernetes cluster, example "alice" or "alice@domain.tld" | true | None | None |
| `membership_id` | Id of the membership | true | None | None |
| `location` | Location of the Membership | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### role Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `predefined_role` | PredefinedRole is an ENUM representation of the default Kubernetes Roles Possible values are: `UNKNOWN`, `ADMIN`, `EDIT`, `VIEW`, `ANTHOS_SUPPORT`. | true | None | None |
