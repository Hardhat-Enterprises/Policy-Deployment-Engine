## 🛡️ Policy Deployment Engine: `netapp_volume_quota_rule`

This section provides a concise policy evaluation for the `netapp_volume_quota_rule` resource in GCP.

Reference: [Terraform Registry – netapp_volume_quota_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume_quota_rule)

---

## 1. Argument Reference

### `type`
- Description: (Required) Types of Quota Rule. Possible values are: `INDIVIDUAL_USER_QUOTA`, `INDIVIDUAL_GROUP_QUOTA`, `DEFAULT_USER_QUOTA`, `DEFAULT_GROUP_QUOTA`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_limit_mib`
- Description: (Required) The maximum allowed capacity in MiB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_name`
- Description: (Required) Name of the volume to create the quotaRule in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The resource name of the quotaRule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Optional) The quota rule applies to the specified user or group. Valid targets for volumes with NFS protocol enabled: - UNIX UID for individual user quota - UNIX GID for individual group quota Valid targets for volumes with SMB protocol enabled: - Windows SID for individual user quota Leave empty for default quotas
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description for the quota rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs of the quota rule. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Loction of the quotaRule. QuotaRules are child resources of volumes and live in the same location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
