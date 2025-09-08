## 🛡️ Policy Deployment Engine: `firebase_android_app`

This section provides a concise policy evaluation for the `firebase_android_app` resource in GCP.

Reference: [Terraform Registry – firebase_android_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_android_app)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The user-assigned display name of the AndroidApp. | true | None | None |
| `package_name` | The canonical package name of the Android app as would appear in the Google Play Developer Console. | true | None | None |
| `sha1_hashes` | The SHA1 certificate hashes for the AndroidApp. | false | None | None |
| `sha256_hashes` | The SHA256 certificate hashes for the AndroidApp. | false | None | None |
| `api_key_id` | The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the AndroidApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the AndroidApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` | rather than deleted upon `terraform destroy`. This is useful because the AndroidApp may be serving traffic. Set to `DELETE` to delete the AndroidApp. Defaults to `DELETE`. | none | None | None |
