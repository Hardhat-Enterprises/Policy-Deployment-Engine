## 🛡️ Policy Deployment Engine: `scc_management_organization_event_threat_detection_custom_module`

This section provides a concise policy evaluation for the `scc_management_organization_event_threat_detection_custom_module` resource in GCP.

Reference: [Terraform Registry – scc_management_organization_event_threat_detection_custom_module](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_management_organization_event_threat_detection_custom_module)

---

## 1. Argument Reference

### `organization`
- Description: (Required) Numerical ID of the parent organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Optional) Config for the module. For the resident module, its config value is defined at this level. For the inherited module, its config value is inherited from the ancestor module.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enablement_state`
- Description: (Optional) The state of enablement for the module at the given level of the hierarchy. Possible values are: `ENABLED`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Immutable. Type for the module. e.g. CONFIGURABLE_BAD_IP.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The human readable name to be displayed for the module.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Location ID of the parent organization. Only global is supported at the moment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
