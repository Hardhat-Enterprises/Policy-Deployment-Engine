## 🛡️ Policy Deployment Engine: `compute_organization_security_policy_association`

This section provides a concise policy evaluation for the `compute_organization_security_policy_association` resource in GCP.

Reference: [Terraform Registry – compute_organization_security_policy_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_organization_security_policy_association)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name for an association. | true | None | None |
| `attachment_id` | The resource that the security policy is attached to. | true | None | None |
| `policy_id` | The security policy ID of the association. | true | None | None |
