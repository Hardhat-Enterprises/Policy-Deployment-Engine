## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_listing_subscription`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_listing_subscription` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_listing_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_listing_subscription)

---

## 1. Argument Reference

### `destination_dataset`
- Description: (Required) The destination dataset for this subscription. Structure is [documented below](#nested_destination_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_exchange_id`
- Description: (Required) The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `listing_id`
- Description: (Required) The ID of the listing. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The name of the location of the data exchange. Distinct from the location of the destination data set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_destination_dataset"></a>The `destination_dataset` block supports:
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
