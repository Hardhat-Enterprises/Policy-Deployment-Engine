## 🛡️ Policy Deployment Engine: `billing_budget`

This section provides a concise policy evaluation for the `billing_budget` resource in GCP.

Reference: [Terraform Registry – billing_budget](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `billing_account` | ID of the billing account to set a budget on. | true | None | None |
| `display_name` | User data for display name in UI. Must be <= 60 chars. | false | None | None |
| `ownership_scope` | The ownership scope of the budget. The ownership scope and users' IAM permissions determine who has full access to the budget's data. Possible values are: `OWNERSHIP_SCOPE_UNSPECIFIED`, `ALL_USERS`, `BILLING_ACCOUNT`. | false | None | None |

### amount Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `specified_amount` | A specified amount to use as the budget. currencyCode is optional. If specified, it must match the currency of the billing account. The currencyCode is provided on output. Structure is [documented below](#nested_amount_specified_amount). | false | None | None |
| `last_period_amount` | Configures a budget amount that is automatically set to 100% of last period's spend. Boolean. Set value to true to use. Do not set to false, instead use the `specified_amount` block. | false | None | None |

### budget_filter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `projects` | A set of projects of the form projects/{project_number}, specifying that usage from only this set of projects should be included in the budget. If omitted, the report will include all usage for the billing account, regardless of which project the usage occurred on. | false | None | None |
| `resource_ancestors` | A set of folder and organization names of the form folders/{folderId} or organizations/{organizationId}, specifying that usage from only this set of folders and organizations should be included in the budget. If omitted, the budget includes all usage that the billing account pays for. If the folder or organization contains projects that are paid for by a different Cloud Billing account, the budget doesn't apply to those projects. | false | None | None |
| `credit_types_treatment` | Specifies how credits should be treated when determining spend for threshold calculations. Default value is `INCLUDE_ALL_CREDITS`. Possible values are: `INCLUDE_ALL_CREDITS`, `EXCLUDE_ALL_CREDITS`, `INCLUDE_SPECIFIED_CREDITS`. | false | None | None |
| `services` | A set of services of the form services/{service_id}, specifying that usage from only this set of services should be included in the budget. If omitted, the report will include usage for all the services. The service names are available through the Catalog API: https://cloud.google.com/billing/v1/how-tos/catalog-api. | false | None | None |
| `credit_types` | Optional. If creditTypesTreatment is INCLUDE_SPECIFIED_CREDITS, this is a list of credit types to be subtracted from gross cost to determine the spend for threshold calculations. See a list of acceptable credit type values. If creditTypesTreatment is not INCLUDE_SPECIFIED_CREDITS, this field must be empty. **Note:** If the field has a value in the config and needs to be removed, the field has to be an empty array in the config. | false | None | None |
| `subaccounts` | A set of subaccounts of the form billingAccounts/{account_id}, specifying that usage from only this set of subaccounts should be included in the budget. If a subaccount is set to the name of the parent account, usage from the parent account will be included. If the field is omitted, the report will include usage from the parent account and all subaccounts, if they exist. **Note:** If the field has a value in the config and needs to be removed, the field has to be an empty array in the config. | false | None | None |
| `labels` | A single label and value pair specifying that usage from only this set of labeled resources should be included in the budget. | false | None | None |
| `calendar_period` | A CalendarPeriod represents the abstract concept of a recurring time period that has a canonical start. Grammatically, "the start of the current CalendarPeriod". All calendar times begin at 12 AM US and Canadian Pacific Time (UTC-8). Exactly one of `calendar_period`, `custom_period` must be provided. Possible values are: `MONTH`, `QUARTER`, `YEAR`, `CALENDAR_PERIOD_UNSPECIFIED`. | false | None | None |
| `custom_period` | Specifies to track usage from any start date (required) to any end date (optional). This time period is static, it does not recur. Exactly one of `calendar_period`, `custom_period` must be provided. Structure is [documented below](#nested_budget_filter_custom_period). | false | None | None |

### threshold_rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `threshold_percent` | Send an alert when this threshold is exceeded. This is a 1.0-based percentage, so 0.5 = 50%. Must be >= 0. | true | None | None |
| `spend_basis` | The type of basis used to determine if spend has passed the threshold. Default value is `CURRENT_SPEND`. Possible values are: `CURRENT_SPEND`, `FORECASTED_SPEND`. | false | None | None |

### all_updates_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pubsub_topic` | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form projects/{project_id}/topics/{topic_id}. Updates are sent at regular intervals to the topic. | false | None | None |
| `schema_version` | The schema version of the notification. Only "1.0" is accepted. It represents the JSON schema as defined in https://cloud.google.com/billing/docs/how-to/budgets#notification_format. | false | None | None |
| `monitoring_notification_channels` | The full resource name of a monitoring notification channel in the form projects/{project_id}/notificationChannels/{channel_id}. A maximum of 5 channels are allowed. | false | None | None |
| `disable_default_iam_recipients` | Boolean. When set to true, disables default notifications sent when a threshold is exceeded. Default recipients are those with Billing Account Administrators and Billing Account Users IAM roles for the target account. | false | None | None |
| `enable_project_level_recipients` | When set to true, and when the budget has a single project configured, notifications will be sent to project level recipients of that project. This field will be ignored if the budget has multiple or no project configured. Currently, project level recipients are the users with Owner role on a cloud project. | false | None | None |

### specified_amount Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `currency_code` | The 3-letter currency code defined in ISO 4217. | false | None | None |
| `units` | The whole units of the amount. For example if currencyCode is "USD", then 1 unit is one US dollar. | false | None | None |
| `nanos` | Number of nano (10^-9) units of the amount. The value must be between -999,999,999 and +999,999,999 inclusive. If units is positive, nanos must be positive or zero. If units is zero, nanos can be positive, zero, or negative. If units is negative, nanos must be negative or zero. For example $-1.75 is represented as units=-1 and nanos=-750,000,000. | false | None | None |

### custom_period Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start_date` | A start date is required. The start date must be after January 1, 2017. Structure is [documented below](#nested_budget_filter_custom_period_start_date). | true | None | None |
| `end_date` | Optional. The end date of the time period. Budgets with elapsed end date won't be processed. If unset, specifies to track all usage incurred since the startDate. Structure is [documented below](#nested_budget_filter_custom_period_end_date). | false | None | None |

### start_date Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `year` | Year of the date. Must be from 1 to 9999. | true | None | None |
| `month` | Month of a year. Must be from 1 to 12. | true | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month. | true | None | None |

### end_date Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `year` | Year of the date. Must be from 1 to 9999. | true | None | None |
| `month` | Month of a year. Must be from 1 to 12. | true | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month. | true | None | None |
