## 🛡️ Policy Deployment Engine: `google_monitoring_alert_policy`

This section provides a concise policy evaluation for the `google_monitoring_alert_policy` resource in GCP.

Reference: [Terraform Registry – google_monitoring_alert_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Short name or phrase identifying the policy. | true | false | Display metadata with no security impact. | None | None |
| `combiner` | How to combine multiple conditions (AND, OR, AND_WITH_MATCHING_RESOURCE). | true | false | Logic combiner is a functional setting; the security value comes from the conditions themselves, not the combiner. | None | None |
| `conditions` | List of conditions that determine when an incident is created. | true | false | Conditions are application-specific and cannot be enforced generically via policy. | None | None |
| `enabled` | Whether the alert policy is active and can trigger incidents. | false | true | A disabled alert policy will not fire under any circumstances, silently eliminating detection and response capability. This creates a blind spot in security monitoring. | `enabled = true` | `enabled = false` |
| `notification_channels` | Channels to notify when an incident is created. | false | false | While having notification channels is good practice, their absence does not constitute a security vulnerability on its own — the alert policy still fires and records incidents. | None | None |
| `user_labels` | User-supplied key/value data for organising the policy. | false | false | Organisational metadata with no security impact. | None | None |
| `documentation` | Documentation attached to incidents created by this policy. | false | false | Operational documentation with no security impact. | None | None |
| `alert_strategy` | Configuration for alert notification timing and channel strategy. | false | false | Operational timing setting with no direct security impact. | None | None |
| `project` | The project in which the alert policy resides. | false | false | Organisational field, not a security control. | None | None |

---

## Policies Written

| Policy | Type | Attribute | Situation |
|--------|------|-----------|-----------|
| `enabled_required` | whitelist | `enabled` | Prevents alert policies from being silently disabled, which would eliminate all incident detection for that policy |

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `notification_channels` | Whether channels are configured does not affect whether incidents are detected and recorded; their absence is an operational gap, not a security vulnerability |
| `combiner` | AND vs OR combiner logic is application-specific and cannot be enforced as a blanket security policy |
