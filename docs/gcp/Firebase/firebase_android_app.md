## 🛡️ Policy Deployment Engine: `firebase_android_app`

This section provides a concise policy evaluation for the `firebase_android_app` resource in GCP.

Reference: [Terraform Registry – firebase_android_app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_android_app)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The user-assigned display name of the AndroidApp.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `package_name`
- Description: (Required) The canonical package name of the Android app as would appear in the Google Play Developer Console.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha1_hashes`
- Description: (Optional) The SHA1 certificate hashes for the AndroidApp.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha256_hashes`
- Description: (Optional) The SHA256 certificate hashes for the AndroidApp.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key_id`
- Description: (Optional) The globally unique, Google-assigned identifier (UID) for the Firebase API key associated with the AndroidApp. If apiKeyId is not set during creation, then Firebase automatically associates an apiKeyId with the AndroidApp. This auto-associated key may be an existing valid key or, if no valid key exists, a new one will be provisioned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: rather than deleted upon `terraform destroy`. This is useful because the AndroidApp may be serving traffic. Set to `DELETE` to delete the AndroidApp. Defaults to `DELETE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
