## 🛡️ Policy Deployment Engine: `deployment_manager_deployment`

This section provides a concise policy evaluation for the `deployment_manager_deployment` resource in GCP.

Reference: [Terraform Registry – deployment_manager_deployment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/deployment_manager_deployment)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Unique name for the deployment | true | false | Identifier only; does not change security posture. | Name is set and follows org/project naming standard. | Missing name or violates naming standard. |
| `target` | Parameters that define your deployment, including the deployment configuration and relevant templates. Structure is [documented below](#nested_target). | true | false | Configuration and templates determine which resources are created and with what permissions. | Target block is present and references a validated config plus (if used) signed/approved templates. | Target is missing, points to an empty/invalid config, or references unapproved templates. |
| `description` | Optional user-provided description of deployment. | false | false | Metadata only. | Description provided and useful for change/audit history. | No description for production changes. |
| `labels` | Key-value pairs to apply to this labels. Structure is [documented below](#nested_labels). | false | false | None | None | None |
| `create_policy` | Set the policy to use for creating new resources. Only used on create and update. Valid values are `CREATE_OR_ACQUIRE` (default) or `ACQUIRE`. If set to `ACQUIRE` and resources do not already exist, the deployment will fail. Note that updating this field does not actually affect the deployment, just how it is updated. Default value is `CREATE_OR_ACQUIRE`. Possible values are: `ACQUIRE`, `CREATE_OR_ACQUIRE`. | false | false | Controls whether new resources may be created implicitly. | Value is `ACQUIRE` (only adopt pre-provisioned/approved resources). | Value is `CREATE_OR_ACQUIRE` in production (may create resources outside change control). |
| `delete_policy` | Set the policy to use for deleting new resources on update/delete. Valid values are `DELETE` (default) or `ABANDON`. If `DELETE`, resource is deleted after removal from Deployment Manager. If `ABANDON`, the resource is only removed from Deployment Manager and is not actually deleted. Note that updating this field does not actually change the deployment, just how it is updated. Default value is `DELETE`. Possible values are: `ABANDON`, `DELETE`. | false | false | Abandoned resources become unmanaged and may violate lifecycle controls. | Value is `DELETE` (no orphaned resources). Exceptions require approved RFC with fallback plan. | Value is `ABANDON` without an approved exception. |
| `preview` | If set to true, a deployment is created with "shell" resources that are not actually instantiated. This allows you to preview a deployment. It can be updated to false to actually deploy with real resources. ~>**NOTE:** Deployment Manager does not allow update of a deployment in preview (unless updating to preview=false). Thus, Terraform will force-recreate deployments if either preview is updated to true or if other fields are updated while preview is true. | false | false | Preview=true prevents real changes and can mask policy signals; production deployments must be concrete and auditable. | Set to `false` in production environments. | Set to `true` in production (shell deployments). |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `config` |  | false | false | None | None | None |
| `imports` |  | false | false | None | None | None |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `config` | The root configuration file to use for this deployment. Structure is [documented below](#nested_target_config). | true | false | None | None | None |
| `imports` | Specifies import files for this configuration. This can be used to import templates or other files. For example, you might import a text file in order to use the file in a template. Structure is [documented below](#nested_target_imports). | false | false | None | None | None |

### labels Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key for label. | false | false | None | None | None |
| `value` | Value of label. | false | false | None | None | None |

### config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `content` | The full YAML contents of your configuration file. | true | false | None | None | None |

### imports Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `content` | The full contents of the template that you want to import. | false | false | None | None | None |
| `name` | The name of the template to import, as declared in the YAML configuration. | false | false | None | None | None |
