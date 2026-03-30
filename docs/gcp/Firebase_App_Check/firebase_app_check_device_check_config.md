## 🛡️ Policy Deployment Engine: `firebase_app_check_device_check_config`

This section provides a concise policy evaluation for the `firebase_app_check_device_check_config` resource in GCP.

Reference: [Terraform Registry – firebase_app_check_device_check_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_app_check_device_check_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key_id` | The key identifier of a private key enabled with DeviceCheck, created in your Apple Developer account. | true | false | The key_id is only an identifier and does not contain the private key material. It does not expose sensitive data directly. | None | None |
| `private_key` | The contents of the private key (.p8) file associated with the key specified by keyId. **Note**: This property is sensitive and will not be displayed in the plan. | true | true | Hardcoding the DeviceCheck private key in Terraform exposes it to version control and anyone with access to the state file. The private key must be stored in Secret Manager and referenced via 'projects/<project>/secrets/<secret>' to ensure it is centrally managed and access-controlled. | projects/my-project/secrets/my-devicecheck-key | MIIEvAIBADANBgkqhkiG9w0BAQEFAASC... |
| `app_id` | The ID of an [Apple App](https://firebase.google.com/docs/reference/firebase-management/rest/v1beta1/projects.iosApps#IosApp.FIELDS.app_id). | true | false | The app_id is a public identifier used to associate the configuration with an app. It does not expose sensitive data. | None | None |
| `token_ttl` | Specifies the duration for which App Check tokens exchanged from DeviceCheck artifacts will be valid. If unset, a default value of 1 hour is assumed. Must be between 30 minutes and 7 days, inclusive. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | true | App Check tokens are bearer tokens. A long TTL widens the window of opportunity for an intercepted token to be replayed by an attacker. Limiting the TTL to a maximum of 86400s (24 hours) constrains this replay attack window to an operationally acceptable duration. | 3600s | 604800s |
| `project` | If it is not provided, the provider project is used. | false | false | The project field is used only for resource scoping and does not expose sensitive data or affect security posture directly. | None | None |
