## 🛡️ Policy Deployment Engine: `bigquery_bi_reservation`

This section provides a concise policy evaluation for the `bigquery_bi_reservation` resource in GCP.

Reference: [Terraform Registry – bigquery_bi_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_bi_reservation)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The geographic location where the BigQuery BI Reservation is created. | true | true | Location must be restricted to approved regions to support data residency and compliance requirements. | us-central1 | us-west2 |
| `size` | Size of a reservation, in bytes. | false | false | None | None | None |
| `preferred_tables` | Preferred tables to use BI capacity for. Structure is documented below. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### preferred_tables Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The assigned project ID of the project. | false | false | None | None | None |
| `dataset_id` | The ID of the dataset in the above project. | false | false | None | None | None |
| `table_id` | The ID of the table in the above dataset. | false | false | None | None | None |
