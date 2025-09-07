## 🛡️ Policy Deployment Engine: `chronicle_rule_deployment`

This section provides a concise policy evaluation for the `chronicle_rule_deployment` resource in GCP.

Reference: [Terraform Registry – chronicle_rule_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/chronicle_rule_deployment)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the resource. This is the geographical region where the Chronicle instance resides, such as "us" or "europe-west2".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The unique identifier for the Chronicle instance, which is the same as the customer ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule`
- Description: (Required) The Rule ID of the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether the rule is currently deployed continuously against incoming data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alerting`
- Description: (Optional) Whether detections resulting from this deployment should be considered alerts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `archived`
- Description: (Optional) The archive state of the rule deployment. Cannot be set to true unless enabled is set to false i.e. archiving requires a two-step process: first, disable the rule by setting 'enabled' to false, then set 'archive' to true. If set to true, alerting will automatically be set to false. If currently set to true, enabled, alerting, and run_frequency cannot be updated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_frequency`
- Description: (Optional) The run frequency of the rule deployment. Possible values: LIVE HOURLY DAILY
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
