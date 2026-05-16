## 🛡️ Policy Deployment Engine: `spanner_instance_partition`

This section provides a concise policy evaluation for the `spanner_instance_partition` resource in GCP.

Reference: [Terraform Registry – spanner_instance_partition](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance_partition)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | A unique identifier for the instance partition, which cannot be changed after the instance partition is created. The name must be between 2 and 64 characters and match the regular expression [a-z][a-z0-9\\-]{0,61}[a-z0-9]. | true | false | None | None | None |
| `display_name` | The descriptive name for this instance partition as it appears in UIs. Must be unique per project and between 4 and 30 characters in length. | true | false | None | None | None |
| `config` | The name of the instance partition's configuration (similar to a region) which defines the geographic placement and replication of data in this instance partition. | true | false | None | None | None |
| `instance` | The instance to create the instance partition in. | true | false | None | None | None |
| `node_count` | The number of nodes allocated to this instance partition. One node equals 1000 processing units. Exactly one of either node_count or processing_units must be present. | false | false | None | None | None |
| `processing_units` | The number of processing units allocated to this instance partition. Exactly one of either node_count or processing_units must be present. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
