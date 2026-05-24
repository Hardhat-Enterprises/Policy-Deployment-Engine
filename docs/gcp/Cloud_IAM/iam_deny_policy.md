## 🛡️ Policy Deployment Engine: `iam_deny_policy - WILL NOT BE COMPLETED IN ONE TRIMESTER`

This section provides a concise policy evaluation for the `iam_deny_policy - WILL NOT BE COMPLETED IN ONE TRIMESTER` resource in GCP.

Reference: [Terraform Registry – iam_deny_policy - WILL NOT BE COMPLETED IN ONE TRIMESTER](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_deny_policy - WILL NOT BE COMPLETED IN ONE TRIMESTER)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the policy. | true | false | None | None | None |
| `parent` | The attachment point is identified by its URL-encoded full resource name. | true | false | None | None | None |
| `rules` | Rules to be applied. Structure is [documented below](#nested_rules). | true | false | None | None | None |
| `display_name` | The display name of the rule. | false | false | None | None | None |
| `deny_rule` |  | false | false | None | None | None |
| `denial_condition` |  | false | false | None | None | None |

### rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | The description of the rule. | false | false | None | None | None |
| `deny_rule` | A deny rule in an IAM deny policy. Structure is [documented below](#nested_rules_rules_deny_rule). | false | false | None | None | None |

### deny_rule Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `denied_principals` | The identities that are prevented from using one or more permissions on Google Cloud resources. | false | false | None | None | None |
| `exception_principals` | The identities that are excluded from the deny rule, even if they are listed in the deniedPrincipals. For example, you could add a Google group to the deniedPrincipals, then exclude specific users who belong to that group. | false | false | None | None | None |
| `denied_permissions` | The permissions that are explicitly denied by this rule. Each permission uses the format `{service-fqdn}/{resource}.{verb}`, where `{service-fqdn}` is the fully qualified domain name for the service. For example, `iam.googleapis.com/roles.list`. | false | false | None | None | None |
| `exception_permissions` | Specifies the permissions that this rule excludes from the set of denied permissions given by deniedPermissions. If a permission appears in deniedPermissions and in exceptionPermissions then it will not be denied. The excluded permissions can be specified using the same syntax as deniedPermissions. | false | false | None | None | None |
| `denial_condition` | User defined CEVAL expression. A CEVAL expression is used to specify match criteria such as origin.ip, source.region_code and contents in the request header. Structure is [documented below](#nested_rules_rules_deny_rule_denial_condition). | false | false | None | None | None |

### denial_condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | false | None | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | None | None | None |
| `description` | Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | None | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | None | None | None |
