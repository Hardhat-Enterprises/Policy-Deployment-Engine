## 🛡️ Policy Deployment Engine: `scc_event_threat_detection_custom_module`

This section provides a concise policy evaluation for the `scc_event_threat_detection_custom_module` resource in GCP.

Reference: [Terraform Registry – scc_event_threat_detection_custom_module](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_event_threat_detection_custom_module)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `config` | Config for the module. For the resident module, its config value is defined at this level. For the inherited module, its config value is inherited from the ancestor module. | true | false | Ensuring a correct config enforces consistency in detection rules and prevents misconfigurations across projects or folders. | Config is defined and follows the organization’s approved security detection settings. | Config is missing, empty, or does not align with approved detection settings. |
| `enablement_state` | The state of enablement for the module at the given level of the hierarchy. Possible values are: `ENABLED`, `DISABLED`. | true | false | Modules must be enabled to ensure continuous monitoring of security events across the environment. | Enablement state is set to `ENABLED`. | Enablement state is set to `DISABLED`. |
| `type` | Immutable. Type for the module. e.g. CONFIGURABLE_BAD_IP. | true | false | Restricting to approved types ensures alignment with organizational security requirements and avoids unsupported modules. | Type is set to an approved value (e.g., CONFIGURABLE_BAD_IP). | Type is invalid or not part of the approved list. |
| `organization` | Numerical ID of the parent organization. | true | false | None | None | None |
| `display_name` | The human readable name to be displayed for the module. | false | false | None | None | None |
