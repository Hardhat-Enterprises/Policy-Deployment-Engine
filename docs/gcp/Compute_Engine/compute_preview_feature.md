## 🛡️ Policy Deployment Engine: `compute_preview_feature`

This section provides a concise policy evaluation for the `compute_preview_feature` resource in GCP.

Reference: [Terraform Registry – compute_preview_feature](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_preview_feature)

---

## 1. Argument Reference

### `activation_status`
- Description: (Required) The activation status of the preview feature. Possible values are: `ENABLED`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the preview feature.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollout_operation`
- Description: (Optional) The rollout operation of the feature. Structure is [documented below](#nested_rollout_operation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_rollout_operation"></a>The `rollout_operation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollout_input`
- Description: (Optional) The input for the rollout operation. Structure is [documented below](#nested_rollout_operation_rollout_input). <a name="nested_rollout_operation_rollout_input"></a>The `rollout_input` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predefined_rollout_plan`
- Description: (Required) Predefined rollout plans. Possible values are: `ROLLOUT_PLAN_FAST_ROLLOUT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
