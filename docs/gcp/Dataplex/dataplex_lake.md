## 🛡️ Policy Deployment Engine: `dataplex_lake`

This section provides a concise policy evaluation for the `dataplex_lake` resource in GCP.

Reference: [Terraform Registry – dataplex_lake](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_lake)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location for the resource | true | false | None | None | None |
| `name` | The name of the lake. - - - | true | false | None | None | None |
| `description` | Optional. Description of the lake. | false | false | None | None | None |
| `display_name` | Optional. User friendly display name. | false | false | None | None | None |
| `labels` | Optional. User-defined labels for the lake. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Labels like 'owner' are required for accountability and governance. | {"owner": "data-team"} | {} or missing 'owner' label |
| `metastore` | Optional. Settings to manage lake and Dataproc Metastore service instance association. | false | true | A metastore ensures schema management and governance. Lakes should reference an approved metastore. | projects/123456/locations/us-central1/services/metastore-1 | None |
| `project` | The project for the resource | false | false | None | None | None |

### metastore Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | Optional. A relative reference to the Dataproc Metastore service associated with the lake. | false | true | Metastore service is needed for consistent schema governance. | projects/123456/locations/us-central1/services/metastore-1 | Not set |
