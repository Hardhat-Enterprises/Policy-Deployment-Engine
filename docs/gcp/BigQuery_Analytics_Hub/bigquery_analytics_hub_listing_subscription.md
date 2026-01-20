## 🛡️ Policy Deployment Engine: `bigquery_analytics_hub_listing_subscription`

This section provides a concise policy evaluation for the `bigquery_analytics_hub_listing_subscription` resource in GCP.

Reference: [Terraform Registry – bigquery_analytics_hub_listing_subscription](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_analytics_hub_listing_subscription)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `destination_dataset` | The destination dataset for this subscription. Structure is [documented below](#nested_destination_dataset). | true | false | This policy requires a non-empty destination_dataset.labels.environment value so subscriptions are consistently tagged for governance and operational controls (e.g., separating dev/test/prod and applying the right guardrails). | destination_dataset { labels = { environment = "dev" } } (or "test", "stage", "prod"). The environment label exists and is not an empty string. | destination_dataset.labels.environment is missing, null, or set to an empty string (""), which breaks environment classification and governance. |
| `data_exchange_id` | The ID of the data exchange. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | false | None | None | None |
| `listing_id` | The ID of the listing. Must contain only Unicode letters, numbers (0-9), underscores (_). Should not use characters that require URL-escaping, or characters outside of ASCII, spaces. | true | false | None | None | None |
| `location` | The name of the location of the data exchange. Distinct from the location of the destination data set. | true | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `dataset_reference` |  | false | false | None | None | None |

### destination_dataset Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The geographic location where the dataset should reside. See https://cloud.google.com/bigquery/docs/locations for supported locations. | true | false | None | None | None |
| `dataset_reference` | A reference that identifies the destination dataset. Structure is [documented below](#nested_destination_dataset_dataset_reference). | true | false | None | None | None |
| `friendly_name` | A descriptive name for the dataset. | false | false | None | None | None |
| `description` | A user-friendly description of the dataset. | false | false | None | None | None |
| `labels` | The labels associated with this dataset. You can use these to organize and group your datasets. | false | false | This policy enforces the presence of a non-empty 'environment' label under destination_dataset.labels to ensure consistent environment tagging (dev/test/stage/prod) for governance and operational controls. | labels = { environment = "prod" } (or dev/test/stage). The key exists and the value is not empty. | labels missing entirely, environment key missing, environment is null, or environment is an empty string "". |

### dataset_reference Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. | true | false | None | None | None |
| `project_id` | The ID of the project containing this dataset. | true | false | None | None | None |
