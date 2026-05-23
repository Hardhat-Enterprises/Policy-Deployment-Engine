## 🛡️ Policy Deployment Engine: `google_contact_center_insights_qa_scorecard`

This section provides a concise policy evaluation for the `google_contact_center_insights_qa_scorecard` resource in GCP.

Reference: [Terraform Registry – google_contact_center_insights_qa_scorecard](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_contact_center_insights_qa_scorecard)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location of the resource. | true | false | The location of the resource is critical for compliance and security purposes. This attribute is already covered by an implemented policy in another relevant resource. Therefore, a separate policy was not created for this resource. | None |  |
| `qa_scorecard_id` | A unique ID for the new QaScorecard. This ID will become the final component of the QaScorecard's resource name. If no ID is specified, a server-generated ID will be used. This value should be 4-64 characters and must match the regular expression `^[a-z0-9-]{4,64}$`. Valid characters are `a-z-`. | true | false | Defines the unique ID for the QaScorecard only. No direct security impact. | None |  |
| `description` | A text description explaining the intent of the scorecard. | true | false | Provides context for the scorecard's purpose. No direct security impact. | None |  |
| `display_name` | The user-specified display name of the scorecard. | true | false | Provides a user-friendly name for the scorecard. No direct security impact. | None |  |
| `is_default` | Whether the scorecard is the default one for the project. A default scorecard cannot be deleted and will always appear first in scorecard selector. | true | false | Determines the default scorecard for the project. No direct security impact. | None |  |
| `source` | Possible values: QA_SCORECARD_SOURCE_CUSTOMER_DEFINED QA_SCORECARD_SOURCE_DISCOVERY_ENGINE | true | false | Defines the source of the scorecard. No direct security impact. | None |  |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | true | false | Defines the project context only. No direct security impact. | None |  |
