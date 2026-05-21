## 🛡️ Policy Deployment Engine: `iam_projects_policy_binding`

This section provides a concise policy evaluation for the `iam_projects_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_projects_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_projects_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target is the full resource name of the resource to which the policy will be bound. Immutable once set. Structure is [documented below](#nested_target). | true | true | Restricts policy binding scope to approved project principals only, preventing unauthorized identity binding. | //cloudresourcemanager.googleapis.com/projects/approved-project-1 | //cloudresourcemanager.googleapis.com/projects/random-external-project |
| `policy` | Required. Immutable. The resource name of the policy to be bound. The binding parent and policy must belong to the same Organization (or Project). | true | false | None | None | None |
| `location` | The location of the Policy Binding | true | true | Project policy binding location must be restricted to approved Australia regions to meet organizational residency and compliance requirements. | ['australia-southeast1', 'australia-southeast2'] | global |
| `policy_binding_id` | The Policy Binding ID. | true | false | None | None | None |
| `display_name` | Optional. The description of the policy binding. Must be less than or equal to 63 characters. | false | false | None | None | None |
| `annotations` | Optional. User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | None | None | None |
| `policy_kind` | Immutable. The kind of the policy to attach in this binding. This field must be one of the following:  - Left empty (will be automatically set to the policy kind) - The input policy kind   Possible values:  POLICY_KIND_UNSPECIFIED PRINCIPAL_ACCESS_BOUNDARY ACCESS | false | true | Ensures only Principal Access Boundary policies are enforced for security isolation. | PRINCIPAL_ACCESS_BOUNDARY | ['ACCESS', 'POLICY_KIND_UNSPECIFIED'] |
| `condition` | Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: \"Summary size limit\" description: \"Determines if a summary is less than 100 chars\" expression: \"document.summary.size() < 100\" Example (Equality): title: \"Requestor is owner\" description: \"Determines if requestor is the document owner\" expression: \"document.owner == request.auth.claims.email\"  Example (Logic): title: \"Public documents\" description: \"Determine whether the document should be publicly visible\" expression: \"document.type != 'private' && document.type != 'internal'\" Example (Data Manipulation): title: \"Notification string\" description: \"Create a notification string with a timestamp.\" expression: \"'New message received at ' + string(document.create_time)\" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information. Structure is [documented below](#nested_condition). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Required. Immutable. Full Resource Name of the principal set used for principal access boundary policy bindings. | false | true | Project policy binding must only allow approved project-level principals to reduce unauthorized access exposure. | //cloudresourcemanager.googleapis.com/projects/approved-project-1 | //cloudresourcemanager.googleapis.com/projects/random-external-project |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | false | false | None | None | None |
| `title` | Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | None | None | None |
| `description` | Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | None | None | None |
| `location` | Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | None | None | None |
