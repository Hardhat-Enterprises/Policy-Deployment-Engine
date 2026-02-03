## 🛡️ Policy Deployment Engine: `google_biglake_database`

This section provides a concise policy evaluation for the `google_biglake_database` resource in GCP.

Reference: [Terraform Registry – google_biglake_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_biglake_database)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the BigLake database. | true | false | None | None | None |
| `catalog` | The BigLake catalog that contains this database. | true | false | None | None | None |
| `type` | The type of the BigLake database. | true | false | None | None | None |
| `hive_options` | Hive-specific options for the BigLake database. | false | false | None | None | None |

### hive_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location_uri` | The Cloud Storage location where the database data is stored. | true | true | The storage location determines where database data is physically stored. Misconfigured or public storage locations may lead to unauthorised data access or violations of data residency requirements. | gs://secure-private-bucket/database-path | gs://public-bucket/database-path |
| `parameters` | Custom parameters for the Hive database. | false | false | None | None | None |
