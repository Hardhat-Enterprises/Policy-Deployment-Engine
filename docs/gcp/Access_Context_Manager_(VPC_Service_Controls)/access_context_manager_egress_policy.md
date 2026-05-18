## 🛡️ Policy Deployment Engine: `access_context_manager_egress_policy`

This section provides a concise policy evaluation for the `access_context_manager_egress_policy` resource in GCP.

Reference: [Terraform Registry – access_context_manager_egress_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_egress_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource` | A GCP resource that is inside of the service perimeter. | true | false | None | None | None |
| `egress_policy_name` | The name of the Service Perimeter to add this resource to. | true | false | None | None | None |
