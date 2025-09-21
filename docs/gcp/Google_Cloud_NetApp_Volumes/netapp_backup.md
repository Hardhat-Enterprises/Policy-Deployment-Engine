## 🛡️ Policy Deployment Engine: `netapp_backup`

This section provides a concise policy evaluation for the `netapp_backup` resource in GCP.

Reference: [Terraform Registry – netapp_backup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_backup)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Region of the backup resource. | true | true | Data residency and compliance. | australia-southeast2 | us-central1 |
| `vault_name` | Target backup vault name. | true | true | Backups must land in an approved vault with correct IAM/retention. | backup-vault | test-vault |
| `name` | The resource name of the backup. Needs to be unique per location. | true | false | None | None | None |
| `description` | A description of the backup with 2048 characters or less. Requests with longer descriptions will be rejected. | false | false | None | None | None |
| `source_volume` | Full resource ID of the volume to back up. | true | true | Ensures backups only for approved volumes in approved regions/projects. | projects/deakin-lab-123/locations/australia-southeast2/volumes/backup-volume | projects/other-proj/locations/us-central1/volumes/backup-volume |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `source_snapshot` | If specified, backup will be created from the given snapshot. If not specified, there will be a new snapshot taken to initiate the backup creation. Format: `projects/{{projectId}}/locations/{{location}}/volumes/{{volumename}}/snapshots/{{snapshotname}}`` | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
