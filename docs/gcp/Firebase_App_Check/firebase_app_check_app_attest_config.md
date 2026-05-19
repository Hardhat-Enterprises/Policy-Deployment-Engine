## 🛡️ Policy Deployment Engine: `firebase_app_check_app_attest_config`

This section provides a concise policy evaluation for the `firebase_app_check_app_attest_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_app_attest_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_app_attest_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `app_id` | The ID of an [Apple App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.iosApps#IosApp.FIELDS.app_id). | true | false | None | None | None |
| `token_ttl` | Specifies the duration for which App Check tokens exchanged from App Attest artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | true | The Token TTL (Time To Live) defines the window of validity for an App Check token. A shorter TTL limits the replay window for intercepted tokens. 24 hours (86400s) is the maximum recommended duration to balance user experience and security. | 3600s | 86401s |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
