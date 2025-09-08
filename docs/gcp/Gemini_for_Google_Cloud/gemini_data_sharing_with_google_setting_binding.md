## 🛡️ Policy Deployment Engine: `gemini_data_sharing_with_google_setting_binding`

This section provides a concise policy evaluation for the `gemini_data_sharing_with_google_setting_binding` resource in GCP.

Reference: [Terraform Registry – gemini_data_sharing_with_google_setting_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_data_sharing_with_google_setting_binding)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target` | Target of the binding. | true | None | None |
| `data_sharing_with_google_setting_id` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `setting_binding_id` | Required. Id of the setting binding. | true | None | None |
| `product` | Product type of the setting binding. Values include GEMINI_IN_BIGQUERY, GEMINI_CLOUD_ASSIST, etc. See [product reference](https://cloud.google.com/gemini/docs/api/reference/rest/v1/projects.locations.dataSharingWithGoogleSettings.settingBindings) for a complete list. | false | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
