## 🛡️ Policy Deployment Engine: `iam_projects_policy_binding`

This section provides a concise policy evaluation for the `iam_projects_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_projects_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_projects_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | GCP project ID where the policy binding is applied. Must follow valid project naming rules (lowercase letters, numbers, and hyphens). | false | true | Ensures IAM policy is attached to a valid and controlled project scope. | my-project-123 | Invalid_Project |
| `location` | Location of the policy binding. Must always be global for IAM project policy bindings. | true | true | IAM bindings must be globally consistent for proper access control enforcement. | global | us-central1 |
| `policy_binding_id` | Unique identifier for the policy binding within the project. | true | true | Ensures each IAM binding can be uniquely tracked and managed. | project-binding-01 | Project Binding #1 |
| `display_name` | Optional human-readable name for the policy binding (maximum 63 characters). | false | false | Used only for identification and has no security impact. | Project IAM Binding | This is an extremely long invalid display name that exceeds allowed character limits for IAM resources |
| `annotations` | Optional metadata used to tag and classify the policy binding. | false | false | Annotations are informational only and do not affect IAM enforcement. | {'environment': 'prod', 'team': 'security'} | {'note': 'This annotation contains excessive invalid metadata that should not be used in production IAM configurations because it violates expected structure and readability standards'} |
| `policy_kind` | Type of policy being applied. Possible values include ACCESS or PRINCIPAL_ACCESS_BOUNDARY. | false | true | Determines IAM enforcement behavior and access model. | ACCESS | UNKNOWN_TYPE |
| `target` | Full resource name of the target project where the policy binding is applied. | true | true | Defines exact IAM enforcement scope at project level. | //cloudresourcemanager.googleapis.com/projects/my-project-123 | //invalid/resource/name |
| `condition` | Optional IAM condition using Common Expression Language (CEL) for conditional access control. | false | true | Allows fine-grained access control based on logical conditions. | {'expression': "resource.name.startsWith('projects/')", 'title': 'Project access rule', 'description': 'Allows access only to project resources'} | {'expression': 'true'} |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Principal set defining which identities are allowed within the project scope. | false | true | Restricts access to approved identities within project boundary. | //cloudresourcemanager.googleapis.com/projects/123456789 | //cloudresourcemanager.googleapis.com/folders/123 |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression used to define IAM conditional logic. | false | true | Controls when IAM policy is applied. | resource.name.startsWith('projects/') | true |
| `title` | Short title describing the IAM condition. | false | false | Used for readability only. | Project Condition |  |
| `description` | Detailed explanation of the IAM condition. | false | false | Documentation purpose only. | Restricts access to project-level resources only |  |
| `location` | Debugging reference for IAM condition evaluation. | false | false | Used for error tracing and debugging. | global |  |
