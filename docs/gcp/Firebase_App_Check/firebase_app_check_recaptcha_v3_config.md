## 🛡️ Policy Deployment Engine: `firebase_app_check_recaptcha_v3_config`

This section provides a concise policy evaluation for the `firebase_app_check_recaptcha_v3_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_recaptcha_v3_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_recaptcha_v3_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `site_secret` | The site secret used to identify your service for reCAPTCHA v3 verification. For security reasons, this field will never be populated in any response. **Note**: This property is sensitive and will not be displayed in the plan. | true | true | Using an unrestricted API key for reCAPTCHA v3 increases the risk of key leakage and abuse. The key should be restricted to prevent unauthorized use. | restricted-api-key-12345 | unrestricted-api-key-12345 |
| `app_id` | The ID of an [Web App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.webApps#WebApp.FIELDS.app_id). | true | false | None | None | None |
| `token_ttl` | Specifies the duration for which App Check tokens exchanged from reCAPTCHA V3 artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
