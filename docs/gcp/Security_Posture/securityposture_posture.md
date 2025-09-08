## 🛡️ Policy Deployment Engine: `securityposture_posture`

This section provides a concise policy evaluation for the `securityposture_posture` resource in GCP.

Reference: [Terraform Registry – securityposture_posture](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/securityposture_posture)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `state` | State of the posture. Update to state field should not be triggered along with with other field updates. Possible values are: `DEPRECATED`, `DRAFT`, `ACTIVE`. | true | None | None |
| `parent` | The parent of the resource, an organization. Format should be `organizations/{organization_id}`. | true | None | None |
| `location` | Location of the resource, eg: global. | true | None | None |
| `posture_id` | Id of the posture. It is an immutable field. | true | None | None |
| `description` | Description of the posture. | false | None | None |

### policy_sets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `policy_set_id` | ID of the policy set. | true | None | None |
| `description` | Description of the policy set. | false | None | None |
| `policies` | List of security policy Structure is [documented below](#nested_policy_sets_policy_sets_policies). | true | None | None |

### policies Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `policy_id` | ID of the policy. | true | None | None |
| `description` | Description of the policy. | false | None | None |
| `compliance_standards` | Mapping for policy to security standards and controls. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_compliance_standards). | false | None | None |
| `constraint` | Policy constraint definition.It can have the definition of one of following constraints: orgPolicyConstraint orgPolicyConstraintCustom securityHealthAnalyticsModule securityHealthAnalyticsCustomModule Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint). | true | None | None |

### compliance_standards Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `standard` | Mapping of compliance standards for the policy. | false | None | None |
| `control` | Mapping of security controls for the policy. | false | None | None |

### constraint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `org_policy_constraint` | Organization policy canned constraint definition. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint). | false | None | None |
| `org_policy_constraint_custom` | Organization policy custom constraint policy definition. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom). | false | None | None |
| `security_health_analytics_module` | Security Health Analytics built-in detector definition. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_module). | false | None | None |
| `security_health_analytics_custom_module` | Definition of Security Health Analytics Custom Module. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module). | false | None | None |

### org_policy_constraint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `canned_constraint_id` | Organization policy canned constraint Id | true | None | None |
| `policy_rules` | Definition of policy rules Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_policy_rules). | true | None | None |

### policy_rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `values` | List of values to be used for this policy rule. This field can be set only in policies for list constraints. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules_policy_rules_values). | false | None | None |
| `allow_all` | Setting this to true means that all values are allowed. This field can be set only in policies for list constraints. | false | None | None |
| `deny_all` | Setting this to true means that all values are denied. This field can be set only in policies for list constraints. | false | None | None |
| `enforce` | If `true`, then the policy is enforced. If `false`, then any configuration is acceptable. This field can be set only in policies for boolean constraints. | false | None | None |
| `condition` | Represents a textual expression in the Common Expression Language (CEL) syntax. CEL is a C-like expression language. This page details the objects and attributes that are used to the build the CEL expressions for custom access levels - https://cloud.google.com/access-context-manager/docs/custom-access-level-spec. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules_policy_rules_condition). | false | None | None |

### values Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_values` | List of values allowed at this resource. | false | None | None |
| `denied_values` | List of values denied at this resource. | false | None | None |

### condition Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. | false | None | None |
| `description` | Description of the expression | false | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file | false | None | None |

### org_policy_constraint_custom Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `custom_constraint` | Organization policy custom constraint definition. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_custom_constraint). | false | None | None |
| `policy_rules` | Definition of policy rules Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_org_policy_constraint_custom_policy_rules). | true | None | None |

### custom_constraint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Immutable. The name of the custom constraint. This is unique within the organization. | true | None | None |
| `display_name` | A human-friendly name for the constraint. | false | None | None |
| `description` | A human-friendly description of the constraint to display as an error message when the policy is violated. | false | None | None |
| `condition` | A CEL condition that refers to a supported service resource, for example `resource.management.autoUpgrade == false`. For details about CEL usage, see [Common Expression Language](https://cloud.google.com/resource-manager/docs/organization-policy/creating-managing-custom-constraints#common_expression_language). | true | None | None |
| `action_type` | The action to take if the condition is met. Possible values are: `ALLOW`, `DENY`. | true | None | None |
| `method_types` | A list of RESTful methods for which to enforce the constraint. Can be `CREATE`, `UPDATE`, or both. Not all Google Cloud services support both methods. To see supported methods for each service, find the service in [Supported services](https://cloud.google.com/resource-manager/docs/organization-policy/custom-constraint-supported-services). | true | None | None |
| `resource_types` | Immutable. The fully qualified name of the Google Cloud REST resource containing the object and field you want to restrict. For example, `container.googleapis.com/NodePool`. | true | None | None |

### security_health_analytics_module Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `module_name` | The name of the module eg: BIGQUERY_TABLE_CMEK_DISABLED. | true | None | None |
| `module_enablement_state` | The state of enablement for the module at its level of the resource hierarchy. Possible values are: `ENABLEMENT_STATE_UNSPECIFIED`, `ENABLED`, `DISABLED`. | false | None | None |

### security_health_analytics_custom_module Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | (Output) A server generated id of custom module. | none | None | None |
| `display_name` | The display name of the Security Health Analytics custom module. This display name becomes the finding category for all findings that are returned by this custom module. | false | None | None |
| `module_enablement_state` | The state of enablement for the module at its level of the resource hierarchy. Possible values are: `ENABLEMENT_STATE_UNSPECIFIED`, `ENABLED`, `DISABLED`. | false | None | None |
| `config` | Custom module details. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config). | true | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `predicate` | The CEL expression to evaluate to produce findings.When the expression evaluates to true against a resource, a finding is generated. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_predicate). | true | None | None |
| `custom_output` | Custom output properties. A set of optional name-value pairs that define custom source properties to return with each finding that is generated by the custom module. The custom source properties that are defined here are included in the finding JSON under `sourceProperties`. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output). | false | None | None |
| `resource_selector` | The resource types that the custom module operates on. Each custom module can specify up to 5 resource types. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_resource_selector). | true | None | None |
| `severity` | The severity to assign to findings generated by the module. Possible values are: `SEVERITY_UNSPECIFIED`, `CRITICAL`, `HIGH`, `MEDIUM`, `LOW`. | true | None | None |
| `description` | Text that describes the vulnerability or misconfiguration that the custom module detects. | false | None | None |
| `recommendation` | An explanation of the recommended steps that security teams can take to resolve the detected issue | false | None | None |

### predicate Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. | false | None | None |
| `description` | Description of the expression | false | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file | false | None | None |

### custom_output Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `properties` | A list of custom output properties to add to the finding. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output_properties). | false | None | None |

### properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the property for the custom output. | true | None | None |
| `value_expression` | The CEL expression for the custom output. A resource property can be specified to return the value of the property or a text string enclosed in quotation marks. Structure is [documented below](#nested_policy_sets_policy_sets_policies_policies_constraint_security_health_analytics_custom_module_config_custom_output_properties_properties_value_expression). | false | None | None |

### value_expression Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. | false | None | None |
| `description` | Description of the expression | false | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file | false | None | None |

### resource_selector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_types` | The resource types to run the detector on. | true | None | None |
