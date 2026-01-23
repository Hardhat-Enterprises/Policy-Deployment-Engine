## 🛡️ Policy Deployment Engine: `bigquery_reservation`

This section provides a concise policy evaluation for the `bigquery_reservation` resource in GCP.

Reference: [Terraform Registry – bigquery_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_reservation)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `slot_capacity` | The minimum number of slots available for this reservation. | true | true | Slot capacity needs to be set to a value greater than 0 so the reservation is valid and has a baseline capacity. | 100 | 0 |
| `name` | The name of the reservation. This must only contain letters, numbers, or dashes. | true | false | None | None | None |
| `ignore_idle_slots` | If set to true, this reservation will only use its own slots (it won’t take idle slots from other reservations). | false | true | We set ignore_idle_slots to true so this reservation doesn’t use spare slots from other reservations, which helps keep things separated and controlled. | true | false |
| `concurrency` | The maximum number of queries that can run at the same time in this reservation. | false | true | Concurrency needs to stay within the approved range to prevent too many queries running at once. | 100 | 200 |
| `edition` | The edition type for the reservation (STANDARD, ENTERPRISE, ENTERPRISE_PLUS). | false | true | Edition must be set to an approved value to match the required BigQuery reservation standard. | ENTERPRISE | STANDARD |
| `autoscale` | Settings for auto scaling. This lets BigQuery increase slots when needed. | false | false | None | None | None |
| `secondary_location` | The secondary location used for disaster recovery (if enabled). | false | false | None | None | None |
| `location` | The location/region where the reservation is created. | false | true | Location must be set to an approved region to meet data residency and compliance requirements. | us-central1 | us-west2 |
| `project` | If not provided, the provider project is used. | false | false | None | None | None |

### autoscale Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `current_slots` | (Output) The number of extra slots added when autoscale happens. | false | false | None | None | None |
| `max_slots` | The maximum number of slots autoscale can add. | false | true | Max slots must stay within the approved limit so autoscaling doesn’t go too high. | 1000 | 5000 |
