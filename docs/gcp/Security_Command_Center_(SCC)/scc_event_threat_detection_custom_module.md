## 🛡️ Policy Deployment Engine: `scc_event_threat_detection_custom_module`

This section provides a concise policy evaluation for the `scc_event_threat_detection_custom_module` resource in GCP.

Reference: [Terraform Registry – scc_event_threat_detection_custom_module](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_event_threat_detection_custom_module)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `config` | Config for the module. For the resident module, its config value is defined at this level. For the inherited module, its config value is inherited from the ancestor module. | true | None | None |
| `enablement_state` | The state of enablement for the module at the given level of the hierarchy. Possible values are: `ENABLED`, `DISABLED`. | true | None | None |
| `type` | Immutable. Type for the module. e.g. CONFIGURABLE_BAD_IP. | true | None | None |
| `organization` | Numerical ID of the parent organization. | true | None | None |
| `display_name` | The human readable name to be displayed for the module. | false | None | None |
