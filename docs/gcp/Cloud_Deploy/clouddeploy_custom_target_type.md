## 🛡️ Policy Deployment Engine: `clouddeploy_custom_target_type`

This section provides a concise policy evaluation for the `clouddeploy_custom_target_type` resource in GCP.

Reference: [Terraform Registry – clouddeploy_custom_target_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_custom_target_type)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the `CustomTargetType`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the `CustomTargetType`. Max length is 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) User annotations. These attributes can only be set and used by the user, and not by Cloud Deploy. See https://google.aip.dev/128#annotations for more details such as format and size limitations. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels are attributes that can be set and used by both the user and by Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 128 bytes. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_actions`
- Description: (Optional) Configures render and deploy for the `CustomTargetType` using Skaffold custom actions. Structure is [documented below](#nested_custom_actions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_custom_actions"></a>The `custom_actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `render_action`
- Description: (Optional) The Skaffold custom action responsible for render operations. If not provided then Cloud Deploy will perform the render operations via `skaffold render`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deploy_action`
- Description: (Required) The Skaffold custom action responsible for deploy operations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_skaffold_modules`
- Description: (Optional) List of Skaffold modules Cloud Deploy will include in the Skaffold Config as required before performing diagnose. Structure is [documented below](#nested_custom_actions_include_skaffold_modules). <a name="nested_custom_actions_include_skaffold_modules"></a>The `include_skaffold_modules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `configs`
- Description: (Optional) The Skaffold Config modules to use from the specified source.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `git`
- Description: (Optional) Remote git repository containing the Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_git).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_cloud_storage`
- Description: (Optional) Cloud Storage bucket containing Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_google_cloud_storage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_cloud_build_repo`
- Description: (Optional) Cloud Build 2nd gen repository containing the Skaffold Config modules. Structure is [documented below](#nested_custom_actions_include_skaffold_modules_include_skaffold_modules_google_cloud_build_repo). <a name="nested_custom_actions_include_skaffold_modules_include_skaffold_modules_git"></a>The `git` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repo`
- Description: (Required) Git repository the package should be cloned from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Relative path from the repository root to the Skaffold file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ref`
- Description: (Optional) Git ref the package should be cloned from. <a name="nested_custom_actions_include_skaffold_modules_include_skaffold_modules_google_cloud_storage"></a>The `google_cloud_storage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Required) Cloud Storage source paths to copy recursively. For example, providing `gs://my-bucket/dir/configs/*` will result in Skaffold copying all files within the `dir/configs` directory in the bucket `my-bucket`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Relative path from the source to the Skaffold file. <a name="nested_custom_actions_include_skaffold_modules_include_skaffold_modules_google_cloud_build_repo"></a>The `google_cloud_build_repo` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Required) Cloud Build 2nd gen repository in the format of 'projects/<project>/locations/<location>/connections/<connection>/repositories/<repository>'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Relative path from the repository root to the Skaffold file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ref`
- Description: (Optional) Branch or tag to use when cloning the repository.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
