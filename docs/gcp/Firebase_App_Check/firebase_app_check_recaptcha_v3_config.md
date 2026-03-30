## 🛡️ Policy Deployment Engine: `firebase_app_check_recaptcha_v3_config`

This section provides a concise policy evaluation for the `firebase_app_check_recaptcha_v3_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_recaptcha_v3_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_recaptcha_v3_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `site_secret` | The site secret used to identify your service for reCAPTCHA v3 verification. For security reasons, this field will never be populated in any response. **Note**: This property is sensitive and will not be displayed in the plan. | true | true | Hardcoding the reCAPTCHA v3 site secret in Terraform exposes it to version control and anyone with access to the state file. The secret must be stored in Secret Manager and referenced via 'projects/<project>/secrets/<secret>' to ensure it is centrally managed and access-controlled. | projects/my-project/secrets/my-recaptcha-secret | unrestricted-api-key-54321 |
| `app_id` | The ID of an [Web App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.webApps#WebApp.FIELDS.app_id). | true | false | The app_id is a public identifier used to associate the configuration with an app. It does not expose sensitive data. | None | None |
| `token_ttl` | Specifies the duration for which App Check tokens exchanged from reCAPTCHA V3 artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | Token TTL for reCAPTCHA v3 is not a security-critical setting for this resource type. The default of 1 hour is generally appropriate. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The project field is used only for resource scoping and does not expose sensitive data or affect security posture directly. | None | None |
