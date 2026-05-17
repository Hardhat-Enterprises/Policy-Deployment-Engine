## 🛡️ Policy Deployment Engine: `firebase_storage_bucket`

This section provides a concise policy evaluation for the `firebase_storage_bucket` resource in GCP.

Reference: [Terraform Registry – firebase_storage_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_storage_bucket)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_id` | Required. Immutable. The ID of the underlying Google Cloud Storage bucket | true | false | Identifies the storage bucket used by Firebase. | test_bucket_c | test_bucket_nc |
| `project` | If it is not provided, the provider project is used. | false | true | Ensures the resource is deployed in an approved and secure project environment. | 83797152308 | my-project-name |
