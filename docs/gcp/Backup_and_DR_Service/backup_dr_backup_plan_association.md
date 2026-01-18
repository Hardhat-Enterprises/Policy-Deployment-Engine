## 🛡️ Policy Deployment Engine: `backup_dr_backup_plan_association`

This section provides a concise policy evaluation for the `backup_dr_backup_plan_association` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_plan_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_plan_association)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource` | The resource for which BPA needs to be created | true | false | None | None | None |
| `backup_plan` | The BP with which resource needs to be created Note: - A Backup Plan configured for 'compute.googleapis.com/Instance', can only protect instance type resources. - A Backup Plan configured for 'compute.googleapis.com/Disk' can be used to protect both standard Disks and Regional Disks resources. | true | false | None | None | None |
| `resource_type` | The resource type of workload on which backupplan is applied. Examples include, "compute.googleapis.com/Instance", "compute.googleapis.com/Disk", and "compute.googleapis.com/RegionDisk" | true | false | None | None | None |
| `location` | The location for the backupplan association | true | false | None | None | None |
| `backup_plan_association_id` | The id of backupplan association | true | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
