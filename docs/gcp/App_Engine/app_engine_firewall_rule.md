## 🛡️ Policy Deployment Engine: `app_engine_firewall_rule`

This section provides a concise policy evaluation for the `app_engine_firewall_rule` resource in GCP.

Reference: [Terraform Registry – app_engine_firewall_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_firewall_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_range` | IP address or range, defined using CIDR notation, of requests that this rule applies to. | true | None | None |
| `action` | The action to take if this rule matches. Possible values are: `UNSPECIFIED_ACTION`, `ALLOW`, `DENY`. | true | None | None |
| `description` | An optional string description of this rule. | false | None | None |
| `priority` | A positive integer that defines the order of rule evaluation. Rules with the lowest priority are evaluated first. A default rule at priority Int32.MaxValue matches all IPv4 and IPv6 traffic when no previous rule matches. Only the action of this rule can be modified by the user. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
