## 🛡️ Policy Deployment Engine: `gemini_gemini_gcp_enablement_setting_binding`

This section provides a concise policy evaluation for the `gemini_gemini_gcp_enablement_setting_binding` resource in GCP.

Reference: [Terraform Registry – gemini_gemini_gcp_enablement_setting_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_gemini_gcp_enablement_setting_binding)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target of the binding. | true | false | Represents a logical reference only. | None | None |
| `gemini_gcp_enablement_setting_id` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | false | ID, not security related. | ['c', 'c1', 'c2'] | Anything  else |
| `setting_binding_id` | Id of the setting binding. | true | false | Not security-related. | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Not security-related. | None | None |
| `product` | Product type of the setting binding. Values include GEMINI_IN_BIGQUERY, GEMINI_CLOUD_ASSIST, etc. See [product reference](https://cloud.google.com/gemini/docs/api/reference/rest/v1/projects.locations.dataSharingWithGoogleSettings.settingBindings) for a complete list. | false | false | Not security-related. | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | false | Location determines physical hosting region. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'asia-east1'] |
| `project` | If it is not provided, the provider project is used. | true | false | Affects resource grouping. Not security-related. | PDE | Anything Else |
