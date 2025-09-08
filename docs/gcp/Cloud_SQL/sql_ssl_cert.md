## 🛡️ Policy Deployment Engine: `sql_ssl_cert`

This section provides a concise policy evaluation for the `sql_ssl_cert` resource in GCP.

Reference: [Terraform Registry – sql_ssl_cert](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_ssl_cert)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance` | forces a new resource to be created. | none | None | None |
| `common_name` | client. Constrained to [a-zA-Z.-_ ]+. Changing this forces a new resource to be created. | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
