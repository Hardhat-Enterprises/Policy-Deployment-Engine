## 🛡️ Policy Deployment Engine: `org_policy_policy`

This section provides a concise policy evaluation for the `org_policy_policy` resource in GCP.

Reference: [Terraform Registry – org_policy_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/org_policy_policy)

---

## 1. Argument Reference

### `name`
- Description: (Required) Immutable. The resource name of the Policy. Must be one of the following forms, where constraint_name is the name of the constraint which this Policy configures: * `projects/{project_number}/policies/{constraint_name}` * `folders/{folder_id}/policies/{constraint_name}` * `organizations/{organization_id}/policies/{constraint_name}` For example, "projects/123/policies/compute.disableSerialPortAccess". Note: `projects/{project_id}/policies/{constraint_name}` is also an acceptable name for API requests, but responses will return the name using the equivalent project number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spec`
- Description: (Optional) Basic information about the Organization Policy. Structure is [documented below](#nested_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dry_run_spec`
- Description: (Optional) Dry-run policy. Audit-only policy, can be used to monitor how the policy would have impacted the existing and future resources if it's enforced. Structure is [documented below](#nested_dry_run_spec). <a name="nested_spec"></a>The `spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etag`
- Description: (Output) An opaque tag indicating the current version of the `Policy`, used for concurrency control. This field is ignored if used in a `CreatePolicy` request. When the `Policy` is returned from either a `GetPolicy` or a `ListPolicies` request, this `etag` indicates the version of the current `Policy` to use when executing a read-modify-write loop. When the `Policy` is returned from a `GetEffectivePolicy` request, the `etag` will be unset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) Output only. The time stamp this was previously updated. This represents the last time a call to `CreatePolicy` or `UpdatePolicy` was made for that `Policy`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Optional) In Policies for boolean constraints, the following requirements apply: - There must be one and only one PolicyRule where condition is unset. - BooleanPolicyRules with conditions must set `enforced` to the opposite of the PolicyRule without a condition. - During policy evaluation, PolicyRules with conditions that are true for a target resource take precedence. Structure is [documented below](#nested_spec_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inherit_from_parent`
- Description: (Optional) Determines the inheritance behavior for this `Policy`. If `inherit_from_parent` is true, PolicyRules set higher up in the hierarchy (up to the closest root) are inherited and present in the effective policy. If it is false, then no rules are inherited, and this Policy becomes the new root for evaluation. This field can be set only for Policies which configure list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reset`
- Description: (Optional) Ignores policies set above this resource and restores the `constraint_default` enforcement behavior of the specific `Constraint` at this resource. This field can be set in policies for either list or boolean constraints. If set, `rules` must be empty and `inherit_from_parent` must be set to false. <a name="nested_spec_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Optional) List of values to be used for this PolicyRule. This field can be set only in Policies for list constraints. Structure is [documented below](#nested_spec_rules_rules_values).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_all`
- Description: (Optional) Setting this to `"TRUE"` means that all values are allowed. This field can be set only in Policies for list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deny_all`
- Description: (Optional) Setting this to `"TRUE"` means that all values are denied. This field can be set only in Policies for list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce`
- Description: (Optional) If `"TRUE"`, then the `Policy` is enforced. If `"FALSE"`, then any configuration is acceptable. This field can be set only in Policies for boolean constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: (Optional) Optional. Required for Managed Constraints if parameters defined in constraints. Pass parameter values when policy enforcement is enabled. Ensure that parameter value types match those defined in the constraint definition. For example: { \"allowedLocations\" : [\"us-east1\", \"us-west1\"], \"allowAll\" : true }
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) A condition which determines whether this rule is used in the evaluation of the policy. When set, the `expression` field in the `Expr' must include from 1 to 10 subexpressions, joined by the "||" or "&&" operators. Each subexpression must be of the form "resource.matchTag('/tag_key_short_name, 'tag_value_short_name')". or "resource.matchTagId('tagKeys/key_id', 'tagValues/value_id')". where key_name and value_name are the resource names for Label Keys and Values. These names are available from the Tag Manager Service. An example expression is: "resource.matchTag('123456789/environment, 'prod')". or "resource.matchTagId('tagKeys/123', 'tagValues/456')". Structure is [documented below](#nested_spec_rules_rules_condition). <a name="nested_spec_rules_rules_values"></a>The `values` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_values`
- Description: (Optional) List of values allowed at this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `denied_values`
- Description: (Optional) List of values denied at this resource. <a name="nested_spec_rules_rules_condition"></a>The `condition` block supports:
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
- Description: (Optional) Optional. String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. <a name="nested_dry_run_spec"></a>The `dry_run_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etag`
- Description: (Output) An opaque tag indicating the current version of the policy, used for concurrency control. This field is ignored if used in a `CreatePolicy` request. When the policy` is returned from either a `GetPolicy` or a `ListPolicies` request, this `etag` indicates the version of the current policy to use when executing a read-modify-write loop. When the policy is returned from a `GetEffectivePolicy` request, the `etag` will be unset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) Output only. The time stamp this was previously updated. This represents the last time a call to `CreatePolicy` or `UpdatePolicy` was made for that policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Optional) In policies for boolean constraints, the following requirements apply: - There must be one and only one policy rule where condition is unset. - Boolean policy rules with conditions must set `enforced` to the opposite of the policy rule without a condition. - During policy evaluation, policy rules with conditions that are true for a target resource take precedence. Structure is [documented below](#nested_dry_run_spec_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inherit_from_parent`
- Description: (Optional) Determines the inheritance behavior for this policy. If `inherit_from_parent` is true, policy rules set higher up in the hierarchy (up to the closest root) are inherited and present in the effective policy. If it is false, then no rules are inherited, and this policy becomes the new root for evaluation. This field can be set only for policies which configure list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reset`
- Description: (Optional) Ignores policies set above this resource and restores the `constraint_default` enforcement behavior of the specific constraint at this resource. This field can be set in policies for either list or boolean constraints. If set, `rules` must be empty and `inherit_from_parent` must be set to false. <a name="nested_dry_run_spec_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Optional) List of values to be used for this policy rule. This field can be set only in policies for list constraints. Structure is [documented below](#nested_dry_run_spec_rules_rules_values).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_all`
- Description: (Optional) Setting this to `"TRUE"` means that all values are allowed. This field can be set only in Policies for list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deny_all`
- Description: (Optional) Setting this to `"TRUE"` means that all values are denied. This field can be set only in Policies for list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce`
- Description: (Optional) If `"TRUE"`, then the `Policy` is enforced. If `"FALSE"`, then any configuration is acceptable. This field can be set only in Policies for boolean constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: (Optional) Optional. Required for Managed Constraints if parameters defined in constraints. Pass parameter values when policy enforcement is enabled. Ensure that parameter value types match those defined in the constraint definition. For example: { \"allowedLocations\" : [\"us-east1\", \"us-west1\"], \"allowAll\" : true }
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) A condition which determines whether this rule is used in the evaluation of the policy. When set, the `expression` field in the `Expr' must include from 1 to 10 subexpressions, joined by the "||" or "&&" operators. Each subexpression must be of the form "resource.matchTag('/tag_key_short_name, 'tag_value_short_name')". or "resource.matchTagId('tagKeys/key_id', 'tagValues/value_id')". where key_name and value_name are the resource names for Label Keys and Values. These names are available from the Tag Manager Service. An example expression is: "resource.matchTag('123456789/environment, 'prod')". or "resource.matchTagId('tagKeys/123', 'tagValues/456')". Structure is [documented below](#nested_dry_run_spec_rules_rules_condition). <a name="nested_dry_run_spec_rules_rules_values"></a>The `values` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_values`
- Description: (Optional) List of values allowed at this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `denied_values`
- Description: (Optional) List of values denied at this resource. <a name="nested_dry_run_spec_rules_rules_condition"></a>The `condition` block supports:
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
