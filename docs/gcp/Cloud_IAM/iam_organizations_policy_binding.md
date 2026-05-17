## 🛡️ Policy Deployment Engine: `iam_organizations_policy_binding`

This section provides a concise policy evaluation for the `iam_organizations_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_organizations_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_organizations_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target is the full resource name of the resource to which the policy will be bound. Immutable once set. Structure is [documented below](#nested_target). | true | true | Defines the exact principal scope for IAM binding enforcement and prevents unauthorized identity expansion. | //cloudresourcemanager.googleapis.com/organizations/123456789 | //cloudresourcemanager.googleapis.com/projects/untrusted-project |
| `policy` | Required. Immutable. The resource name of the policy to be bound. The binding parent and policy must belong to the same Organization (or Project). | true | true | Ensures binding only approved Principal Access Boundary policies within the organization. | organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy-1 | organizations/123456789/locations/global/principalAccessBoundaryPolicies/unknown-policy |
| `organization` | The parent organization of the Policy Binding. | true | true | Ensures IAM governance is enforced at the correct organizational boundary. | 123456789 | 999999999 |
| `location` | The location of the Policy Binding | true | true | Enforces centralized IAM policy binding control. | global | us-central1 |
| `policy_binding_id` | The Policy Binding ID. | true | true | Ensures unique identification of IAM policy bindings. | org-binding-001 | invalid binding id!! |
| `display_name` | Optional. The description of the policy binding. Must be less than or equal to 63 characters. | false | false | Improves readability and auditability. |  |  |
| `annotations` | Optional. User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Used for governance, metadata tagging, and tracking purposes only. |  |  |
| `policy_kind` | Immutable. The kind of the policy to attach in this binding. This field must be one of the following:  - Left empty (will be automatically set to the policy kind) - The input policy kind   Possible values:  POLICY_KIND_UNSPECIFIED PRINCIPAL_ACCESS_BOUNDARY ACCESS | false | true | Restricts IAM binding to secure boundary enforcement policies. | PRINCIPAL_ACCESS_BOUNDARY | ACCESS |
| `condition` | Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: \"Summary size limit\" description: \"Determines if a summary is less than 100 chars\" expression: \"document.summary.size() < 100\" Example (Equality): title: \"Requestor is owner\" description: \"Determines if requestor is the document owner\" expression: \"document.owner == request.auth.claims.email\"  Example (Logic): title: \"Public documents\" description: \"Determine whether the document should be publicly visible\" expression: \"document.type != 'private' && document.type != 'internal'\" Example (Data Manipulation): title: \"Notification string\" description: \"Create a notification string with a timestamp.\" expression: \"'New message received at ' + string(document.create_time)\" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information. Structure is [documented below](#nested_condition). | false | true | Allows conditional IAM enforcement based on attributes and contextual access restrictions. | request.time < timestamp('2026-12-31T00:00:00Z') | true |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Required. Immutable. Full Resource Name of the principal set used for principal access boundary policy bindings. Examples for each one of the following supported principal set types: * Organization `//cloudresourcemanager.googleapis.com/organizations/ORGANIZATION_ID` * Workforce Identity: `//iam.googleapis.com/locations/global/workforcePools/WORKFORCE_POOL_ID` * Workspace Identity: `//iam.googleapis.com/locations/global/workspace/WORKSPACE_ID` It must be parent by the policy binding's parent (the organization). | false | true | Ensures only approved identity domains such as organization, workforce, or workspace identities are used. | //cloudresourcemanager.googleapis.com/organizations/123456789 | //cloudresourcemanager.googleapis.com/organizations/000000000 |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | false | true | Controls IAM access behavior through conditional authorization logic. | request.time < timestamp('2026-12-31T00:00:00Z') | true |
| `title` | Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | Used only for readability and operational clarity. |  |  |
| `description` | Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | Provides human-readable explanation of the CEL condition only. |  |  |
| `location` | Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | Used for debugging and error reporting purposes only. |  |  |
