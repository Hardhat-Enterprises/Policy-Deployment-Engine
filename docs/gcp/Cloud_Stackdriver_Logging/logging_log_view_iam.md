## 🛡️ Policy Deployment Engine: `logging_log_view_iam`

This section provides a concise policy evaluation for the `logging_log_view_iam` resource in GCP.

Reference: [Terraform Registry – logging_log_view_iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_log_view_iam)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `parent` | The parent resource of the log view. Format: projects/PROJECT_ID/locations/LOCATION/buckets/BUCKET_ID | true | false | Parent identifies which bucket contains the log view. Has no direct security impact beyond resource identification. | projects/my-project/locations/global/buckets/audit-bucket | None |
| `location` | The location of the resource. If no location is provided in the parent identifier and no location is specified, it is taken from the provider configuration. Examples: global, us-central1, eu | false | false | Location selection affects data residency but has no direct impact on IAM security controls. | global | None |
| `bucket` | The logging bucket that contains the log view. Format: buckets/BUCKET_ID | true | false | Bucket identifies which logging bucket contains the view. Has no direct security impact beyond resource identification. | buckets/audit-log-bucket | None |
| `name` | The name of the log view. Format: views/VIEW_NAME | true | false | Name is a unique identifier for the log view. Has no security implications beyond being a reference name. | views/_Default | None |
| `member/members` | Identities that will be granted the role. Each entry can be: allUsers, allAuthenticatedUsers, user:{emailid}, serviceAccount:{emailid}, group:{emailid}, domain:{domain}, projectOwner:projectid, projectEditor:projectid, projectViewer:projectid | true | true | Members determine who has access to view logs. Granting access to allUsers or allAuthenticatedUsers exposes logs to unauthorized parties, violating confidentiality and compliance requirements. Overly permissive access (e.g., projectViewer) may grant log access to unintended users. | ["serviceAccount:security-auditor@my-project.iam.gserviceaccount.com"] | ["allUsers", "allAuthenticatedUsers", "user:unauthorized@gmail.com"] |
| `role` | The IAM role to grant to the members. Valid roles include: roles/logging.viewAccessor, roles/logging.privateLogViewer, roles/logging.logWriter. Custom roles format: [projects|organizations]/{parent-name}/roles/{role-name} | true | true | Role determines what actions members can perform on logs. Granting overly permissive roles (e.g., roles/logging.logWriter) allows log modification or deletion. Only grant roles/logging.viewAccessor for read-only access to logs. | roles/logging.viewAccessor | roles/logging.logWriter |
| `policy_data` | The policy data from a google_iam_policy data source. Use this for fine-grained control over the entire IAM policy. Conflicts with member/members and role. | false | true | Policy data defines the complete IAM policy. Misconfiguration can inadvertently remove critical permissions or grant excessive access. | data.google_iam_policy.admin_policy.policy_data | None |
| `condition` | An IAM condition that restricts when the role binding is active. Structure documented below. | false | true | Conditions can be used to enforce time-based or attribute-based access controls (e.g., only allow access during business hours or from specific IP ranges). Misconfigured conditions may grant unintended access or block legitimate access. | Refer to child arguments | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | A Common Expression Language (CEL) expression that defines the condition. Example: request.time < timestamp('2025-01-01T00:00:00Z') | true | true | Expression defines the logic for when access is granted. Incorrect expressions can bypass security controls or lock out legitimate users. | request.time >= timestamp('2025-01-01T00:00:00Z') | true |
| `title` | A title for the condition that describes its purpose. | true | false | Title is descriptive metadata and has no security impact. | Temporary audit access - expires Jan 2025 | None |
| `description` | A description of the condition. ~> **Warning:** Terraform considers the role and condition contents (title+description+expression) as the identifier for the binding. This means that if any part of the condition is changed out-of-band, Terraform will consider it to be an entirely different resource. | false | false | Description is metadata only and does not affect security controls. | Temporary access for compliance audit until 2025-01-01 | None |
