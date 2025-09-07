## 🛡️ Policy Deployment Engine: `securityposture_posture`

This section provides a concise policy evaluation for the `securityposture_posture` resource in GCP.

Reference: [Terraform Registry – securityposture_posture](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/securityposture_posture)

---

## 1. Argument Reference

### `state`
- Description: (Required) State of the posture. Update to state field should not be triggered along with with other field updates. Possible values are: `DEPRECATED`, `DRAFT`, `ACTIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_sets`
- Description: (Required) List of policy sets for the posture. Structure is [documented below](#nested_policy_sets).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent of the resource, an organization. Format should be `organizations/{organization_id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location of the resource, eg: global.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `posture_id`
- Description: (Required) Id of the posture. It is an immutable field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the posture. <a name="nested_policy_sets"></a>The `policy_sets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_set_id`
- Description: (Required) ID of the policy set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the policy set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policies`
- Description: (Required) List of security policy Structure is [documented below](#nested_policy_sets_policy_sets_policies). <a name="nested_policy_sets_policy_sets_policies"></a>The `policies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_id`
- Description: (Required) ID of the policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compliance_standards`
- Description: (Optional) Mapping for policy to security standards and controls. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_compliance_standards).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `constraint`
- Description: (Required) Policy constraint definition.It can have the definition of one of following constraints: orgPolicyConstraint orgPolicyConstraintCustom securityHealthAnalyticsModule securityHealthAnalyticsCustomModule Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint). <a name="nested_policy_sets_policy_sets_policies_policies_compliance_standards"></a>The `compliance_standards` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standard`
- Description: (Optional) Mapping of compliance standards for the policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control`
- Description: (Optional) Mapping of security controls for the policy. <a name="nested_policy_sets_policy_sets_policies_policies_constraint"></a>The `constraint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_policy_constraint`
- Description: (Optional) Organization policy canned constraint definition. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `org_policy_constraint_custom`
- Description: (Optional) Organization policy custom constraint policy definition. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_health_analytics_module`
- Description: (Optional) Security Health Analytics built-in detector definition. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_module).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_health_analytics_custom_module`
- Description: (Optional) Definition of Security Health Analytics Custom Module. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module). <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint"></a>The `org_policy_constraint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `canned_constraint_id`
- Description: (Required) Organization policy canned constraint Id
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_rules`
- Description: (Required) Definition of policy rules Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_policy_rules). <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_policy_rules"></a>The `policy_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Optional) List of values to be used for this policy rule. This field can be set only in policies for list constraints. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_policy_rules_policy_rules_values).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_all`
- Description: (Optional) Setting this to true means that all values are allowed. This field can be set only in policies for list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deny_all`
- Description: (Optional) Setting this to true means that all values are denied. This field can be set only in policies for list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce`
- Description: (Optional) If `true`, then the policy is enforced. If `false`, then any configuration is acceptable. This field can be set only in policies for boolean constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. This page details the objects and attributes that are used to the build the CEL expressions for custom access levels - https://cloud.google.com/access-context-manager/docs/custom-access-level-spec. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_policy_rules_policy_rules_condition). <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_policy_rules_policy_rules_values"></a>The `values` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_values`
- Description: (Optional) List of values allowed at this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `denied_values`
- Description: (Optional) List of values denied at this resource. <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_policy_rules_policy_rules_condition"></a>The `condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom"></a>The `org_policy_constraint_custom` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_constraint`
- Description: (Optional) Organization policy custom constraint definition. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_custom_constraint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_rules`
- Description: (Required) Definition of policy rules Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules). <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_custom_constraint"></a>The `custom_constraint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Immutable. The name of the custom constraint. This is unique within the organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A human-friendly name for the constraint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-friendly description of the constraint to display as an error message when the policy is violated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Required) A CEL condition that refers to a supported service resource, for example `resource.management.autoUpgrade == false`. For details about CEL usage, see [Common Expression Language](https://cloud.google.com/resource-manager/docs/organization-policy/creating-managing-custom-constraints#common_expression_language).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action_type`
- Description: (Required) The action to take if the condition is met. Possible values are: `ALLOW`, `DENY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `method_types`
- Description: (Required) A list of RESTful methods for which to enforce the constraint. Can be `CREATE`, `UPDATE`, or both. Not all Google Cloud services support both methods. To see supported methods for each service, find the service in [Supported services](https://cloud.google.com/resource-manager/docs/organization-policy/custom-constraint-supported-services).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_types`
- Description: (Required) Immutable. The fully qualified name of the Google Cloud REST resource containing the object and field you want to restrict. For example, `container.googleapis.com/NodePool`. <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules"></a>The `policy_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: (Optional) List of values to be used for this policy rule. This field can be set only in policies for list constraints. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules_policy_rules_values).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_all`
- Description: (Optional) Setting this to true means that all values are allowed. This field can be set only in policies for list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deny_all`
- Description: (Optional) Setting this to true means that all values are denied. This field can be set only in policies for list constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce`
- Description: (Optional) If `true`, then the policy is enforced. If `false`, then any configuration is acceptable. This field can be set only in policies for boolean constraints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. This page details the objects and attributes that are used to the build the CEL expressions for custom access levels - https://cloud.google.com/access-context-manager/docs/custom-access-level-spec. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules_policy_rules_condition). <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules_policy_rules_values"></a>The `values` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_values`
- Description: (Optional) List of values allowed at this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `denied_values`
- Description: (Optional) List of values denied at this resource. <a name="nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules_policy_rules_condition"></a>The `condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file <a name="nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_module"></a>The `security_health_analytics_module` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `module_name`
- Description: (Required) The name of the module eg: BIGQUERY_TABLE_CMEK_DISABLED.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `module_enablement_state`
- Description: (Optional) The state of enablement for the module at its level of the resource hierarchy. Possible values are: `ENABLEMENT_STATE_UNSPECIFIED`, `ENABLED`, `DISABLED`. <a name="nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module"></a>The `security_health_analytics_custom_module` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Output) A server generated id of custom module.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the Security Health Analytics custom module. This display name becomes the finding category for all findings that are returned by this custom module.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `module_enablement_state`
- Description: (Optional) The state of enablement for the module at its level of the resource hierarchy. Possible values are: `ENABLEMENT_STATE_UNSPECIFIED`, `ENABLED`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Required) Custom module details. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config). <a name="nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predicate`
- Description: (Required) The CEL expression to evaluate to produce findings.When the expression evaluates to true against a resource, a finding is generated. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_predicate).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_output`
- Description: (Optional) Custom output properties. A set of optional name-value pairs that define custom source properties to return with each finding that is generated by the custom module. The custom source properties that are defined here are included in the finding JSON under `sourceProperties`. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_selector`
- Description: (Required) The resource types that the custom module operates on. Each custom module can specify up to 5 resource types. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_resource_selector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `severity`
- Description: (Required) The severity to assign to findings generated by the module. Possible values are: `SEVERITY_UNSPECIFIED`, `CRITICAL`, `HIGH`, `MEDIUM`, `LOW`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Text that describes the vulnerability or misconfiguration that the custom module detects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recommendation`
- Description: (Optional) An explanation of the recommended steps that security teams can take to resolve the detected issue <a name="nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_predicate"></a>The `predicate` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file <a name="nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output"></a>The `custom_output` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `properties`
- Description: (Optional) A list of custom output properties to add to the finding. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output_properties). <a name="nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output_properties"></a>The `properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the property for the custom output.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value_expression`
- Description: (Optional) The CEL expression for the custom output. A resource property can be specified to return the value of the property or a text string enclosed in quotation marks. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output_properties_properties_value_expression). <a name="nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output_properties_properties_value_expression"></a>The `value_expression` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file <a name="nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_resource_selector"></a>The `resource_selector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_types`
- Description: (Required) The resource types to run the detector on.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
