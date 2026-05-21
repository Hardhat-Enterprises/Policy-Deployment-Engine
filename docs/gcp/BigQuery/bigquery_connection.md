## 🛡️ Policy Deployment Engine: `bigquery_connection`

This section provides a concise policy evaluation for the `bigquery_connection` resource in GCP.

Reference: [Terraform Registry – bigquery_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_connection)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `connection_id` | Optional connection id that should be assigned to the created connection. | false | false | connection_id is an identifier for the connection | None | None |
| `location` | The geographic location where the connection should reside. | false | false | None | None | None |
| `friendly_name` | A descriptive name for the connection. | false | false | None | None | None |
| `description` | A descriptive description for the connection. | false | false | None | None | None |
| `kms_key_name` | Optional. The Cloud KMS key that is used for encryption. | false | true | kms_key_name enforces customer-managed encryption (CMEK) on the connection rather than relying on default Google-managed keys | google_kms_crypto_key.crypto_key.id | None |
| `cloud_sql` | Connection properties specific to the Cloud SQL. Structure is [documented below](#nested_cloud_sql). | false | false | None | None | None |
| `aws` | Connection properties specific to Amazon Web Services. | false | false | None | None | None |
| `azure` | Container for connection properties specific to Azure. | false | false | None | None | None |
| `cloud_spanner` | Connection properties specific to Cloud Spanner. | false | false | None | None | None |
| `cloud_resource` | Container for connection properties for delegation of access to GCP resources. | false | false | None | None | None |
| `spark` | Container for connection properties to execute stored procedures for Apache Spark. | false | false | None | None | None |
| `configuration` | Container for connection properties for connections to Salesforce. | false | false | None | None | None |
| `project` | The ID of the project in which the resource belongs. | false | false | None | None | None |

### cloud_sql Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `instance_id` | Cloud SQL instance ID in the form project:location:instance. | true | false | None | None | None |
| `database` | Database name. | true | false | None | None | None |
| `type` | Type of the Cloud SQL database. Possible values: DATABASE_TYPE_UNSPECIFIED, POSTGRES, MYSQL. | true | false | None | None | None |
| `credential` | Cloud SQL credential. Structure is [documented below](#nested_credential). | true | false | None | None | None |

### credential Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | The username for the credential. | true | true | Empty username allows unauthorised access to the Cloud SQL database | admin | "" |
| `password` | The password for the credential. | true | true | Empty password allows unauthorised access to the Cloud SQL database | securepassword123 | "" |