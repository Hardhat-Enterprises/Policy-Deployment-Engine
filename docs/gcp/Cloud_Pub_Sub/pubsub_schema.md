## 🛡️ Policy Deployment Engine: `pubsub_schema`

This section provides a concise policy evaluation for the `pubsub_schema` resource in GCP.

Reference: [Terraform Registry – pubsub_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_schema)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID to use for the schema, which will become the final component of the schema's resource name. | true | false | None | None | None |
| `type` | The type of the schema definition Default value is `TYPE_UNSPECIFIED`. Possible values are: `TYPE_UNSPECIFIED`, `PROTOCOL_BUFFER`, `AVRO`. | false | true | Leaving the schema type as `TYPE_UNSPECIFIED` disables message structure validation, allowing arbitrarily structured or malformed messages to be published. This can lead to silent data corruption, downstream processing errors, and injection of unexpected payloads. Setting the type to `PROTOCOL_BUFFER` or `AVRO` enforces strict schema validation on all published messages. | PROTOCOL_BUFFER | TYPE_UNSPECIFIED |
| `definition` | The definition of the schema. This should contain a string representing the full definition of the schema that is a valid schema definition of the type specified in type. Changes to the definition commit new [schema revisions](https://cloud.google.com/pubsub/docs/commit-schema-revision). A schema can only have up to 20 revisions, so updates that fail with an error indicating that the limit has been reached require manually [deleting old revisions](https://cloud.google.com/pubsub/docs/delete-schema-revision). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
