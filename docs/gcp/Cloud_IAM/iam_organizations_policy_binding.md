## 🛡️ Policy Deployment Engine: `iam_organizations_policy_binding`

This section provides a concise policy evaluation for the `iam_organizations_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_organizations_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_organizations_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `organization` | Numeric organization ID for binding. | true | true | Ensures policy is attached to correct organization boundary. | 123456789 | org-name |
| `location` | Must always be global. | true | true | IAM bindings must be globally consistent. | global | us-central1 |
| `policy_binding_id` | Unique identifier for policy binding. | true | true | Ensures unique tracking of bindings. | binding-001 | binding#1 |
| `display_name` | Human readable name for policy binding. | false | false | No security impact. | Org Binding |  |
| `annotations` | User-defined metadata annotations. | false | false | Used for tagging only. | {} | {} |
| `policy_kind` | Type of policy: PRINCIPAL_ACCESS_BOUNDARY or ACCESS. | false | true | Controls IAM enforcement behavior. | ACCESS | UNKNOWN |
