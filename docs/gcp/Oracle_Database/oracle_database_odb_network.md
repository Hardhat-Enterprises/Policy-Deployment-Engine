## 🛡️ Policy Deployment Engine: `oracle_database_odb_network`

This section provides a concise policy evaluation for the `oracle_database_odb_network` resource in GCP.

Reference: [Terraform Registry – oracle_database_odb_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_odb_network)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The name of the VPC network in the following format: projects/{project}/global/networks/{network} | true | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `odb_network_id` | The ID of the OdbNetwork to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number. | true | None | None |
| `labels` | Labels or tags associated with the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_protection` |  | none | None | None |
