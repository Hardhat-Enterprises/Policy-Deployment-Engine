## 🛡️ Policy Deployment Engine: `dataplex_lake`

This section provides a concise policy evaluation for the `dataplex_lake` resource in GCP.

Reference: [Terraform Registry – dataplex_lake](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_lake)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location for the resource | true | None | None |
| `name` | The name of the lake. - - - | true | None | None |
| `description` | Optional. Description of the lake. | false | None | None |
| `display_name` | Optional. User friendly display name. | false | None | None |
| `labels` | Optional. User-defined labels for the lake. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | The project for the resource | false | None | None |

### metastore Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | Optional. A relative reference to the Dataproc Metastore (https://cloud.google.com/dataproc-metastore/docs) service associated with the lake: `projects/{project_id}/locations/{location_id}/services/{service_id}` | false | None | None |
