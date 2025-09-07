## 🛡️ Policy Deployment Engine: `cloud_identity_group_membership`

This section provides a concise policy evaluation for the `cloud_identity_group_membership` resource in GCP.

Reference: [Terraform Registry – cloud_identity_group_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_identity_group_membership)

---

## 1. Argument Reference

### `roles`
- Description: (Required) The MembershipRoles that apply to the Membership. Must not contain duplicate MembershipRoles with the same name. Structure is [documented below](#nested_roles).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group`
- Description: (Required) The name of the Group to create this membership in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `member_key`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) EntityKey of the member. Structure is [documented below](#nested_member_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preferred_member_key`
- Description: (Optional) EntityKey of the member. Structure is [documented below](#nested_preferred_member_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_ignore_already_exists`
- Description: <a name="nested_roles"></a>The `roles` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the MembershipRole. Must be one of OWNER, MANAGER, MEMBER. Possible values are: `OWNER`, `MANAGER`, `MEMBER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiry_detail`
- Description: (Optional) The MembershipRole expiry details, only supported for MEMBER role. Other roles cannot be accompanied with MEMBER role having expiry. Structure is [documented below](#nested_roles_roles_expiry_detail). <a name="nested_roles_roles_expiry_detail"></a>The `expiry_detail` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expire_time`
- Description: (Required) The time at which the MembershipRole will expire. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". <a name="nested_member_key"></a>The `member_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) The ID of the entity. For Google-managed entities, the id must be the email address of an existing group or user. For external-identity-mapped entities, the id must be a string conforming to the Identity Source's requirements. Must be unique within a namespace.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Optional) The namespace in which the entity exists. If not specified, the EntityKey represents a Google-managed entity such as a Google user or a Google Group. If specified, the EntityKey represents an external-identity-mapped group. The namespace must correspond to an identity source created in Admin Console and must be in the form of `identitysources/{identity_source_id}`. <a name="nested_preferred_member_key"></a>The `preferred_member_key` block supports:
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
