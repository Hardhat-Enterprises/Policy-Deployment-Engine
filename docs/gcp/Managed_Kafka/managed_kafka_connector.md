## 🛡️ Policy Deployment Engine: `managed_kafka_connector`

This section provides a concise policy evaluation for the `managed_kafka_connector` resource in GCP.

Reference: [Terraform Registry – managed_kafka_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_connector)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | ID of the location of the Kafka Connect resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations. | true | None | None |
| `connect_cluster` | The connect cluster name. | true | None | None |
| `connector_id` | The ID to use for the connector, which will become the final component of the connector's name. This value is structured like: `my-connector-id`. | true | None | None |
| `configs` | Connector config as keys/values. The keys of the map are connector property names, for example: `connector.class`, `tasks.max`, `key.converter`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### task_restart_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `minimum_backoff` | The minimum amount of time to wait before retrying a failed task. This sets a lower bound for the backoff delay. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |
| `maximum_backoff` | The maximum amount of time to wait before retrying a failed task. This sets an upper bound for the backoff delay. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |
