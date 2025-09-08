## 🛡️ Policy Deployment Engine: `gemini_logging_setting`

This section provides a concise policy evaluation for the `gemini_logging_setting` resource in GCP.

Reference: [Terraform Registry – gemini_logging_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_logging_setting)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `logging_setting_id` | Id of the Logging Setting. | true | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `log_prompts_and_responses` | Whether to log prompts and responses. | false | None | None |
| `log_metadata` | Whether to log metadata. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
