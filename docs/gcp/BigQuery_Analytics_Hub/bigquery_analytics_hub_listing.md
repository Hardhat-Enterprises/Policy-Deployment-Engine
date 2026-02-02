## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_listing`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_listing` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_listing](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_listing)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_exchange_id` | The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | false | None | None | None |
| `listing_id` | The ID of the listing. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | false | None | None | None |
| `location` | The name of the location this data exchange listing. | true | false | None | None | None |
| `display_name` | Human-readable display name of the listing. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), ampersands (&) and can't start or end with spaces. | true | false | None | None | None |
| `description` | Short description of the listing. The description must not contain Unicode non-characters and C0 and C1 control codes except tabs (HT), new lines (LF), carriage returns (CR), and page breaks (FF). | false | false | None | None | None |
| `primary_contact` | Email or URL of the primary point of contact of the listing. | false | false | None | None | None |
| `documentation` | Documentation describing the listing. | false | false | None | None | None |
| `icon` | Base64 encoded image representing the listing. | false | false | None | None | None |
| `request_access` | Email or URL of the request access of the listing. Subscribers can use this reference to request access. | false | false | None | None | None |
| `data_provider` | Details of the data provider who owns the source data. Structure is documented below. | false | false | None | None | None |
| `publisher` | Details of the publisher who owns the listing and who can share the source data. Structure is documented below. | false | false | None | None | None |
| `categories` | Categories of the listing. Up to two categories are allowed. | false | false | None | None | None |
| `bigquery_dataset` | Shared dataset i.e. BigQuery dataset source. Structure is documented below. | false | false | None | None | None |
| `pubsub_topic` | Pub/Sub topic source. Structure is documented below. | false | false | None | None | None |
| `restricted_export_config` | If set, restricted export configuration will be propagated and enforced on the linked dataset. Structure is documented below. | false | true | Restricted export helps prevent uncontrolled export of shared data and reduces risk of data leakage from linked datasets. This policy requires restricted_export_config to be present and enabled to ensure export restrictions are enforced on datasets created from Analytics Hub listings. | Set restricted_export_config and enable it, e.g. restricted_export_config { enabled = true }. Optionally also set restrict_query_result = true if you want to restrict exports derived from query results. | restricted_export_config is missing or restricted_export_config.enabled is false, meaning export restrictions are not enforced for the listing. |
| `log_linked_dataset_query_user_email` | If true, subscriber email logging is enabled and all queries on the linked dataset will log the email address of the querying user. Once enabled, this setting cannot be turned off. | false | false | None | None | None |
| `discovery_type` | Specifies the type of discovery on the discovery page. Cannot be set for a restricted listing. | false | false | None | None | None |
| `allow_only_metadata_sharing` | If true, the listing is only available to get the resource metadata. Listing is non subscribable. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `delete_commercial` |  | false | false | None | None | None |
| `selected_resources` |  | false | false | None | None | None |

### data_provider Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the data provider. | true | false | None | None | None |
| `primary_contact` | Email or URL of the data provider. | false | false | None | None | None |

### publisher Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the listing publisher. | true | false | None | None | None |
| `primary_contact` | Email or URL of the listing publisher. | false | false | None | None | None |

### bigquery_dataset Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset` | Resource name of the dataset source for this listing. e.g. projects/myproject/datasets/123 | true | false | None | None | None |
| `selected_resources` | Resource in this dataset that is selectively shared. This field is required for data clean room exchanges. Structure is documented below. | false | false | None | None | None |

### pubsub_topic Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `topic` | Resource name of the Pub/Sub topic source for this listing. e.g. projects/myproject/topics/topicId | true | false | None | None | None |
| `data_affinity_regions` | Region hint on where the data might be published. | false | false | None | None | None |

### restricted_export_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | If true, enable restricted export. | false | true | If enabled is false (or not set), restricted export protections are not enforced for the listing. This policy requires restricted_export_config.enabled to be true so restricted export is actively enforced for the listing. | restricted_export_config { enabled = true } | restricted_export_config { enabled = false } or missing enabled, resulting in restricted export not being enforced. |
| `restrict_direct_table_access` | (Output) If true, restrict direct table access(read api/tabledata.list) on linked table. | false | false | None | None | None |
| `restrict_query_result` | If true, restrict export of query result derived from restricted linked dataset table. | false | false | None | None | None |

### selected_resources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `table` | Format: For table: projects/{projectId}/datasets/{datasetId}/tables/{tableId} | false | false | None | None | None |
| `routine` | Format: For routine: projects/{projectId}/datasets/{datasetId}/routines/{routineId} | false | false | None | None | None |
