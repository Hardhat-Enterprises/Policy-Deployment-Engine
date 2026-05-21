## 🛡️ Policy Deployment Engine: `google_contact_center_insights_auto_labeling_rule`

This section provides a concise policy evaluation for the `google_contact_center_insights_auto_labeling_rule` resource in GCP.

Reference: [Terraform Registry – google_contact_center_insights_auto_labeling_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_contact_center_insights_auto_labeling_rule)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location of the resource. | true | true | The location of the resource is critical for compliance and security purposes. | australia-southeast1 |  |
| `active` | Whether the rule is active. | true | false | The active status of the rule determines whether it is applied to conversations, which can have security implications. However, this attribute does not currently have a policy implementation in this resource. Therefore, security_impact is marked as true to reflect the potential implications. | True |  |
| `display_name` | Display Name of the auto labeling rule. | true | false | Used for identification purposes only. No direct security impact. | None |  |
| `description` | The description of the rule. | true | false | Used for identification purposes only. No direct security impact. | None |  |
| `label_key_type` | The type of the label key. Possible values are: `LABEL_KEY_TYPE_UNSPECIFIED`, `LABEL_KEY_TYPE_CUSTOM`. | true | true | The type of the label key can have security implications, especially if it's a custom type. | LABEL_KEY_TYPE_CUSTOM |  |
| `label_key` | The label key. | true | true | The label key itself can have security implications, especially if it contains sensitive information. | risk level |  |
| `conditions` | Conditions to apply for auto-labeling the label_key. Structure is [documented below](#nested_conditions). | true | false | Conditions define the logic for when the auto-labeling rule should be applied. While they are critical for the functionality of the rule, they do not have direct security implications. | None |  |
| `auto_labeling_rule_id` | A unique ID for the new AutoLabelingRule. This ID will become the final component of the AutoLabelingRule's resource name. If no ID is specified, a server-generated ID will be used. This value should be 4-64 characters and must match the regular expression `^[A-Za-z0-9]{4,64}$`. | false | false | Used for identification purposes only. No direct security impact. | None |  |
| `project` | If it is not provided, the provider project is used. | true | false | Used for identification purposes only. No direct security impact. | None |  |

### conditions Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `condition` | A optional CEL expression to be evaluated as a boolean value. Once evaluated as true, then we will proceed with the value evaluation. An empty condition will be auto evaluated as true. | true | false | Defines CEL evaluation logic for auto-labeling. No direct security impact. | None |  |
| `value` | CEL expression to be evaluated as the value. | true | false | Defines the evaluated labeling value only. No direct security impact. | None |  |
