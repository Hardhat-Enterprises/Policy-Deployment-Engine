## 🛡️ Policy Deployment Engine: `sql_ssl_cert`

This section provides a concise policy evaluation for the `sql_ssl_cert` resource in GCP.

Reference: [Terraform Registry – sql_ssl_cert](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_ssl_cert)

---

## 1. Argument Reference

### `instance`
- Description: forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `common_name`
- Description: client. Constrained to [a-zA-Z.-_ ]+. Changing this forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
