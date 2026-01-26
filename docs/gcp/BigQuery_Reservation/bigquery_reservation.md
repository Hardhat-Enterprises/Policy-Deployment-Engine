## 🛡️ Policy Deployment Engine: `bigquery_reservation`

This section provides a concise policy evaluation for the `bigquery_reservation` resource in GCP.

Reference: [Terraform Registry – bigquery_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_reservation)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `slot_capacity` | The minimum number of slots available for this reservation. | true | true | Slot capacity must be set correctly to ensure the reservation is functional and cannot be misconfigured in a way that causes query failures or service disruption (availability risk). | 100 | 0 |
| `name` | The name of the reservation. This must only contain letters, numbers, or dashes. | true | false | This is just the reservation name/identifier and does not affect access, permissions, or security settings. | example-reservation | bad name with spaces |
| `ignore_idle_slots` | If set to true, this reservation will only use its own slots (it won’t take idle slots from other reservations). | false | true | Setting ignore_idle_slots to true helps keep workloads isolated by preventing this reservation from using idle slots from other reservations, reducing cross-team resource abuse and unexpected performance impact. | true | false |
| `concurrency` | The maximum number of queries that can run at the same time in this reservation. | false | true | Concurrency limits help reduce availability risk by preventing too many queries running at once, which can overload capacity and cause performance degradation or denial-of-service style disruption. | 100 | 200 |
| `edition` | The edition type for the reservation (STANDARD, ENTERPRISE, ENTERPRISE_PLUS). | false | true | Edition must be restricted to approved values to align with organisational standards and compliance expectations, ensuring the service is deployed using the required baseline configuration. | ENTERPRISE | STANDARD |
| `autoscale` | Settings for auto scaling. This lets BigQuery increase slots when needed. | false | false | Autoscale is mainly for performance scaling and does not directly change access control or security settings. | None | None |
| `secondary_location` | The secondary location used for disaster recovery (if enabled). | false | false | This is only used for disaster recovery configuration and does not control access or permissions. | None | None |
| `location` | The location/region where the reservation is created. | false | true | Location must be restricted to approved regions to meet data residency, compliance requirements, and reduce risk of storing or processing data in an unapproved region. | us-central1 | us-west2 |
| `project` | If not provided, the provider project is used. | false | false | This only tells Terraform what project to create it in and does not automatically change security settings. | pde-dummy-project | None |

### autoscale Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `current_slots` | (Output) The number of extra slots added when autoscale happens. | false | false | This is an output value used for reporting and does not change security behaviour. | None | None |
| `max_slots` | The maximum number of slots autoscale can add. | false | true | Max slots must stay within an approved limit to prevent uncontrolled scaling that could lead to resource exhaustion, service disruption, or unexpected cost blowouts (financial abuse risk). | 1000 | 5000 |
