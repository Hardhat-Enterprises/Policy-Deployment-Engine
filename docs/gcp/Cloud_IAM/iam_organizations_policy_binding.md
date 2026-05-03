## 🛡️ Policy Deployment Engine: `iam_organizations_policy_binding`

This section provides a concise policy evaluation for the `iam_organizations_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_organizations_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_organizations_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target is the full resource name of the resource to which the policy will be bound. Immutable once set. | true | true | Defines the exact principal scope for IAM binding enforcement, preventing unauthorized identity expansion. | //cloudresourcemanager.googleapis.com/organizations/123456789 | //cloudresourcemanager.googleapis.com/projects/untrusted-project |
| `policy` | Required. Immutable. The resource name of the policy to be bound. | true | true | Ensures binding only approved Principal Access Boundary policies within the organization. | organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy-1 | organizations/123456789/locations/global/principalAccessBoundaryPolicies/unknown-policy |
| `organization` | Parent organization of the Policy Binding. | true | true | Ensures IAM governance is enforced at the correct organizational boundary. | 123456789 | 999999999 |
| `location` | The location of the Policy Binding | true | true | Enforces centralized IAM policy binding control. | global | us-central1 |
| `policy_binding_id` | The Policy Binding ID. | true | true | Ensures unique identification of IAM policy bindings. | org-binding-001 | invalid binding id!! |
| `display_name` | Optional description of the policy binding. | false | false | Improves readability and auditability. | Org Access Boundary Binding | x |
| `annotations` | User-defined annotations for metadata tagging. | false | false | Used for governance and tracking only. | {'env': 'prod'} | {'env': 'test'} |
| `policy_kind` | Type of policy attached in this binding. | false | true | Restricts IAM binding to secure boundary enforcement policies. | PRINCIPAL_ACCESS_BOUNDARY | ACCESS |
| `condition` | CEL condition for fine-grained policy enforcement. | false | true | Allows conditional IAM enforcement based on attributes. |  |  |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Full Resource Name of the principal set used for principal access boundary policy bindings. | false | true | Ensures only approved identity domains (org/workforce/workspace) are used. | //cloudresourcemanager.googleapis.com/organizations/123456789 | //cloudresourcemanager.googleapis.com/organizations/000000000 |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression controlling IAM access. | false | false |  | request.time < timestamp('2026-12-31T00:00:00Z') | true |
| `title` | Short title of the condition. | false | false |  | Time Restricted Access |  |
| `description` | Description of the condition logic. | false | false |  | Restricts access based on time window |  |
| `location` | Error reporting location metadata. | false | false |  | global | unknown |
