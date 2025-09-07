## 🛡️ Policy Deployment Engine: `iam_organizations_policy_binding`

This section provides a concise policy evaluation for the `iam_organizations_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_organizations_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_organizations_policy_binding)

---

## 1. Argument Reference

### `target`
- Description: (Required) Target is the full resource name of the resource to which the policy will be bound. Immutable once set. Structure is [documented below](#nested_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy`
- Description: (Required) Required. Immutable. The resource name of the policy to be bound. The binding parent and policy must belong to the same Organization (or Project).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization`
- Description: (Required) The parent organization of the Policy Binding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the Policy Binding
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_binding_id`
- Description: (Required) The Policy Binding ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. The description of the policy binding. Must be less than or equal to 63 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_kind`
- Description: (Optional) Immutable. The kind of the policy to attach in this binding. This field must be one of the following:  - Left empty (will be automatically set to the policy kind) - The input policy kind   Possible values:  POLICY_KIND_UNSPECIFIED PRINCIPAL_ACCESS_BOUNDARY ACCESS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. The syntax and semantics of CEL are documented at https://github.com/google/cel-spec. Example (Comparison): title: \"Summary size limit\" description: \"Determines if a summary is less than 100 chars\" expression: \"document.summary.size() < 100\" Example (Equality): title: \"Requestor is owner\" description: \"Determines if requestor is the document owner\" expression: \"document.owner == request.auth.claims.email\"  Example (Logic): title: \"Public documents\" description: \"Determine whether the document should be publicly visible\" expression: \"document.type != 'private' && document.type != 'internal'\" Example (Data Manipulation): title: \"Notification string\" description: \"Create a notification string with a timestamp.\" expression: \"'New message received at ' + string(document.create_time)\" The exact variables and functions that may be referenced within an expression are determined by the service that evaluates it. See the service documentation for additional information. Structure is [documented below](#nested_condition). <a name="nested_target"></a>The `target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `principal_set`
- Description: (Optional) Required. Immutable. Full Resource Name of the principal set used for principal access boundary policy bindings. Examples for each one of the following supported principal set types: * Organization `//cloudresourcemanager.googleapis.com/organizations/ORGANIZATION_ID` * Workforce Identity: `//iam.googleapis.com/locations/global/workforcePools/WORKFORCE_POOL_ID` * Workspace Identity: `//iam.googleapis.com/locations/global/workspace/WORKSPACE_ID` It must be parent by the policy binding's parent (the organization). <a name="nested_condition"></a>The `condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Optional) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
