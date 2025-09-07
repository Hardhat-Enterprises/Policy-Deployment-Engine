## 🛡️ Policy Deployment Engine: `compute_public_delegated_prefix`

This section provides a concise policy evaluation for the `compute_public_delegated_prefix` resource in GCP.

Reference: [Terraform Registry – compute_public_delegated_prefix](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_public_delegated_prefix)

---

## 1. Argument Reference

### `region`
- Description: (Required) A region where the prefix will reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the resource. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent_prefix`
- Description: (Required) The URL of parent prefix. Either PublicAdvertisedPrefix or PublicDelegatedPrefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_cidr_range`
- Description: (Required) The IP address range, in CIDR format, represented by this public delegated prefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_live_migration`
- Description: (Optional) If true, the prefix will be live migrated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Specifies the mode of this IPv6 PDP. MODE must be one of: DELEGATION, EXTERNAL_IPV6_FORWARDING_RULE_CREATION and EXTERNAL_IPV6_SUBNETWORK_CREATION. Possible values are: `DELEGATION`, `EXTERNAL_IPV6_FORWARDING_RULE_CREATION`, `EXTERNAL_IPV6_SUBNETWORK_CREATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocatable_prefix_length`
- Description: (Optional) The allocatable prefix length supported by this public delegated prefix. This field is optional and cannot be set for prefixes in DELEGATION mode. It cannot be set for IPv4 prefixes either, and it always defaults to 32.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
