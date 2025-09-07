## 🛡️ Policy Deployment Engine: `apihub_plugin`

This section provides a concise policy evaluation for the `apihub_plugin` resource in GCP.

Reference: [Terraform Registry – apihub_plugin](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_plugin)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The display name of the plugin. Max length is 50 characters (Unicode code points).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plugin_id`
- Description: (Required) The ID to use for the Plugin resource, which will become the final component of the Plugin's resource name. This field is optional. * If provided, the same will be used. The service will throw an error if the specified id is already used by another Plugin resource in the API hub instance. * If not provided, a system generated id will be used. This value should be 4-63 characters, overall resource name which will be of format `projects/{project}/locations/{location}/plugins/{plugin}`, its length is limited to 1000 characters and valid characters are /a-z[0-9]-_/.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The plugin description. Max length is 2000 characters (Unicode code points).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions_config`
- Description: (Optional) The configuration of actions supported by the plugin. Structure is [documented below](#nested_actions_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `documentation`
- Description: (Optional) Documentation details. Structure is [documented below](#nested_documentation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plugin_category`
- Description: (Optional) Possible values: PLUGIN_CATEGORY_UNSPECIFIED API_GATEWAY API_PRODUCER
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_template`
- Description: (Optional) ConfigTemplate represents the configuration template for a plugin. Structure is [documented below](#nested_config_template).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hosting_service`
- Description: (Optional) The information related to the service implemented by the plugin developer, used to invoke the plugin's functionality. Structure is [documented below](#nested_hosting_service).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_actions_config"></a>The `actions_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) The id of the action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) The display name of the action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Required) The description of the operation performed by the action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_mode`
- Description: (Required) The trigger mode supported by the action. Possible values: TRIGGER_MODE_UNSPECIFIED API_HUB_ON_DEMAND_TRIGGER API_HUB_SCHEDULE_TRIGGER NON_API_HUB_MANAGED <a name="nested_documentation"></a>The `documentation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_uri`
- Description: (Optional) The uri of the externally hosted documentation. <a name="nested_config_template"></a>The `config_template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_config_template`
- Description: (Optional) AuthConfigTemplate represents the authentication template for a plugin. Structure is [documented below](#nested_config_template_auth_config_template).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_config_template`
- Description: (Optional) The list of additional configuration variables for the plugin's configuration. Structure is [documented below](#nested_config_template_additional_config_template). <a name="nested_config_template_auth_config_template"></a>The `auth_config_template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `supported_auth_types`
- Description: (Required) The list of authentication types supported by the plugin.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Config for Google service account authentication. Structure is [documented below](#nested_config_template_auth_config_template_service_account). <a name="nested_config_template_auth_config_template_service_account"></a>The `service_account` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Required) The service account to be used for authenticating request. The `iam.serviceAccounts.getAccessToken` permission should be granted on this service account to the impersonator service account. <a name="nested_config_template_additional_config_template"></a>The `additional_config_template` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `required`
- Description: (Optional) Flag represents that this `ConfigVariable` must be provided for a PluginInstance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enum_options`
- Description: (Optional) Enum options. To be populated if `ValueType` is `ENUM`. Structure is [documented below](#nested_config_template_additional_config_template_additional_config_template_enum_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multi_select_options`
- Description: (Optional) Multi select options. To be populated if `ValueType` is `MULTI_SELECT`. Structure is [documented below](#nested_config_template_additional_config_template_additional_config_template_multi_select_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) ID of the config variable. Must be unique within the configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value_type`
- Description: (Required) Type of the parameter: string, int, bool etc. Possible values: VALUE_TYPE_UNSPECIFIED STRING INT BOOL SECRET ENUM MULTI_SELECT MULTI_STRING MULTI_INT
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validation_regex`
- Description: (Optional) Regular expression in RE2 syntax used for validating the `value` of a `ConfigVariable`. <a name="nested_config_template_additional_config_template_additional_config_template_enum_options"></a>The `enum_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Id of the option.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Display name of the option.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the option. <a name="nested_config_template_additional_config_template_additional_config_template_multi_select_options"></a>The `multi_select_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Id of the option.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Display name of the option.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the option. <a name="nested_hosting_service"></a>The `hosting_service` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_uri`
- Description: (Optional) The URI of the service implemented by the plugin developer, used to invoke the plugin's functionality. This information is only required for user defined plugins.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
