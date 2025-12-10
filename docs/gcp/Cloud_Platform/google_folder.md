## 🛡️ Policy Deployment Engine: `google_folder`

This section provides a concise policy evaluation for the `google_folder` resource in GCP.

Reference: [Terraform Registry – google_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | A folder’s display name must be unique amongst its siblings, e.g. no two folders with the same parent can share the same display name. The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores and can be no longer than 30 characters. | true | false | Display name is a label for identification, no impact on security. | None | None |
| `parent` | Must be of the form `folders/{folder_id}` or `organizations/{org_id}`. | true | false | Defines organisational hierarchy, not directly related to security. | None | None |
| `deletion_protection` | Whether Terraform will be prevented from destroying or recreating the Folder. When the field is set to true or unset in Terraform state, a terraform apply or terraform destroy that would delete the folder will fail. When the field is set to false, deleting the folder is allowed. Default value is true. | false | true | Prevents accidental or unauthorised deletion of critical folders, which could impact availability and access security | deletion_protection = true | deletion_protection = false |
| `tags` | A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. The field is ignored when empty. The field is immutable and causes resource replacement when mutated. This field is only set at create time and modifying this field after creation will trigger recreation. To apply tags to an existing resource, see the google_tags_tag_value resource. | false | false | Tags are primarily for governance and policy-based organisation. They do not directly enforce security | None | None |
