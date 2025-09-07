## 🛡️ Policy Deployment Engine: `iap_tunnel_dest_group`

This section provides a concise policy evaluation for the `iap_tunnel_dest_group` resource in GCP.

Reference: [Terraform Registry – iap_tunnel_dest_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iap_tunnel_dest_group)

---

## 1. Argument Reference

### `group_name`
- Description: (Required) Unique tunnel destination group name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cidrs`
- Description: (Optional) List of CIDRs that this group applies to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fqdns`
- Description: (Optional) List of FQDNs that this group applies to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the tunnel group. Must be the same as the network resources in the group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
