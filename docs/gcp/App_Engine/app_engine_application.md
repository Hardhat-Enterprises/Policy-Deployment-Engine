## 🛡️ Policy Deployment Engine: `app_engine_application`

This section provides a concise policy evaluation for the `app_engine_application` resource in GCP.

Reference: [Terraform Registry – app_engine_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application)

---

## 1. Argument Reference

### `project`
- Description: ~>**NOTE:** GCP only accepts project ID, not project number. If you are using number, you may get a "Permission denied" error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location_id`
- Description: to serve the app from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_domain`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_type`
- Description: Can be `CLOUD_FIRESTORE` or `CLOUD_DATASTORE_COMPATIBILITY` for new instances.  To support old instances, the value `CLOUD_DATASTORE` is accepted by the provider, but will be rejected by the API. To create a Cloud Firestore database without creating an App Engine application, use the [`google_firestore_database`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_database) resource instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serving_status`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `feature_settings`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `split_health_checks`
- Description: and liveness checks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `iap`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_secret`
- Description: The SHA-256 hash of the value is returned in the oauth2ClientSecretSha256 field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
