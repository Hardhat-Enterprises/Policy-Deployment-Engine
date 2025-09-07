## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_data_exchange_subscription`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_data_exchange_subscription` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_data_exchange_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_data_exchange_subscription)

---

## 1. Argument Reference

### `data_exchange_id`
- Description: (Required) The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_exchange_project`
- Description: (Required) The ID of the Google Cloud project where the Data Exchange is located.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_exchange_location`
- Description: (Required) The name of the location of the Data Exchange.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The geographic location where the Subscription (and its linked dataset) should reside. This is the subscriber's desired location for the created resources. See https://cloud.google.com/bigquery/docs/locations for supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subscription_id`
- Description: (Required) Name of the subscription to create.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subscriber_contact`
- Description: (Optional) Email of the subscriber.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_dataset`
- Description: (Optional) BigQuery destination dataset to create for the subscriber. Structure is [documented below](#nested_destination_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `refresh_policy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The geographic location where the dataset should reside. See https://cloud.google.com/bigquery/docs/locations for supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_reference`
- Description: (Required) A reference that identifies the destination dataset. Structure is [documented below](#nested_destination_dataset_dataset_reference).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `friendly_name`
- Description: (Optional) A descriptive name for the dataset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A user-friendly description of the dataset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels associated with this dataset. You can use these to organize and group your datasets. <a name="nested_destination_dataset_dataset_reference"></a>The `dataset_reference` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this dataset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
