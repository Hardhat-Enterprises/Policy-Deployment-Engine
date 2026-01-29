## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_data_exchange`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_data_exchange` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_data_exchange](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_data_exchange)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_exchange_id` | The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | false | None | None | None |
| `location` | The name of the location this data exchange. | true | true | This policy restricts Analytics Hub data exchanges to approved regions to meet data residency and governance requirements. Deploying a data exchange in an unapproved location may violate regulatory, contractual, or internal policy constraints. | Set location to an approved region, for example: australia-southeast1. | Any location value outside the approved list (for example, us-central1) is non-compliant. |
| `display_name` | Human-readable display name of the data exchange. The display name must contain only Unicode letters, numbers (0-9), underscores (_), dashes (-), spaces ( ), and must not start or end with spaces. | true | false | None | None | None |
| `description` | Description of the data exchange. | false | false | None | None | None |
| `primary_contact` | Email or URL of the primary point of contact of the data exchange. | false | false | None | None | None |
| `documentation` | Documentation describing the data exchange. | false | false | None | None | None |
| `icon` | Base64 encoded image representing the data exchange. | false | false | None | None | None |
| `sharing_environment_config` | Configurable data sharing environment option for a data exchange. This field is required for data clean room exchanges. Structure is [documented below](#nested_sharing_environment_config). | false | false | None | None | None |
| `discovery_type` | Type of discovery on the discovery page for all the listings under this exchange. Cannot be set for a Data Clean Room. Updating this field also updates (overwrites) the discoveryType field for all the listings under this exchange. Possible values are: `DISCOVERY_TYPE_PRIVATE`, `DISCOVERY_TYPE_PUBLIC`. | false | true | This policy enforces an approved discovery_type for Analytics Hub data exchanges. Using a public discovery type can increase visibility and the risk of unintended exposure. The approved setting restricts discovery behavior to align with governance requirements. | Set discovery_type to DISCOVERY_TYPE_PRIVATE. If the exchange is a Data Clean Room (sharing_environment_config.dcr_exchange_config), do not set discovery_type. | Setting discovery_type to DISCOVERY_TYPE_PUBLIC (or any value not explicitly approved) is non-compliant. |
| `log_linked_dataset_query_user_email` | If true, subscriber email logging is enabled and all queries on the linked dataset will log the email address of the querying user. Once enabled, this setting cannot be turned off. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### sharing_environment_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `default_exchange_config` | Default Analytics Hub data exchange, used for secured data sharing. | false | false | None | None | None |
| `dcr_exchange_config` | Data Clean Room (DCR), used for privacy-safe and secured data sharing. | false | false | None | None | None |
