## 🛡️ Policy Deployment Engine: `gemini_data_sharing_with_google_setting`

This section provides a concise policy evaluation for the `gemini_data_sharing_with_google_setting` resource in GCP.

Reference: [Terraform Registry – gemini_data_sharing_with_google_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_data_sharing_with_google_setting)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_sharing_with_google_setting_id` | Id of the Data Sharing With Google Setting. | true | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `enable_preview_data_sharing` | Whether data sharing should be enabled in Preview products. | false | None | None |
| `enable_data_sharing` | Whether data sharing should be enabled in GA products. | false | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
