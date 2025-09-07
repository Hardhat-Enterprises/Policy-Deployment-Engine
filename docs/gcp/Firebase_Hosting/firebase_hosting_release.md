## 🛡️ Policy Deployment Engine: `firebase_hosting_release`

This section provides a concise policy evaluation for the `firebase_hosting_release` resource in GCP.

Reference: [Terraform Registry – firebase_hosting_release](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firebase_hosting_release)

---

## 1. Argument Reference

### `site_id`
- Description: (Required) Required. The ID of the site to which the release belongs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of the release; indicates what happened to the content of the site. There is no need to specify `DEPLOY` or `ROLLBACK` type if a `version_name` is provided. DEPLOY: A version was uploaded to Firebase Hosting and released. Output only. ROLLBACK: The release points back to a previously deployed version. Output only. SITE_DISABLE: The release prevents the site from serving content. Firebase Hosting acts as if the site never existed Possible values are: `DEPLOY`, `ROLLBACK`, `SITE_DISABLE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message`
- Description: (Optional) The deploy description when the release was created. The value can be up to 512 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `channel_id`
- Description: (Optional) The ID of the channel to which the release belongs. If not provided, the release will belong to the default "live" channel
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version_name`
- Description: (Optional) The unique identifier for a version, in the format: sites/SITE_ID/versions/VERSION_ID. The content of the version specified will be actively displayed on the appropriate URL. The Version must belong to the same site as in the `site_id`. This parameter must be empty if the `type` of the release is `SITE_DISABLE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
