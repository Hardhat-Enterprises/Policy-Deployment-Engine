## 🛡️ Policy Deployment Engine: `dataform_repository`

This section provides a concise policy evaluation for the `dataform_repository` resource in GCP.

Reference: [Terraform Registry – dataform_repository](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataform_repository)

---

## 1. Argument Reference

### `name`
- Description: (Required) The repository's name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `git_remote_settings`
- Description: (Optional) Optional. If set, configures this repository to be linked to a Git remote. Structure is [documented below](#nested_git_remote_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workspace_compilation_overrides`
- Description: (Optional) If set, fields of workspaceCompilationOverrides override the default compilation settings that are specified in dataform.json when creating workspace-scoped compilation results. Structure is [documented below](#nested_workspace_compilation_overrides).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The service account to run workflow invocations under.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `npmrc_environment_variables_secret_version`
- Description: (Optional) Optional. The name of the Secret Manager secret version to be used to interpolate variables into the .npmrc file for package installation operations. Must be in the format projects/*/secrets/*/versions/*. The file itself must be in a JSON format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. The repository's user-friendly name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) Optional. The reference to a KMS encryption key. If provided, it will be used to encrypt user data in the repository and all child resources. It is not possible to add or update the encryption key after the repository is created. Example projects/[kms_project_id]/locations/[region]/keyRings/[key_region]/cryptoKeys/[key]
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Repository user labels. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) A reference to the region
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: <a name="nested_git_remote_settings"></a>The `git_remote_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Required) The Git remote's URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_branch`
- Description: (Required) The Git remote's default branch name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authentication_token_secret_version`
- Description: (Optional) The name of the Secret Manager secret version to use as an authentication token for Git operations. This secret is for assigning with HTTPS only(for SSH use `ssh_authentication_config`). Must be in the format projects/*/secrets/*/versions/*.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_authentication_config`
- Description: (Optional) Authentication fields for remote uris using SSH protocol. Structure is [documented below](#nested_git_remote_settings_ssh_authentication_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_status`
- Description: (Output) Indicates the status of the Git access token. https://cloud.google.com/dataform/reference/rest/v1beta1/projects.locations.repositories#TokenStatus <a name="nested_git_remote_settings_ssh_authentication_config"></a>The `ssh_authentication_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_private_key_secret_version`
- Description: (Required) The name of the Secret Manager secret version to use as a ssh private key for Git operations. Must be in the format projects/*/secrets/*/versions/*.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_public_key`
- Description: (Required) Content of a public SSH key to verify an identity of a remote Git host. <a name="nested_workspace_compilation_overrides"></a>The `workspace_compilation_overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_database`
- Description: (Optional) The default database (Google Cloud project ID).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_suffix`
- Description: (Optional) The suffix that should be appended to all schema (BigQuery dataset ID) names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_prefix`
- Description: (Optional) The prefix that should be prepended to all table names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
