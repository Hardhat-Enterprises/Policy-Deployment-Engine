## 🛡️ Policy Deployment Engine: `app_engine_application`

This section provides a concise policy evaluation for the `app_engine_application` resource in GCP.

Reference: [Terraform Registry – app_engine_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | ~>**NOTE:** GCP only accepts project ID, not project number. If you are using number, you may get a "Permission denied" error. | true | true | To enforce the use of Project IDs over Project Numbers to prevent API resolution failures and (Permission Denied) errors during deployment. | gcp-project-12345 | 123456789 |
| `location_id` | The location to serve the app from. | true | true | To esnure data residency compliance, prevents deployment to unauthorized regions, as App Engine locations cannot be changed once set. | australia-southeast1 | europe-west1 |
| `auth_domain` | The domain to authenticate users with when using App Engine's User API. | false | false | Modern identity management is handled via Identity-Aware Proxy IAP), making the legacy domain setting redundant for security enforcement. | None | None |
| `database_type` | Can be `CLOUD_FIRESTORE` or `CLOUD_DATASTORE_COMPATIBILITY` for new instances.  To support old instances, the value `CLOUD_DATASTORE` is accepted by the provider, but will be rejected by the API. To create a Cloud Firestore database without creating an App Engine application, use the [`google_firestore_database`](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_database) resource instead. | false | true | To enforce the selection of Cloud Firestore so the application uses Google's latest scalable database technology with modern security and consistency features. | CLOUD_FIRESTORE | CLOUD_DATASTORE_COMPATIBILITY |
| `serving_status` | The serving status of the app. | false | true | Ensures applications are deployed in an active state and prevents accidental service outages caused by manual or uncoordinated status overrides. | SERVING | USER_DISABLED |
| `feature_settings` | A block of optional settings to configure specific App Engine features: | false | true | to enforce the use of modern split health checks to ensure precise monitoring of application readiness and liveness, replacing legacy combined health checks. | None | None |
| `split_health_checks` | Set to false to use the legacy health check instead of the readiness and liveness checks. | true | true | Enables the separation of readiness and liveness probes to improve deployment reliability and prevent traffic from being routed to instances that are still initializing. | split_health_checks = true | split_health_checks = false |
| `iap` | Settings for enabling Cloud Identity Aware Proxy | false | true | Enforces Identity-Aware Proxy to establish a Zero Trust security layer, ensuring that only authenticated and authorized users can access the application, regardless of network location. | None | None |
| `oauth2_client_id` | OAuth2 client ID to use for the authentication flow. | true | true | Mandates a valid OAuth2 Client ID to securely link the IAP to the organization's identity provider, ensuring only verified corporate credentials can grant access. | 12345.apps.googleusercontent.com | incorrect-id.apps.googleusercontent.com |
| `oauth2_client_secret` | OAuth2 client secret to use for the authentication flow. The SHA-256 hash of the value is returned in the oauth2ClientSecretSha256 field. | true | true | Ensures the authenticity of the handshake between Google Cloud and the Identity Provider to prevent man-in-the-middle attacks/unauthorized identity spoofing. | GOCSPX-abc123def456_actual_secret | 12345 |
| `ssl_policy` | A list of the SSL policy that will be applied. Each block has a SSL_POLICY_UNSPECIFIED, DEFAULT, and MODERN field. | false | true | To enforce secure managed SSL certificates to ensure all data in transit is encrypted using modern protocols and to prevent service outages caused by manual certificate expiration. | AUTOMATIC | MANUAL |
