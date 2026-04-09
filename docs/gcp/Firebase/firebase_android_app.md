## 🛡️ Policy Deployment Engine: `firebase_android_app`

This section provides a concise policy evaluation for the `firebase_android_app` resource in GCP.

Reference: [Terraform Registry – firebase_android_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_android_app)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The user-assigned display name of the AndroidApp. | true | false | Display Name has no impact on the security of the resource or data contained. | None | None |
| `package_name` | The canonical package name of the Android app as would appear in the Google Play Developer Console. | true | false | The package name is only used for uniquely identifying the application within Google Play and Firebase. It does not expose sensitive data or affect security posture. | None | None |
| `sha1_hashes` | The SHA1 certificate hashes for the AndroidApp. | false | false | SHA1 hashes are primarily used for backward compatibility in authenticating the app to Firebase. They do not directly expose sensitive data but are less secure than SHA256 and should only be used when necessary. | None | None |
| `sha256_hashes` | The SHA256 certificate hashes for the AndroidApp. | false | false | SHA256 hashes provide a stronger cryptographic binding between the app and Firebase services compared to SHA1. They do not expose sensitive data but enhance application verification. | None | None |
| `api_key_id` | The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the AndroidApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the AndroidApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned. | false | false | The api_key_id is only an identifier and does not contain the actual API key value. It does not expose sensitive information or create direct security risks | None | None |
| `project` | The ID of the project in which the resource belongs.If it is not provided, the provider project is used. | false | false | Project ID is used only for resource organization and mapping. It does not pose a security risk as long as proper project-level IAM controls are in place | None | None |
| `deletion_policy` | rather than deleted upon `terraform destroy`. This is useful because the AndroidApp may be serving traffic. Set to `DELETE` to delete the AndroidApp. Defaults to `DELETE`. | false | true | Setting up the The Firebase android_app resource with 'deletion_policy' to 'ABANDON' may leave underlying configurations or metadata undeleted, leading to compliance risks, residual data exposure, or resource mismanagement. To enforce proper lifecycle management, the deletion_policy must be set to 'DELETE' | DELETE | ABANDON |
