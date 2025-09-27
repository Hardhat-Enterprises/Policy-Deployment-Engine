## 🛡️ Policy Deployment Engine: `firebase_app_check_device_check_config`

This section provides a concise policy evaluation for the `firebase_app_check_device_check_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_device_check_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_device_check_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key_id` | The key identifier of a private key enabled with DeviceCheck, created in your Apple Developer account. | true | true | The Key ID is a sensitive part of the DeviceCheck credential. It should be stored securely and not exposed. | loaded from a secret manager | hardcoded-key-id |
| `private_key` | The contents of the private key (.p8) file associated with the key specified by keyId. **Note**: This property is sensitive and will not be displayed in the plan. | true | true | The DeviceCheck private key is a sensitive credential used to attest to the authenticity of your app and device. It must be kept confidential to prevent unauthorized use. Hardcoding secrets increases the risk of exposure. | loaded from a secret manager, e.g., data.google_secret_manager_secret_version.device_check_private_key.secret_data | hardcoded private key |
| `app_id` | The ID of an [Apple App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.iosApps#IosApp.FIELDS.app_id). | true | false | None | None | None |
| `token_ttl` | Specifies the duration for which App Check tokens exchanged from DeviceCheck artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | true | A shorter token TTL (Time-To-Live) reduces the window of opportunity for an attacker to replay an intercepted token. While the App Check SDK handles token refreshes, a shorter TTL enhances security. However, it should be balanced with performance considerations to avoid excessive refresh requests. | 3600s | 604800s |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
