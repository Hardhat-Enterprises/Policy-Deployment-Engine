## 🛡️ Policy Deployment Engine: `backup_dr_backup_plan_association`

This section provides a concise policy evaluation for the `backup_dr_backup_plan_association` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_plan_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_plan_association)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource` | Required. The resource for which BPA needs to be created | true | true | Incorrect or missing resource may lead unproper backups, impacting data recovery and security. | None | None |
| `backup_plan` | Required. The BP with which resource needs to be created Note: - A Backup Plan configured for 'compute.googleapis.com/Instance', can only protect instance type resources. - A Backup Plan configured for 'compute.googleapis.com/Disk' can be used to protect both standard Disks and Regional Disks resources. | true | true | Incorrect or missing backup plan may lead unproper backups, impacting data recovery and security. | None | None |
| `resource_type` | Required. The resource type of workload on which backupplan is applied. Examples include, "compute.googleapis.com/Instance", "compute.googleapis.com/Disk", and "compute.googleapis.com/RegionDisk" | true | true | Incorrect or missing resource type may lead unproper backups, impacting data recovery and security. | None | None |
| `location` | Required. The GCP location for the backup vault should be on approved region. | true | true | Location determines physical hosting region and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1'] |
| `backup_plan_association_id` | Required. The id of backupplan association | true | false | ID is a configuration setting and does not directly impact security. | None | None |
| `project` | Optional. If it is not provided, the provider project is used. | false | false | even without manual ID configuration ID will be automatically generated. | None | None |
