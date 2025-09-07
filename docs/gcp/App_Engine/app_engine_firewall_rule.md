## 🛡️ Policy Deployment Engine: `app_engine_firewall_rule`

This section provides a concise policy evaluation for the `app_engine_firewall_rule` resource in GCP.

Reference: [Terraform Registry – app_engine_firewall_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_firewall_rule)

---

## 1. Argument Reference

### `source_range`
- Description: (Required) IP address or range, defined using CIDR notation, of requests that this rule applies to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) The action to take if this rule matches. Possible values are: `UNSPECIFIED_ACTION`, `ALLOW`, `DENY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional string description of this rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Optional) A positive integer that defines the order of rule evaluation. Rules with the lowest priority are evaluated first. A default rule at priority Int32.MaxValue matches all IPv4 and IPv6 traffic when no previous rule matches. Only the action of this rule can be modified by the user.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
