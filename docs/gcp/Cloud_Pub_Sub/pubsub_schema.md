## 🛡️ Policy Deployment Engine: `pubsub_schema`

This section provides a concise policy evaluation for the `google_pubsub_schema` resource in GCP.

Reference: [Terraform Registry – google_pubsub_schema](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/pubsub_schema)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID to use for the schema, which will become the final component of the schema's resource name. | true | false | None | None | None |
| `type` | The type of the schema definition. Possible values: `TYPE_UNSPECIFIED`, `PROTOCOL_BUFFER`, `AVRO`. | false | true | Leaving the schema type as `TYPE_UNSPECIFIED` disables message structure validation, allowing arbitrarily structured or malformed messages to be published. This can lead to silent data corruption, downstream processing errors, and injection of unexpected payloads. Setting the type to `PROTOCOL_BUFFER` or `AVRO` enforces strict schema validation on all published messages. | PROTOCOL_BUFFER | TYPE_UNSPECIFIED |
| `definition` | The definition of the schema as a string. Changes to this field commit new schema revisions (max 20 revisions). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
