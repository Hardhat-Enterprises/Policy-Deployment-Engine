## 🛡️ Policy Deployment Engine: `tags_tag_key`

This section provides a concise policy evaluation for the `tags_tag_key` resource in GCP.

Reference: [Terraform Registry – tags_tag_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tags_tag_key)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | Input only. The resource name of the new TagKey's parent. Must be of the form organizations/{org_id} or projects/{project_id_or_number}. | true | None | None |
| `short_name` | Input only. The user friendly name for a TagKey. The short name should be unique for TagKeys within the same tag namespace. The short name can have a maximum length of 256 characters. The permitted character set for the shortName includes all UTF-8 encoded Unicode characters except single quotes ('), double quotes ("), backslashes (\\), and forward slashes (/). | true | None | None |
| `description` | User-assigned description of the TagKey. Must not exceed 256 characters. | false | None | None |
| `purpose` | Optional. A purpose cannot be changed once set. A purpose denotes that this Tag is intended for use in policies of a specific policy engine, and will involve that policy engine in management operations involving this Tag. Possible values are: `GCE_FIREWALL`. | false | None | None |
| `purpose_data` | Optional. Purpose data cannot be changed once set. Purpose data corresponds to the policy system that the tag is intended for. For example, the GCE_FIREWALL purpose expects data in the following format: `network = "<project-name>/<vpc-name>"`. | false | None | None |
