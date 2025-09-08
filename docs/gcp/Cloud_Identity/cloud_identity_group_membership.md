## 🛡️ Policy Deployment Engine: `cloud_identity_group_membership`

This section provides a concise policy evaluation for the `cloud_identity_group_membership` resource in GCP.

Reference: [Terraform Registry – cloud_identity_group_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_identity_group_membership)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `group` | The name of the Group to create this membership in. | true | None | None |
| `create_ignore_already_exists` |  | none | None | None |

### roles Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the MembershipRole. Must be one of OWNER, MANAGER, MEMBER. Possible values are: `OWNER`, `MANAGER`, `MEMBER`. | true | None | None |
| `expiry_detail` | The MembershipRole expiry details, only supported for MEMBER role. Other roles cannot be accompanied with MEMBER role having expiry. Structure is [documented below](#nested_roles_roles_expiry_detail). | false | None | None |

### member_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | The ID of the entity. For Google-managed entities, the id must be the email address of an existing group or user. For external-identity-mapped entities, the id must be a string conforming to the Identity Source's requirements. Must be unique within a namespace. | true | None | None |
| `namespace` | The namespace in which the entity exists. If not specified, the EntityKey represents a Google-managed entity such as a Google user or a Google Group. If specified, the EntityKey represents an external-identity-mapped group. The namespace must correspond to an identity source created in Admin Console and must be in the form of `identitysources/{identity_source_id}`. | false | None | None |

### preferred_member_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | The ID of the entity. For Google-managed entities, the id must be the email address of an existing group or user. For external-identity-mapped entities, the id must be a string conforming to the Identity Source's requirements. Must be unique within a namespace. | true | None | None |
| `namespace` | The namespace in which the entity exists. If not specified, the EntityKey represents a Google-managed entity such as a Google user or a Google Group. If specified, the EntityKey represents an external-identity-mapped group. The namespace must correspond to an identity source created in Admin Console and must be in the form of `identitysources/{identity_source_id}`. | false | None | None |

### expiry_detail Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expire_time` | The time at which the MembershipRole will expire. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | true | None | None |
