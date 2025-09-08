## 🛡️ Policy Deployment Engine: `access_context_manager_ingress_policy`

This section provides a concise policy evaluation for the `access_context_manager_ingress_policy` resource in GCP.

Reference: [Terraform Registry – access_context_manager_ingress_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_ingress_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource` | A GCP resource that is inside of the service perimeter. | true | None | None |
| `ingress_policy_name` | The name of the Service Perimeter to add this resource to. | true | None | None |
