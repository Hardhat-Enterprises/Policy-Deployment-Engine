## 🛡️ Policy Deployment Engine: `iap_tunnel_dest_group`

This section provides a concise policy evaluation for the `iap_tunnel_dest_group` resource in GCP.

Reference: [Terraform Registry – iap_tunnel_dest_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_tunnel_dest_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `group_name` | Unique tunnel destination group name. | true | None | None |
| `cidrs` | List of CIDRs that this group applies to. | false | None | None |
| `fqdns` | List of FQDNs that this group applies to. | false | None | None |
| `region` | The region of the tunnel group. Must be the same as the network resources in the group. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
