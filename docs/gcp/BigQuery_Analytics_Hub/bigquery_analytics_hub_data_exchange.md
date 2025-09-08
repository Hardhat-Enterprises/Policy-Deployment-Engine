## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_data_exchange`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_data_exchange` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_data_exchange](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_data_exchange)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_exchange_id` | The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | None | None |
| `location` | The name of the location this data exchange. | true | None | None |
| `display_name` | Human-readable display name of the data exchange. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), and must not start or end with spaces. | true | None | None |
| `description` | Description of the data exchange. | false | None | None |
| `primary_contact` | Email or URL of the primary point of contact of the data exchange. | false | None | None |
| `documentation` | Documentation describing the data exchange. | false | None | None |
| `icon` | Base64 encoded image representing the data exchange. | false | None | None |
| `discovery_type` | Type of discovery on the discovery page for all the listings under this exchange. Cannot be set for a Data Clean Room. Updating this field also updates (overwrites) the discoveryType field for all the listings under this exchange. Possible values are: `DISCOVERY_TYPE_PRIVATE`, `DISCOVERY_TYPE_PUBLIC`. | false | None | None |
| `log_linked_dataset_query_user_email` | If true, subscriber email logging is enabled and all queries on the linked dataset will log the email address of the querying user. Once enabled, this setting cannot be turned off. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### sharing_environment_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `default_exchange_config` | Default Analytics Hub data exchange, used for secured data sharing. | false | None | None |
| `dcr_exchange_config` | Data Clean Room (DCR), used for privacy-safe and secured data sharing. | false | None | None |
