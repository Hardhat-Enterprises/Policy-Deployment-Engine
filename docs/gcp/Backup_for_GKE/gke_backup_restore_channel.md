## 🛡️ Policy Deployment Engine: `gke_backup_restore_channel`

This section provides a concise policy evaluation for the `gke_backup_restore_channel` resource in GCP.

Reference: [Terraform Registry – gke_backup_restore_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_restore_channel)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The full name of the RestoreChannel Resource. | true | false | Resource identification has no direct security impact but is essential for governance and operational management of restore operations. | restore-channel-prod-australia | channel123 |
| `destination_project` | The project where Backups will be restored. The format is `projects/{project}`. {project} can be project number or project id. | true | true | CRITICAL: Controls where backup data can be restored, defining the security boundary for restore operations. Restoring to unauthorized projects could expose sensitive data or violate compliance requirements. Must only allow approved organizational projects. | projects/fluent-coder-468700-h4 | projects/external-untrusted-project |
| `location` | The region of the Restore Channel. | true | true | Determines data residency for restore operations. Critical for ensuring restored data remains within approved geographical boundaries and meets compliance requirements for data protection regulations. | australia-southeast1 | us-central1 |
| `description` | User specified descriptive string for this RestoreChannel. | false | false | Documentation field has no direct security impact but aids in governance and operational understanding of the restore channel's purpose. | Production restore channel for GKE clusters in Australia region | None |
| `labels` | Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Labels enforce governance, security classification, and ownership tracking for restore operations. Proper labeling enables security policies, audit trails, and compliance verification. Missing labels can lead to policy enforcement failures. | {"environment": "production", "security": "approved", "operation": "restore"} | {"env": "test", "owner": "unknown"} |
| `project` | If it is not provided, the provider project is used. | false | false | Project context for resource creation, typically inherited from provider configuration. No direct security impact. | fluent-coder-468700-h4 | None |
