## 🛡️ Policy Deployment Engine: `data_catalog_entry`

This section provides a concise policy evaluation for the `data_catalog_entry` resource in GCP.

Reference: [Terraform Registry – data_catalog_entry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_entry)

---

## 1. Argument Reference

### `entry_group`
- Description: (Required) The name of the entry group this entry is in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entry_id`
- Description: (Required) The id of the entry to create.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `linked_resource`
- Description: (Optional) The resource this metadata entry refers to. For Google Cloud Platform resources, linkedResource is the full name of the resource. For example, the linkedResource for a table resource from BigQuery is: //bigquery.googleapis.com/projects/projectId/datasets/datasetId/tables/tableId Output only when Entry is of type in the EntryType enum. For entries with userSpecifiedType, this field is optional and defaults to an empty string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Display information such as title and description. A short name to identify the entry, for example, "Analytics Data - Jan 2011".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Entry description, which can consist of several sentences or paragraphs that describe entry contents.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schema`
- Description: (Optional) Schema of the entry (e.g. BigQuery, GoogleSQL, Avro schema), as a json string. An entry might not have any schema attached to it. See https://cloud.google.com/data-catalog/docs/reference/rest/v1/projects.locations.entryGroups.entries#schema for what fields this schema can contain.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of the entry. Only used for Entries with types in the EntryType enum. Currently, only FILESET enum value is allowed. All other entries created through Data Catalog must use userSpecifiedType. Possible values are: `FILESET`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_specified_type`
- Description: (Optional) Entry type if it does not fit any of the input-allowed values listed in EntryType enum above. When creating an entry, users should check the enum values first, if nothing matches the entry to be created, then provide a custom value, for example "my_special_type". userSpecifiedType strings must begin with a letter or underscore and can only contain letters, numbers, and underscores; are case insensitive; must be at least 1 character and at most 64 characters long.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_specified_system`
- Description: (Optional) This field indicates the entry's source system that Data Catalog does not integrate with. userSpecifiedSystem strings must begin with a letter or underscore and can only contain letters, numbers, and underscores; are case insensitive; must be at least 1 character and at most 64 characters long.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_fileset_spec`
- Description: (Optional) Specification that applies to a Cloud Storage fileset. This is only valid on entries of type FILESET. Structure is [documented below](#nested_gcs_fileset_spec). <a name="nested_gcs_fileset_spec"></a>The `gcs_fileset_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_patterns`
- Description: (Required) Patterns to identify a set of files in Google Cloud Storage. See [Cloud Storage documentation](https://cloud.google.com/storage/docs/gsutil/addlhelp/WildcardNames) for more information. Note that bucket wildcards are currently not supported. Examples of valid filePatterns: * gs://bucket_name/dir/*: matches all files within bucket_name/dir directory. * gs://bucket_name/dir/**: matches all files in bucket_name/dir spanning all subdirectories. * gs://bucket_name/file*: matches files prefixed by file in bucket_name * gs://bucket_name/??.txt: matches files with two characters followed by .txt in bucket_name * gs://bucket_name/[aeiou].txt: matches files that contain a single vowel character followed by .txt in bucket_name * gs://bucket_name/[a-m].txt: matches files that contain a, b, ... or m followed by .txt in bucket_name * gs://bucket_name/a/*/b: matches all files in bucket_name that match a/*/b pattern, such as a/c/b, a/d/b * gs://another_bucket/a.txt: matches gs://another_bucket/a.txt
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sample_gcs_file_specs`
- Description: (Output) Sample files contained in this fileset, not all files contained in this fileset are represented here. Structure is [documented below](#nested_gcs_fileset_spec_sample_gcs_file_specs). <a name="nested_gcs_fileset_spec_sample_gcs_file_specs"></a>The `sample_gcs_file_specs` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_path`
- Description: (Output) The full file path
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size_bytes`
- Description: (Output) The size of the file, in bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
