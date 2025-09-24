## 🛡️ Policy Deployment Engine: `app_engine_application`

This section provides a concise policy evaluation for the `app_engine_application` resource in GCP.

Reference: [Terraform Registry – app_engine_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | GCP only accepts project ID, not project number. If you are using number, you may get a "Permission denied" error. | true | false | Enforcing correct project IDs ensures the resource is deployed in the intended secure environment. | Project is set to a valid project ID (e.g., my-secure-project). | Project is set to a numeric project number or left unset. |
| `location_id` | Location where the app is served from. | true | false | Restricting location ensures data remains in approved regions. | Location is set to an approved region (e.g., australia-southeast1). | Location is left unset or uses a disallowed region. |
| `auth_domain` | Google Apps domain where users must belong to in order to access the app. | false | false | Restricting authentication to trusted domains enforces organizational boundaries. | auth_domain is set to company.com. | auth_domain is unset or set to a broad/unrestricted domain. |
| `database_type` | Database type for App Engine (Firestore or Datastore). | true | false | Enforce use of modern and supported database types like Firestore for reliability and security. | database_type = CLOUD_FIRESTORE. | database_type = CLOUD_DATASTORE (legacy) or unset. |
| `serving_status` | Whether the app is serving or disabled. | false | false | Disable unused applications to reduce attack surface. | serving_status = SERVING only when app is active. | serving_status = SERVING for unused or test apps. |
| `feature_settings` | Optional feature settings. | false | false | Explicit feature configuration ensures secure defaults. | feature_settings configured for security best practices. | feature_settings left empty or insecurely configured. |
| `split_health_checks` | Enables split health checks (readiness and liveness checks). | false | false | Health checks are needed for resilience and secure operations. | split_health_checks = true. | split_health_checks = false or unset. |
| `iap` | Identity-Aware Proxy configuration for App Engine. | false | false | Enforcing IAP ensures only authenticated and authorized users can access sensitive apps. | iap block is configured with client_id and secret. | iap is not configured on sensitive apps. |
| `oauth2_client_id` | OAuth2 client ID for IAP. | false | false | Enforce valid OAuth2 identity provider integration. | oauth2_client_id references a valid and secure client ID. | oauth2_client_id is unset or invalid. |
| `oauth2_client_secret` | The SHA-256 hash of the client secret. | false | false | Secrets must be hashed and stored securely. | oauth2_client_secret is stored as a hashed value. | oauth2_client_secret is stored in plain text or unset. |
