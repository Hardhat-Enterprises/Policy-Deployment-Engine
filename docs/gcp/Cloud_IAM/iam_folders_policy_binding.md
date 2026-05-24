## 🛡️ Policy Deployment Engine: `iam_folders_policy_binding`

This section provides a concise policy evaluation for the `iam_folders_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_folders_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_folders_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target is the full resource name of the resource to which the policy will be bound. Immutable once set. Structure is [documented below](#nested_target). | true | true | The target defines where the IAM policy is applied, which directly affects access control scope. | None | None |
| `policy` | Required. Immutable. The resource name of the policy to be bound. The binding parent and policy must belong to the same Organization (or Project). | true | true | Ensures only approved organization-level IAM policies are attached to folder bindings. | organizations/123456789/locations/australia-southeast2/principalAccessBoundaryPolicies/pde-policy-1 | organizations/999999999/locations/australia-southeast2/principalAccessBoundaryPolicies/unknown-policy |
| `folder` | The parent folder for the PolicyBinding. | true | true | Using the correct folder ensures IAM policies are applied only to approved organizational resources. | None | None |
| `location` | The location of the PolicyBinding. | true | true | IAM folder policy bindings must be deployed only in approved Australian regions to meet organizational residency and compliance requirements. | australia-southeast2 | global |
| `policy_binding_id` | The Policy Binding ID. | true | false | This field identifies the policy binding resource but does not directly control security behavior. | None | None |
| `display_name` | Optional. The description of the policy binding. Must be less than or equal to 63 characters. | false | false | This field is used only for readability and identification purposes. | None | None |
| `annotations` | Optional. User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations are metadata fields and do not directly affect IAM policy enforcement. | None | None |
| `policy_kind` | Immutable. The kind of the policy to attach in this binding. This field must be one of the following:  - Left empty (will be automatically set to the policy kind) - The input policy kind   Possible values:  POLICY_KIND_UNSPECIFIED PRINCIPAL_ACCESS_BOUNDARY ACCESS | false | true | Restricting policy kind prevents misuse of non-boundary IAM policies and reduces privilege escalation risk. | PRINCIPAL_ACCESS_BOUNDARY | ACCESS |
| `condition` | Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: \"Summary size limit\" description: \"Determines if a summary is less than 100 chars\" expression: \"document.summary.size() < 100\" Example (Equality): title: \"Requestor is owner\" description: \"Determines if requestor is the document owner\" expression: \"document.owner == request.auth.claims.email\"  Example (Logic): title: \"Public documents\" description: \"Determine whether the document should be publicly visible\" expression: \"document.type != 'private' && document.type != 'internal'\" Example (Data Manipulation): title: \"Notification string\" description: \"Create a notification string with a timestamp.\" expression: \"'New message received at ' + string(document.create_time)\" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information. Structure is [documented below](#nested_condition). | false | true | Conditions control when and how access is granted, which directly affects IAM security enforcement. | None | None |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Required. Immutable. Full Resource Name of the principal set used for principal access boundary policy bindings. Examples for each one of the following supported principal set types: * Folder: `//cloudresourcemanager.googleapis.com/folders/FOLDER_ID` It must be parent by the policy binding's parent (the folder). | false | true | The principal set determines which identities are affected by the policy binding. | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | false | true | The expression defines the actual access restriction logic used by the IAM condition. | None | None |
| `title` | Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | The title is only used for readability and documentation purposes. | None | None |
| `description` | Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | The description provides documentation but does not affect policy behavior. | None | None |
| `location` | Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | This field is used for debugging and error tracking only. | None | None |
