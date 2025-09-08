## 🛡️ Policy Deployment Engine: `storage_hmac_key`

This section provides a concise policy evaluation for the `storage_hmac_key` resource in GCP.

Reference: [Terraform Registry – storage_hmac_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_hmac_key)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account_email` | The email address of the key's associated service account. | true | None | None |
| `state` | The state of the key. Can be set to one of ACTIVE, INACTIVE. Default value is `ACTIVE`. Possible values are: `ACTIVE`, `INACTIVE`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
