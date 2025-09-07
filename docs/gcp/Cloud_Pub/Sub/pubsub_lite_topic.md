## 🛡️ Policy Deployment Engine: `pubsub_lite_topic`

This section provides a concise policy evaluation for the `pubsub_lite_topic` resource in GCP.

Reference: [Terraform Registry – pubsub_lite_topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_lite_topic)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the topic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partition_config`
- Description: (Optional) The settings for this topic's partitions. Structure is [documented below](#nested_partition_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_config`
- Description: (Optional) The settings for a topic's message retention. Structure is [documented below](#nested_retention_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_config`
- Description: (Optional) The settings for this topic's Reservation usage. Structure is [documented below](#nested_reservation_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the pubsub lite topic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The zone of the pubsub lite topic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_partition_config"></a>The `partition_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `count`
- Description: (Required) The number of partitions in the topic. Must be at least 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity`
- Description: (Optional) The capacity configuration. Structure is [documented below](#nested_partition_config_capacity). <a name="nested_partition_config_capacity"></a>The `capacity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publish_mib_per_sec`
- Description: (Required) Subscribe throughput capacity per partition in MiB/s. Must be >= 4 and <= 16.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subscribe_mib_per_sec`
- Description: (Required) Publish throughput capacity per partition in MiB/s. Must be >= 4 and <= 16. <a name="nested_retention_config"></a>The `retention_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `per_partition_bytes`
- Description: (Required) The provisioned storage, in bytes, per partition. If the number of bytes stored in any of the topic's partitions grows beyond this value, older messages will be dropped to make room for newer ones, regardless of the value of period.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `period`
- Description: (Optional) How long a published message is retained. If unset, messages will be retained as long as the bytes retained for each partition is below perPartitionBytes. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". <a name="nested_reservation_config"></a>The `reservation_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `throughput_reservation`
- Description: (Optional) The Reservation to use for this topic's throughput capacity.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
