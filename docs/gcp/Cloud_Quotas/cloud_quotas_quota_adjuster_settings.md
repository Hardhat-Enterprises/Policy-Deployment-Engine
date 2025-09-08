## 🛡️ Policy Deployment Engine: `cloud_quotas_quota_adjuster_settings`

This section provides a concise policy evaluation for the `cloud_quotas_quota_adjuster_settings` resource in GCP.

Reference: [Terraform Registry – cloud_quotas_quota_adjuster_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_quotas_quota_adjuster_settings)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enablement` | Required. The configured value of the enablement at the given resource. Possible values are: `ENABLED`, `DISABLED`. | true | None | None |
| `parent` | The parent of the quota preference. Allowed parent format is "projects/[project-id / number]". | true | None | None |
