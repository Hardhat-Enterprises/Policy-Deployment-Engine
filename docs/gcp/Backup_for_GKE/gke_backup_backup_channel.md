## 🛡️ Policy Deployment Engine: `gke_backup_backup_channel`

This section provides a concise policy evaluation for the `gke_backup_backup_channel` resource in GCP.

Reference: [Terraform Registry – gke_backup_backup_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_backup_channel)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The full name of the BackupChannel Resource. | true | false | None | None | None |
| `destination_project` | The project where Backups are allowed to be stored. The format is `projects/{project}`. {project} can be project number or project id. | true | true | Backups must be stored in a dedicated backup project to ensure isolation. | projects/backup-prod | projects/my-app-dev |
| `location` | The region of the Backup Channel. | true | true | Data sovereignty requires backups to be stored in specific Australian regions. | australia-southeast1 | us-central1 |
| `description` | User specified descriptive string for this BackupChannel. | false | false | None | None | None |
| `labels` | Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are required for cost allocation and ownership tracking. | environment='prod', cost-center='123', owner='team' | missing required labels |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
