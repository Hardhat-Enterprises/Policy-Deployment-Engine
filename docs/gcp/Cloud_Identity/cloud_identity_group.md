---
noteId: "724bd4904dce11f190953b90f7cd7f69"
tags: []

---

## 🛡️ Policy Deployment Engine: `cloud_identity_group`

This section provides a concise policy evaluation for the `cloud_identity_group` resource in GCP.

Reference: [Terraform Registry – google_cloud_identity_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_identity_group)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `group_key` | EntityKey of the Group. Structure is [documented below](#nested_group_key). | true | false | Identifies the group entity and is required for resource creation, but it does not directly enforce a security control. | Refer to child argument | Refer to child argument |
| `parent` | The resource name of the entity under which this Group resides in the Cloud Identity resource hierarchy. Must be of the form `identitysources/{identity_source_id}` for external-identity-mapped groups or `customers/{customer_id}` for Google Groups. | true | false | It defines where the group lives in the Cloud Identity hierarchy and is required for correct resource placement, but it is not itself a security control. | `customers/my_customer` | Empty or null |
| `labels` | One or more label entries that apply to the Group. Currently supported labels contain a key with an empty value. | true | true | Labels determine the group type and classification. Missing required labels can create governance and access-control issues. | `{ "cloudidentity.googleapis.com/groups.discussion_forum": "" }` | Empty or missing labels |
| `display_name` | The display name of the Group. | false | false | Display name is used for identification and user experience. It does not directly control access or security behavior. | Any non-empty string | Empty or null |
| `description` | An extended description to help users determine the purpose of a Group. Must not be longer than 4,096 characters. | false | false | This is descriptive metadata and does not directly affect security enforcement. | Any valid string | Over 4096 characters |
| `initial_group_config` | The initial configuration options for creating a Group. Possible values are: `INITIAL_GROUP_CONFIG_UNSPECIFIED`, `WITH_INITIAL_OWNER`, `EMPTY`. | false | false | This config controls the initial setup state of the group and does not directly enforce a security control. | `EMPTY` | Invalid enum value |

### group_key Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | The ID of the entity. For Google-managed entities, the id must be the email address of an existing group or user. For external-identity-mapped entities, the id must be a string conforming to the Identity Source's requirements. Must be unique within a namespace. | true | false | The identifier is required to create the group entity, but it does not directly enforce a security control. | `group@example.com` | Empty or null |
| `namespace` | The namespace in which the entity exists. If not specified, the EntityKey represents a Google-managed entity such as a Google user or a Google Group. If specified, the EntityKey represents an external-identity-mapped group. The namespace must correspond to an identity source created in Admin Console and must be in the form of `identitysources/{identity_source_id}`. | false | false | Namespace is an identity-scoping setting and does not directly affect access or security posture. | `identitysources/1234567890` | Invalid namespace format |

---

## Policies

### Mandatory `env` label

- **Description:** Ensure every `google_cloud_identity_group` has an `env` label to support environment-based governance.
- **Rationale:** Labels provide important operational metadata used for routing, billing, and access controls. Requiring `env` helps teams consistently classify groups.
- **Compliant example:** group contains `labels = { env = "prod" }` (see inputs/gcp/cloud_identity/google_cloud_identity_group/labels/c.tf)
- **Non-compliant example:** group missing `labels` or missing `env` key (see inputs/gcp/cloud_identity/google_cloud_identity_group/labels/nc.tf)

### Mandatory `discussion_forum` label format

- **Description:** Ensure every `google_cloud_identity_group` defines `labels["cloudidentity.googleapis.com/groups.discussion_forum"]` as an empty string.
- **Rationale:** This label is the expected Cloud Identity group type label and should be explicitly set in a valid and consistent format.
- **Compliant example:** `labels = { "cloudidentity.googleapis.com/groups.discussion_forum" = "" }` (see inputs/gcp/cloud_identity/google_cloud_identity_group/labels/c.tf)
- **Non-compliant example:** `labels = { "cloudidentity.googleapis.com/groups.discussion_forum" = "not-empty" }` (see inputs/gcp/cloud_identity/google_cloud_identity_group/labels/nc.tf)
