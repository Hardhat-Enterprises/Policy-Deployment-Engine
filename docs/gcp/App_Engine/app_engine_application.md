## 🛡️ Policy Deployment Engine: `app_engine_application`

This section provides a concise policy evaluation for the `app_engine_application` resource in GCP.

Reference: [Terraform Registry – app_engine_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project` | ~>**NOTE:** GCP only accepts project ID, not project number. If you are using number, you may get a "Permission denied" error. | none | None | None |
| `location_id` | to serve the app from. | none | None | None |
| `auth_domain` |  | none | None | None |
| `database_type` | Can be `CLOUD_FIRESTORE` or `CLOUD_DATASTORE_COMPATIBILITY` for new instances.  To support old instances, the value `CLOUD_DATASTORE` is accepted by the provider, but will be rejected by the API. To create a Cloud Firestore database without creating an App Engine application, use the [`google_firestore_database`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_database) resource instead. | none | None | None |
| `serving_status` |  | none | None | None |
| `feature_settings` |  | none | None | None |
| `split_health_checks` | and liveness checks. | none | None | None |
| `iap` |  | none | None | None |
| `oauth2_client_id` |  | none | None | None |
| `oauth2_client_secret` | The SHA-256 hash of the value is returned in the oauth2ClientSecretSha256 field. | none | None | None |
