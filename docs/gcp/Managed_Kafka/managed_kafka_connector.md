## 🛡️ Policy Deployment Engine: `managed_kafka_connector`

This section provides a concise policy evaluation for the `managed_kafka_connector` resource in GCP.

Reference: [Terraform Registry – managed_kafka_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_connector)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | ID of the location of the Kafka Connect resource. | true | false | Defines geographic location; does not affect access or data protection. | none | none |
| `connect_cluster` | The connect cluster name. | true | false | Refers to the parent cluster, not an access control mechanism itself. | none | none |
| `connector_id` | The ID to use for the connector. | true | false | Used for naming only, no impact on security posture. | none | none |
| `configs` | Connector config as keys/values. Example: `connector.class`, `tasks.max`, `key.converter`. | false | true | Misconfigured or insecure values (e.g., insecure converters or secrets) can lead to data leakage, broken encryption, or operational risks. | ['configs with secure serializers and authentication credentials stored externally'] | ['configs exposing passwords in plain text', 'open source connectors without authentication'] |
| `task_restart_policy` | Specifies how to restart failed tasks. If not set, tasks won't be restarted. | false | false | Primarily affects availability and reliability, not confidentiality or access control. | ['Defined backoff policies to avoid crash loops'] | ['Unbounded retries with minimal backoff'] |
| `project` | If it is not provided, the provider project is used. | false | false | Resource scoping identifier; does not influence security directly. | none | none |

### task_restart_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `minimum_backoff` | Minimum time to wait before retrying a failed task. Example: "3.5s". | false | false | Availability-related; does not directly influence security posture. | [] | [] |
| `maximum_backoff` | Maximum time to wait before retrying a failed task. Example: "3.5s". | false | false | Availability-related; no access or data protection impact. | [] | [] |
