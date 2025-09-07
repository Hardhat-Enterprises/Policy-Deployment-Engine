## 🛡️ Policy Deployment Engine: `vmwareengine_network`

This section provides a concise policy evaluation for the `vmwareengine_network` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network)

---

## 1. Argument Reference

### `type`
- Description: (Required) VMware Engine network type. Possible values are: `LEGACY`, `STANDARD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the VMwareEngineNetwork should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The ID of the VMwareEngineNetwork.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description for this VMware Engine network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
