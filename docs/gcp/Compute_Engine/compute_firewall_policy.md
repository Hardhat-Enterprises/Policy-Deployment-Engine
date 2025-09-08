## 🛡️ Policy Deployment Engine: `compute_firewall_policy`

This section provides a concise policy evaluation for the `compute_firewall_policy` resource in GCP.

Reference: [Terraform Registry – compute_firewall_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `short_name` | User-provided name of the Organization firewall policy. The name should be unique in the organization in which the firewall policy is created. This field is not applicable to network firewall policies. This name must be set on creation and cannot be changed. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `parent` | The parent of the firewall policy. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
