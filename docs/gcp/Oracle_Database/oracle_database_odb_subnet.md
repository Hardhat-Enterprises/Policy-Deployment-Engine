## 🛡️ Policy Deployment Engine: `oracle_database_odb_subnet`

This section provides a concise policy evaluation for the `oracle_database_odb_subnet` resource in GCP.

Reference: [Terraform Registry – oracle_database_odb_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/oracle_database_odb_subnet)

---

## 1. Argument Reference

### `cidr_range`
- Description: (Required) The CIDR range of the subnet.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `purpose`
- Description: (Required) Purpose of the subnet. Possible values: CLIENT_SUBNET BACKUP_SUBNET
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `odbnetwork`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `odb_subnet_id`
- Description: (Required) The ID of the OdbSubnet to create. This value is restricted to (^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$) and must be a maximum of 63 characters in length. The value must start with a letter and end with a letter or a number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels or tags associated with the resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
