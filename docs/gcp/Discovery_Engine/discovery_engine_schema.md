## 🛡️ Policy Deployment Engine: `discovery_engine_schema`

This section provides a concise policy evaluation for the `discovery_engine_schema` resource in GCP.

Reference: [Terraform Registry – discovery_engine_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_schema)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | None | None |
| `data_store_id` | The unique id of the data store. | true | None | None |
| `schema_id` | The unique id of the schema. | true | None | None |
| `json_schema` | The JSON representation of the schema. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
