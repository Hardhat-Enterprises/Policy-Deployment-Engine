## 🛡️ Policy Deployment Engine: `bigquery_dataset`

This section provides a concise policy evaluation for the `bigquery_dataset` resource in GCP.

Reference: [Terraform Registry – bigquery_dataset](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | A unique ID for this dataset, without the project name. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. | true | false | dataset_id defines the dataset to which IAM policies are applied | None | None |
| `max_time_travel_hours` | Defines the time travel window in hours. The value can be from 48 to 168 hours (2 to 7 days). | false | false | None | None | None |
| `access` | An array of objects that define dataset access for one or more entities. Structure is [documented below](#nested_access). | false | false | None | None | None |
| `default_table_expiration_ms` | The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour). Once this property is set, all newly-created tables in the dataset will have an `expirationTime` property set to the creation time plus the value in this property, and changing the value will only affect new tables, not existing ones. When the `expirationTime` for a given table is reached, that table will be deleted automatically. If a table's `expirationTime` is modified or removed before the table expires, or if you provide an explicit `expirationTime` when creating a table, that value takes precedence over the default expiration time indicated by this property. | false | false | None | None | None |
| `default_partition_expiration_ms` | The default partition expiration for all partitioned tables in the dataset, in milliseconds. Once this property is set, all newly-created partitioned tables in the dataset will have an `expirationMs` property in the `timePartitioning` settings set to this value, and changing the value will only affect new tables, not existing ones. The storage in a partition will have an expiration time of its partition time plus this value. Setting this property overrides the use of `defaultTableExpirationMs` for partitioned tables: only one of `defaultTableExpirationMs` and `defaultPartitionExpirationMs` will be used for any new partitioned table. If you provide an explicit `timePartitioning.expirationMs` when creating or updating a partitioned table, that value takes precedence over the default partition expiration time indicated by this property. | false | false | None | None | None |
| `description` | A user-friendly description of the dataset | false | false | None | None | None |
| `external_dataset_reference` | Information about the external metadata storage where the dataset is defined. Structure is [documented below](#nested_external_dataset_reference). | false | false | None | None | None |
| `friendly_name` | A descriptive name for the dataset | false | false | None | None | None |
| `labels` | The labels associated with this dataset. You can use these to organize and group your datasets. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `location` | The geographic location where the dataset should reside. See [official docs](https://cloud.google.com/bigquery/docs/dataset-locations). There are two types of locations, regional or multi-regional. A regional location is a specific geographic place, such as Tokyo, and a multi-regional location is a large geographic area, such as the United States, that contains at least two geographic places. The default value is multi-regional location `US`. Changing this forces a new resource to be created. | false | true | location defines access permissions | None | None |
| `default_encryption_configuration` | The default encryption key for all tables in the dataset. Once this property is set, all newly-created partitioned tables in the dataset will have encryption key set to this value, unless table creation request (or query) overrides the key. Structure is [documented below](#nested_default_encryption_configuration). | false | false | None | None | None |
| `is_case_insensitive` | TRUE if the dataset and its table names are case-insensitive, otherwise FALSE. By default, this is FALSE, which means the dataset and its table names are case-sensitive. This field does not affect routine references. | false | false | None | None | None |
| `default_collation` | Defines the default collation specification of future tables created in the dataset. If a table is created in this dataset without table-level default collation, then the table inherits the dataset default collation, which is applied to the string fields that do not have explicit collation specified. A change to this field affects only tables created afterwards, and does not alter the existing tables. The following values are supported: - 'und:ci': undetermined locale, case insensitive. - '': empty string. Default to case-sensitive behavior. | false | false | None | None | None |
| `storage_billing_model` | Specifies the storage billing model for the dataset. Set this flag value to LOGICAL to use logical bytes for storage billing, or to PHYSICAL to use physical bytes instead. LOGICAL is the default if this flag isn't specified. | false | false | None | None | None |
| `resource_tags` | The tags attached to this table. Tag keys are globally unique. Tag key is expected to be in the namespaced format, for example "123456789012/environment" where 123456789012 is the ID of the parent organization or project resource for this tag key. Tag value is expected to be the short name, for example "Production". See [Tag definitions](https://cloud.google.com/iam/docs/tags-access-control#definitions) for more details. | false | false | None | None | None |
| `external_catalog_dataset_options` | Options defining open source compatible datasets living in the BigQuery catalog. Contains metadata of open source database, schema or namespace represented by the current dataset. Structure is [documented below](#nested_external_catalog_dataset_options). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `delete_contents_on_destroy` | dataset when destroying the resource; otherwise, destroying the resource will fail if tables are present. | false | false | None | None | None |
| `view` |  | false | false | None | None | None |
| `dataset` |  | false | false | None | None | None |
| `routine` |  | false | false | None | None | None |
| `condition` |  | false | false | None | None | None |

### access Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `domain` | A domain to grant access to. Any users signed in with the domain specified will be granted the specified access | false | false | None | None | None |
| `group_by_email` | An email address of a Google Group to grant access to. | false | false | None | None | None |
| `role` | Describes the rights granted to the user specified by the other member of the access object. Basic, predefined, and custom roles are supported. Predefined roles that have equivalent basic roles are swapped by the API to their basic counterparts. See [official docs](https://cloud.google.com/bigquery/docs/access-control). | false | false | None | None | None |
| `special_group` | A special group to grant access to. Possible values include: * `projectOwners`: Owners of the enclosing project. * `projectReaders`: Readers of the enclosing project. * `projectWriters`: Writers of the enclosing project. * `allAuthenticatedUsers`: All authenticated BigQuery users. | false | false | None | None | None |
| `iam_member` | Some other type of member that appears in the IAM Policy but isn't a user, group, domain, or special group. For example: `allUsers` | false | false | None | None | None |
| `user_by_email` | An email address of a user to grant access to. For example: fred@example.com | false | true | group email defines access permissions | example@company.com | invalid@example.com |
| `view` | A view from a different dataset to grant access to. Queries executed against that view will have read access to tables in this dataset. The role field is not required when this field is set. If that view is updated by any user, access to the view needs to be granted again via an update operation. Structure is [documented below](#nested_access_access_view). | false | false | None | None | None |
| `dataset` | Grants all resources of particular types in a particular dataset read access to the current dataset. Structure is [documented below](#nested_access_access_dataset). | false | false | None | None | None |
| `routine` | A routine from a different dataset to grant access to. Queries executed against that routine will have read access to tables in this dataset. The role field is not required when this field is set. If that routine is updated by any user, access to the routine needs to be granted again via an update operation. Structure is [documented below](#nested_access_access_routine). | false | false | None | None | None |
| `condition` | Condition for the binding. If CEL expression in this field is true, this access binding will be considered. Structure is [documented below](#nested_access_access_condition). | false | false | None | None | None |

### external_dataset_reference Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `external_source` | External source that backs this dataset. | true | false | None | None | None |
| `connection` | The connection id that is used to access the externalSource. Format: projects/{projectId}/locations/{locationId}/connections/{connectionId} | true | false | None | None | None |

### default_encryption_configuration Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_name` | Describes the Cloud KMS encryption key that will be used to protect destination BigQuery table. The BigQuery Service Account associated with your project requires access to this encryption key. | true | true | KMS key is used for encryption of data at rest | google_kms_crypto_key.crypto_key.id | None |

### external_catalog_dataset_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `parameters` | A map of key value pairs defining the parameters and properties of the open source schema. Maximum size of 2Mib. | false | false | None | None | None |
| `default_storage_location_uri` | The storage location URI for all tables in the dataset. Equivalent to hive metastore's database locationUri. Maximum length of 1024 characters. | false | false | None | None | None |

### view Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | The ID of the dataset containing this table. | true | false | None | None | None |
| `project_id` | The ID of the project containing this table. | true | false | None | None | None |
| `table_id` | The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. | true | false | None | None | None |

### dataset Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset` | The dataset this entry applies to Structure is [documented below](#nested_access_access_dataset_dataset). | true | false | None | None | None |
| `target_types` | Which resources in the dataset this entry applies to. Currently, only views are supported, but additional target types may be added in the future. Possible values: VIEWS | true | false | None | None | None |
| `dataset_id` | The ID of the dataset containing this table. | true | false | None | None | None |
| `project_id` | The ID of the project containing this table. | true | false | None | None | None |

### routine Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataset_id` | The ID of the dataset containing this table. | true | false | None | None | None |
| `project_id` | The ID of the project containing this table. | true | false | None | None | None |
| `routine_id` | The ID of the routine. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 256 characters. | true | false | None | None | None |

### condition Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. | true | false | None | None | None |
| `title` | Title for the expression, i.e. a short string describing its purpose. This can be used e.g. in UIs which allow to enter the expression. | false | false | None | None | None |
| `description` | Description of the expression. This is a longer text which describes the expression, e.g. when hovered over it in a UI. | false | false | None | None | None |
| `location` | String indicating the location of the expression for error reporting, e.g. a file name and a position in the file. | false | false | None | None | None |
