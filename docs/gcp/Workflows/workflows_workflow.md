## 🛡️ Policy Deployment Engine: `workflows_workflow`

This section provides a concise policy evaluation for the `workflows_workflow` resource in GCP.

Reference: [Terraform Registry – workflows_workflow](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workflows_workflow)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the Workflow. | false | None | None |
| `description` | Description of the workflow provided by the user. Must be at most 1000 unicode characters long. | false | None | None |
| `labels` | A set of key/value label pairs to assign to this Workflow. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `service_account` | Name of the service account associated with the latest workflow version. This service account represents the identity of the workflow and determines what permissions the workflow has. Format: projects/{project}/serviceAccounts/{account} or {account}. Using - as a wildcard for the {project} or not providing one at all will infer the project from the account. The {account} value can be the email address or the unique_id of the service account. If not provided, workflow will use the project's default service account. Modifying this field for an existing workflow results in a new workflow revision. | false | None | None |
| `source_contents` | Workflow code to be executed. The size limit is 128KB. | false | None | None |
| `crypto_key_name` | The KMS key used to encrypt workflow and execution data. Format: projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey} | false | None | None |
| `call_log_level` | Describes the level of platform logging to apply to calls and call responses during executions of this workflow. If both the workflow and the execution specify a logging level, the execution level takes precedence. Possible values are: `CALL_LOG_LEVEL_UNSPECIFIED`, `LOG_ALL_CALLS`, `LOG_ERRORS_ONLY`, `LOG_NONE`. | false | None | None |
| `execution_history_level` | Describes the level of execution history to be stored for this workflow. This configuration determines how much information about workflow executions is preserved. If not specified, defaults to EXECUTION_HISTORY_LEVEL_UNSPECIFIED. Possible values are: `EXECUTION_HISTORY_LEVEL_UNSPECIFIED`, `EXECUTION_HISTORY_BASIC`, `EXECUTION_HISTORY_DETAILED`. | false | None | None |
| `user_env_vars` | User-defined environment variables associated with this workflow revision. This map has a maximum length of 20. Each string can take up to 4KiB. Keys cannot be empty strings and cannot start with "GOOGLE" or "WORKFLOWS". | false | None | None |
| `tags` | A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. The field is ignored (both PUT & PATCH) when empty. | false | None | None |
| `region` | The region of the workflow. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` | When a`terraform destroy` or `terraform apply` would delete the workflow, the command will fail if this field is not set to false in Terraform state. When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the workflow will fail. When the field is set to false, deleting the workflow is allowed. | none | None | None |
| `name_prefix` | specified prefix. If this and name are unspecified, a random value is chosen for the name. | none | None | None |
