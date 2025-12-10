## 🛡️ Policy Deployment Engine: `netapp_volume_quota_rule`

This section provides a concise policy evaluation for the `netapp_volume_quota_rule` resource in GCP.

Reference: [Terraform Registry – netapp_volume_quota_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume_quota_rule)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Types of Quota Rule. Possible values are: `INDIVIDUAL_USER_QUOTA`, `INDIVIDUAL_GROUP_QUOTA`, `DEFAULT_USER_QUOTA`, `DEFAULT_GROUP_QUOTA`. | true | false | None | None | None |
| `disk_limit_mib` | Quota limit in MiB. | true | true | Prevents unlimited or trivially small quotas that undermine control. | 10240 | 0 |
| `volume_name` | Name of the volume to create the quotaRule in. | true | false | None | None | None |
| `name` | The resource name of the quotaRule. | true | false | None | None | None |
| `target` | The quota rule applies to the specified user or group. Valid targets for volumes with NFS protocol enabled: - UNIX UID for individual user quota - UNIX GID for individual group quota Valid targets for volumes with SMB protocol enabled: - Windows SID for individual user quota Leave empty for default quotas | false | false | None | None | None |
| `description` | Description for the quota rule. | false | false | None | None | None |
| `labels` | Labels as key value pairs of the quota rule. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `location` | Region for the quota rule. | true | true | Residency compliance. | australia-southeast2 | us-central1 |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
