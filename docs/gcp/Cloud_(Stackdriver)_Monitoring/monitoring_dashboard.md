## 🛡️ Policy Deployment Engine: `monitoring_dashboard`

This section provides a concise policy evaluation for the `monitoring_dashboard` resource in GCP.

Reference: [Terraform Registry – monitoring_dashboard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_dashboard)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dashboard_json` | The JSON representation of a dashboard, following the format at https://cloud.google.com/monitoring/api/ref_v3/rest/v1/projects.dashboards. The representation of an existing dashboard can be found by using the [API Explorer](https://cloud.google.com/monitoring/api/ref_v3/rest/v1/projects.dashboards/get) ~> **Warning:** Because this is represented as a JSON string, Terraform doesn't have underlying information to know which fields in the string have defaults. To prevent permanent diffs from default values, Terraform will attempt to suppress diffs where the value is returned in the JSON string but doesn't exist in the configuration. Consequently, legitmate remove-only diffs will also be suppressed. For Terraform to detect the diff, key removals must also be accompanied by a non-removal change (trivial or not). - - - | true | false | Raw JSON blob defining visualisation layout and widgets. Does not control access, encryption, authentication, or network exposure. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Organisational field, not a security control. | None | None |
