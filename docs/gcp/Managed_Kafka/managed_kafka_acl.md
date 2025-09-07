## 🛡️ Policy Deployment Engine: `managed_kafka_acl`

This section provides a concise policy evaluation for the `managed_kafka_acl` resource in GCP.

Reference: [Terraform Registry – managed_kafka_acl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_acl)

---

## 1. Argument Reference

### `acl_entries`
- Description: (Required) The acl entries that apply to the resource pattern. The maximum number of allowed entries is 100. Structure is [documented below](#nested_acl_entries).
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

### `acl_id`
- Description: (Required) The ID to use for the acl, which will become the final component of the acl's name. The structure of `aclId` defines the Resource Pattern (resource_type, resource_name, pattern_type) of the acl. `aclId` is structured like one of the following: For acls on the cluster: `cluster` For acls on a single resource within the cluster: `topic/{resource_name}` `consumerGroup/{resource_name}` `transactionalId/{resource_name}` For acls on all resources that match a prefix: `topicPrefixed/{resource_name}` `consumerGroupPrefixed/{resource_name}` `transactionalIdPrefixed/{resource_name}` For acls on all resources of a given type (i.e. the wildcard literal '*''): `allTopics` (represents `topic/*`) `allConsumerGroups` (represents `consumerGroup/*`) `allTransactionalIds` (represents `transactionalId/*`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_acl_entries"></a>The `acl_entries` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `principal`
- Description: (Required) The principal. Specified as Google Cloud account, with the Kafka StandardAuthorizer prefix User:". For example: "User:test-kafka-client@test-project.iam.gserviceaccount.com". Can be the wildcard "User:*" to refer to all users.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permission_type`
- Description: (Optional) The permission type. Accepted values are (case insensitive): ALLOW, DENY.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operation`
- Description: (Required) The operation type. Allowed values are (case insensitive): ALL, READ, WRITE, CREATE, DELETE, ALTER, DESCRIBE, CLUSTER_ACTION, DESCRIBE_CONFIGS, ALTER_CONFIGS, and IDEMPOTENT_WRITE. See https://kafka.apache.org/documentation/#operations_resources_and_protocols for valid combinations of resource_type and operation for different Kafka API requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) The host. Must be set to "*" for Managed Service for Apache Kafka.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
