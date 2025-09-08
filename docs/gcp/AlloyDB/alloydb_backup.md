## 🛡️ Policy Deployment Engine: `alloydb_backup`

This section provides a concise policy evaluation for the `alloydb_backup` resource in GCP.

Reference: [Terraform Registry – alloydb_backup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_backup)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster_name` | The full resource name of the backup source cluster (e.g., projects/{project}/locations/{location}/clusters/{clusterId}). | true | None | None |
| `backup_id` | The ID of the alloydb backup. | true | None | None |
| `location` | The location where the alloydb backup should reside. | true | None | None |
| `display_name` | User-settable and human-readable display name for the Backup. | false | None | None |
| `labels` | User-defined labels for the alloydb backup. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `type` | The backup type, which suggests the trigger for the backup. Possible values are: `TYPE_UNSPECIFIED`, `ON_DEMAND`, `AUTOMATED`, `CONTINUOUS`. | false | None | None |
| `description` | User-provided description of the backup. | false | None | None |
| `annotations` | Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels. https://google.aip.dev/128 An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### encryption_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | The fully-qualified resource name of the KMS key. Each Cloud KMS key is regionalized and has the following format: projects/[PROJECT]/locations/[REGION]/keyRings/[RING]/cryptoKeys/[KEY_NAME]. | false | None | None |
