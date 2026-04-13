## 🛡️ Policy Deployment Engine: `gke_backup_restore_channel`

This section provides a concise policy evaluation for the `gke_backup_restore_channel` resource in GCP.

Reference: [Terraform Registry – gke_backup_restore_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_restore_channel)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The full name of the RestoreChannel Resource. | true | false | None | None | None |
| `destination_project` | The project where Backups will be restored. The format is `projects/{project}`. {project} can be project number or project id. | true | true | Restores must be performed in approved projects, typically the same region as the backup. | projects/restore-prod | projects/untrusted-dev |
| `location` | The region of the Restore Channel. | true | true | Data sovereignty requires restores to occur in specific Australian regions. | australia-southeast1 | us-central1 |
| `description` | User specified descriptive string for this RestoreChannel. | false | false | None | None | None |
| `labels` | Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are required for cost allocation and ownership tracking. | environment='prod', cost-center='123', owner='team' | missing required labels |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
