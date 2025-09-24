## 🛡️ Policy Deployment Engine: `discovery_engine_schema`

This section provides a concise policy evaluation for the `discovery_engine_schema` resource in GCP.

Reference: [Terraform Registry – discovery_engine_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/discovery_engine_schema)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The geographic location where the data store should reside. The value can only be one of "global", "us" and "eu". | true | true | laws apply based on location | None | None |
| `data_store_id` | The unique id of the data store. | true | false | None | None | None |
| `schema_id` | The unique id of the schema. | true | false | None | None | None |
| `json_schema` | The JSON representation of the schema. | false | true | Since it's the actual schema definition, if it's too permissive (e.g., allows freeform fields or deep nesting), it can allow arbitrary data injection   | {"$schema":"https://json-schema.org/draft/2020-12/schema","datetime_detection":true,"type":"object","geolocation_detection":true} | {"$schema":"https://json-schema.org/draft/2020-12/schema","datetime_detection":false,"type":"object","geolocation_detection":false} |
| `project` | If it is not provided, the provider project is used. | true | false | Needed to work | None | None |
