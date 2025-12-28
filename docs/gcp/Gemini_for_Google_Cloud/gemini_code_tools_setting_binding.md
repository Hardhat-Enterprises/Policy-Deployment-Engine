## 🛡️ Policy Deployment Engine: `gemini_code_tools_setting_binding`

This section provides a concise policy evaluation for the `gemini_code_tools_setting_binding` resource in GCP.

Reference: [Terraform Registry – gemini_code_tools_setting_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_code_tools_setting_binding)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target of the binding. | true | false | Represents a logical reference only. | None | None |
| `code_tools_setting_id` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | false | Identifiers determine naming structure only | None | None |
| `setting_binding_id` | Id of the setting binding. | true | false | Binding IDs are naming elements only | None | None |
| `product` | Product type of the setting binding. Possible values are: `GEMINI_CODE_ASSIST`. | false | false | Product selection affects functional behaviour but not security posture directly. | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are metadata only. Should avoid secrets | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | true | Location determines geographic residency of associated configurations. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'asia-east1'] |
| `project` | If it is not provided, the provider project is used. | false | false | Not security related. | PDE | Anything else |
