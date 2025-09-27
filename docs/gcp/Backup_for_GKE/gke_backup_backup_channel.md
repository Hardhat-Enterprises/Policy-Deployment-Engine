## 🛡️ Policy Deployment Engine: `gke_backup_backup_channel`

This section provides a concise policy evaluation for the `gke_backup_backup_channel` resource in GCP.

Reference: [Terraform Registry – gke_backup_backup_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_backup_channel)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The full name of the BackupChannel Resource. | true | false | Resource identification has no direct security impact but is essential for governance and audit trails. | backup-channel-prod-australia | channel123 |
| `destination_project` | The project where Backups are allowed to be stored. The format is `projects/{project}`. {project} can be project number or project id. | true | true | Controls where backup data is stored, critical for data sovereignty, access control, and compliance with organizational policies. Backup data may contain sensitive information that must remain within approved organizational boundaries. | projects/fluent-coder-468700-h4 | projects/external-untrusted-project |
| `location` | The region of the Backup Channel. | true | true | Determines data residency and compliance with regional data protection regulations. Critical for ensuring backup data remains within approved geographical boundaries and meets compliance requirements. | australia-southeast1 | us-central1 |
| `description` | User specified descriptive string for this BackupChannel. | false | false | Documentation field has no direct security impact but aids in governance and operational understanding of the backup channel's purpose. | Production backup channel for GKE clusters in Australia | None |
| `labels` | A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Labels enforce governance, security classification, and ownership tracking. Proper labeling enables security policies, cost allocation, and compliance auditing. Missing or incorrect labels can lead to policy enforcement failures. | {"environment": "production", "security": "approved", "team": "platform"} | {"environment": "test", "team": "unknown"} |
| `project` | If it is not provided, the provider project is used. | false | false | Project context for resource creation, typically inherited from provider configuration. No direct security impact. | fluent-coder-468700-h4 | None |
