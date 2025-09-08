## 🛡️ Policy Deployment Engine: `compute_firewall_policy_association`

This section provides a concise policy evaluation for the `compute_firewall_policy_association` resource in GCP.

Reference: [Terraform Registry – compute_firewall_policy_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall_policy_association)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name for an association. | true | None | None |
| `attachment_target` | The target that the firewall policy is attached to. | true | None | None |
| `firewall_policy` | The firewall policy of the resource. This field can be updated to refer to a different Firewall Policy, which will create a new association from that new firewall policy with the flag to override the existing attachmentTarget's policy association. **Note** Due to potential risks with this operation it is *highly* recommended to use the `create_before_destroy` life cycle option on your exisiting firewall policy so as to prevent a situation where your attachment target has no associated policy. | true | None | None |
