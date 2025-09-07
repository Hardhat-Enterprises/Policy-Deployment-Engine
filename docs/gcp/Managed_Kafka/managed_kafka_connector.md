## 🛡️ Policy Deployment Engine: `managed_kafka_connector`

This section provides a concise policy evaluation for the `managed_kafka_connector` resource in GCP.

Reference: [Terraform Registry – managed_kafka_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/managed_kafka_connector)

---

## 1. Argument Reference

### `location`
- Description: (Required) ID of the location of the Kafka Connect resource. See https://cloud.google.com/managed-kafka/docs/locations for a list of supported locations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connect_cluster`
- Description: (Required) The connect cluster name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connector_id`
- Description: (Required) The ID to use for the connector, which will become the final component of the connector's name. This value is structured like: `my-connector-id`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `configs`
- Description: (Optional) Connector config as keys/values. The keys of the map are connector property names, for example: `connector.class`, `tasks.max`, `key.converter`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `task_restart_policy`
- Description: (Optional) A policy that specifies how to restart the failed connectors/tasks in a Cluster resource. If not set, the failed connectors/tasks won't be restarted. Structure is [documented below](#nested_task_restart_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_task_restart_policy"></a>The `task_restart_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_backoff`
- Description: (Optional) The minimum amount of time to wait before retrying a failed task. This sets a lower bound for the backoff delay. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maximum_backoff`
- Description: (Optional) The maximum amount of time to wait before retrying a failed task. This sets an upper bound for the backoff delay. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
