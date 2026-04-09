## 🛡️ Policy Deployment Engine: `database_migration_service_private_connection`

This section provides a concise policy evaluation for the `database_migration_service_private_connection` resource in GCP.

Reference: [Terraform Registry – database_migration_service_private_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_private_connection)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vpc_peering_config` | The VPC Peering configuration is used to create VPC peering between databasemigrationservice and the consumer's VPC. Structure is [documented below](#nested_vpc_peering_config). | true | false | This is a required field and doesnot need a Rego policy | None | None |
| `private_connection_id` | The private connectivity identifier. | true | false | Not Security Related | None | None |
| `location` | The name of the location this private connection is located in. | true | true | Location must align with compliance and data residency requirements. | australia-southeast1, australia-southeast2 | US-east1 |
| `labels` | Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Not Security Related | None | None |
| `display_name` | Display name. | false | false | Not Security Related | None | None |
| `create_without_validation` | If set to true, will skip validations. | false | true | Validation ensures that configuration errors are caught before deployment. Skipping validation can allow insecure or broken private connections. | False | True |
| `project` | If it is not provided, the provider project is used. | false | false | Not Security Related | None | None |

### vpc_peering_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vpc_name` | Fully qualified name of the VPC that Database Migration Service will peer to. Format: projects/{project}/global/{networks}/{name} | true | false | None | None | None |
| `subnet` | A free subnet for peering. (CIDR of /29) | true | false | None | None | None |
