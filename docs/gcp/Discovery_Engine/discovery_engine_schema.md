## 🛡️ Policy Deployment Engine: `discovery_engine_schema`

This section provides a concise policy evaluation for the `discovery_engine_schema` resource in GCP.

Reference: [Terraform Registry – discovery_engine_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_schema)

---

## 1. Argument Reference

### `location`
- Description: (Required) The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_id`
- Description: (Required) The unique id of the data store.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema_id`
- Description: (Required) The unique id of the schema.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_schema`
- Description: (Optional) The JSON representation of the schema.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
