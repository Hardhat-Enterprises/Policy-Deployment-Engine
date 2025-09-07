## 🛡️ Policy Deployment Engine: `firebase_extensions_instance`

This section provides a concise policy evaluation for the `firebase_extensions_instance` resource in GCP.

Reference: [Terraform Registry – firebase_extensions_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_extensions_instance)

---

## 1. Argument Reference

### `config`
- Description: (Required) The current Config of the Extension Instance. Structure is [documented below](#nested_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Required) The ID to use for the Extension Instance, which will become the final component of the instance's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Output) The unique identifier for this configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_time`
- Description: (Output) The time at which the Extension Instance Config was created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `params`
- Description: (Required) Environment variables that may be configured for the Extension
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `system_params`
- Description: (Optional) Params whose values are only available at deployment time. Unlike other params, these will not be set as environment variables on functions. See a full list of system parameters at https://firebase.google.com/docs/extensions/publishers/parameters#system_parameters
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extension_ref`
- Description: (Required) The ref of the Extension from the Registry (e.g. publisher-id/awesome-extension)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `extension_version`
- Description: (Optional) The version of the Extension from the Registry (e.g. 1.0.3). If left blank, latest is assumed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_event_types`
- Description: (Optional) List of extension events selected by consumer that extension is allowed to emit, identified by their types.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `eventarc_channel`
- Description: (Optional) Fully qualified Eventarc resource name that consumers should use for event triggers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `populated_postinstall_content`
- Description: (Output) Postinstall instructions to be shown for this Extension, with template strings representing function and parameter values substituted with actual values. These strings include: ${param:FOO}, ${function:myFunc.url}, ${function:myFunc.name}, and ${function:myFunc.location}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
