## 🛡️ Policy Deployment Engine: `ml_engine_model`

This section provides a concise policy evaluation for the `ml_engine_model` resource in GCP.

Reference: [Terraform Registry – ml_engine_model](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/ml_engine_model)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name specified for the model.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description specified for the model when it was created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_version`
- Description: (Optional) The default version of the model. This version will be used to handle prediction requests that do not specify a version. Structure is [documented below](#nested_default_version).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regions`
- Description: (Optional) The list of regions where the model is going to be deployed. Currently only one region per model is supported
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `online_prediction_logging`
- Description: (Optional) If true, online prediction access logs are sent to StackDriver Logging.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `online_prediction_console_logging`
- Description: (Optional) If true, online prediction nodes send stderr and stdout streams to Stackdriver Logging
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) One or more labels that you can add, to organize your models. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_default_version"></a>The `default_version` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name specified for the version when it was created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
