## 🛡️ Policy Deployment Engine: `apihub_plugin_instance`

This section provides a concise policy evaluation for the `apihub_plugin_instance` resource in GCP.

Reference: [Terraform Registry – apihub_plugin_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apihub_plugin_instance)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The display name for this plugin instance. Max length is 255 characters. | true | false | Display name. No security relevance. | None | None |
| `actions` | The action status for the plugin instance. Structure is [documented below](#nested_actions). | true | false | Not security related. | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | Location controls regional compliance and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'europe-west1'] |
| `plugin` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | false | Display name. No security relevance. | None | None |
| `plugin_instance_id` | The ID to use for the plugin instance, which will become the final component of the plugin instance's resource name. This field is optional. * If provided, the same will be used. The service will throw an error if the specified id is already used by another plugin instance in the plugin resource. * If not provided, a system generated id will be used. This value should be 4-63 characters, and valid characters are /a-z[0-9]-_/. | true | false | ID. No security relevance. | ['c', 'c1', 'c2'] | ['Anything else'] |
| `disable` | The display name for this plugin instance. Max length is 255 characters. | false | true | Prevents accidental or malicious disabling of critical plugins. Description of this attribute is wrong in terraform documentation? | [False] | [True] |
| `auth_config` | AuthConfig represents the authentication information. Structure is [documented below](#nested_auth_config). | false | false | Parent, nested functions may be security-related. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Not security relevant, but required for terraform json to operate. | ['PDE'] | ['Anything else'] |
| `curation_config` |  | false | false | Curation configuration. | None | None |
| `custom_curation` |  | false | false | None | None | None |
| `google_service_account_config` |  | true | false | Arguments inside could be security relevant. | None | None |
| `user_password_config` |  | true | false | Arguments inside are security relevant. | None | None |
| `password` |  | true | false | Arguments inside are security relevant. | None | None |
| `api_key_config` |  | true | false | Parent. | None | None |
| `api_key` |  | true | false | Parent. | None | None |
| `oauth2_client_credentials_config` |  | true | false | None | None | None |
| `client_secret` |  | true | false | Parent | None | None |

### actions Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hub_instance_action` | (Output) The execution status for the plugin instance. Structure is [documented below](#nested_actions_actions_hub_instance_action). | true | false | Arguments inside could be security relevant however. | None | None |
| `action_id` | This should map to one of the action id specified in actions_config in the plugin. | true | false | Not security relevant. | None | None |
| `state` | (Output) The current state of the plugin action in the plugin instance. Possible values: STATE_UNSPECIFIED ENABLED DISABLED ENABLING DISABLING ERROR | false | false | None | None | None |
| `schedule_cron_expression` | The schedule for this plugin instance action. This can only be set if the plugin supports API_HUB_SCHEDULE_TRIGGER mode for this action. | false | false | Configuration. Not security relevant. | None | None |
| `curation_config` | The curation information for this plugin instance. Structure is [documented below](#nested_actions_actions_curation_config). | false | false | Configuration. Not security relevant. | None | None |
| `schedule_time_zone` | The time zone for the schedule cron expression. If not provided, UTC will be used. The `hub_instance_action` block contains: | false | false | Configuration. Not security relevant. | None | None |
| `current_execution_state` | (Output) The current state of the execution. Possible values: CURRENT_EXECUTION_STATE_UNSPECIFIED RUNNING NOT_RUNNING | false | false | None | None | None |
| `last_execution` | (Output) The result of the last execution of the plugin instance. Structure is [documented below](#nested_actions_actions_hub_instance_action_last_execution). The `last_execution` block contains: | false | false | None | None | None |
| `result` | (Output) The result of the last execution of the plugin instance. Possible values: RESULT_UNSPECIFIED SUCCEEDED FAILED | false | false | None | None | None |
| `error_message` | (Output) Error message describing the failure, if any, during the last execution. | false | false | None | None | None |
| `start_time` | (Output) The last execution start time of the plugin instance. | false | false | None | None | None |
| `end_time` | (Output) The last execution end time of the plugin instance. | false | false | None | None | None |

### auth_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `google_service_account_config` | Config for Google service account authentication. Structure is [documented below](#nested_auth_config_google_service_account_config). | false | false | Parameter, not security related. | None | None |
| `user_password_config` | Parameters to support Username and Password Authentication. Structure is [documented below](#nested_auth_config_user_password_config). | false | false | Parameter, not security related. | None | None |
| `api_key_config` | Config for authentication with API key. Structure is [documented below](#nested_auth_config_api_key_config). | false | false | Parameter, not security related. | None | None |
| `oauth2_client_credentials_config` | Parameters to support Oauth 2.0 client credentials grant authentication. See https://tools.ietf.org/html/rfc6749#section-1.3.4 for more details. Structure is [documented below](#nested_auth_config_oauth2_client_credentials_config). | false | false | Parameter, not security related. | None | None |
| `auth_type` | Possible values: AUTH_TYPE_UNSPECIFIED NO_AUTH GOOGLE_SERVICE_ACCOUNT USER_PASSWORD API_KEY OAUTH2_CLIENT_CREDENTIALS | true | true | Controls authentication methods. | ['USER_PASSWORD', 'OAUTH2_CLIENT_CREDENTIALS'] | ['NO_AUTH', 'Anything else'] |

### curation_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `custom_curation` | Custom curation information for this plugin instance. Structure is [documented below](#nested_actions_actions_curation_config_custom_curation). | false | false | Configuration settings. Not security relevant. | None | None |
| `curation_type` | Possible values: CURATION_TYPE_UNSPECIFIED DEFAULT_CURATION_FOR_API_METADATA CUSTOM_CURATION_FOR_API_METADATA | true | false | Configuration settings. Not security relevant. | None | None |

### custom_curation Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `curation` | The unique name of the curation resource. This will be the name of the curation resource in the format: `projects/{project}/locations/{location}/curations/{curation}` | true | false | Unique name. Not security relevant. | None | None |

### google_service_account_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account` | The service account to be used for authenticating request. The `iam.serviceAccounts.getAccessToken` permission should be granted on this service account to the impersonator service account. | true | true | Misconfigured or over-privileged service accounts are a major security risk. | None | None |

### user_password_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | Username. | true | true | Potentially security relevant. Credentials-relevant. | None | None |
| `password` | Secret provides a reference to entries in Secret Manager. Structure is [documented below](#nested_auth_config_user_password_config_password). | true | true | Potentially security relevant. Credentials-relevant and related to secrets manager. | None | None |

### password Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | The resource name of the secret version in the format, format as: `projects/*/secrets/*/versions/*`. | true | true | Potentiall security relevant, points to the location where secrets are stored. | None | None |

### api_key_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The parameter name of the API key. E.g. If the API request is "https://example.com/act?api_key=", "api_key" would be the parameter name. | true | false | Name of API key. Not security relevant. | None | None |
| `api_key` | Secret provides a reference to entries in Secret Manager. Structure is [documented below](#nested_auth_config_api_key_config_api_key). | true | true | Potentially security relevant. Holds api key for auth. | None | None |
| `http_element_location` | The location of the API key. The default value is QUERY. Possible values: HTTP_ELEMENT_LOCATION_UNSPECIFIED QUERY HEADER PATH BODY COOKIE | true | false | Not a secret, just a config. | None | None |

### api_key Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | The resource name of the secret version in the format, format as: `projects/*/secrets/*/versions/*`. | true | true | Potentially security relevant, points to the location where secrets are stored. | None | None |

### oauth2_client_credentials_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_secret` | Secret provides a reference to entries in Secret Manager. Structure is [documented below](#nested_auth_config_oauth2_client_credentials_config_client_secret). | true | true | Potentially security relevant, points to the location where secrets are stored. | None | None |
| `client_id` | The client identifier. | true | true | Could be used to pair with secrets in auth if compromised. Potentially security relevant. | None | None |

### client_secret Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | The resource name of the secret version in the format, format as: `projects/*/secrets/*/versions/*`. | true | true | Could be security relevant. Points to secrets. | None | None |
