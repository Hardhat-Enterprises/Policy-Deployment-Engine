## 🛡️ Policy Deployment Engine: `gemini_logging_setting`

This section provides a concise policy evaluation for the `gemini_logging_setting` resource in GCP.

Reference: [Terraform Registry – gemini_logging_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_logging_setting)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | true | Location determines physical hosting region. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'asia-east1'] |
| `logging_setting_id` | Id of the Logging Setting. | true | false | ID, not security related. | ['c', 'c1', 'c2'] | Anything  else |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Not security-related. | None | None |
| `log_prompts_and_responses` | Whether to log prompts and responses. | false | true | Recording user inputs and responses may be part of data compliance obligations and is good practice. | [True] | [False] |
| `log_metadata` | Whether to log metadata. | false | true | Determines whether contextual information about requests is recorded. Part of data compliance. | [True] | [False] |
| `project` | If it is not provided, the provider project is used. | true | false | Affects resource grouping. Not security-related. | PDE | Anything Else |
