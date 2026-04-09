## 🛡️ Policy Deployment Engine: `managed_kafka_topic`

This section provides a concise policy evaluation for the `managed_kafka_topic` resource in GCP.

Reference: [Terraform Registry – managed_kafka_topic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_topic)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `replication_factor` | The number of replicas of each partition. A replication factor of 3 is recommended for high availability. | true | true | Ensures data availability and fault tolerance. Lower replication factors increase the risk of data loss during failures. | ['replication_factor: 3 or more'] | ['replication_factor: 1'] |
| `location` | ID of the location of the Kafka resource. | true | false | Specifies region; no direct impact on confidentiality or access control. |   none | none |
| `cluster` | The cluster name. | true | false | Reference value used for association; not a security configuration. |   none |   none |
| `topic_id` | The ID to use for the topic. Structured like: `my-topic-name`. | true | false | Used for naming the topic; does not affect access or data protection directly. |   none | none |
| `partition_count` | The number of partitions in a topic. Increasing may impact message distribution. | false | false | Affects performance and scalability, not security posture. | none | none |
| `configs` | Configurations for the topic that override cluster defaults. Example: `cleanup.policy=compact`. | false | true | Certain configs (e.g., `retention.ms`, `cleanup.policy`, `compression.type`) may leak data or allow unbounded data growth if misconfigured. | ['`cleanup.policy=compact` for compaction-enabled use cases', '`retention.ms` set according to data retention policies'] | ['`cleanup.policy=delete` with unlimited retention', 'no compression for high-throughput sensitive data'] |
| `project` | If it is not provided, the provider project is used. | false | false | Used for scoping; no impact on access control or encryption. | none | none |
