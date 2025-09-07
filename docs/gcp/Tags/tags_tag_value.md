## 🛡️ Policy Deployment Engine: `tags_tag_value`

This section provides a concise policy evaluation for the `tags_tag_value` resource in GCP.

Reference: [Terraform Registry – tags_tag_value](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tags_tag_value)

---

## 1. Argument Reference

### `parent`
- Description: (Required) Input only. The resource name of the new TagValue's parent. Must be of the form tagKeys/{tag_key_id}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `short_name`
- Description: (Required) Input only. User-assigned short name for TagValue. The short name should be unique for TagValues within the same parent TagKey. The short name can have a maximum length of 256 characters. The permitted character set for the shortName includes all UTF-8 encoded Unicode characters except single quotes ('), double quotes ("), backslashes (\\), and forward slashes (/).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-assigned description of the TagValue. Must not exceed 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
