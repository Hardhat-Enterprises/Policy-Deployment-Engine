## 🛡️ Policy Deployment Engine: `iap_tunnel_dest_group`

This section provides a concise policy evaluation for the `iap_tunnel_dest_group` resource in GCP.

Reference: [Terraform Registry – iap_tunnel_dest_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_tunnel_dest_group)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `group_name` | Unique tunnel destination group name. | true | true | Clear, unique names avoid misrouting and make reviews/audits easier. | group_name = "corp-admin-tcp" | group_name = "test" / "" / "corp-admin-tcp " (trailing space) |
| `cidrs` | List of CIDRs that this group applies to. | false | true | CIDRs define reachable networks over IAP TCP; overly broad ranges expand blast radius. | cidrs = ["10.0.0.0/24", "192.168.10.0/24"] | cidrs = ["0.0.0.0/0"] or unnecessarily broad private ranges without justification |
| `fqdns` | List of FQDNs that this group applies to. | false | true | Restrict to specific internal hostnames; wildcards or public sites dilute access control. | fqdns = ["db.internal.example.com", "bastion.internal.example.com"] | fqdns = ["*.example.com", "public-site.com"] |
| `region` | The region of the tunnel group. Must be the same as the network resources in the group. | false | true | Region must match target resources; mismatches can route to the wrong place or fail closed. | region = "australia-southeast1" | region = "" or a region that doesn’t match the resources (e.g., "us-east1" while backends are in "australia-southeast1") |
| `project` | If it is not provided, the provider project is used. | false | true | Ensures the destination group is created in the intended project; mismatches affect the wrong tenant. | project = "my-gcp-project" (matches provider context) | project = "other-project" while provider points elsewhere |
