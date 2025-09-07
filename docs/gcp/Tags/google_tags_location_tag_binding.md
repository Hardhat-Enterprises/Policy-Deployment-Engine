## 🛡️ Policy Deployment Engine: `google_tags_location_tag_binding`

This section provides a concise policy evaluation for the `google_tags_location_tag_binding` resource in GCP.

Reference: [Terraform Registry – google_tags_location_tag_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_tags_location_tag_binding)

---

## 1. Argument Reference

### `parent`
- Description: (Required) The full resource name of the resource the TagValue is bound to. E.g. //cloudresourcemanager.googleapis.com/projects/123
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag_value`
- Description: (Required) The TagValue of the TagBinding. Must be of the form tagValues/456.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location of the target resource. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
