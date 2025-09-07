## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_data_exchange`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_data_exchange` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_data_exchange](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_data_exchange)

---

## 1. Argument Reference

### `data_exchange_id`
- Description: (Required) The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The name of the location this data exchange.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Human-readable display name of the data exchange. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), and must not start or end with spaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the data exchange.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_contact`
- Description: (Optional) Email or URL of the primary point of contact of the data exchange.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `documentation`
- Description: (Optional) Documentation describing the data exchange.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `icon`
- Description: (Optional) Base64 encoded image representing the data exchange.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sharing_environment_config`
- Description: (Optional) Configurable data sharing environment option for a data exchange. This field is required for data clean room exchanges. Structure is [documented below](#nested_sharing_environment_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `discovery_type`
- Description: (Optional) Type of discovery on the discovery page for all the listings under this exchange. Cannot be set for a Data Clean Room. Updating this field also updates (overwrites) the discoveryType field for all the listings under this exchange. Possible values are: `DISCOVERY_TYPE_PRIVATE`, `DISCOVERY_TYPE_PUBLIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_linked_dataset_query_user_email`
- Description: (Optional) If true, subscriber email logging is enabled and all queries on the linked dataset will log the email address of the querying user. Once enabled, this setting cannot be turned off.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_sharing_environment_config"></a>The `sharing_environment_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_exchange_config`
- Description: (Optional) Default Analytics Hub data exchange, used for secured data sharing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dcr_exchange_config`
- Description: (Optional) Data Clean Room (DCR), used for privacy-safe and secured data sharing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
