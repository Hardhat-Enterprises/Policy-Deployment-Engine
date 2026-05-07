## 🛡️ Policy Deployment Engine: `google_biglake_table`

This section provides a concise policy evaluation for the `google_biglake_table` resource in GCP.

Reference: [Terraform Registry – google_biglake_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_biglake_table)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the BigLake table. | true | false | None | None | None |
| `database` | The BigLake database that contains this table. | true | false | None | None | None |
| `type` | The type of the BigLake table. | true | false | None | None | None |
| `hive_options` | Hive-specific options for the BigLake table. | false | false | None | None | None |

### hive_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `storage_descriptor` | Storage descriptor for the BigLake table. | true | false | None | None | None |

###   storage_descriptor Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `location_uri` | The Cloud Storage location where table data is stored. | true | true | The table storage location determines where data is physically stored. Insecure or public locations may expose sensitive data or violate data governance requirements. | gs://secure-private-bucket/table-path | gs://public-bucket/table-path |
  | `input_format` | The input format of the table data. | false | false | None | None | None |
  | `output_format` | The output format of the table data. | false | false | None | None | None |
  | `parameters` | Custom parameters for the table storage descriptor. | false | false | None | None | None |
