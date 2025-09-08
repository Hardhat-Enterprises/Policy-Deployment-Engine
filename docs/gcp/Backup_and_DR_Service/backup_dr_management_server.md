## 🛡️ Policy Deployment Engine: `backup_dr_management_server`

This section provides a concise policy evaluation for the `backup_dr_management_server` resource in GCP.

Reference: [Terraform Registry – backup_dr_management_server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_management_server)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location for the management server (management console) | true | None | None |
| `name` | The name of management server (management console) | true | None | None |
| `type` | The type of management server (management console). Default value is `BACKUP_RESTORE`. Possible values are: `BACKUP_RESTORE`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### networks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | Network with format `projects/{{project_id}}/global/networks/{{network_id}}` | true | None | None |
| `peering_mode` | Type of Network peeringMode Default value is `PRIVATE_SERVICE_ACCESS`. Possible values are: `PRIVATE_SERVICE_ACCESS`. | false | None | None |
