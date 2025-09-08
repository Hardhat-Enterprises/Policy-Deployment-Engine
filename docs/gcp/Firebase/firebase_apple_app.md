## 🛡️ Policy Deployment Engine: `firebase_apple_app`

This section provides a concise policy evaluation for the `firebase_apple_app` resource in GCP.

Reference: [Terraform Registry – firebase_apple_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_apple_app)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The user-assigned display name of the App. | true | None | None |
| `bundle_id` | The canonical bundle ID of the Apple app as it would appear in the Apple AppStore. | true | None | None |
| `app_store_id` | The automatically generated Apple ID assigned to the Apple app by Apple in the Apple App Store. | false | None | None |
| `team_id` | The Apple Developer Team ID associated with the App in the App Store. | false | None | None |
| `api_key_id` | The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the AppleApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the AppleApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` | rather than deleted upon `terraform destroy`. This is useful because the Apple may be serving traffic. Set to `DELETE` to delete the Apple. Defaults to `DELETE`. | none | None | None |
