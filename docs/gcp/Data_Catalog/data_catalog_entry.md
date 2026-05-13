## 🛡️ Policy Deployment Engine: `data_catalog_entry`

This section provides a concise policy evaluation for the `data_catalog_entry` resource in GCP.

Reference: [Terraform Registry – data_catalog_entry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_entry)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `entry_group` | The name of the entry group this entry is in. | true | true | Entries should be stored in an approved entry group so catalog metadata remains in a managed location. | approved_entry_group | unapproved_entry_group |
| `entry_id` | The id of the entry to create. | true | false |  | None | None |
| `linked_resource` | The resource this metadata entry refers to. For Google Cloud Platform resources, linkedResource is the full name of the resource. For example, the linkedResource for a table resource from BigQuery is: //bigquery.googleapis.com/projects/projectId/datasets/datasetId/tables/tableId Output only when Entry is of type in the EntryType enum. For entries with userSpecifiedType, this field is optional and defaults to an empty string. | false | true | The linked resource should point only to approved resources, otherwise metadata may reference untrusted or unmanaged data. | my/linked/resource | others/linked/resource |
| `display_name` | Display information such as title and description. A short name to identify the entry, for example, "Analytics Data - Jan 2011". | false | false |  | None | None |
| `description` | Entry description, which can consist of several sentences or paragraphs that describe entry contents. | false | true | A clear description is needed to support governance and audit understanding of the data entry. | Customer dataset entry | None |
| `schema` | Schema of the entry (e.g. BigQuery, GoogleSQL, Avro schema), as a json string. An entry might not have any schema attached to it. See https://cloud.google.com/data-catalog/docs/reference/rest/v1/projects.locations.entryGroups.entries#schema for what fields this schema can contain. | false | false |  | None | None |
| `type` | The type of the entry. Only used for Entries with types in the EntryType enum. Currently, only FILESET enum value is allowed. All other entries created through Data Catalog must use userSpecifiedType. Possible values are: `FILESET`. | false | false |  | None | None |
| `user_specified_type` | Entry type if it does not fit any of the input-allowed values listed in EntryType enum above. When creating an entry, users should check the enum values first, if nothing matches the entry to be created, then provide a custom value, for example "my_special_type". userSpecifiedType strings must begin with a letter or underscore and can only contain letters, numbers, and underscores; are case insensitive; must be at least 1 character and at most 64 characters long. | false | true | Custom entry types should be limited to approved values to keep data classification consistent. | approved_custom_type | unapproved_custom_type |
| `user_specified_system` | This field indicates the entry's source system that Data Catalog does not integrate with. userSpecifiedSystem strings must begin with a letter or underscore and can only contain letters, numbers, and underscores; are case insensitive; must be at least 1 character and at most 64 characters long. | false | true | Custom source systems should be approved so unknown external systems are not catalogued. | approved_system | unapproved_system |
| `gcs_fileset_spec` | Specification that applies to a Cloud Storage fileset. This is only valid on entries of type FILESET. Structure is [documented below](#nested_gcs_fileset_spec). | false | false |  | None | None |

### gcs_fileset_spec Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `file_patterns` | Patterns to identify a set of files in Google Cloud Storage. See [Cloud Storage documentation](https://cloud.google.com/storage/docs/gsutil/addlhelp/WildcardNames) for more information. Note that bucket wildcards are currently not supported. Examples of valid filePatterns: * gs://bucket_name/dir/*: matches all files within bucket_name/dir directory. * gs://bucket_name/dir/**: matches all files in bucket_name/dir spanning all subdirectories. * gs://bucket_name/file*: matches files prefixed by file in bucket_name * gs://bucket_name/??.txt: matches files with two characters followed by .txt in bucket_name * gs://bucket_name/[aeiou].txt: matches files that contain a single vowel character followed by .txt in bucket_name * gs://bucket_name/[a-m].txt: matches files that contain a, b, ... or m followed by .txt in bucket_name * gs://bucket_name/a/*/b: matches all files in bucket_name that match a/*/b pattern, such as a/c/b, a/d/b * gs://another_bucket/a.txt: matches gs://another_bucket/a.txt | true | true | GCS file patterns should be limited to approved bucket paths to avoid cataloguing unmanaged or sensitive storage locations. | gs://my_bucket/file | gs://other_bucket/file |
| `sample_gcs_file_specs` | (Output) Sample files contained in this fileset, not all files contained in this fileset are represented here. Structure is [documented below](#nested_gcs_fileset_spec_sample_gcs_file_specs). The `sample_gcs_file_specs` block contains: | false | false |  | None | None |
| `file_path` | (Output) The full file path | false | false |  | None | None |
| `size_bytes` | (Output) The size of the file, in bytes. | false | false |  | None | None |
