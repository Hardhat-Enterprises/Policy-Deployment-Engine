## 🛡️ Policy Deployment Engine: `colab_runtime`

This section provides a concise policy evaluation for the `colab_runtime` resource in GCP.

Reference: [Terraform Registry – colab_runtime](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/colab_runtime)

---

## 1. Argument Reference

### `runtime_user`
- Description: (Required) The user email of the NotebookRuntime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Required. The display name of the Runtime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource: https://cloud.google.com/colab/docs/locations
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook_runtime_template_ref`
- Description: (Optional) 'Runtime specific information used for NotebookRuntime creation.' Structure is [documented below](#nested_notebook_runtime_template_ref).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the Runtime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The resource name of the Runtime
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_state`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_upgrade`
- Description: <a name="nested_notebook_runtime_template_ref"></a>The `notebook_runtime_template_ref` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook_runtime_template`
- Description: (Required) The resource name of the NotebookRuntimeTemplate based on which a NotebookRuntime will be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
