## 🛡️ Policy Deployment Engine: `managed_kafka_acl`

This section provides a concise policy evaluation for the `managed_kafka_acl` resource in GCP.

Reference: [Terraform Registry – managed_kafka_acl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_acl)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `acl_entries` | The acl entries that apply to the resource pattern. The maximum number of allowed entries is 100. Structure is [documented below](#nested_acl_entries). | true | true | ACLs are used to control access to Kafka resources, ensuring that only authorized users can perform specific operations. Properly configured ACLs help maintain the security and integrity of the Kafka environment by preventing unauthorized access and potential data breaches. | ['User:specific-user@project.iam.gserviceaccount.com', 'permission_type: ALLOW', 'operation: READ or WRITE'] | ['User:*', 'permission_type: ALLOW', 'operation: ALL'] |
| `location` | ID of the location of the Kafka resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations. | true | false | Specifies the geographic region; not directly related to access control or data protection. | none | none |
| `cluster` | The cluster name. | true | false | This is a reference to the cluster and does not impact access control itself. | none | none |
| `acl_id` | The ID to use for the acl, which will become the final component of the acl's name. The structure of `aclId` defines the Resource Pattern (resource_type, resource_name, pattern_type) of the acl. `aclId` is structured like one of the following: For acls on the cluster: `cluster` For acls on a single resource within the cluster: `topic/{resource_name}` `consumerGroup/{resource_name}` `transactionalId/{resource_name}` For acls on all resources that match a prefix: `topicPrefixed/{resource_name}` `consumerGroupPrefixed/{resource_name}` `transactionalIdPrefixed/{resource_name}` For acls on all resources of a given type (i.e. the wildcard literal '*''): `allTopics` (represents `topic/*`) `allConsumerGroups` (represents `consumerGroup/*`) `allTransactionalIds` (represents `transactionalId/*`). | true | true | ACL ID defines the resource scope of the ACL. Using global scopes (e.g., allTopics) can expose all resources to the defined principal. | ['topic/my-topic', 'consumerGroup/my-group'] | ['allTopics', 'allConsumerGroups'] |
| `project` | If it is not provided, the provider project is used. | false | false | Project identifier used for resource scoping; does not define security posture of the resource. | none | none |

### acl_entries Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `principal` | The principal. Specified as Google Cloud account, with the Kafka StandardAuthorizer prefix User:". For example: "User:test-kafka-client@test-project.iam.gserviceaccount.com". Can be the wildcard "User:*" to refer to all users. | true | true | Specifying the principal is crucial for defining who has access to Kafka resources. Using specific user accounts enhances security by limiting access to authorized individuals, while using wildcards can expose resources to unauthorized access. | ['User:app-client@project.iam.gserviceaccount.com'] | ['User:*'] |
| `permission_type` | The permission type. Accepted values are (case insensitive): ALLOW, DENY. | false | true | Setting the permission type is essential for controlling access to Kafka resources. Using 'ALLOW' grants specific permissions to users, while 'DENY' can be used to explicitly restrict access. Properly configuring permission types helps enforce security policies and prevent unauthorized actions. | ['DENY (when access should be blocked)', 'ALLOW (on least privilege basis)'] | ['ALLOW to global principals without constraints'] |
| `operation` | The operation type. Allowed values are (case insensitive): ALL, READ, WRITE, CREATE, DELETE, ALTER, DESCRIBE, CLUSTER_ACTION, DESCRIBE_CONFIGS, ALTER_CONFIGS, and IDEMPOTENT_WRITE. See https://kafka.apache.org/documentation/#operations_resources_and_protocols for valid combinations of resource_type and operation for different Kafka API requests. | true | true | Defining the operation type is vital for specifying what actions a principal can perform on Kafka resources. By restricting operations to only those necessary for a user's role, organizations can minimize the risk of accidental or malicious actions that could compromise data integrity or availability. | ['READ', 'WRITE', 'DESCRIBE'] | ['ALL', 'ALTER_CONFIGS'] |
| `host` | The host. Must be set to "*" for Managed Service for Apache Kafka. | false | false | This is fixed for Managed Kafka and does not alter access scope beyond the ACL definition. | none | none |
