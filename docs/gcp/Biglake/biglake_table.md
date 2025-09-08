## 🛡️ Policy Deployment Engine: `biglake_table`

This section provides a concise policy evaluation for the `biglake_table` resource in GCP.

Reference: [Terraform Registry – biglake_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/biglake_table)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Output only. The name of the Table. Format: projects/{project_id_or_number}/locations/{locationId}/catalogs/{catalogId}/databases/{databaseId}/tables/{tableId} | true | None | None |
| `type` | The database type. Possible values are: `HIVE`. | false | None | None |
| `database` | The id of the parent database. | false | None | None |

### hive_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parameters` | Stores user supplied Hive table parameters. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |
| `table_type` | Hive table type. For example, MANAGED_TABLE, EXTERNAL_TABLE. | false | None | None |
| `storage_descriptor` | Stores physical storage information on the data. Structure is [documented below](#nested_hive_options_storage_descriptor). | false | None | None |

### storage_descriptor Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location_uri` | Cloud Storage folder URI where the table data is stored, starting with "gs://". | false | None | None |
| `input_format` | The fully qualified Java class name of the input format. | false | None | None |
| `output_format` | The fully qualified Java class name of the output format. | false | None | None |
