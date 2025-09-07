## 🛡️ Policy Deployment Engine: `secure_source_manager_repository`

This section provides a concise policy evaluation for the `secure_source_manager_repository` resource in GCP.

Reference: [Terraform Registry – secure_source_manager_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secure_source_manager_repository)

---

## 1. Argument Reference

### `instance`
- Description: (Required) The name of the instance in which the repository is hosted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the Repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository_id`
- Description: (Required) The ID for the Repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the repository, which cannot exceed 500 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_config`
- Description: (Optional) Initial configurations for the repository. Structure is [documented below](#nested_initial_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: to be abandoned, rather than deleted. Setting `DELETE` deletes the resource and all its contents. Setting `PREVENT` prevents the resource from accidental deletion by erroring out during plan. Default is `DELETE`.  Possible values are: * DELETE * PREVENT * ABANDON <a name="nested_initial_config"></a>The `initial_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_branch`
- Description: (Optional) Default branch name of the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gitignores`
- Description: (Optional) List of gitignore template names user can choose from. Valid values can be viewed at https://cloud.google.com/secure-source-manager/docs/reference/rest/v1/projects.locations.repositories#initialconfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `license`
- Description: (Optional) License template name user can choose from. Valid values can be viewed at https://cloud.google.com/secure-source-manager/docs/reference/rest/v1/projects.locations.repositories#initialconfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `readme`
- Description: (Optional) README template name. Valid values can be viewed at https://cloud.google.com/secure-source-manager/docs/reference/rest/v1/projects.locations.repositories#initialconfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
