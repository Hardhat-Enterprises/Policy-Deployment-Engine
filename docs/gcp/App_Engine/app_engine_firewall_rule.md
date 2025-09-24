## 🛡️ Policy Deployment Engine: `app_engine_firewall_rule`

This section provides a concise policy evaluation for the `app_engine_firewall_rule` resource in GCP.

Reference: [Terraform Registry – app_engine_firewall_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_firewall_rule)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_range` | IP address or range, defined using CIDR notation, of requests that this rule applies to. | true | false | Restricting source ranges ensures only trusted networks (e.g., internal IPs, corporate ranges, or specific client ranges) can access services. | Use tightly scoped CIDR ranges (e.g., `10.0.0.0/24` or known trusted IP ranges). | Using `0.0.0.0/0` or overly broad ranges that allow unrestricted public access. |
| `action` | The action to take if this rule matches. Possible values are: `UNSPECIFIED_ACTION`, `ALLOW`, `DENY`. | true | false | Firewall actions prevent unauthorized access. Explicit deny rules are critical for reducing attack surface. | Use `DENY` for all non-trusted ranges. Allow only for trusted ranges required for business purposes. | Allowing all ranges without restrictions, or leaving action unspecified. |
| `description` | An optional string description of this rule. | false | false | Documenting rules helps teams understand purpose and avoid misconfigurations. | Description explains purpose, such as 'Allow traffic from corporate VPN'. | Description is missing or unclear, making future audits harder. |
| `priority` | A positive integer that defines the order of rule evaluation. Rules with the lowest priority are evaluated first. A default rule at priority Int32.MaxValue matches all IPv4 and IPv6 traffic when no previous rule matches. Only the action of this rule can be modified by the user. | false | false | Firewall rules should be evaluated in a strict order, ensuring critical deny rules are enforced before allow rules. | Deny rules for broad ranges have the lowest numerical priority so they are applied first. | Critical deny rules assigned higher numerical values, causing them to be evaluated after allow rules. |
| `project` | If it is not provided, the provider project is used. | false | false | Always confirm rules are applied to the intended project. | Project field matches the expected App Engine project ID. | Omitting or misconfiguring project, applying rules unintentionally elsewhere. |
