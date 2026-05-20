## 🛡️ Policy Deployment Engine: `google_monitoring_monitored_project`

This section provides a concise policy evaluation for the `google_monitoring_monitored_project` resource in GCP.

Reference: [Terraform Registry – google_monitoring_monitored_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_monitored_project)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the MonitoredProject, including scoping project and monitored project IDs. | true | false | Immutable identifier field with no security impact. | None | None |
| `metrics_scope` | The resource name of the existing Metrics Scope that will monitor this project. | true | false | Organisational scoping field with no direct security impact; it links a project into a metrics scope, not a security control. | None | None |

---

## Policies Written

None. This resource has only two arguments, both of which are immutable identifiers that link a project into a metrics scope. Neither presents a meaningful security control opportunity.

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `metrics_scope` | Scoping project association is an organisational/administrative setting, not a security control |
