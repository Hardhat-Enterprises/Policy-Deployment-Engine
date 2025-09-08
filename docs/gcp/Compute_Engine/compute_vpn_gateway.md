## 🛡️ Policy Deployment Engine: `compute_vpn_gateway`

This section provides a concise policy evaluation for the `compute_vpn_gateway` resource in GCP.

Reference: [Terraform Registry – compute_vpn_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_vpn_gateway)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `network` | The network this VPN gateway is accepting traffic for. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `region` | The region this gateway should sit in. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
