## 🛡️ Policy Deployment Engine: `security_scanner_scan_config`

This section provides a concise policy evaluation for the `security_scanner_scan_config` resource in GCP.

Reference: [Terraform Registry – security_scanner_scan_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/security_scanner_scan_config)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The user provider display name of the ScanConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `starting_urls`
- Description: (Required) The starting URLs from which the scanner finds site pages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_qps`
- Description: (Optional) The maximum QPS during scanning. A valid value ranges from 5 to 20 inclusively. Defaults to 15.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authentication`
- Description: (Optional) The authentication configuration. If specified, service will use the authentication configuration during scanning. Structure is [documented below](#nested_authentication).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_agent`
- Description: (Optional) Type of the user agents used for scanning Default value is `CHROME_LINUX`. Possible values are: `USER_AGENT_UNSPECIFIED`, `CHROME_LINUX`, `CHROME_ANDROID`, `SAFARI_IPHONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `blacklist_patterns`
- Description: (Optional) The blacklist URL patterns as described in https://cloud.google.com/security-scanner/docs/excluded-urls
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Optional) The schedule of the ScanConfig Structure is [documented below](#nested_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_platforms`
- Description: (Optional) Set of Cloud Platforms targeted by the scan. If empty, APP_ENGINE will be used as a default. Each value may be one of: `APP_ENGINE`, `COMPUTE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_to_security_command_center`
- Description: (Optional) Controls export of scan configurations and results to Cloud Security Command Center. Default value is `ENABLED`. Possible values are: `ENABLED`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_authentication"></a>The `authentication` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_account`
- Description: (Optional) Describes authentication configuration that uses a Google account. Structure is [documented below](#nested_authentication_google_account).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_account`
- Description: (Optional) Describes authentication configuration that uses a custom account. Structure is [documented below](#nested_authentication_custom_account). <a name="nested_authentication_google_account"></a>The `google_account` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) The user name of the Google account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Required) The password of the Google account. The credential is stored encrypted in GCP. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_authentication_custom_account"></a>The `custom_account` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) The user name of the custom account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Required) The password of the custom account. The credential is stored encrypted in GCP. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `login_url`
- Description: (Required) The login form URL of the website. <a name="nested_schedule"></a>The `schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule_time`
- Description: (Optional) A timestamp indicates when the next run will be scheduled. The value is refreshed by the server after each run. If unspecified, it will default to current server time, which means the scan will be scheduled to start immediately.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interval_duration_days`
- Description: (Required) The duration of time between executions in days
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
