## 🛡️ Policy Deployment Engine: `managed_kafka_acl`

This section provides a concise policy evaluation for the `managed_kafka_acl` resource in GCP.

Reference: [Terraform Registry – managed_kafka_acl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_acl)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | ID of the location of the Kafka resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations. | true | None | None |
| `cluster` | The cluster name. | true | None | None |
| `acl_id` | The ID to use for the acl, which will become the final component of the acl's name. The structure of `aclId` defines the Resource Pattern (resource_type, resource_name, pattern_type) of the acl. `aclId` is structured like one of the following: For acls on the cluster: `cluster` For acls on a single resource within the cluster: `topic/{resource_name}` `consumerGroup/{resource_name}` `transactionalId/{resource_name}` For acls on all resources that match a prefix: `topicPrefixed/{resource_name}` `consumerGroupPrefixed/{resource_name}` `transactionalIdPrefixed/{resource_name}` For acls on all resources of a given type (i.e. the wildcard literal '*''): `allTopics` (represents `topic/*`) `allConsumerGroups` (represents `consumerGroup/*`) `allTransactionalIds` (represents `transactionalId/*`). | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### acl_entries Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `principal` | The principal. Specified as Google Cloud account, with the Kafka StandardAuthorizer prefix User:". For example: "User:test-kafka-client@test-project.iam.gserviceaccount.com". Can be the wildcard "User:*" to refer to all users. | true | None | None |
| `permission_type` | The permission type. Accepted values are (case insensitive): ALLOW, DENY. | false | None | None |
| `operation` | The operation type. Allowed values are (case insensitive): ALL, READ, WRITE, CREATE, DELETE, ALTER, DESCRIBE, CLUSTER_ACTION, DESCRIBE_CONFIGS, ALTER_CONFIGS, and IDEMPOTENT_WRITE. See https://kafka.apache.org/documentation/#operations_resources_and_protocols for valid combinations of resource_type and operation for different Kafka API requests. | true | None | None |
| `host` | The host. Must be set to "*" for Managed Service for Apache Kafka. | false | None | None |
