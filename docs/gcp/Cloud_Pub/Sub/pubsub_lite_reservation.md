## 🛡️ Policy Deployment Engine: `pubsub_lite_reservation`

This section provides a concise policy evaluation for the `pubsub_lite_reservation` resource in GCP.

Reference: [Terraform Registry – pubsub_lite_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_lite_reservation)

---

## 1. Argument Reference

### `throughput_capacity`
- Description: (Required) The reserved throughput capacity. Every unit of throughput capacity is equivalent to 1 MiB/s of published messages or 2 MiB/s of subscribed messages.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the reservation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the pubsub lite reservation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
