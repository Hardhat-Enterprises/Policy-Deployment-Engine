## 🛡️ Policy Deployment Engine: `iam_access_boundary_policy`

This section provides a concise policy evaluation for the `iam_access_boundary_policy` resource in GCP.

Reference: [Terraform Registry – iam_access_boundary_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_access_boundary_policy)

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

### `access_boundary_rule`
- Description: (Optional) An access boundary rule in an IAM policy. Structure is [documented below](#nested_rules_rules_access_boundary_rule). <a name="nested_rules_rules_access_boundary_rule"></a>The `access_boundary_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `available_resource`
- Description: (Optional) The full resource name of a Google Cloud resource entity.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `available_permissions`
- Description: (Optional) A list of permissions that may be allowed for use on the specified resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `availability_condition`
- Description: (Optional) The availability condition further constrains the access allowed by the access boundary rule. Structure is [documented below](#nested_rules_rules_access_boundary_rule_availability_condition). <a name="nested_rules_rules_access_boundary_rule_availability_condition"></a>The `availability_condition` block supports:
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
