## 🛡️ Policy Deployment Engine: `sql_source_representation_instance`

This section provides a concise policy evaluation for the `sql_source_representation_instance` resource in GCP.

Reference: [Terraform Registry – sql_source_representation_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_source_representation_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the source representation instance. Use any valid Cloud SQL instance name. | true | None | None |
| `database_version` | The MySQL, PostgreSQL or SQL Server (beta) version to use. Supported values include MYSQL_5_6, MYSQL_5_7, MYSQL_8_0, MYSQL_8_4, POSTGRES_9_6, POSTGRES_10, POSTGRES_11, POSTGRES_12, POSTGRES_13, POSTGRES_14, POSTGRES_15, POSTGRES_16, POSTGRES_17. Database Version Policies includes an up-to-date reference of supported versions. | true | None | None |
| `host` | The IPv4 address and port for the external server, or the the DNS address for the external server. If the external server is hosted on Cloud SQL, the port is 5432. | true | None | None |
| `region` | The Region in which the created instance should reside. If it is not provided, the provider region is used. | false | None | None |
| `port` | The externally accessible port for the source database server. Defaults to 3306. | false | None | None |
| `username` | The replication user account on the external server. | false | None | None |
| `password` | The password for the replication user account. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `dump_file_path` | A file in the bucket that contains the data from the external server. | false | None | None |
| `ca_certificate` | The CA certificate on the external server. Include only if SSL/TLS is used on the external server. | false | None | None |
| `client_certificate` | The client certificate on the external server. Required only for server-client authentication. Include only if SSL/TLS is used on the external server. | false | None | None |
| `client_key` | The private key file for the client certificate on the external server. Required only for server-client authentication. Include only if SSL/TLS is used on the external server. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
