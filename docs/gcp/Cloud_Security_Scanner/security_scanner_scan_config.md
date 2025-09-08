## 🛡️ Policy Deployment Engine: `security_scanner_scan_config`

This section provides a concise policy evaluation for the `security_scanner_scan_config` resource in GCP.

Reference: [Terraform Registry – security_scanner_scan_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/security_scanner_scan_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The user provider display name of the ScanConfig. | true | None | None |
| `starting_urls` | The starting URLs from which the scanner finds site pages. | true | None | None |
| `max_qps` | The maximum QPS during scanning. A valid value ranges from 5 to 20 inclusively. Defaults to 15. | false | None | None |
| `user_agent` | Type of the user agents used for scanning Default value is `CHROME_LINUX`. Possible values are: `USER_AGENT_UNSPECIFIED`, `CHROME_LINUX`, `CHROME_ANDROID`, `SAFARI_IPHONE`. | false | None | None |
| `blacklist_patterns` | The blacklist URL patterns as described in https://cloud.google.com/security-scanner/docs/excluded-urls | false | None | None |
| `target_platforms` | Set of Cloud Platforms targeted by the scan. If empty, APP_ENGINE will be used as a default. Each value may be one of: `APP_ENGINE`, `COMPUTE`. | false | None | None |
| `export_to_security_command_center` | Controls export of scan configurations and results to Cloud Security Command Center. Default value is `ENABLED`. Possible values are: `ENABLED`, `DISABLED`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### authentication Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `google_account` | Describes authentication configuration that uses a Google account. Structure is [documented below](#nested_authentication_google_account). | false | None | None |
| `custom_account` | Describes authentication configuration that uses a custom account. Structure is [documented below](#nested_authentication_custom_account). | false | None | None |

### schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schedule_time` | A timestamp indicates when the next run will be scheduled. The value is refreshed by the server after each run. If unspecified, it will default to current server time, which means the scan will be scheduled to start immediately. | false | None | None |
| `interval_duration_days` | The duration of time between executions in days | true | None | None |

### google_account Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The user name of the Google account. | true | None | None |
| `password` | The password of the Google account. The credential is stored encrypted in GCP. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |

### custom_account Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The user name of the custom account. | true | None | None |
| `password` | The password of the custom account. The credential is stored encrypted in GCP. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `login_url` | The login form URL of the website. | true | None | None |
