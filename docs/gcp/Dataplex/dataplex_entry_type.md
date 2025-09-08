## 🛡️ Policy Deployment Engine: `dataplex_entry_type`

This section provides a concise policy evaluation for the `dataplex_entry_type` resource in GCP.

Reference: [Terraform Registry – dataplex_entry_type](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_entry_type)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | Description of the EntryType. | false | None | None |
| `display_name` | User friendly display name. | false | None | None |
| `labels` | User-defined labels for the EntryType. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `type_aliases` | Indicates the class this Entry Type belongs to, for example, TABLE, DATABASE, MODEL. | false | None | None |
| `platform` | The platform that Entries of this type belongs to. | false | None | None |
| `system` | The system that Entries of this type belongs to. | false | None | None |
| `location` | The location where entry type will be created in. | false | None | None |
| `entry_type_id` | The entry type id of the entry type. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### required_aspects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Required aspect type for the entry type. | false | None | None |
