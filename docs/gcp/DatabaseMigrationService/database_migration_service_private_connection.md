## 🛡️ Policy Deployment Engine: `database_migration_service_private_connection`

This section provides a concise policy evaluation for the `database_migration_service_private_connection` resource in GCP.

Reference: [Terraform Registry – database_migration_service_private_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/database_migration_service_private_connection)

---

## 1. Argument Reference

### `vpc_peering_config`
- Description: (Required) The VPC Peering configuration is used to create VPC peering between databasemigrationservice and the consumer's VPC. Structure is [documented below](#nested_vpc_peering_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_connection_id`
- Description: (Required) The private connectivity identifier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The name of the location this private connection is located in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_without_validation`
- Description: (Optional) If set to true, will skip validations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_vpc_peering_config"></a>The `vpc_peering_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_name`
- Description: (Required) Fully qualified name of the VPC that Database Migration Service will peer to. Format: projects/{project}/global/{networks}/{name}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet`
- Description: (Required) A free subnet for peering. (CIDR of /29)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
