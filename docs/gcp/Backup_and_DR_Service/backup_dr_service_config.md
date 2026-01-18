## 🛡️ Policy Deployment Engine: `backup_dr_service_config`

This section provides a concise policy evaluation for the `backup_dr_service_config` resource in GCP.

Reference: [Terraform Registry – backup_dr_service_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_service_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_type` | The resource type to which the default service config will be applied. | true | false | None | None | None |
| `location` | The location in which the Service config is to be initialized. | true | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
