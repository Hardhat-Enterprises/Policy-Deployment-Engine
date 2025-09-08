## 🛡️ Policy Deployment Engine: `logging_billing_account_bucket_config`

This section provides a concise policy evaluation for the `logging_billing_account_bucket_config` resource in GCP.

Reference: [Terraform Registry – logging_billing_account_bucket_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_billing_account_bucket_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `billing_account` |  | none | None | None |
| `location` |  | none | None | None |
| `bucket_id` |  | none | None | None |
| `description` |  | none | None | None |
| `retention_days` |  | none | None | None |

### index_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `field_path` | Note that some paths are automatically indexed, and other paths are not eligible for indexing. See [indexing documentation](https://cloud.google.com/logging/docs/analyze/custom-index) for details. | none | None | None |
| `type` |  | none | None | None |
