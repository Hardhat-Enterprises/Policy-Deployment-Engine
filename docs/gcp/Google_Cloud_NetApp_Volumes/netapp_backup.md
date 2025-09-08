## 🛡️ Policy Deployment Engine: `netapp_backup`

This section provides a concise policy evaluation for the `netapp_backup` resource in GCP.

Reference: [Terraform Registry – netapp_backup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_backup)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Location of the backup. | true | None | None |
| `vault_name` | Name of the backup vault to store the backup in. | true | None | None |
| `name` | The resource name of the backup. Needs to be unique per location. | true | None | None |
| `description` | A description of the backup with 2048 characters or less. Requests with longer descriptions will be rejected. | false | None | None |
| `source_volume` | ID of volumes this backup belongs to. Format: `projects/{{projects_id}}/locations/{{location}}/volumes/{{name}}`` | false | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `source_snapshot` | If specified, backup will be created from the given snapshot. If not specified, there will be a new snapshot taken to initiate the backup creation. Format: `projects/{{projectId}}/locations/{{location}}/volumes/{{volumename}}/snapshots/{{snapshotname}}`` | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
