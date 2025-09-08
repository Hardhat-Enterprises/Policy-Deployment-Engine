## 🛡️ Policy Deployment Engine: `firebase_app_check_recaptcha_enterprise_config`

This section provides a concise policy evaluation for the `firebase_app_check_recaptcha_enterprise_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_recaptcha_enterprise_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_recaptcha_enterprise_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `site_key` | The score-based site key created in reCAPTCHA Enterprise used to invoke reCAPTCHA and generate the reCAPTCHA tokens for your application. **Important**: This is not the siteSecret (as it is in reCAPTCHA v3), but rather your score-based reCAPTCHA Enterprise site key. | true | None | None |
| `app_id` | The ID of an [Web App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.webApps#WebApp.FIELDS.app_id). | true | None | None |
| `token_ttl` | Specifies the duration for which App Check tokens exchanged from reCAPTCHA Enterprise artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
