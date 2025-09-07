## 🛡️ Policy Deployment Engine: `managed_kafka_topic`

This section provides a concise policy evaluation for the `managed_kafka_topic` resource in GCP.

Reference: [Terraform Registry – managed_kafka_topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_topic)

---

## 1. Argument Reference

### `replication_factor`
- Description: (Required) The number of replicas of each partition. A replication factor of 3 is recommended for high availability.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) ID of the location of the Kafka resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) The cluster name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic_id`
- Description: (Required) The ID to use for the topic, which will become the final component of the topic's name. This value is structured like: `my-topic-name`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partition_count`
- Description: (Optional) The number of partitions in a topic. You can increase the partition count for a topic, but you cannot decrease it. Increasing partitions for a topic that uses a key might change how messages are distributed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `configs`
- Description: (Optional) Configuration for the topic that are overridden from the cluster defaults. The key of the map is a Kafka topic property name, for example: `cleanup.policy=compact`, `compression.type=producer`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
