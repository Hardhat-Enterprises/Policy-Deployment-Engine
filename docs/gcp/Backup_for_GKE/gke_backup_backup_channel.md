## 🛡️ Policy Deployment Engine: `gke_backup_backup_channel`

This section provides a concise policy evaluation for the `gke_backup_backup_channel` resource in GCP.

Reference: [Terraform Registry – gke_backup_backup_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_backup_channel)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The full name of the BackupChannel Resource. | true | None | None |
| `destination_project` | The project where Backups are allowed to be stored. The format is `projects/{project}`. {project} can be project number or project id. | true | None | None |
| `location` | The region of the Backup Channel. | true | None | None |
| `description` | User specified descriptive string for this BackupChannel. | false | None | None |
| `labels` | Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
