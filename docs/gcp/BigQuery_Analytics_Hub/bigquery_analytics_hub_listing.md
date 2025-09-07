## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_listing`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_listing` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_listing](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_listing)

---

## 1. Argument Reference

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
- Description: (Required) The name of the location this data exchange listing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) Human-readable display name of the listing. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), ampersands (&) and can't start or end with spaces.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Short description of the listing. The description must not contain Unicode non-characters and C0 and C1 control codes except tabs (HT), new lines (LF), carriage returns (CR), and page breaks (FF).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_contact`
- Description: (Optional) Email or URL of the primary point of contact of the listing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `documentation`
- Description: (Optional) Documentation describing the listing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `icon`
- Description: (Optional) Base64 encoded image representing the listing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_access`
- Description: (Optional) Email or URL of the request access of the listing. Subscribers can use this reference to request access.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_provider`
- Description: (Optional) Details of the data provider who owns the source data. Structure is [documented below](#nested_data_provider).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publisher`
- Description: (Optional) Details of the publisher who owns the listing and who can share the source data. Structure is [documented below](#nested_publisher).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `categories`
- Description: (Optional) Categories of the listing. Up to two categories are allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bigquery_dataset`
- Description: (Optional) Shared dataset i.e. BigQuery dataset source. Structure is [documented below](#nested_bigquery_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_topic`
- Description: (Optional) Pub/Sub topic source. Structure is [documented below](#nested_pubsub_topic).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restricted_export_config`
- Description: (Optional) If set, restricted export configuration will be propagated and enforced on the linked dataset. Structure is [documented below](#nested_restricted_export_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_linked_dataset_query_user_email`
- Description: (Optional) If true, subscriber email logging is enabled and all queries on the linked dataset will log the email address of the querying user. Once enabled, this setting cannot be turned off.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `discovery_type`
- Description: (Optional) Specifies the type of discovery on the discovery page. Cannot be set for a restricted listing. Note that this does not control the visibility of the exchange/listing which is defined by IAM permission. Possible values are: `DISCOVERY_TYPE_PRIVATE`, `DISCOVERY_TYPE_PUBLIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_only_metadata_sharing`
- Description: (Optional) If true, the listing is only available to get the resource metadata. Listing is non subscribable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_commercial`
- Description: <a name="nested_data_provider"></a>The `data_provider` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the data provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_contact`
- Description: (Optional) Email or URL of the data provider. <a name="nested_publisher"></a>The `publisher` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the listing publisher.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_contact`
- Description: (Optional) Email or URL of the listing publisher. <a name="nested_bigquery_dataset"></a>The `bigquery_dataset` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Required) Resource name of the dataset source for this listing. e.g. projects/myproject/datasets/123
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selected_resources`
- Description: (Optional) Resource in this dataset that is selectively shared. This field is required for data clean room exchanges. Structure is [documented below](#nested_bigquery_dataset_selected_resources). <a name="nested_bigquery_dataset_selected_resources"></a>The `selected_resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Optional) Format: For table: projects/{projectId}/datasets/{datasetId}/tables/{tableId} Example:"projects/test_project/datasets/test_dataset/tables/test_table"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routine`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Format: For routine: projects/{projectId}/datasets/{datasetId}/routines/{routineId} Example:"projects/test_project/datasets/test_dataset/routines/test_routine" <a name="nested_pubsub_topic"></a>The `pubsub_topic` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Required) Resource name of the Pub/Sub topic source for this listing. e.g. projects/myproject/topics/topicId
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_affinity_regions`
- Description: (Optional) Region hint on where the data might be published. Data affinity regions are modifiable. See https://cloud.google.com/about/locations for full listing of possible Cloud regions. <a name="nested_restricted_export_config"></a>The `restricted_export_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) If true, enable restricted export.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restrict_direct_table_access`
- Description: (Output) If true, restrict direct table access(read api/tabledata.list) on linked table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restrict_query_result`
- Description: (Optional) If true, restrict export of query result derived from restricted linked dataset table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
