## 🛡️ Policy Deployment Engine: `apihub_plugin`

This section provides a concise policy evaluation for the `apihub_plugin` resource in GCP.

Reference: [Terraform Registry – apihub_plugin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_plugin)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The display name of the plugin. Max length is 50 characters (Unicode code points). | true | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `plugin_id` | The ID to use for the Plugin resource, which will become the final component of the Plugin's resource name. This field is optional. * If provided, the same will be used. The service will throw an error if the specified id is already used by another Plugin resource in the API hub instance. * If not provided, a system generated id will be used. This value should be 4-63 characters, overall resource name which will be of format `projects/{project}/locations/{location}/plugins/{plugin}`, its length is limited to 1000 characters and valid characters are /a-z[0-9]-_/. | true | None | None |
| `description` | The plugin description. Max length is 2000 characters (Unicode code points). | false | None | None |
| `plugin_category` | Possible values: PLUGIN_CATEGORY_UNSPECIFIED API_GATEWAY API_PRODUCER | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### actions_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | The id of the action. | true | None | None |
| `display_name` | The display name of the action. | true | None | None |
| `description` | The description of the operation performed by the action. | true | None | None |
| `trigger_mode` | The trigger mode supported by the action. Possible values: TRIGGER_MODE_UNSPECIFIED API_HUB_ON_DEMAND_TRIGGER API_HUB_SCHEDULE_TRIGGER NON_API_HUB_MANAGED | true | None | None |

### documentation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `external_uri` | The uri of the externally hosted documentation. | false | None | None |

### config_template Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auth_config_template` | AuthConfigTemplate represents the authentication template for a plugin. Structure is [documented below](#nested_config_template_auth_config_template). | false | None | None |
| `additional_config_template` | The list of additional configuration variables for the plugin's configuration. Structure is [documented below](#nested_config_template_additional_config_template). | false | None | None |

### hosting_service Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_uri` | The URI of the service implemented by the plugin developer, used to invoke the plugin's functionality. This information is only required for user defined plugins. | false | None | None |

### auth_config_template Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `supported_auth_types` | The list of authentication types supported by the plugin. | true | None | None |
| `service_account` | Config for Google service account authentication. Structure is [documented below](#nested_config_template_auth_config_template_service_account). | false | None | None |

### service_account Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account` | The service account to be used for authenticating request. The `iam.serviceAccounts.getAccessToken` permission should be granted on this service account to the impersonator service account. | true | None | None |

### additional_config_template Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `required` | Flag represents that this `ConfigVariable` must be provided for a PluginInstance. | false | None | None |
| `enum_options` | Enum options. To be populated if `ValueType` is `ENUM`. Structure is [documented below](#nested_config_template_additional_config_template_additional_config_template_enum_options). | false | None | None |
| `multi_select_options` | Multi select options. To be populated if `ValueType` is `MULTI_SELECT`. Structure is [documented below](#nested_config_template_additional_config_template_additional_config_template_multi_select_options). | false | None | None |
| `id` | ID of the config variable. Must be unique within the configuration. | true | None | None |
| `value_type` | Type of the parameter: string, int, bool etc. Possible values: VALUE_TYPE_UNSPECIFIED STRING INT BOOL SECRET ENUM MULTI_SELECT MULTI_STRING MULTI_INT | true | None | None |
| `description` | Description. | false | None | None |
| `validation_regex` | Regular expression in RE2 syntax used for validating the `value` of a `ConfigVariable`. | false | None | None |

### enum_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Id of the option. | true | None | None |
| `display_name` | Display name of the option. | true | None | None |
| `description` | Description of the option. | false | None | None |

### multi_select_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Id of the option. | true | None | None |
| `display_name` | Display name of the option. | true | None | None |
| `description` | Description of the option. | false | None | None |
