## 🛡️ Policy Deployment Engine: `apihub_plugin_instance`

This section provides a concise policy evaluation for the `apihub_plugin_instance` resource in GCP.

Reference: [Terraform Registry – apihub_plugin_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_plugin_instance)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The display name for this plugin instance. Max length is 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Required) The action status for the plugin instance. Structure is [documented below](#nested_actions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plugin`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `plugin_instance_id`
- Description: (Required) The ID to use for the plugin instance, which will become the final component of the plugin instance's resource name. This field is optional. * If provided, the same will be used. The service will throw an error if the specified id is already used by another plugin instance in the plugin resource. * If not provided, a system generated id will be used. This value should be 4-63 characters, and valid characters are /a-z[0-9]-_/.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable`
- Description: (Optional) The display name for this plugin instance. Max length is 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_config`
- Description: (Optional) AuthConfig represents the authentication information. Structure is [documented below](#nested_auth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_actions"></a>The `actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hub_instance_action`
- Description: (Output) The execution status for the plugin instance. Structure is [documented below](#nested_actions_actions_hub_instance_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action_id`
- Description: (Required) This should map to one of the action id specified in actions_config in the plugin.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) The current state of the plugin action in the plugin instance. Possible values: STATE_UNSPECIFIED ENABLED DISABLED ENABLING DISABLING ERROR
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule_cron_expression`
- Description: (Optional) The schedule for this plugin instance action. This can only be set if the plugin supports API_HUB_SCHEDULE_TRIGGER mode for this action.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `curation_config`
- Description: (Optional) The curation information for this plugin instance. Structure is [documented below](#nested_actions_actions_curation_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule_time_zone`
- Description: (Optional) The time zone for the schedule cron expression. If not provided, UTC will be used. <a name="nested_actions_actions_hub_instance_action"></a>The `hub_instance_action` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `current_execution_state`
- Description: (Output) The current state of the execution. Possible values: CURRENT_EXECUTION_STATE_UNSPECIFIED RUNNING NOT_RUNNING
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last_execution`
- Description: (Output) The result of the last execution of the plugin instance. Structure is [documented below](#nested_actions_actions_hub_instance_action_last_execution). <a name="nested_actions_actions_hub_instance_action_last_execution"></a>The `last_execution` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `result`
- Description: (Output) The result of the last execution of the plugin instance. Possible values: RESULT_UNSPECIFIED SUCCEEDED FAILED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_message`
- Description: (Output) Error message describing the failure, if any, during the last execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Output) The last execution start time of the plugin instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Output) The last execution end time of the plugin instance. <a name="nested_actions_actions_curation_config"></a>The `curation_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_curation`
- Description: (Optional) Custom curation information for this plugin instance. Structure is [documented below](#nested_actions_actions_curation_config_custom_curation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `curation_type`
- Description: (Required) Possible values: CURATION_TYPE_UNSPECIFIED DEFAULT_CURATION_FOR_API_METADATA CUSTOM_CURATION_FOR_API_METADATA <a name="nested_actions_actions_curation_config_custom_curation"></a>The `custom_curation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `curation`
- Description: (Required) The unique name of the curation resource. This will be the name of the curation resource in the format: `projects/{project}/locations/{location}/curations/{curation}` <a name="nested_auth_config"></a>The `auth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_service_account_config`
- Description: (Optional) Config for Google service account authentication. Structure is [documented below](#nested_auth_config_google_service_account_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_password_config`
- Description: (Optional) Parameters to support Username and Password Authentication. Structure is [documented below](#nested_auth_config_user_password_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key_config`
- Description: (Optional) Config for authentication with API key. Structure is [documented below](#nested_auth_config_api_key_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_credentials_config`
- Description: (Optional) Parameters to support Oauth 2.0 client credentials grant authentication. See https://tools.ietf.org/html/rfc6749#section-1.3.4 for more details. Structure is [documented below](#nested_auth_config_oauth2_client_credentials_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_type`
- Description: (Required) Possible values: AUTH_TYPE_UNSPECIFIED NO_AUTH GOOGLE_SERVICE_ACCOUNT USER_PASSWORD API_KEY OAUTH2_CLIENT_CREDENTIALS <a name="nested_auth_config_google_service_account_config"></a>The `google_service_account_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Required) The service account to be used for authenticating request. The `iam.serviceAccounts.getAccessToken` permission should be granted on this service account to the impersonator service account. <a name="nested_auth_config_user_password_config"></a>The `user_password_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Required) Secret provides a reference to entries in Secret Manager. Structure is [documented below](#nested_auth_config_user_password_config_password). <a name="nested_auth_config_user_password_config_password"></a>The `password` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: `projects/*/secrets/*/versions/*`. <a name="nested_auth_config_api_key_config"></a>The `api_key_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The parameter name of the API key. E.g. If the API request is "https://example.com/act?api_key=", "api_key" would be the parameter name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key`
- Description: (Required) Secret provides a reference to entries in Secret Manager. Structure is [documented below](#nested_auth_config_api_key_config_api_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_element_location`
- Description: (Required) The location of the API key. The default value is QUERY. Possible values: HTTP_ELEMENT_LOCATION_UNSPECIFIED QUERY HEADER PATH BODY COOKIE <a name="nested_auth_config_api_key_config_api_key"></a>The `api_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: `projects/*/secrets/*/versions/*`. <a name="nested_auth_config_oauth2_client_credentials_config"></a>The `oauth2_client_credentials_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Required) Secret provides a reference to entries in Secret Manager. Structure is [documented below](#nested_auth_config_oauth2_client_credentials_config_client_secret).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) The client identifier. <a name="nested_auth_config_oauth2_client_credentials_config_client_secret"></a>The `client_secret` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: `projects/*/secrets/*/versions/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
