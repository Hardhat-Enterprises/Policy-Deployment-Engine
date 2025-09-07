## 🛡️ Policy Deployment Engine: `monitoring_monitored_project`

This section provides a concise policy evaluation for the `monitoring_monitored_project` resource in GCP.

Reference: [Terraform Registry – monitoring_monitored_project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_monitored_project)

---

## 1. Argument Reference

### `name`
- Description: (Required) Immutable. The resource name of the `MonitoredProject`. On input, the resource name includes the scoping project ID and monitored project ID. On output, it contains the equivalent project numbers. Example: `locations/global/metricsScopes/{SCOPING_PROJECT_ID_OR_NUMBER}/projects/{MONITORED_PROJECT_ID_OR_NUMBER}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metrics_scope`
- Description: (Required) Required. The resource name of the existing Metrics Scope that will monitor this project. Example: locations/global/metricsScopes/{SCOPING_PROJECT_ID_OR_NUMBER}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
