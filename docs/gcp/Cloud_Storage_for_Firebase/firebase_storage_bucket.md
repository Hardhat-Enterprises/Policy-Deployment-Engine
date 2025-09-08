## 🛡️ Policy Deployment Engine: `firebase_storage_bucket`

This section provides a concise policy evaluation for the `firebase_storage_bucket` resource in GCP.

Reference: [Terraform Registry – firebase_storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_storage_bucket)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_id` | Required. Immutable. The ID of the underlying Google Cloud Storage bucket | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
