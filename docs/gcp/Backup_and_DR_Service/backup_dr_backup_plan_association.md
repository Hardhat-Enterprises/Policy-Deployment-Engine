## 🛡️ Policy Deployment Engine: `backup_dr_backup_plan_association`

This section provides a concise policy evaluation for the `backup_dr_backup_plan_association` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_plan_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_plan_association)

---

## 1. Argument Reference

### `resource`
- Description: (Required) The resource for which BPA needs to be created
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_plan`
- Description: (Required) The BP with which resource needs to be created Note: - A Backup Plan configured for 'compute.googleapis.com/Instance', can only protect instance type resources. - A Backup Plan configured for 'compute.googleapis.com/Disk' can be used to protect both standard Disks and Regional Disks resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_type`
- Description: (Required) The resource type of workload on which backupplan is applied. Examples include, "compute.googleapis.com/Instance", "compute.googleapis.com/Disk", and "compute.googleapis.com/RegionDisk"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the backupplan association
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_plan_association_id`
- Description: (Required) The id of backupplan association
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
