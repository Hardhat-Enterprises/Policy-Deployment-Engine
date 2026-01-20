## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_data_exchange_subscription`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_data_exchange_subscription` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_data_exchange_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_data_exchange_subscription)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_exchange_id` | The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | false | None | None | None |
| `data_exchange_project` | The ID of the Google Cloud project where the Data Exchange is located. | true | false | None | None | None |
| `data_exchange_location` | The name of the location of the Data Exchange. | true | false | None | None | None |
| `location` | The geographic location where the Subscription (and its linked dataset) should reside. This is the subscriber's desired location for the created resources. See https://cloud.google.com/bigquery/docs/locations for supported locations. | true | false | None | None | None |
| `subscription_id` | Name of the subscription to create. | true | false | None | None | None |
| `subscriber_contact` | Email of the subscriber. | false | false | None | None | None |
| `destination_dataset` | BigQuery destination dataset to create for the subscriber. Structure is [documented below](#nested_destination_dataset). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `refresh_policy` | * `ON_READ`: Default value if not specified. The subscription will be refreshed every time Terraform performs a read operation (e.g., `terraform plan`, `terraform apply`, `terraform refresh`). This ensures the state is always up-to-date. * `ON_STALE`: The subscription will only be refreshed when its reported `state` (an output-only field from the API) is `STATE_STALE` during a Terraform read operation. * `NEVER`: The provider will not automatically refresh the subscription. | false | false | This policy blocks refresh_policy=NEVER to ensure Terraform continues to refresh the Analytics Hub subscription state (ON_READ by default, or ON_STALE). Regular refresh reduces the chance of undetected drift or stale state during plan/apply workflows. | Do not set refresh_policy (defaults to ON_READ), or explicitly set refresh_policy to ON_READ or ON_STALE. | Setting refresh_policy to NEVER is non-compliant because it disables automatic refresh during Terraform read operations. |
| `dataset_reference` |  | false | false | None | None | None |

### destination_dataset Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The geographic location where the dataset should reside. See https://cloud.google.com/bigquery/docs/locations for supported locations. | true | false | None | None | None |
| `dataset_reference` | A reference that identifies the destination dataset. Structure is [documented below](#nested_destination_dataset_dataset_reference). | true | false | None | None | None |
| `friendly_name` | A descriptive name for the dataset. | false | false | None | None | None |
| `description` | A user-friendly description of the dataset. | false | false | None | None | None |
| `labels` | The labels associated with this dataset. You can use these to organize and group your datasets. | false | false | None | None | None |

### dataset_reference Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. | true | false | None | None | None |
| `project_id` | The ID of the project containing this dataset. | true | false | None | None | None |
