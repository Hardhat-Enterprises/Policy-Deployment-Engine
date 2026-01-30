## 🛡️ Policy Deployment Engine: `gemini_gemini_gcp_enablement_setting`

This section provides a concise policy evaluation for the `gemini_gemini_gcp_enablement_setting` resource in GCP.

Reference: [Terraform Registry – gemini_gemini_gcp_enablement_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_gemini_gcp_enablement_setting)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | true | Location determines physical hosting region. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'asia-east1'] |
| `gemini_gcp_enablement_setting_id` | Id of the Gemini Gcp Enablement setting. | true | false | ID, not security related. | ['c', 'c1', 'c2'] | Anything  else |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Not security-related. | None | None |
| `enable_customer_data_sharing` | Whether customer data sharing should be enabled. | false | true | Controls a config that enables organisational data to be shared with Google, which involves data security and governance | [False] | [True] |
| `disable_web_grounding` | , Deprecated) Whether web grounding should be disabled. ~> **Warning:** `disable_web_grounding` is deprecated. Use `web_grounding_type` instead. | false | false | Deprecated. | None | None |
| `web_grounding_type` | Web grounding type. Possible values: GROUNDING_WITH_GOOGLE_SEARCH WEB_GROUNDING_FOR_ENTERPRISE | false | true | WEB_GROUNDING_FOR_ENTERPRISE is more secure as it is designed for high data security enterprises. | WEB_GROUNDING_FOR_ENTERPRISE | GROUNDING_WITH_GOOGLE_SEARCH |
| `project` | If it is not provided, the provider project is used. | true | false | Affects resource grouping. Not security-related. | PDE | Anything Else |
