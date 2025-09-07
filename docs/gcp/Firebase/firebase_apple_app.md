## 🛡️ Policy Deployment Engine: `firebase_apple_app`

This section provides a concise policy evaluation for the `firebase_apple_app` resource in GCP.

Reference: [Terraform Registry – firebase_apple_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_apple_app)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The user-assigned display name of the App.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bundle_id`
- Description: (Required) The canonical bundle ID of the Apple app as it would appear in the Apple AppStore.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_store_id`
- Description: (Optional) The automatically generated Apple ID assigned to the Apple app by Apple in the Apple App Store.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `team_id`
- Description: (Optional) The Apple Developer Team ID associated with the App in the App Store.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key_id`
- Description: (Optional) The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the AppleApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the AppleApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: rather than deleted upon `terraform destroy`. This is useful because the Apple may be serving traffic. Set to `DELETE` to delete the Apple. Defaults to `DELETE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
