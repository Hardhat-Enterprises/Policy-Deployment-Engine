## 🛡️ Policy Deployment Engine: `firebase_app_check_recaptcha_v3_config`

This section provides a concise policy evaluation for the `firebase_app_check_recaptcha_v3_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_recaptcha_v3_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_recaptcha_v3_config)

---

## 1. Argument Reference

### `site_secret`
- Description: (Required) The site secret used to identify your service for reCAPTCHA v3 verification. For security reasons, this field will never be populated in any response. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_id`
- Description: (Required) The ID of an [Web App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.webApps#WebApp.FIELDS.app_id).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_ttl`
- Description: (Optional) Specifies the duration for which App Check tokens exchanged from reCAPTCHA V3 artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
