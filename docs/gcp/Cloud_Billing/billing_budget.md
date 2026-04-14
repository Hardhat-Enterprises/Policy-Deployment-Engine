## 🛡️ Policy Deployment Engine: `billing_budget`

This section provides a concise policy evaluation for the `billing_budget` resource in GCP.

Reference: [Terraform Registry – billing_budget](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `amount` | The budgeted amount for each usage period. Structure is [documented below](#nested_amount). | true | false | Defines the monetary budget limit for a billing period. This is primarily a financial management and cost control setting and does not directly impact system security. | None | None |
| `billing_account` | ID of the billing account to set a budget on. | true | false | Identifies the billing account associated with the budget. While required for correct configuration, it does not enforce or influence security controls. | Billing accoutn ID field can't be empty and needs a valid ID that allows the budget to be correctly associated with a billing account. | When the billing_account field empty or incorrect, it prevents the budget from being associated with a billing account and results in deployment failure |
| `display_name` | User data for display name in UI. Must be <= 60 chars. | false | false | Used only for identification and display purposes in the user interface. It has no effect on security or system behavior. | None | None |
| `budget_filter` | Filters that define which resources are used to compute the actual spend against the budget. Structure is [documented below](#nested_budget_filter). | false | false | Defines the scope of resources included in budget calculations. This supports cost tracking and reporting but does not enforce or influence security controls. | None | None |
| `threshold_rules` | Rules that trigger alerts (notifications of thresholds being crossed) when spend exceeds the specified percentages of the budget. Structure is [documented below](#nested_threshold_rules). | false | false | Threshold rules is for cost monitoring and financial governance but does not enforce or influence security controls. | None | None |
| `all_updates_rule` | Defines notifications that are sent on every update to the billing account's spend, regardless of the thresholds defined using threshold rules. Structure is [documented below](#nested_all_updates_rule). | false | false | Defines how budget update notifications are delivered. This supports billing visibility and operational awareness, but does not directly enforce or influence security controls. | None | None |
| `ownership_scope` | The ownership scope of the budget. The ownership scope and users' IAM permissions determine who has full access to the budget's data. Possible values are: `OWNERSHIP_SCOPE_UNSPECIFIED`, `ALL_USERS`, `BILLING_ACCOUNT`. | false | true | Determines who can access budget data in combination with IAM permissions. This has security impact because it affects visibility of billing information and helps limit access to financial data. | A configuration is compliant when the ownership_scope is set to 'BILLING_ACCOUNT', restricting budget visibility to users with appropriate billing account access. | A configuration is non-compliant when the ownership_scope is set to 'ALL_USERS', as this may allow broader access to budget data than intended. |
| `specified_amount` | A specified amount to use as the budget. currencyCode is optional. If specified, it must match the currency of the billing account. The currencyCode is provided on output.  | false | false | Specifies the budget amount used for cost tracking. This is a financial configuration setting and does not directly enforce or influence security controls. | None | None |
| `custom_period` | Specifies a custom time period for tracking budget spend. | false | false | Defines a fixed time range for budget monitoring. This supports billing and reporting configuration but does not enforce or influence security controls. | None | None |

### amount Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `specified_amount` | A specified amount to use as the budget. currencyCode is optional. If specified, it must match the currency of the billing account. The currencyCode is provided on output. Structure is [documented below](#nested_amount_specified_amount). | false | false | Specifies a fixed budget value. This affects budgeting accuracy and cost tracking but does not introduce or mitigate security risks. | None | None |
| `last_period_amount` | Configures a budget amount that is automatically set to 100% of last period's spend. Boolean. Set value to true to use. Do not set to false, instead use the `specified_amount` block. | false | false | Automatically adjusts the budget based on previous usage. This is a financial convenience feature and has no direct security implications. | None | None |

### budget_filter Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `projects` | A set of projects of the form projects/{project_number}, specifying that usage from only this set of projects should be included in the budget. If omitted, the report will include all usage for the billing account, regardless of which project the usage occurred on. | false | false | Limits budget calculation to specific projects. This improves cost visibility but does not impact security enforcement. | None | None |
| `resource_ancestors` | A set of folder and organization names of the form folders/{folderId} or organizations/{organizationId}, specifying that usage from only this set of folders and organizations should be included in the budget. If omitted, the budget includes all usage that the billing account pays for. If the folder or organization contains projects that are paid for by a different Cloud Billing account, the budget doesn't apply to those projects. | false | false | Scopes budget calculation to organizational structure. This is a governance and reporting feature rather than a security control. | None | None |
| `credit_types_treatment` | Specifies how credits should be treated when determining spend for threshold calculations. Default value is `INCLUDE_ALL_CREDITS`. Possible values are: `INCLUDE_ALL_CREDITS`, `EXCLUDE_ALL_CREDITS`, `INCLUDE_SPECIFIED_CREDITS`. | false | false | Controls how billing credits are applied in cost calculations. This affects financial reporting but has no direct security impact. | None | None |
| `services` | A set of services of the form services/{service_id}, specifying that usage from only this set of services should be included in the budget. If omitted, the report will include usage for all the services. The service names are available through the Catalog API: https://cloud.google.com/billing/v1/how-tos/catalog-api. | false | false | Filters budget calculations by service usage. This improves cost attribution but does not influence system security. | None | None |
| `credit_types` | Optional. If creditTypesTreatment is INCLUDE_SPECIFIED_CREDITS, this is a list of credit types to be subtracted from gross cost to determine the spend for threshold calculations. See a list of acceptable credit type values. If creditTypesTreatment is not INCLUDE_SPECIFIED_CREDITS, this field must be empty. **Note:** If the field has a value in the config and needs to be removed, the field has to be an empty array in the config. | false | false | Controls how billing credits are applied in cost calculations. This affects financial reporting but has no direct security impact. | None | None |
| `subaccounts` | A set of subaccounts of the form billingAccounts/{account_id}, specifying that usage from only this set of subaccounts should be included in the budget. If a subaccount is set to the name of the parent account, usage from the parent account will be included. If the field is omitted, the report will include usage from the parent account and all subaccounts, if they exist. **Note:** If the field has a value in the config and needs to be removed, the field has to be an empty array in the config. | false | false | Scopes budget tracking to specific subaccounts. This is used for cost management and does not enforce security controls. | None | None |
| `labels` | A single label and value pair specifying that usage from only this set of labeled resources should be included in the budget. | false | false | Filters resources based on labels for cost tracking purposes. This supports organization but does not impact security. | None | None |
| `calendar_period` | A CalendarPeriod represents the abstract concept of a recurring time period that has a canonical start. Grammatically, "the start of the current CalendarPeriod". All calendar times begin at 12 AM US and Canadian Pacific Time (UTC-8). Exactly one of `calendar_period`, `custom_period` must be provided. Possible values are: `MONTH`, `QUARTER`, `YEAR`, `CALENDAR_PERIOD_UNSPECIFIED`. | false | false | Determines the time interval for budget tracking. This is a scheduling and reporting feature, not a security control. | None | None |
| `custom_period` | Specifies to track usage from any start date (required) to any end date (optional). This time period is static, it does not recur. Exactly one of `calendar_period`, `custom_period` must be provided. Structure is [documented below](#nested_budget_filter_custom_period). | false | false | Allows flexible time range configuration for budget tracking. This impacts budget reporting only and has no security relevance. | None | None |

### threshold_rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `threshold_percent` | Send an alert when this threshold is exceeded. This is a 1.0-based percentage, so 0.5 = 50%. Must be >= 0. | true | false | Defines the percentage threshold for triggering alerts. This is used for budget tracking and does not directly impact security. | None | None |
| `spend_basis` | The type of basis used to determine if spend has passed the threshold. Default value is `CURRENT_SPEND`. Possible values are: `CURRENT_SPEND`, `FORECASTED_SPEND`. | false | false | Specifies whether alerts are based on current or forecasted spend. This affects reporting behaviour but does not enforce security controls. | None | None |

### all_updates_rule Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pubsub_topic` | The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form projects/{project_id}/topics/{topic_id}. Updates are sent at regular intervals to the topic. | false | false | Specifies the Pub/Sub destination for budget update messages. This controls notification delivery only and does not itself enforce security. | None | None |
| `schema_version` | The schema version of the notification. Only "1.0" is accepted. It represents the JSON schema as defined in https://cloud.google.com/billing/docs/how-to/budgets#notification_format. | false | false | Defines the format version of the notification payload. This affects message structure and compatibility rather than security behaviour. | None | None |
| `monitoring_notification_channels` | The full resource name of a monitoring notification channel in the form projects/{project_id}/notificationChannels/{channel_id}. A maximum of 5 channels are allowed. | false | false | Specifies the monitoring channels used to receive budget notifications. This supports alert delivery and operational monitoring, but does not directly enforce security controls. | None | None |
| `disable_default_iam_recipients` | Boolean. When set to true, disables default notifications sent when a threshold is exceeded. Default recipients are those with Billing Account Administrators and Billing Account Users IAM roles for the target account. | false | false | Controls whether default IAM recipients receive billing notifications. This affects who is notified about budget events, but does not itself enforce access restrictions or other security controls | None | None |
| `enable_project_level_recipients` | When set to true, and when the budget has a single project configured, notifications will be sent to project level recipients of that project. This field will be ignored if the budget has multiple or no project configured. Currently, project level recipients are the users with Owner role on a cloud project. | false | false | Controls whether project-level recipients receive budget notifications for a single configured project. This is a notification routing feature and does not impact security. | None | None |

### specified_amount Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `currency_code` | The 3-letter currency code defined in ISO 4217. | false | false | Defines the currency used for the specified budget amount. This supports financial accuracy and reporting but does not impact security. | None | None |
| `units` | The whole units of the amount. For example if currencyCode is "USD", then 1 unit is one US dollar. | false | false | Represents the whole-number portion of the budget amount. This is part of the financial configuration and has no direct security relevance. | None | None |
| `nanos` | Number of nano (10^-9) units of the amount. The value must be between -999,999,999 and +999,999,999 inclusive. If units is positive, nanos must be positive or zero. If units is zero, nanos can be positive, zero, or negative. If units is negative, nanos must be negative or zero. For example $-1.75 is represented as units=-1 and nanos=-750,000,000. | false | false | Represents the fractional portion of the budget amount. This improves precision in financial configuration but does not affect security controls. | None | None |

### custom_period Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `start_date` | A start date is required. The start date must be after January 1, 2017. Structure is [documented below](#nested_budget_filter_custom_period_start_date). | true | false | Defines when the custom budget tracking period begins. This is a reporting and budgeting setting with no direct security impact. | None | None |
| `end_date` | Optional. The end date of the time period. Budgets with elapsed end date won't be processed. If unset, specifies to track all usage incurred since the startDate. Structure is [documented below](#nested_budget_filter_custom_period_end_date). | false | false | Defines when the custom budget tracking period ends. This affects the duration of budget monitoring but does not influence security controls. | None | None |

###   start_date Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `year` | Year of the date. Must be from 1 to 9999. | true | false | Specifies the year component of the start date. This is part of date formatting and does not affect security. | None | None |
  | `month` | Month of a year. Must be from 1 to 12. | true | false | Specifies the month component of the start date. This is part of date configuration and has no direct security impact | None | None |
  | `day` | Day of a month. Must be from 1 to 31 and valid for the year and month. | true | false | Specifies the day component of the start date. This supports valid date definition and does not influence security controls. | None | None |

###   end_date Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `year` | Year of the date. Must be from 1 to 9999. | true | false | Defines when the custom budget tracking period ends. This affects reporting duration but does not influence security controls. | None | None |
  | `month` | Month of a year. Must be from 1 to 12. | true | false | Specifies the month component of the end date. This is part of date configuration and does not affect security. | None | None |
  | `day` | Day of a month. Must be from 1 to 31 and valid for the year and month. | true | false | Specifies the day component of the end date. This supports valid date definition and does not influence security controls. | None | None |
