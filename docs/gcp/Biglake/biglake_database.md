## 🛡️ Policy Deployment Engine: `biglake_database`

This section provides a concise policy evaluation for the `biglake_database` resource in GCP.

Reference: [Terraform Registry – biglake_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/biglake_database)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The database type. | true | None | None |
| `catalog` | The parent catalog. | true | None | None |
| `name` | The name of the database. | true | None | None |

### hive_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location_uri` | Cloud Storage folder URI where the database data is stored, starting with "gs://". | false | None | None |
| `parameters` | Stores user supplied Hive database parameters. An object containing a list of"key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |
