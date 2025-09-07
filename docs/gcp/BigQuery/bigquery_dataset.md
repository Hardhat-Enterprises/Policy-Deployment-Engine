## 🛡️ Policy Deployment Engine: `bigquery_dataset`

This section provides a concise policy evaluation for the `bigquery_dataset` resource in GCP.

Reference: [Terraform Registry – bigquery_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset)

---

## 1. Argument Reference

### `dataset_id`
- Description: (Required) A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_time_travel_hours`
- Description: (Optional) Defines the time travel window in hours. The value can be from 48 to 168 hours (2 to 7 days).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access`
- Description: (Optional) An array of objects that define dataset access for one or more entities. Structure is [documented below](#nested_access).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_table_expiration_ms`
- Description: (Optional) The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour). Once this property is set, all newly-created tables in the dataset will have an `expirationTime` property set to the creation time plus the value in this property, and changing the value will only affect new tables, not existing ones. When the `expirationTime` for a given table is reached, that table will be deleted automatically. If a table's `expirationTime` is modified or removed before the table expires, or if you provide an explicit `expirationTime` when creating a table, that value takes precedence over the default expiration time indicated by this property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_partition_expiration_ms`
- Description: (Optional) The default partition expiration for all partitioned tables in the dataset, in milliseconds. Once this property is set, all newly-created partitioned tables in the dataset will have an `expirationMs` property in the `timePartitioning` settings set to this value, and changing the value will only affect new tables, not existing ones. The storage in a partition will have an expiration time of its partition time plus this value. Setting this property overrides the use of `defaultTableExpirationMs` for partitioned tables: only one of `defaultTableExpirationMs` and `defaultPartitionExpirationMs` will be used for any new partitioned table. If you provide an explicit `timePartitioning.expirationMs` when creating or updating a partitioned table, that value takes precedence over the default partition expiration time indicated by this property.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A user-friendly description of the dataset
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_dataset_reference`
- Description: (Optional) Information about the external metadata storage where the dataset is defined. Structure is [documented below](#nested_external_dataset_reference).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `friendly_name`
- Description: (Optional) A descriptive name for the dataset
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels associated with this dataset. You can use these to organize and group your datasets. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The geographic location where the dataset should reside. See [official docs](https://cloud.google.com/bigquery/docs/dataset-locations). There are two types of locations, regional or multi-regional. A regional location is a specific geographic place, such as Tokyo, and a multi-regional location is a large geographic area, such as the United States, that contains at least two geographic places. The default value is multi-regional location `US`. Changing this forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_encryption_configuration`
- Description: (Optional) The default encryption key for all tables in the dataset. Once this property is set, all newly-created partitioned tables in the dataset will have encryption key set to this value, unless table creation request (or query) overrides the key. Structure is [documented below](#nested_default_encryption_configuration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_case_insensitive`
- Description: (Optional) TRUE if the dataset and its table names are case-insensitive, otherwise FALSE. By default, this is FALSE, which means the dataset and its table names are case-sensitive. This field does not affect routine references.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_collation`
- Description: (Optional) Defines the default collation specification of future tables created in the dataset. If a table is created in this dataset without table-level default collation, then the table inherits the dataset default collation, which is applied to the string fields that do not have explicit collation specified. A change to this field affects only tables created afterwards, and does not alter the existing tables. The following values are supported: - 'und:ci': undetermined locale, case insensitive. - '': empty string. Default to case-sensitive behavior.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_billing_model`
- Description: (Optional) Specifies the storage billing model for the dataset. Set this flag value to LOGICAL to use logical bytes for storage billing, or to PHYSICAL to use physical bytes instead. LOGICAL is the default if this flag isn't specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_tags`
- Description: (Optional) The tags attached to this table. Tag keys are globally unique. Tag key is expected to be in the namespaced format, for example "123456789012/environment" where 123456789012 is the ID of the parent organization or project resource for this tag key. Tag value is expected to be the short name, for example "Production". See [Tag definitions](https://cloud.google.com/iam/docs/tags-access-control#definitions) for more details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_catalog_dataset_options`
- Description: (Optional) Options defining open source compatible datasets living in the BigQuery catalog. Contains metadata of open source database, schema or namespace represented by the current dataset. Structure is [documented below](#nested_external_catalog_dataset_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_contents_on_destroy`
- Description: dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. <a name="nested_access"></a>The `access` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Optional) A domain to grant access to. Any users signed in with the domain specified will be granted the specified access
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_by_email`
- Description: (Optional) An email address of a Google Group to grant access to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Optional) Describes the rights granted to the user specified by the other member of the access object. Basic, predefined, and custom roles are supported. Predefined roles that have equivalent basic roles are swapped by the API to their basic counterparts. See [official docs](https://cloud.google.com/bigquery/docs/access-control).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `special_group`
- Description: (Optional) A special group to grant access to. Possible values include:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `iam_member`
- Description: (Optional) Some other type of member that appears in the IAM Policy but isn't a user, group, domain, or special group. For example: `allUsers`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_by_email`
- Description: (Optional) An email address of a user to grant access to. For example: fred@example.com
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `view`
- Description: (Optional) A view from a different dataset to grant access to. Queries executed against that view will have read access to tables in this dataset. The role field is not required when this field is set. If that view is updated by any user, access to the view needs to be granted again via an update operation. Structure is [documented below](#nested_access_access_view).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Optional) Grants all resources of particular types in a particular dataset read access to the current dataset. Structure is [documented below](#nested_access_access_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routine`
- Description: (Optional) A routine from a different dataset to grant access to. Queries executed against that routine will have read access to tables in this dataset. The role field is not required when this field is set. If that routine is updated by any user, access to the routine needs to be granted again via an update operation. Structure is [documented below](#nested_access_access_routine).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `condition`
- Description: (Optional) Condition for the binding. If CEL expression in this field is true, this access binding will be considered. Structure is [documented below](#nested_access_access_condition). <a name="nested_access_access_view"></a>The `view` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. <a name="nested_access_access_dataset"></a>The `dataset` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Required) The dataset this entry applies to Structure is [documented below](#nested_access_access_dataset_dataset).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_types`
- Description: (Required) Which resources in the dataset this entry applies to. Currently, only views are supported, but additional target types may be added in the future. Possible values: VIEWS <a name="nested_access_access_dataset_dataset"></a>The `dataset` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this table. <a name="nested_access_access_routine"></a>The `routine` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `routine_id`
- Description: (Required) The ID of the routine. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters. <a name="nested_access_access_condition"></a>The `condition` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: (Required) Textual representation of an expression in Common Expression Language syntax.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Optional) Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. <a name="nested_external_dataset_reference"></a>The `external_dataset_reference` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_source`
- Description: (Required) External source that backs this dataset.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection`
- Description: (Required) The connection id that is used to access the externalSource. Format: projects/{projectId}/locations/{locationId}/connections/{connectionId} <a name="nested_default_encryption_configuration"></a>The `default_encryption_configuration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Required) Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key. <a name="nested_external_catalog_dataset_options"></a>The `external_catalog_dataset_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameters`
- Description: (Optional) A map of key value pairs defining the parameters and properties of the open source schema. Maximum size of 2Mib.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_storage_location_uri`
- Description: (Optional) The storage location URI for all tables in the dataset. Equivalent to hive metastore's database locationUri. Maximum length of 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
