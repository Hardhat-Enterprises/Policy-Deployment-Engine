## 🛡️ Policy Deployment Engine: `tags_tag_value`

This section provides a concise policy evaluation for the `tags_tag_value` resource in GCP.

Reference: [Terraform Registry – tags_tag_value](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tags_tag_value)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | Input only. The resource name of the new TagValue's parent. Must be of the form tagKeys/{tag_key_id}. | true | None | None |
| `short_name` | Input only. User-assigned short name for TagValue. The short name should be unique for TagValues within the same parent TagKey. The short name can have a maximum length of 256 characters. The permitted character set for the shortName includes all UTF-8 encoded Unicode characters except single quotes ('), double quotes ("), backslashes (\\), and forward slashes (/). | true | None | None |
| `description` | User-assigned description of the TagValue. Must not exceed 256 characters. | false | None | None |
