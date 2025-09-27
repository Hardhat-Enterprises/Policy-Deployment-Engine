## 🛡️ Policy Deployment Engine: `firebase_app_check_play_integrity_config`

This section provides a concise policy evaluation for the `firebase_app_check_play_integrity_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_play_integrity_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_play_integrity_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `app_id` | The ID of an [Android App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.androidApps#AndroidApp.FIELDS.app_id). | true | false | None | None | None |
| `token_ttl` | Specifies the duration for which App Check tokens exchanged from Play Integrity artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | true | A shorter token TTL (Time-To-Live) reduces the window of opportunity for an attacker to replay an intercepted token. While the App Check SDK handles token refreshes, a shorter TTL enhances security. However, it should be balanced with performance considerations to avoid excessive refresh requests. | 3600s | 604800s |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
