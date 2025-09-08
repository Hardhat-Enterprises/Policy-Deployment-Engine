## 🛡️ Policy Deployment Engine: `firebase_app_check_app_attest_config`

This section provides a concise policy evaluation for the `firebase_app_check_app_attest_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_app_attest_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_app_attest_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `app_id` | The ID of an [Apple App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.iosApps#IosApp.FIELDS.app_id). | true | None | None |
| `token_ttl` | Specifies the duration for which App Check tokens exchanged from App Attest artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
