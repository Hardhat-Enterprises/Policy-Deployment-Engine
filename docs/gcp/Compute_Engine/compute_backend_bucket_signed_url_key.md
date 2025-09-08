## 🛡️ Policy Deployment Engine: `compute_backend_bucket_signed_url_key`

This section provides a concise policy evaluation for the `compute_backend_bucket_signed_url_key` resource in GCP.

Reference: [Terraform Registry – compute_backend_bucket_signed_url_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_bucket_signed_url_key)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the signed URL key. | true | None | None |
| `key_value` | 128-bit key value used for signing the URL. The key value must be a valid RFC 4648 Section 5 base64url encoded string. **Note**: This property is sensitive and will not be displayed in the plan. | true | None | None |
| `backend_bucket` | The backend bucket this signed URL key belongs. | true | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
