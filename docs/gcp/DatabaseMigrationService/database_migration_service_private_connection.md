## 🛡️ Policy Deployment Engine: `database_migration_service_private_connection`

This section provides a concise policy evaluation for the `database_migration_service_private_connection` resource in GCP.

Reference: [Terraform Registry – database_migration_service_private_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_private_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `private_connection_id` | The private connectivity identifier. | true | None | None |
| `location` | The name of the location this private connection is located in. | true | None | None |
| `labels` | Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `display_name` | Display name. | false | None | None |
| `create_without_validation` | If set to true, will skip validations. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### vpc_peering_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vpc_name` | Fully qualified name of the VPC that Database Migration Service will peer to. Format: projects/{project}/global/{networks}/{name} | true | None | None |
| `subnet` | A free subnet for peering. (CIDR of /29) | true | None | None |
