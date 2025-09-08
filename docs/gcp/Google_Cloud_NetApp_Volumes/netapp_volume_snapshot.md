## 🛡️ Policy Deployment Engine: `netapp_volume_snapshot`

This section provides a concise policy evaluation for the `netapp_volume_snapshot` resource in GCP.

Reference: [Terraform Registry – netapp_volume_snapshot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume_snapshot)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Name of the snapshot location. Snapshots are child resources of volumes and live in the same location. | true | None | None |
| `volume_name` | The name of the volume to create the snapshot in. | true | None | None |
| `name` | The name of the snapshot. | true | None | None |
| `description` | Description for the snapshot. | false | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
