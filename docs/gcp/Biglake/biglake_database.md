## 🛡️ Policy Deployment Engine: `biglake_database`

This section provides a concise policy evaluation for the `biglake_database` resource in GCP.

Reference: [Terraform Registry – biglake_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/biglake_database)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The database type. | true | false | None | None | None |
| `hive_options` | Options of a Hive database. Structure is [documented below](#nested_hive_options). | true | false | None | None | None |
| `catalog` | The parent catalog. | true | false | None | None | None |
| `name` | The name of the database. | true | false | None | None | None |

### hive_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location_uri` | Cloud Storage folder URI where the database data is stored, starting with "gs://". | false | true | The storage location defines where database data is physically stored. Incorrect configuration may expose sensitive data or violate data residency requirements. | Storage location points to a controlled and private Cloud Storage bucket | Storage location points to an uncontrolled or public bucket |
| `parameters` | Stores user supplied Hive database parameters. An object containing a list of"key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | false | None | None | None |
