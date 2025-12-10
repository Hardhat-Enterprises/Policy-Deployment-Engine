## 🛡️ Policy Deployment Engine: `netapp_volume_snapshot`

This section provides a concise policy evaluation for the `netapp_volume_snapshot` resource in GCP.

Reference: [Terraform Registry – netapp_volume_snapshot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume_snapshot)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Region where the snapshot is created. | true | true | Residency/compliance. | australia-southeast2 | us-central1 |
| `volume_name` | Name of the source volume to snapshot. | true | true | Limits snapshots to approved volumes. | backup-volume |  |
| `name` | The name of the snapshot. | true | false | None | None | None |
| `description` | Description for the snapshot. | false | false | None | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
