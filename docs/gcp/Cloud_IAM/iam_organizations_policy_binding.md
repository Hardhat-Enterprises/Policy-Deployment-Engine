## 🛡️ Policy Deployment Engine: `iam_organizations_policy_binding`

This section provides a concise policy evaluation for the `iam_organizations_policy_binding` resource in GCP.

Reference: [Terraform Registry – iam_organizations_policy_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_organizations_policy_binding)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Target is the full resource name of the resource to which the policy will be bound. Immutable once set. Structure is [documented below](#nested_target). | true | true | The target defines where the IAM policy is applied, which directly affects access control scope. | None | None |
| `policy` | Required. Immutable. The resource name of the policy to be bound. The binding parent and policy must belong to the same Organization (or Project). | true | true | Ensures only approved IAM policies are attached to organization policy bindings. | None | None |
| `organization` | The parent organization of the Policy Binding. | true | true | Using the correct organization ensures IAM policies are applied only to approved organizational resources. | None | None |
| `location` | The location of the Policy Binding | true | true | Organization policy bindings must be deployed only in approved Australian regions to meet organizational residency and compliance requirements. | australia-southeast2 | global |
| `policy_binding_id` | The Policy Binding ID. | true | false | This field identifies the policy binding resource but does not directly affect security enforcement. | None | None |
| `display_name` | Optional. The description of the policy binding. Must be less than or equal to 63 characters. | false | false | This field is used only for readability and identification purposes. | None | None |
| `annotations` | Optional. User defined annotations. See https://google.aip.dev/148#annotations for more details such as format and size limitations **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations are metadata fields and do not directly affect IAM policy enforcement. | None | None |
| `policy_kind` | Immutable. The kind of the policy to attach in this binding. This field must be one of the following:  - Left empty (will be automatically set to the policy kind) - The input policy kind   Possible values:  POLICY_KIND_UNSPECIFIED PRINCIPAL_ACCESS_BOUNDARY ACCESS | false | true | Restricting policy kind prevents misuse of incorrect IAM policy types and reduces privilege escalation risk. | None | None |
| `condition` | Represents a textual expression in the Common Expression Language (CEL) syntax. | false | true | Conditions control when and how access is granted, which directly affects IAM security enforcement. | None | None |

### target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal_set` | Required. Immutable. Full Resource Name of the principal set used for principal access boundary policy bindings. Examples for each one of the following supported principal set types: * Organization `//cloudresourcemanager.googleapis.com/organizations/ORGANIZATION_ID` * Workforce Identity: `//iam.googleapis.com/locations/global/workforcePools/WORKFORCE_POOL_ID` * Workspace Identity: `//iam.googleapis.com/locations/global/workspace/WORKSPACE_ID` It must be parent by the policy binding's parent (the organization). | false | true | The principal set determines which identities are affected by the policy binding. | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | false | true | The expression defines the actual access restriction logic used by the IAM condition. | None | None |
| `title` | Optional. Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | The title is used only for readability and documentation purposes. | None | None |
| `description` | Optional. Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | The description provides documentation but does not affect policy behavior. | None | None |
| `location` | Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | This field is used for debugging and error tracking only. | None | None |
