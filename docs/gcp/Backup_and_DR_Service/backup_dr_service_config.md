## 🛡️ Policy Deployment Engine: `backup_dr_service_config`

This section provides a concise policy evaluation for the `backup_dr_service_config` resource in GCP.

Reference: [Terraform Registry – backup_dr_service_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_service_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_type` | Required. The resource type to which the default service config will be applied. | true | true | Resource type has no impact on the security of the resource or data contained. | None | None |
| `location` | Required. The GCP location for the backup vault should be on approved region. | true | true | Location determines physical hosting region and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1'] |
| `project` | If it is not provided, the provider project is used. | false | false | even without manual ID configuration ID will be automatically generated. | None | None |
