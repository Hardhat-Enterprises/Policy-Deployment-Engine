## 🛡️ Policy Deployment Engine: `gemini_data_sharing_with_google_setting`

This section provides a concise policy evaluation for the `gemini_data_sharing_with_google_setting` resource in GCP.

Reference: [Terraform Registry – gemini_data_sharing_with_google_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_data_sharing_with_google_setting)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_sharing_with_google_setting_id` | Id of the Data Sharing With Google Setting. | true | false | ID, not security related. | ['c', 'c1', 'c2'] | Anything  else |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Not security-related. | None | None |
| `enable_preview_data_sharing` | Whether data sharing should be enabled in Preview products. | false | true | Controls a config that enables organisational data to be shared with Google within Preview Products, which involves data security and governance | [False] | [True] |
| `enable_data_sharing` | Whether data sharing should be enabled in GA products. | false | true | Controls a config that enables organisational data to be shared with Google within GA Products, which involves data security and governance | [False] | [True] |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | false | Location determines physical hosting region. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'asia-east1'] |
| `project` | If it is not provided, the provider project is used. | true | false | Affects resource grouping. Not security-related. | PDE | Anything Else |
