## 🛡️ Policy Deployment Engine: `google_tags_location_tag_binding`

This section provides a concise policy evaluation for the `google_tags_location_tag_binding` resource in GCP.

Reference: [Terraform Registry – google_tags_location_tag_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_tags_location_tag_binding)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The full resource name of the resource the TagValue is bound to. E.g. //cloudresourcemanager.googleapis.com/projects/123 | true | None | None |
| `tag_value` | The TagValue of the TagBinding. Must be of the form tagValues/456. | true | None | None |
| `location` | Location of the target resource. - - - | true | None | None |
