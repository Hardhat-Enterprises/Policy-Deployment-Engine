## 🛡️ Policy Deployment Engine: `firebase_apple_app`

This section provides a concise policy evaluation for the `firebase_apple_app` resource in GCP.

Reference: [Terraform Registry – firebase_apple_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_apple_app)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The user-assigned display name of the App. | true | false | Display name is only a user-friendly identifier and does not expose sensitive data or impact the security of the application or its resources. | None | None |
| `bundle_id` | The canonical bundle ID of the Apple app as it would appear in the Apple AppStore. | true | false | The bundle ID uniquely identifies the app within Apple's ecosystem. It does not expose sensitive information or introduce security risks by itself | None | None |
| `app_store_id` | The automatically generated Apple ID assigned to the Apple app by Apple in the Apple App Store. | false | false | The App Store ID is an identifier provided by Apple for marketplace purposes. It does not affect access control, authentication, or data security. | None | None |
| `team_id` | The Apple Developer Team ID associated with the App in the App Store. | false | false | The team ID is used to associate the app with a developer account in Apple’s ecosystem. It does not pose a direct security risk as it is an identifier only. | None | None |
| `api_key_id` | The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the AppleApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the AppleApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned. | false | false | The api_key_id is a reference to the API key rather than the key itself. Since it does not expose the secret value, it carries no direct security impact. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The project field is used to group resources under a Firebase/Google Cloud project. Security is determined by project-level IAM and policies, not by this attribute itself. | None | None |
| `deletion_policy` | rather than deleted upon `terraform destroy`. This is useful because the Apple may be serving traffic. Set to `DELETE` to delete the Apple. Defaults to `DELETE`. | false | true | If 'deletion_policy' is set to 'ABANDON', the Apple app resource and its metadata may remain undeleted, leading to compliance issues, residual data exposure, or orphaned resources. To ensure proper lifecycle management and compliance, the deletion_policy should be set to 'DELETE'. | DELETE | ABANDON |
