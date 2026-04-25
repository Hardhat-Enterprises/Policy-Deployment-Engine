## 🛡️ Policy Deployment Engine: `iam_principal_access_boundary_policy`

This section provides a concise policy evaluation for the `iam_principal_access_boundary_policy` resource in GCP.

Reference: [Terraform Registry – iam_principal_access_boundary_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_principal_access_boundary_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `organization` | Numeric organization ID. | true | true | Defines IAM boundary scope at organization level. | 123456789 | org-name |
| `location` | Must always be global. | true | true | Ensures centralized IAM enforcement. | global | us-central1 |
| `principal_access_boundary_policy_id` | Policy ID (2–62 chars, lowercase, numbers, hyphen, dot allowed). | true | true | Ensures valid IAM naming standard. | pab-policy-01 | INVALID_ID |
| `display_name` | Display name of policy. | false | false | No security impact. | PAB Policy |  |
| `annotations` | Metadata tags for policy. | false | false | Only metadata. | {} | {} |
