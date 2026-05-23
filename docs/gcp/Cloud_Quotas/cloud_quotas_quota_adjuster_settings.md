## 🛡️ Policy Deployment Engine: `cloud_quotas_quota_adjuster_settings`

This section provides a concise policy evaluation for the `cloud_quotas_quota_adjuster_settings` resource in GCP.

Reference: [Terraform Registry – cloud_quotas_quota_adjuster_settings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_quotas_quota_adjuster_settings)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enablement` | Required. The configured value of the enablement at the given resource. Possible values are: `ENABLED`, `DISABLED`. | true | false | Implemented. A whitelist policy was written to allow only the approved enablement value. In this project, the policy was set to allow only `DISABLED` as the safer governance setting. | enablement = "DISABLED" | enablement = "ENABLED" |
| `parent` | The parent of the quota preference. Allowed parent format is "projects/[project-id / number]". | true | false | Implemented. A pattern whitelist policy was written so only approved project parents can be used. | parent = "projects/104740170505" | parent = "projects/999999999999" |
