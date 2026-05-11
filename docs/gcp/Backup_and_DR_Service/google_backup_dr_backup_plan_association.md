## 🛡️ Policy Deployment Engine: `google_backup_dr_backup_plan_association`

This section provides a concise policy evaluation for the `google_backup_dr_backup_plan_association` resource in GCP.

Reference: [Terraform Registry – google_backup_dr_backup_plan_association](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_backup_dr_backup_plan_association)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource` | Required. The resource for which BPA needs to be created | true | false | This is a resource reference and would require service-specific validation to confirm that the correct workload is being protected. It is not an explicit security control. | None | None |
| `backup_plan` | Required. The BP with which resource needs to be created Note: - A Backup Plan configured for 'compute.googleapis.com/Instance', can only protect instance type resources. - A Backup Plan configured for 'compute.googleapis.com/Disk' can be used to protect both standard Disks and Regional Disks resources. | true | false | This is a configuration setting and does not directly impact security. | None | None |
| `resource_type` | Required. The resource type of workload on which backupplan is applied. Examples include, "compute.googleapis.com/Instance", "compute.googleapis.com/Disk", and "compute.googleapis.com/RegionDisk" | true | false | This affects workload compatibility and intended usage. This is a configuration setting and does not directly impact security. | None | None |
| `location` | Required. The GCP location for the backup vault should be on approved region. | true | true | Location is a clear generic security control because it can be enforced through an approved-region whitelist for governance and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1'] |
| `backup_plan_association_id` | Required. The id of backupplan association | true | false | ID is a configuration setting and does not directly impact security. | None | None |
| `project` | Optional. If it is not provided, the provider project is used. | false | false | Project is an administrative scoping field used to determine where the resource is created. It does not directly define or enforce an explicit security control for the association itself. | None | None |
