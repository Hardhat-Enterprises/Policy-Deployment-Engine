## 🛡️ Policy Deployment Engine: `google_backup_dr_service_config`

This section provides a concise policy evaluation for the `google_backup_dr_service_config` resource in GCP.

Reference: [Terraform Registry – google_backup_dr_service_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_backup_dr_service_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_type` | Required. The resource type to which the default service config will be applied. | true | false | Resource type has no impact on the security of the resource or data contained. | None | None |
| `location` | Required. The GCP location for the backup vault should be on approved region. | true | true | Location determines regional placement and governance alignment, including data residency requirements. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1'] |
| `project` | Optional. If it is not provided, the provider project is used. | false | false | The project field determines the deployment context of the resource, but it does not directly change the security configuration | None | None |
