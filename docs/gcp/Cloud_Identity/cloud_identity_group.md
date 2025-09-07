## 🛡️ Policy Deployment Engine: `cloud_identity_group`

This section provides a concise policy evaluation for the `cloud_identity_group` resource in GCP.

Reference: [Terraform Registry – cloud_identity_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_identity_group)

---

## 1. Argument Reference

### `group_key`
- Description: (Required) EntityKey of the Group. Structure is [documented below](#nested_group_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The resource name of the entity under which this Group resides in the Cloud Identity resource hierarchy. Must be of the form identitysources/{identity_source_id} for external-identity-mapped groups or customers/{customer_id} for Google Groups.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Required) One or more label entries that apply to the Group. Currently supported labels contain a key with an empty value. Google Groups are the default type of group and have a label with a key of cloudidentity.googleapis.com/groups.discussion_forum and an empty value. Existing Google Groups can have an additional label with a key of cloudidentity.googleapis.com/groups.security and an empty value added to them. This is an immutable change and the security label cannot be removed once added. Dynamic groups have a label with a key of cloudidentity.googleapis.com/groups.dynamic. Identity-mapped groups for Cloud Search have a label with a key of system/groups/external and an empty value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) The display name of the Group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An extended description to help users determine the purpose of a Group. Must not be longer than 4,096 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_group_config`
- Description: (Optional) The initial configuration options for creating a Group. See the [API reference](https://cloud.google.com/identity/docs/reference/rest/v1beta1/groups/create#initialgroupconfig) for possible values. Default value is `EMPTY`. Possible values are: `INITIAL_GROUP_CONFIG_UNSPECIFIED`, `WITH_INITIAL_OWNER`, `EMPTY`. <a name="nested_group_key"></a>The `group_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) The ID of the entity. For Google-managed entities, the id must be the email address of an existing group or user. For external-identity-mapped entities, the id must be a string conforming to the Identity Source's requirements. Must be unique within a namespace.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Optional) The namespace in which the entity exists. If not specified, the EntityKey represents a Google-managed entity such as a Google user or a Google Group. If specified, the EntityKey represents an external-identity-mapped group. The namespace must correspond to an identity source created in Admin Console and must be in the form of `identitysources/{identity_source_id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
