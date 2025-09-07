## 🛡️ Policy Deployment Engine: `iam_deny_policy`

This section provides a concise policy evaluation for the `iam_deny_policy` resource in GCP.

Reference: [Terraform Registry – iam_deny_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_deny_policy)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The attachment point is identified by its URL-encoded full resource name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Required) Rules to be applied. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the rule. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description of the rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deny_rule`
- Description: (Optional) A deny rule in an IAM deny policy. Structure is [documented below](#nested_rules_rules_deny_rule). <a name="nested_rules_rules_deny_rule"></a>The `deny_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `denied_principals`
- Description: (Optional) The identities that are prevented from using one or more permissions on Google Cloud resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exception_principals`
- Description: (Optional) The identities that are excluded from the deny rule, even if they are listed in the deniedPrincipals. For example, you could add a Google group to the deniedPrincipals, then exclude specific users who belong to that group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `denied_permissions`
- Description: (Optional) The permissions that are explicitly denied by this rule. Each permission uses the format `{service-fqdn}/{resource}.{verb}`, where `{service-fqdn}` is the fully qualified domain name for the service. For example, `iam.googleapis.com/roles.list`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exception_permissions`
- Description: (Optional) Specifies the permissions that this rule excludes from the set of denied permissions given by deniedPermissions. If a permission appears in deniedPermissions and in exceptionPermissions then it will not be denied. The excluded permissions can be specified using the same syntax as deniedPermissions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `denial_condition`
- Description: (Optional) User defined CEVAL expression. A CEVAL expression is used to specify match criteria such as origin.ip, source.region_code and contents in the request header. Structure is [documented below](#nested_rules_rules_deny_rule_denial_condition). <a name="nested_rules_rules_deny_rule_denial_condition"></a>The `denial_condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
