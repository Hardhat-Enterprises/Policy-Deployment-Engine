## 🛡️ Policy Deployment Engine: `iam_projects_policy_binding`

This section provides a concise policy evaluation for the `iam_projects_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_projects_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_projects_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target is the full resource name of the resource to which the policy will be bound. Immutable once set. Structure is [documented below](#nested_target). | true | true | Restricts policy binding scope to approved project principals only, preventing unauthorized identity binding. | ['//cloudresourcemanager.googleapis.com/projects/approved-project-1', '//cloudresourcemanager.googleapis.com/projects/approved-project-2'] | ['//cloudresourcemanager.googleapis.com/projects/*', '//cloudresourcemanager.googleapis.com/projects/external-project'] |
| `policy` | Required. Immutable. The resource name of the policy to be bound. The binding parent and policy must belong to the same Organization (or Project). | true | true | Ensures only approved IAM boundary policies are attached to projects. | organizations/123456789/locations/global/principalAccessBoundaryPolicies/approved-policy | organizations/123456789/locations/global/principalAccessBoundaryPolicies/unapproved-policy |
| `location` | The location of the Policy Binding | true | true | Enforcing global location ensures consistent IAM policy application across projects and prevents regional drift. | global | us-central1 |
| `policy_binding_id` | The Policy Binding ID. | true | false | Ensures consistent naming and traceability of policy bindings. | project-binding-01 | INVALID_BINDING |
| `display_name` | Optional. The description of the policy binding. Must be less than or equal to 63 characters. | false | false | Used for human-readable identification only. | Project IAM Binding Policy | Very long or unclear name exceeding limits |
| `annotations` | Optional. User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Used for tagging, auditing, and governance tracking. | env=prod, team=security | random unstructured metadata |
| `policy_kind` | Immutable. The kind of the policy to attach in this binding. This field must be one of the following:  - Left empty (will be automatically set to the policy kind) - The input policy kind   Possible values:  POLICY_KIND_UNSPECIFIED PRINCIPAL_ACCESS_BOUNDARY ACCESS | false | true | Ensures only Principal Access Boundary policies are enforced for security isolation. | PRINCIPAL_ACCESS_BOUNDARY | ACCESS, POLICY_KIND_UNSPECIFIED |
| `condition` | Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: \"Summary size limit\" description: \"Determines if a summary is less than 100 chars\" expression: \"document.summary.size() < 100\" Example (Equality): title: \"Requestor is owner\" description: \"Determines if requestor is the document owner\" expression: \"document.owner == request.auth.claims.email\"  Example (Logic): title: \"Public documents\" description: \"Determine whether the document should be publicly visible\" expression: \"document.type != 'private' && document.type != 'internal'\" Example (Data Manipulation): title: \"Notification string\" description: \"Create a notification string with a timestamp.\" expression: \"'New message received at ' + string(document.create_time)\" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information. Structure is [documented below](#nested_condition). | false | true | Allows fine-grained IAM control based on runtime conditions. | document.type != 'internal' | true (unrestricted access) |
| `project` | If it is not provided, the provider project is used. | false | true | Ensures correct project-level IAM isolation and prevents cross-project misconfiguration. | approved-project-id | external-project-id |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Required. Immutable. Full Resource Name of the principal set used for principal access boundary policy bindings. Examples for each one of the following supported principal set types: * Project: * `//cloudresourcemanager.googleapis.com/projects/PROJECT_NUMBER` * `//cloudresourcemanager.googleapis.com/projects/PROJECT_ID` * Workload Identity Pool: `//iam.googleapis.com/projects/PROJECT_NUMBER/locations/LOCATION/workloadIdentityPools/WORKLOAD_POOL_ID` It must be parent by the policy binding's parent (the project). | false | true | Ensures only approved project-level principals can be assigned IAM boundaries. | ['//cloudresourcemanager.googleapis.com/projects/approved-project-1', '//cloudresourcemanager.googleapis.com/projects/approved-project-2'] | ['//cloudresourcemanager.googleapis.com/projects/*', '//cloudresourcemanager.googleapis.com/projects/external-*'] |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | false | true | Controls conditional IAM enforcement. | None | None |
| `title` | Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | None | None | None |
| `description` | Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | None | None | None |
| `location` | Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | None | None | None |
