## 🛡️ Policy Deployment Engine: `oracle_database_odb_subnet`

This section provides a concise policy evaluation for the `oracle_database_odb_subnet` resource in GCP.

Reference: [Terraform Registry – oracle_database_odb_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_odb_subnet)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cidr_range` | The CIDR range of the subnet. | true | None | None |
| `purpose` | Purpose of the subnet. Possible values: CLIENT_SUBNET BACKUP_SUBNET | true | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `odbnetwork` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `odb_subnet_id` | The ID of the OdbSubnet to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number. | true | None | None |
| `labels` | Labels or tags associated with the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` |  | none | None | None |
