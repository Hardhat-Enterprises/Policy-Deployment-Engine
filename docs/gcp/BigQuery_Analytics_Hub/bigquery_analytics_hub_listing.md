## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_listing`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_listing` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_listing](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_listing)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_exchange_id` | The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | None | None |
| `listing_id` | The ID of the listing. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | None | None |
| `location` | The name of the location this data exchange listing. | true | None | None |
| `display_name` | Human-readable display name of the listing. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), ampersands (&) and can't start or end with spaces. | true | None | None |
| `description` | Short description of the listing. The description must not contain Unicode non-characters and C0 and C1 control codes except tabs (HT), new lines (LF), carriage returns (CR), and page breaks (FF). | false | None | None |
| `primary_contact` | Email or URL of the primary point of contact of the listing. | false | None | None |
| `documentation` | Documentation describing the listing. | false | None | None |
| `icon` | Base64 encoded image representing the listing. | false | None | None |
| `request_access` | Email or URL of the request access of the listing. Subscribers can use this reference to request access. | false | None | None |
| `categories` | Categories of the listing. Up to two categories are allowed. | false | None | None |
| `log_linked_dataset_query_user_email` | If true, subscriber email logging is enabled and all queries on the linked dataset will log the email address of the querying user. Once enabled, this setting cannot be turned off. | false | None | None |
| `discovery_type` | Specifies the type of discovery on the discovery page. Cannot be set for a restricted listing. Note that this does not control the visibility of the exchange/listing which is defined by IAM permission. Possible values are: `DISCOVERY_TYPE_PRIVATE`, `DISCOVERY_TYPE_PUBLIC`. | false | None | None |
| `allow_only_metadata_sharing` | If true, the listing is only available to get the resource metadata. Listing is non subscribable. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `delete_commercial` |  | none | None | None |

### data_provider Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the data provider. | true | None | None |
| `primary_contact` | Email or URL of the data provider. | false | None | None |

### publisher Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the listing publisher. | true | None | None |
| `primary_contact` | Email or URL of the listing publisher. | false | None | None |

### bigquery_dataset Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataset` | Resource name of the dataset source for this listing. e.g. projects/myproject/datasets/123 | true | None | None |
| `selected_resources` | Resource in this dataset that is selectively shared. This field is required for data clean room exchanges. Structure is [documented below](#nested_bigquery_dataset_selected_resources). | false | None | None |

### pubsub_topic Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `topic` | Resource name of the Pub/Sub topic source for this listing. e.g. projects/myproject/topics/topicId | true | None | None |
| `data_affinity_regions` | Region hint on where the data might be published. Data affinity regions are modifiable. See https://cloud.google.com/about/locations for full listing of possible Cloud regions. | false | None | None |

### restricted_export_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | If true, enable restricted export. | false | None | None |
| `restrict_direct_table_access` | (Output) If true, restrict direct table access(read api/tabledata.list) on linked table. | none | None | None |
| `restrict_query_result` | If true, restrict export of query result derived from restricted linked dataset table. | false | None | None |

### selected_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` | Format: For table: projects/{projectId}/datasets/{datasetId}/tables/{tableId} Example:"projects/test_project/datasets/test_dataset/tables/test_table" | false | None | None |
| `routine` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Format: For routine: projects/{projectId}/datasets/{datasetId}/routines/{routineId} Example:"projects/test_project/datasets/test_dataset/routines/test_routine" | false | None | None |
