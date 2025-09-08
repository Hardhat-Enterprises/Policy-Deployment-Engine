## 🛡️ Policy Deployment Engine: `dataplex_entry`

This section provides a concise policy evaluation for the `dataplex_entry` resource in GCP.

Reference: [Terraform Registry – dataplex_entry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_entry)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `entry_type` | The relative resource name of the entry type that was used to create this entry, in the format projects/{project_number}/locations/{locationId}/entryTypes/{entryTypeId}. | true | None | None |
| `parent_entry` | The resource name of the parent entry, in the format projects/{project_number}/locations/{locationId}/entryGroups/{entryGroupId}/entries/{entryId}. | false | None | None |
| `fully_qualified_name` | A name for the entry that can be referenced by an external system. For more information, see https://cloud.google.com/dataplex/docs/fully-qualified-names. The maximum size of the field is 4000 characters. | false | None | None |
| `location` | The location where entry will be created. | false | None | None |
| `entry_group_id` | The entry group id of the entry group the entry will be created in. | false | None | None |
| `entry_id` | The entry id of the entry. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### aspects Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `aspect_key` | Depending on how the aspect is attached to the entry, the format of the aspect key can be one of the following: If the aspect is attached directly to the entry: {project_number}.{locationId}.{aspectTypeId} If the aspect is attached to an entry's path: {project_number}.{locationId}.{aspectTypeId}@{path} | true | None | None |
| `aspect` | A nested object resource. Structure is [documented below](#nested_aspects_aspects_aspect). | true | None | None |

### entry_source Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource` | The name of the resource in the source system. Maximum length is 4,000 characters. | false | None | None |
| `system` | The name of the source system. Maximum length is 64 characters. | false | None | None |
| `platform` | The platform containing the source system. Maximum length is 64 characters. | false | None | None |
| `display_name` | A user-friendly display name. Maximum length is 500 characters. | false | None | None |
| `description` | A description of the data resource. Maximum length is 2,000 characters. | false | None | None |
| `labels` | User-defined labels. The maximum size of keys and values is 128 characters each. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |
| `ancestors` | Structure is [documented below](#nested_entry_source_ancestors). | false | None | None |
| `create_time` | The time when the resource was created in the source system. | false | None | None |
| `update_time` | The time when the resource was last updated in the source system. If the entry exists in the system and its EntrySource has updateTime populated, further updates to the EntrySource of the entry must provide incremental updates to its updateTime. | false | None | None |
| `location` | (Output) Location of the resource in the source system. You can search the entry by this location. By default, this should match the location of the entry group containing this entry. A different value allows capturing the source location for data external to Google Cloud. | none | None | None |

### aspect Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `aspect_type` | (Output) The resource name of the type used to create this Aspect. | none | None | None |
| `path` | (Output) The path in the entry under which the aspect is attached. | none | None | None |
| `create_time` | (Output) The time when the Aspect was created. | none | None | None |
| `update_time` | (Output) The time when the Aspect was last modified. | none | None | None |
| `data` | The content of the aspect in JSON form, according to its aspect type schema. The maximum size of the field is 120KB (encoded as UTF-8). | true | None | None |

### ancestors Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the ancestor resource. | false | None | None |
| `type` | The type of the ancestor resource. | false | None | None |
