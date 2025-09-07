## 🛡️ Policy Deployment Engine: `bigquery_reservation`

This section provides a concise policy evaluation for the `bigquery_reservation` resource in GCP.

Reference: [Terraform Registry – bigquery_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_reservation)

---

## 1. Argument Reference

### `slot_capacity`
- Description: (Required) Minimum slots available to this reservation. A slot is a unit of computational power in BigQuery, and serves as the unit of parallelism. Queries using this reservation might use more slots during runtime if ignoreIdleSlots is set to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the reservation. This field must only contain alphanumeric characters or dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_idle_slots`
- Description: (Optional) If false, any query using this reservation will use idle slots from other reservations within the same admin project. If true, a query using this reservation will execute with the slot capacity specified above at most.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `concurrency`
- Description: (Optional) Maximum number of queries that are allowed to run concurrently in this reservation. This is a soft limit due to asynchronous nature of the system and various optimizations for small queries. Default value is 0 which means that concurrency will be automatically set based on the reservation size.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edition`
- Description: (Optional) The edition type. Valid values are STANDARD, ENTERPRISE, ENTERPRISE_PLUS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscale`
- Description: (Optional) The configuration parameters for the auto scaling feature. Structure is [documented below](#nested_autoscale).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_location`
- Description: (Optional) The current location of the reservation's secondary replica. This field is only set for reservations using the managed disaster recovery feature. Users can set this in create reservation calls to create a failover reservation or in update reservation calls to convert a non-failover reservation to a failover reservation(or vice versa).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The geographic location where the transfer config should reside. Examples: US, EU, asia-northeast1. The default value is US.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_autoscale"></a>The `autoscale` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `current_slots`
- Description: (Output) The slot capacity added to this reservation when autoscale happens. Will be between [0, max_slots].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_slots`
- Description: (Optional) Number of slots to be scaled when needed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
