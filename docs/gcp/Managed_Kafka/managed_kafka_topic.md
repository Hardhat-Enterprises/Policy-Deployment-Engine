## 🛡️ Policy Deployment Engine: `managed_kafka_topic`

This section provides a concise policy evaluation for the `managed_kafka_topic` resource in GCP.

Reference: [Terraform Registry – managed_kafka_topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_topic)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `replication_factor` | The number of replicas of each partition. A replication factor of 3 is recommended for high availability. | true | None | None |
| `location` | ID of the location of the Kafka resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations. | true | None | None |
| `cluster` | The cluster name. | true | None | None |
| `topic_id` | The ID to use for the topic, which will become the final component of the topic's name. This value is structured like: `my-topic-name`. | true | None | None |
| `partition_count` | The number of partitions in a topic. You can increase the partition count for a topic, but you cannot decrease it. Increasing partitions for a topic that uses a key might change how messages are distributed. | false | None | None |
| `configs` | Configuration for the topic that are overridden from the cluster defaults. The key of the map is a Kafka topic property name, for example: `cleanup.policy=compact`, `compression.type=producer`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
