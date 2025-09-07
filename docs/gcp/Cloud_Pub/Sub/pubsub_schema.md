## 🛡️ Policy Deployment Engine: `pubsub_schema`

This section provides a concise policy evaluation for the `pubsub_schema` resource in GCP.

Reference: [Terraform Registry – pubsub_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_schema)

---

## 1. Argument Reference

### `name`
- Description: (Required) The ID to use for the schema, which will become the final component of the schema's resource name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of the schema definition Default value is `TYPE_UNSPECIFIED`. Possible values are: `TYPE_UNSPECIFIED`, `PROTOCOL_BUFFER`, `AVRO`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `definition`
- Description: (Optional) The definition of the schema. This should contain a string representing the full definition of the schema that is a valid schema definition of the type specified in type. Changes to the definition commit new [schema revisions](https://cloud.google.com/pubsub/docs/commit-schema-revision). A schema can only have up to 20 revisions, so updates that fail with an error indicating that the limit has been reached require manually [deleting old revisions](https://cloud.google.com/pubsub/docs/delete-schema-revision).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
