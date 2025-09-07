## 🛡️ Policy Deployment Engine: `dialogflow_cx_version`

This section provides a concise policy evaluation for the `dialogflow_cx_version` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_version)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The human-readable name of the version. Limit of 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the version. The maximum length is 500 characters. If exceeded, the request is rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The Flow to create an Version for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>/flows/<Flow ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
