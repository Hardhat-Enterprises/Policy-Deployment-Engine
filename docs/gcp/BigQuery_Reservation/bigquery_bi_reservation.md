## 🛡️ Policy Deployment Engine: `bigquery_bi_reservation`

This section provides a concise policy evaluation for the `bigquery_bi_reservation` resource in GCP.

Reference: [Terraform Registry – bigquery_bi_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_bi_reservation)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | LOCATION_DESCRIPTION | true | None | None |
| `size` | Size of a reservation, in bytes. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### preferred_tables Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The assigned project ID of the project. | false | None | None |
| `dataset_id` | The ID of the dataset in the above project. | false | None | None |
| `table_id` | The ID of the table in the above dataset. | false | None | None |
