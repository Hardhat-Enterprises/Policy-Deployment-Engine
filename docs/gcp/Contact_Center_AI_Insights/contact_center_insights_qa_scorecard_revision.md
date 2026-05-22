## 🛡️ Policy Deployment Engine: `google_contact_center_insights_qa_scorecard_revision`

This section provides a concise policy evaluation for the `google_contact_center_insights_qa_scorecard_revision` resource in GCP.

Reference: [Terraform Registry – google_contact_center_insights_qa_scorecard_revision](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_contact_center_insights_qa_scorecard_revision)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the resource is critical for compliance and security purposes. | true | false | The location of the resource is critical for compliance and security purposes. This attribute is already covered by an implemented policy in another relevant resource. Therefore, a separate policy was not created for this resource. | None |  |
| `qa_scorecard` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | false | Provides the ID of the parent QaScorecard. No direct security impact. | None |  |
| `qa_scorecard_revision_id` | A unique ID for the new QaScorecardRevision. This ID will become the final component of the QaScorecardRevision's resource name. If no ID is specified this resource will get the latest revision on the given scorecard. | true | false | Defines the unique ID for the QaScorecardRevision. No direct security impact. | None |  |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | true | false | Defines the project context only. No direct security impact. | None |  |
