## 🛡️ Policy Deployment Engine: `backup_dr_management_server`

This section provides a concise policy evaluation for the `backup_dr_management_server` resource in GCP.

Reference: [Terraform Registry – backup_dr_management_server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_management_server)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location for the management server (management console) | true | false | None | None | None |
| `name` | The name of management server (management console) | true | false | None | None | None |
| `type` | The type of management server (management console). Default value is `BACKUP_RESTORE`. Possible values are: `BACKUP_RESTORE`. | false | false | None | None | None |
| `networks` | Network details to create management server (management console). Structure is [documented below](#nested_networks). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### networks Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | Network with format `projects/{{project_id}}/global/networks/{{network_id}}` | true | false | None | None | None |
| `peering_mode` | Type of Network peeringMode Default value is `PRIVATE_SERVICE_ACCESS`. Possible values are: `PRIVATE_SERVICE_ACCESS`. | false | false | None | None | None |
