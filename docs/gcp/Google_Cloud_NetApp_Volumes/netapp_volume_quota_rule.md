## 🛡️ Policy Deployment Engine: `netapp_volume_quota_rule`

This section provides a concise policy evaluation for the `netapp_volume_quota_rule` resource in GCP.

Reference: [Terraform Registry – netapp_volume_quota_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume_quota_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Types of Quota Rule. Possible values are: `INDIVIDUAL_USER_QUOTA`, `INDIVIDUAL_GROUP_QUOTA`, `DEFAULT_USER_QUOTA`, `DEFAULT_GROUP_QUOTA`. | true | None | None |
| `disk_limit_mib` | The maximum allowed capacity in MiB. | true | None | None |
| `volume_name` | Name of the volume to create the quotaRule in. | true | None | None |
| `name` | The resource name of the quotaRule. | true | None | None |
| `target` | The quota rule applies to the specified user or group. Valid targets for volumes with NFS protocol enabled: - UNIX UID for individual user quota - UNIX GID for individual group quota Valid targets for volumes with SMB protocol enabled: - Windows SID for individual user quota Leave empty for default quotas | false | None | None |
| `description` | Description for the quota rule. | false | None | None |
| `labels` | Labels as key value pairs of the quota rule. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `location` | Loction of the quotaRule. QuotaRules are child resources of volumes and live in the same location. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
