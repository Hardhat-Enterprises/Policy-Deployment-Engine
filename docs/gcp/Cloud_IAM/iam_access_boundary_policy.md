## 🛡️ Policy Deployment Engine: `iam_access_boundary_policy`

This section provides a concise policy evaluation for the `iam_access_boundary_policy` resource in GCP.

Reference: [Terraform Registry – iam_access_boundary_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_access_boundary_policy)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the policy. | true | false | None | None | None |
| `parent` | The attachment point is identified by its URL-encoded full resource name. | true | false | None | None | None |
| `rules` | Rules to be applied. Structure is [documented below](#nested_rules). | true | false | None | None | None |
| `display_name` | The display name of the rule. | false | false | None | None | None |
| `access_boundary_rule` |  | false | false | None | None | None |
| `availability_condition` |  | false | false | None | None | None |

### rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | The description of the rule. | false | false | None | None | None |
| `access_boundary_rule` | An access boundary rule in an IAM policy. Structure is [documented below](#nested_rules_rules_access_boundary_rule). | false | false | None | None | None |

### access_boundary_rule Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `available_resource` | The full resource name of a Google Cloud resource entity. | false | false | None | None | None |
| `available_permissions` | A list of permissions that may be allowed for use on the specified resource. | false | false | None | None | None |
| `availability_condition` | The availability condition further constrains the access allowed by the access boundary rule. Structure is [documented below](#nested_rules_rules_access_boundary_rule_availability_condition). | false | false | None | None | None |

### availability_condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | false | None | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | None | None | None |
| `description` | Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | None | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | None | None | None |
