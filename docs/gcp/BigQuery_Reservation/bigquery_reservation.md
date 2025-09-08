## 🛡️ Policy Deployment Engine: `bigquery_reservation`

This section provides a concise policy evaluation for the `bigquery_reservation` resource in GCP.

Reference: [Terraform Registry – bigquery_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_reservation)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `slot_capacity` | Minimum slots available to this reservation. A slot is a unit of computational power in BigQuery, and serves as the unit of parallelism. Queries using this reservation might use more slots during runtime if ignoreIdleSlots is set to false. | true | None | None |
| `name` | The name of the reservation. This field must only contain alphanumeric characters or dash. | true | None | None |
| `ignore_idle_slots` | If false, any query using this reservation will use idle slots from other reservations within the same admin project. If true, a query using this reservation will execute with the slot capacity specified above at most. | false | None | None |
| `concurrency` | Maximum number of queries that are allowed to run concurrently in this reservation. This is a soft limit due to asynchronous nature of the system and various optimizations for small queries. Default value is 0 which means that concurrency will be automatically set based on the reservation size. | false | None | None |
| `edition` | The edition type. Valid values are STANDARD, ENTERPRISE, ENTERPRISE_PLUS | false | None | None |
| `secondary_location` | The current location of the reservation's secondary replica. This field is only set for reservations using the managed disaster recovery feature. Users can set this in create reservation calls to create a failover reservation or in update reservation calls to convert a non-failover reservation to a failover reservation(or vice versa). | false | None | None |
| `location` | The geographic location where the transfer config should reside. Examples: US, EU, asia-northeast1. The default value is US. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### autoscale Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `current_slots` | (Output) The slot capacity added to this reservation when autoscale happens. Will be between [0, max_slots]. | none | None | None |
| `max_slots` | Number of slots to be scaled when needed. | false | None | None |
