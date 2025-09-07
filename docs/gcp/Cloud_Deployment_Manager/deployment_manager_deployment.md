## 🛡️ Policy Deployment Engine: `deployment_manager_deployment`

This section provides a concise policy evaluation for the `deployment_manager_deployment` resource in GCP.

Reference: [Terraform Registry – deployment_manager_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/deployment_manager_deployment)

---

## 1. Argument Reference

### `name`
- Description: (Required) Unique name for the deployment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Required) Parameters that define your deployment, including the deployment configuration and relevant templates. Structure is [documented below](#nested_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional user-provided description of deployment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Key-value pairs to apply to this labels. Structure is [documented below](#nested_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_policy`
- Description: (Optional) Set the policy to use for creating new resources. Only used on create and update. Valid values are `CREATE_OR_ACQUIRE` (default) or `ACQUIRE`. If set to `ACQUIRE` and resources do not already exist, the deployment will fail. Note that updating this field does not actually affect the deployment, just how it is updated. Default value is `CREATE_OR_ACQUIRE`. Possible values are: `ACQUIRE`, `CREATE_OR_ACQUIRE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_policy`
- Description: (Optional) Set the policy to use for deleting new resources on update/delete. Valid values are `DELETE` (default) or `ABANDON`. If `DELETE`, resource is deleted after removal from Deployment Manager. If `ABANDON`, the resource is only removed from Deployment Manager and is not actually deleted. Note that updating this field does not actually change the deployment, just how it is updated. Default value is `DELETE`. Possible values are: `ABANDON`, `DELETE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preview`
- Description: (Optional) If set to true, a deployment is created with "shell" resources that are not actually instantiated. This allows you to preview a deployment. It can be updated to false to actually deploy with real resources. ~>**NOTE:** Deployment Manager does not allow update of a deployment in preview (unless updating to preview=false). Thus, Terraform will force-recreate deployments if either preview is updated to true or if other fields are updated while preview is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_target"></a>The `target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Required) The root configuration file to use for this deployment. Structure is [documented below](#nested_target_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `imports`
- Description: (Optional) Specifies import files for this configuration. This can be used to import templates or other files. For example, you might import a text file in order to use the file in a template. Structure is [documented below](#nested_target_imports). <a name="nested_target_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Required) The full YAML contents of your configuration file. <a name="nested_target_imports"></a>The `imports` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Optional) The full contents of the template that you want to import.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The name of the template to import, as declared in the YAML configuration. <a name="nested_labels"></a>The `labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Key for label.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of label.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
