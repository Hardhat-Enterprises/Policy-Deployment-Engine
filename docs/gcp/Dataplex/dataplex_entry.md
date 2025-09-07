## 🛡️ Policy Deployment Engine: `dataplex_entry`

This section provides a concise policy evaluation for the `dataplex_entry` resource in GCP.

Reference: [Terraform Registry – dataplex_entry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_entry)

---

## 1. Argument Reference

### `entry_type`
- Description: (Required) The relative resource name of the entry type that was used to create this entry, in the format projects/{project_number}/locations/{locationId}/entryTypes/{entryTypeId}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aspects`
- Description: (Optional) The aspects that are attached to the entry. Structure is [documented below](#nested_aspects).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent_entry`
- Description: (Optional) The resource name of the parent entry, in the format projects/{project_number}/locations/{locationId}/entryGroups/{entryGroupId}/entries/{entryId}.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fully_qualified_name`
- Description: (Optional) A name for the entry that can be referenced by an external system. For more information, see https://cloud.google.com/dataplex/docs/fully-qualified-names. The maximum size of the field is 4000 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entry_source`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_entry_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location where entry will be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entry_group_id`
- Description: (Optional) The entry group id of the entry group the entry will be created in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entry_id`
- Description: (Optional) The entry id of the entry.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_aspects"></a>The `aspects` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aspect_key`
- Description: (Required) Depending on how the aspect is attached to the entry, the format of the aspect key can be one of the following: If the aspect is attached directly to the entry: {project_number}.{locationId}.{aspectTypeId} If the aspect is attached to an entry's path: {project_number}.{locationId}.{aspectTypeId}@{path}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aspect`
- Description: (Required) A nested object resource. Structure is [documented below](#nested_aspects_aspects_aspect). <a name="nested_aspects_aspects_aspect"></a>The `aspect` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aspect_type`
- Description: (Output) The resource name of the type used to create this Aspect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Output) The path in the entry under which the aspect is attached.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_time`
- Description: (Output) The time when the Aspect was created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) The time when the Aspect was last modified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data`
- Description: (Required) The content of the aspect in JSON form, according to its aspect type schema. The maximum size of the field is 120KB (encoded as UTF-8). <a name="nested_entry_source"></a>The `entry_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource`
- Description: (Optional) The name of the resource in the source system. Maximum length is 4,000 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `system`
- Description: (Optional) The name of the source system. Maximum length is 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `platform`
- Description: (Optional) The platform containing the source system. Maximum length is 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A user-friendly display name. Maximum length is 500 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the data resource. Maximum length is 2,000 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels. The maximum size of keys and values is 128 characters each. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ancestors`
- Description: (Optional) Structure is [documented below](#nested_entry_source_ancestors).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_time`
- Description: (Optional) The time when the resource was created in the source system.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Optional) The time when the resource was last updated in the source system. If the entry exists in the system and its EntrySource has updateTime populated, further updates to the EntrySource of the entry must provide incremental updates to its updateTime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Output) Location of the resource in the source system. You can search the entry by this location. By default, this should match the location of the entry group containing this entry. A different value allows capturing the source location for data external to Google Cloud. <a name="nested_entry_source_ancestors"></a>The `ancestors` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The name of the ancestor resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of the ancestor resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
