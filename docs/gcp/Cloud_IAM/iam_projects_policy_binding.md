## 🛡️ Policy Deployment Engine: `iam_projects_policy_binding`

This section provides a concise policy evaluation for the `iam_projects_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_projects_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_projects_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target is the full resource name of the resource to which the policy will be bound. Immutable once set. | true | true | Restricts policy binding scope to approved project principals only, preventing unauthorized identity binding. | ['//cloudresourcemanager.googleapis.com/projects/approved-project-1', '//cloudresourcemanager.googleapis.com/projects/approved-project-2'] | ['//cloudresourcemanager.googleapis.com/projects/*', '//cloudresourcemanager.googleapis.com/projects/external-project'] |
| `policy` | The resource name of the policy to be bound. | true | true | Ensures only approved IAM boundary policies are attached to projects. | organizations/123456789/locations/global/principalAccessBoundaryPolicies/approved-policy | organizations/123456789/locations/global/principalAccessBoundaryPolicies/unapproved-policy |
| `location` | The location of the Policy Binding. | true | true | Enforcing global location ensures consistent IAM policy application across projects and prevents regional drift. | global | us-central1 |
| `policy_binding_id` | The Policy Binding ID. | true | false | Ensures consistent naming and traceability of policy bindings. | project-binding-01 | INVALID_BINDING |
| `display_name` | Optional description of the policy binding. | false | false | Used for human-readable identification only. | Project IAM Binding Policy | Very long or unclear name exceeding limits |
| `annotations` | User-defined metadata annotations. | false | false | Used for tagging, auditing, and governance tracking. | env=prod, team=security | random unstructured metadata |
| `policy_kind` | The kind of policy to attach in this binding. | false | true | Ensures only Principal Access Boundary policies are enforced for security isolation. | PRINCIPAL_ACCESS_BOUNDARY | ACCESS, POLICY_KIND_UNSPECIFIED |
| `condition` | CEL expression controlling conditional policy binding. | false | true | Allows fine-grained IAM control based on runtime conditions. | document.type != 'internal' | true (unrestricted access) |
| `project` | The project where the policy binding is applied. | false | true | Ensures correct project-level IAM isolation and prevents cross-project misconfiguration. | approved-project-id | external-project-id |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Full resource name of the principal set used for IAM policy binding. | false | true | Ensures only approved project-level principals can be assigned IAM boundaries. | ['//cloudresourcemanager.googleapis.com/projects/approved-project-1', '//cloudresourcemanager.googleapis.com/projects/approved-project-2'] | ['//cloudresourcemanager.googleapis.com/projects/*', '//cloudresourcemanager.googleapis.com/projects/external-*'] |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | CEL expression for conditional logic. | false | true | Controls conditional IAM enforcement. | None | None |
| `title` | Title of the condition. | false | false | None | None | None |
| `description` | Description of the condition. | false | false | None | None | None |
| `location` | Location of expression for debugging. | false | false | None | None | None |
