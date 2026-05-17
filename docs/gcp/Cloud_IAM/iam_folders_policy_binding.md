## 🛡️ Policy Deployment Engine: `iam_folders_policy_binding`

This section provides a concise policy evaluation for the `iam_folders_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_folders_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_folders_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target is the full resource name of the resource to which the policy will be bound. Immutable once set. Structure is [documented below](#nested_target). | true | true | Restricts IAM enforcement scope to approved folder-level resources and prevents unauthorized policy attachment. | //cloudresourcemanager.googleapis.com/folders/123456789 | //cloudresourcemanager.googleapis.com/folders/external-folder |
| `policy` | Required. Immutable. The resource name of the policy to be bound. The binding parent and policy must belong to the same Organization (or Project). | true | true | Ensures only approved organization-level IAM policies are attached to folder bindings. | organizations/123456789/locations/global/principalAccessBoundaryPolicies/pde-policy-1 | organizations/999999999/locations/global/principalAccessBoundaryPolicies/unapproved-policy |
| `folder` | The parent folder for the PolicyBinding. | true | true | Restricts policy bindings to approved enterprise-managed folders. | folders/123456789 | folders/external-folder |
| `location` | The location of the PolicyBinding. | true | true | Restricting location prevents cross-region policy sprawl and enforces governance boundaries. | global | us-central1 |
| `policy_binding_id` | The Policy Binding ID. | true | true | Ensures traceability and prevents duplicate or unauthorized policy bindings. | pde-folder-binding-1 | test-binding |
| `display_name` | Optional. The description of the policy binding. Must be less than or equal to 63 characters. | false | false | Display name is used for operational readability and auditing purposes only. |  |  |
| `annotations` | Optional. User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations are metadata used for organization and tracking purposes and do not directly affect IAM enforcement. |  |  |
| `policy_kind` | Immutable. The kind of the policy to attach in this binding. This field must be one of the following:  - Left empty (will be automatically set to the policy kind) - The input policy kind   Possible values:  POLICY_KIND_UNSPECIFIED PRINCIPAL_ACCESS_BOUNDARY ACCESS | false | true | Restricting policy kind prevents misuse of non-boundary IAM policies and reduces privilege escalation risk. | PRINCIPAL_ACCESS_BOUNDARY | ACCESS |
| `condition` | Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: \"Summary size limit\" description: \"Determines if a summary is less than 100 chars\" expression: \"document.summary.size() < 100\" Example (Equality): title: \"Requestor is owner\" description: \"Determines if requestor is the document owner\" expression: \"document.owner == request.auth.claims.email\"  Example (Logic): title: \"Public documents\" description: \"Determine whether the document should be publicly visible\" expression: \"document.type != 'private' && document.type != 'internal'\" Example (Data Manipulation): title: \"Notification string\" description: \"Create a notification string with a timestamp.\" expression: \"'New message received at ' + string(document.create_time)\" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information. Structure is [documented below](#nested_condition). | false | true | Conditions can affect IAM authorization logic and access enforcement. | request.time < timestamp('2026-12-31T23:59:59Z') | true |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Required. Immutable. Full Resource Name of the principal set used for principal access boundary policy bindings. Examples for each one of the following supported principal set types: * Folder: `//cloudresourcemanager.googleapis.com/folders/FOLDER_ID` It must be parent by the policy binding's parent (the folder). | false | true | Restricts policy bindings to approved folder-level principal sets to prevent unauthorized privilege escalation. | //cloudresourcemanager.googleapis.com/folders/123456789 | //cloudresourcemanager.googleapis.com/folders/999999999 |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | false | true | Controls authorization logic and access restrictions through CEL expressions. | request.auth != null | true |
| `title` | Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | Title is informational metadata only and does not affect IAM behavior. |  |  |
| `description` | Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | Description is informational metadata only and does not affect IAM enforcement. |  |  |
| `location` | Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | Location metadata is used only for debugging and error reporting. |  |  |
