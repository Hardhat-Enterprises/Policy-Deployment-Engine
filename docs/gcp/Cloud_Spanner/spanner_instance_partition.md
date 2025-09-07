## 🛡️ Policy Deployment Engine: `spanner_instance_partition`

This section provides a concise policy evaluation for the `spanner_instance_partition` resource in GCP.

Reference: [Terraform Registry – spanner_instance_partition](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance_partition)

---

## 1. Argument Reference

### `name`
- Description: (Required) A unique identifier for the instance partition, which cannot be changed after the instance partition is created. The name must be between 2 and 64 characters and match the regular expression [a-z][a-z0-9\\-]{0,61}[a-z0-9].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) The descriptive name for this instance partition as it appears in UIs. Must be unique per project and between 4 and 30 characters in length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Required) The name of the instance partition's configuration (similar to a region) which defines the geographic placement and replication of data in this instance partition.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The instance to create the instance partition in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_count`
- Description: (Optional) The number of nodes allocated to this instance partition. One node equals 1000 processing units. Exactly one of either node_count or processing_units must be present.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `processing_units`
- Description: (Optional) The number of processing units allocated to this instance partition. Exactly one of either node_count or processing_units must be present.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
