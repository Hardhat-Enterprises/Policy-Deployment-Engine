## 🛡️ Policy Deployment Engine: `compute_network_firewall_policy_association`

This section provides a concise policy evaluation for the `compute_network_firewall_policy_association` resource in GCP.

Reference: [Terraform Registry – compute_network_firewall_policy_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_firewall_policy_association)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name for an association. | true | None | None |
| `attachment_target` | The target that the firewall policy is attached to. | true | None | None |
| `firewall_policy` | The firewall policy of the resource. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
