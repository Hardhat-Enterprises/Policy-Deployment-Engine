## 🛡️ Policy Deployment Engine: `billing_budget`

This section provides a concise policy evaluation for the `billing_budget` resource in GCP.

Reference: [Terraform Registry – billing_budget](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/billing_budget)

---

## 1. Argument Reference

### `amount`
- Description: (Required) The budgeted amount for each usage period. Structure is [documented below](#nested_amount).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `billing_account`
- Description: (Required) ID of the billing account to set a budget on.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User data for display name in UI. Must be <= 60 chars.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `budget_filter`
- Description: (Optional) Filters that define which resources are used to compute the actual spend against the budget. Structure is [documented below](#nested_budget_filter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threshold_rules`
- Description: (Optional) Rules that trigger alerts (notifications of thresholds being crossed) when spend exceeds the specified percentages of the budget. Structure is [documented below](#nested_threshold_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_updates_rule`
- Description: (Optional) Defines notifications that are sent on every update to the billing account's spend, regardless of the thresholds defined using threshold rules. Structure is [documented below](#nested_all_updates_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ownership_scope`
- Description: (Optional) The ownership scope of the budget. The ownership scope and users' IAM permissions determine who has full access to the budget's data. Possible values are: `OWNERSHIP_SCOPE_UNSPECIFIED`, `ALL_USERS`, `BILLING_ACCOUNT`. <a name="nested_amount"></a>The `amount` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `specified_amount`
- Description: (Optional) A specified amount to use as the budget. currencyCode is optional. If specified, it must match the currency of the billing account. The currencyCode is provided on output. Structure is [documented below](#nested_amount_specified_amount).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last_period_amount`
- Description: (Optional) Configures a budget amount that is automatically set to 100% of last period's spend. Boolean. Set value to true to use. Do not set to false, instead use the `specified_amount` block. <a name="nested_amount_specified_amount"></a>The `specified_amount` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `currency_code`
- Description: (Optional) The 3-letter currency code defined in ISO 4217.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `units`
- Description: (Optional) The whole units of the amount. For example if currencyCode is "USD", then 1 unit is one US dollar.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Number of nano (10^-9) units of the amount. The value must be between -999,999,999 and +999,999,999 inclusive. If units is positive, nanos must be positive or zero. If units is zero, nanos can be positive, zero, or negative. If units is negative, nanos must be negative or zero. For example $-1.75 is represented as units=-1 and nanos=-750,000,000. <a name="nested_budget_filter"></a>The `budget_filter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `projects`
- Description: (Optional) A set of projects of the form projects/{project_number}, specifying that usage from only this set of projects should be included in the budget. If omitted, the report will include all usage for the billing account, regardless of which project the usage occurred on.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_ancestors`
- Description: (Optional) A set of folder and organization names of the form folders/{folderId} or organizations/{organizationId}, specifying that usage from only this set of folders and organizations should be included in the budget. If omitted, the budget includes all usage that the billing account pays for. If the folder or organization contains projects that are paid for by a different Cloud Billing account, the budget doesn't apply to those projects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `credit_types_treatment`
- Description: (Optional) Specifies how credits should be treated when determining spend for threshold calculations. Default value is `INCLUDE_ALL_CREDITS`. Possible values are: `INCLUDE_ALL_CREDITS`, `EXCLUDE_ALL_CREDITS`, `INCLUDE_SPECIFIED_CREDITS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `services`
- Description: (Optional) A set of services of the form services/{service_id}, specifying that usage from only this set of services should be included in the budget. If omitted, the report will include usage for all the services. The service names are available through the Catalog API: https://cloud.google.com/billing/v1/how-tos/catalog-api.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `credit_types`
- Description: (Optional) Optional. If creditTypesTreatment is INCLUDE_SPECIFIED_CREDITS, this is a list of credit types to be subtracted from gross cost to determine the spend for threshold calculations. See a list of acceptable credit type values. If creditTypesTreatment is not INCLUDE_SPECIFIED_CREDITS, this field must be empty. **Note:** If the field has a value in the config and needs to be removed, the field has to be an empty array in the config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subaccounts`
- Description: (Optional) A set of subaccounts of the form billingAccounts/{account_id}, specifying that usage from only this set of subaccounts should be included in the budget. If a subaccount is set to the name of the parent account, usage from the parent account will be included. If the field is omitted, the report will include usage from the parent account and all subaccounts, if they exist. **Note:** If the field has a value in the config and needs to be removed, the field has to be an empty array in the config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A single label and value pair specifying that usage from only this set of labeled resources should be included in the budget.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `calendar_period`
- Description: (Optional) A CalendarPeriod represents the abstract concept of a recurring time period that has a canonical start. Grammatically, "the start of the current CalendarPeriod". All calendar times begin at 12 AM US and Canadian Pacific Time (UTC-8). Exactly one of `calendar_period`, `custom_period` must be provided. Possible values are: `MONTH`, `QUARTER`, `YEAR`, `CALENDAR_PERIOD_UNSPECIFIED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_period`
- Description: (Optional) Specifies to track usage from any start date (required) to any end date (optional). This time period is static, it does not recur. Exactly one of `calendar_period`, `custom_period` must be provided. Structure is [documented below](#nested_budget_filter_custom_period). <a name="nested_budget_filter_custom_period"></a>The `custom_period` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_date`
- Description: (Required) A start date is required. The start date must be after January 1, 2017. Structure is [documented below](#nested_budget_filter_custom_period_start_date).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_date`
- Description: (Optional) Optional. The end date of the time period. Budgets with elapsed end date won't be processed. If unset, specifies to track all usage incurred since the startDate. Structure is [documented below](#nested_budget_filter_custom_period_end_date). <a name="nested_budget_filter_custom_period_start_date"></a>The `start_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Required) Year of the date. Must be from 1 to 9999.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Required) Month of a year. Must be from 1 to 12.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) Day of a month. Must be from 1 to 31 and valid for the year and month. <a name="nested_budget_filter_custom_period_end_date"></a>The `end_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Required) Year of the date. Must be from 1 to 9999.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Required) Month of a year. Must be from 1 to 12.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) Day of a month. Must be from 1 to 31 and valid for the year and month. <a name="nested_threshold_rules"></a>The `threshold_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threshold_percent`
- Description: (Required) Send an alert when this threshold is exceeded. This is a 1.0-based percentage, so 0.5 = 50%. Must be >= 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spend_basis`
- Description: (Optional) The type of basis used to determine if spend has passed the threshold. Default value is `CURRENT_SPEND`. Possible values are: `CURRENT_SPEND`, `FORECASTED_SPEND`. <a name="nested_all_updates_rule"></a>The `all_updates_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_topic`
- Description: (Optional) The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form projects/{project_id}/topics/{topic_id}. Updates are sent at regular intervals to the topic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_version`
- Description: (Optional) The schema version of the notification. Only "1.0" is accepted. It represents the JSON schema as defined in https://cloud.google.com/billing/docs/how-to/budgets#notification_format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitoring_notification_channels`
- Description: (Optional) The full resource name of a monitoring notification channel in the form projects/{project_id}/notificationChannels/{channel_id}. A maximum of 5 channels are allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_default_iam_recipients`
- Description: (Optional) Boolean. When set to true, disables default notifications sent when a threshold is exceeded. Default recipients are those with Billing Account Administrators and Billing Account Users IAM roles for the target account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_project_level_recipients`
- Description: (Optional) When set to true, and when the budget has a single project configured, notifications will be sent to project level recipients of that project. This field will be ignored if the budget has multiple or no project configured. Currently, project level recipients are the users with Owner role on a cloud project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
