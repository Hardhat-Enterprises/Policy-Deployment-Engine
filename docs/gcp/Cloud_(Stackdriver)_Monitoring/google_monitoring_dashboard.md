## 🛡️ Policy Deployment Engine: `google_monitoring_dashboard`

This section provides a concise policy evaluation for the `google_monitoring_dashboard` resource in GCP.

Reference: [Terraform Registry – google_monitoring_dashboard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_dashboard)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dashboard_json` | The full JSON representation of the dashboard configuration. | true | false | This is a raw JSON blob defining visualisation layout and widgets. It does not control access, encryption, authentication, or network exposure. | None | None |
| `project` | The project in which the dashboard resides. | false | false | Organisational field, not a security control. | None | None |

---

## Policies Written

None. This resource contains only a raw JSON configuration blob for a visual dashboard and a project identifier. Neither attribute presents a meaningful security control opportunity.

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `dashboard_json` | Contains visualisation layout data only; no security-enforceable attributes are exposed at the Terraform resource level |
