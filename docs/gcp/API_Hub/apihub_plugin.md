## 🛡️ Policy Deployment Engine: `apihub_plugin`

This section provides a concise policy evaluation for the `apihub_plugin` resource in GCP.

Reference: [Terraform Registry – apihub_plugin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_plugin)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The display name of the plugin. Max length is 50 characters (Unicode code points). | true | false | Display name. No security relevance. | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | false | Identifier only. Does not contain secrets or security-sensitive data. | None | None |
| `plugin_id` | The ID to use for the Plugin resource, which will become the final component of the Plugin's resource name. This field is optional. * If provided, the same will be used. The service will throw an error if the specified id is already used by another Plugin resource in the API hub instance. * If not provided, a system generated id will be used. This value should be 4-63 characters, overall resource name which will be of format `projects/{project}/locations/{location}/plugins/{plugin}`, its length is limited to 1000 characters and valid characters are /a-z[0-9]-_/. | true | false | Acts as identifier. No inherent security risk. | None | None |
| `description` | The plugin description. Max length is 2000 characters (Unicode code points). | false | false | Human-readable description only. No security impact. | None | None |
| `actions_config` | The configuration of actions supported by the plugin. Structure is [documented below](#nested_actions_config). | false | false | Action metadata only, no secrets or sensitive data. | None | None |
| `documentation` | Documentation details. Structure is [documented below](#nested_documentation). | false | false | Documentation references only. Not security-relevant. | None | None |
| `plugin_category` | Possible values: PLUGIN_CATEGORY_UNSPECIFIED API_GATEWAY API_PRODUCER | false | false | Categorization metadata. Not sensitive. | None | None |
| `config_template` | ConfigTemplate represents the configuration template for a plugin. Structure is [documented below](#nested_config_template). | false | false | Template structure only. Sensitivity comes from nested attributes. | None | None |
| `hosting_service` | The information related to the service implemented by the plugin developer, used to invoke the plugin's functionality. Structure is [documented below](#nested_hosting_service). | false | false | Defines where service is hosted. Not a secret. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project reference. No secrets here. | None | None |
| `auth_config_template` |  | false | false | Container for auth configuration. Sensitive data handled inside child attributes. | None | None |
| `service_account` |  | false | false | Container object only. Sensitive at child level. | None | None |
| `additional_config_template` |  | false | false | Template object. Only sensitive if value_type is SECRET. | None | None |
| `enum_options` |  | false | false | Option metadata only. Not security relevant. | None | None |
| `multi_select_options` |  | false | false | Option metadata only. Not security relevant. | None | None |

### actions_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | The id of the action. | true | false | Identifier only. Not sensitive. | None | None |
| `display_name` | The display name of the action. | true | false | Display only. Not sensitive. | None | None |
| `description` | The description of the operation performed by the action. | true | false | Metadata only. No security impact. | None | None |
| `trigger_mode` | The trigger mode supported by the action. Possible values: TRIGGER_MODE_UNSPECIFIED API_HUB_ON_DEMAND_TRIGGER API_HUB_SCHEDULE_TRIGGER NON_API_HUB_MANAGED | true | false | Configuration setting. Not a secret. | None | None |

### documentation Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `external_uri` | The uri of the externally hosted documentation. | false | false | Points to external docs. No secret values. | None | None |

### config_template Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `auth_config_template` | AuthConfigTemplate represents the authentication template for a plugin. Structure is [documented below](#nested_config_template_auth_config_template). | false | false | Container for auth config. Not directly sensitive. | None | None |
| `additional_config_template` | The list of additional configuration variables for the plugin's configuration. Structure is [documented below](#nested_config_template_additional_config_template). | false | false | Additional metadata. Security depends on nested values. | None | None |

### hosting_service Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_uri` | The URI of the service implemented by the plugin developer, used to invoke the plugin's functionality. This information is only required for user defined plugins. | false | false | Public endpoint reference. Not secret. | None | None |

### auth_config_template Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `supported_auth_types` | The list of authentication types supported by the plugin. | true | false | Lists allowed auth mechanisms. Not a secret but security-relevant in configuration enforcement. | None | None |
| `service_account` | Config for Google service account authentication. Structure is [documented below](#nested_config_template_auth_config_template_service_account). | false | false | Container for service account settings. Secret risk exists at child level. | None | None |

### service_account Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account` | The service account to be used for authenticating request. The `iam.serviceAccounts.getAccessToken` permission should be granted on this service account to the impersonator service account. | true | true | Directly references a service account used for authentication. Exposure could compromise system access. | None | None |

### additional_config_template Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `required` | Flag represents that this `ConfigVariable` must be provided for a PluginInstance. | false | false | Boolean flag. Not sensitive. | None | None |
| `enum_options` | Enum options. To be populated if `ValueType` is `ENUM`. Structure is [documented below](#nested_config_template_additional_config_template_additional_config_template_enum_options). | false | false | Option metadata only. Not sensitive. | None | None |
| `multi_select_options` | Multi select options. To be populated if `ValueType` is `MULTI_SELECT`. Structure is [documented below](#nested_config_template_additional_config_template_additional_config_template_multi_select_options). | false | false | Option metadata only. Not sensitive. | None | None |
| `id` | ID of the config variable. Must be unique within the configuration. | true | false | Identifier only. Not sensitive. | None | None |
| `value_type` | Type of the parameter: string, int, bool etc. Possible values: VALUE_TYPE_UNSPECIFIED STRING INT BOOL SECRET ENUM MULTI_SELECT MULTI_STRING MULTI_INT | true | false | Indicates type of value. Not sensitive itself. | None | None |
| `description` | Description. | false | false | Metadata only. Not sensitive. | None | None |
| `validation_regex` | Regular expression in RE2 syntax used for validating the `value` of a `ConfigVariable`. | false | false | Validation expression. Not sensitive. | None | None |

### enum_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Id of the option. | true | false | Identifier only. Not sensitive. | None | None |
| `display_name` | Display name of the option. | true | false | Display only. Not sensitive. | None | None |
| `description` | Description of the option. | false | false | Metadata only. Not sensitive. | None | None |

### multi_select_options Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Id of the option. | true | false | Identifier only. Not sensitive. | None | None |
| `display_name` | Display name of the option. | true | false | Display only. Not sensitive. | None | None |
| `description` | Description of the option. | false | false | Metadata only. Not sensitive. | None | None |
