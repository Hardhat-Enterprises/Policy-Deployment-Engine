## 🛡️ Policy Deployment Engine: `bigquery_bi_reservation`

This section provides a concise policy evaluation for the `bigquery_bi_reservation` resource in GCP.

Reference: [Terraform Registry – bigquery_bi_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_bi_reservation)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The geographic location where the BigQuery BI Reservation is created. | true | true | Location must be restricted to approved regions to support data residency and compliance requirements. | us-central1 | us-west2 |
| `size` | Size of a reservation, in bytes. | false | false | This setting only controls the amount of BI capacity available and does not affect access, permissions, or security controls. | 3000000000 | 0 |
| `preferred_tables` | Preferred tables to use BI capacity for. Structure is documented below. | false | false | This setting only determines which tables use BI capacity and does not change who can access the data. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | This just specifies which project the resource belongs to and does not impact security on its own. | my-project-id | None |

### preferred_tables Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project_id` | The assigned project ID of the project. | false | false | This simply identifies the project and does not grant permissions or impact security controls. | my-project-id | None |
| `dataset_id` | The ID of the dataset in the above project. | false | false | This only references the dataset and does not affect access control, encryption, or data exposure. | analytics_dataset | None |
| `table_id` | The ID of the table in the above dataset. | false | false | This only points to a specific table and does not modify permissions or security settings. | sales_table | None |
