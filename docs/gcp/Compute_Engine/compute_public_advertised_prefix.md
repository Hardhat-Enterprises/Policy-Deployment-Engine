## 🛡️ Policy Deployment Engine: `compute_public_advertised_prefix`

This section provides a concise policy evaluation for the `compute_public_advertised_prefix` resource in GCP.

Reference: [Terraform Registry – compute_public_advertised_prefix](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_public_advertised_prefix)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_verification_ip`
- Description: (Required) The IPv4 address to be used for reverse DNS verification.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_cidr_range`
- Description: (Required) The address range, in CIDR format, represented by this public advertised prefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pdp_scope`
- Description: (Optional) Specifies how child public delegated prefix will be scoped. pdpScope must be one of: GLOBAL, REGIONAL * REGIONAL: The public delegated prefix is regional only. The provisioning will take a few minutes. * GLOBAL: The public delegated prefix is global only. The provisioning will take ~4 weeks. Possible values are: `GLOBAL`, `REGIONAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
