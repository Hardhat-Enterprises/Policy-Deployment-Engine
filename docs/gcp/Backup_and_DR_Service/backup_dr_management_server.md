## 🛡️ Policy Deployment Engine: `backup_dr_management_server`

This section provides a concise policy evaluation for the `backup_dr_management_server` resource in GCP.

Reference: [Terraform Registry – backup_dr_management_server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_management_server)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location for the management server (management console)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of management server (management console)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of management server (management console). Default value is `BACKUP_RESTORE`. Possible values are: `BACKUP_RESTORE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networks`
- Description: (Optional) Network details to create management server (management console). Structure is [documented below](#nested_networks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_networks"></a>The `networks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) Network with format `projects/{{project_id}}/global/networks/{{network_id}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peering_mode`
- Description: (Optional) Type of Network peeringMode Default value is `PRIVATE_SERVICE_ACCESS`. Possible values are: `PRIVATE_SERVICE_ACCESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
