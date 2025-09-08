## 🛡️ Policy Deployment Engine: `firestore_database`

This section provides a concise policy evaluation for the `firestore_database` resource in GCP.

Reference: [Terraform Registry – firestore_database](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_database)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The ID to use for the database, which will become the final component of the database's resource name. This value should be 4-63 characters. Valid characters are /[a-z][0-9]-/ with first character a letter and the last a letter or a number. Must not be UUID-like /[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}/. "(default)" database id is also valid. | true | None | None |
| `location_id` | The location of the database. Available locations are listed at https://cloud.google.com/firestore/docs/locations. | true | None | None |
| `type` | The type of the database. See https://cloud.google.com/datastore/docs/firestore-or-datastore for information about how to choose. Possible values are: `FIRESTORE_NATIVE`, `DATASTORE_MODE`. | true | None | None |
| `database_edition` | The database edition. Possible values are: `STANDARD`, `ENTERPRISE`. | false | None | None |
| `concurrency_mode` | The concurrency control mode to use for this database. Possible values are: `OPTIMISTIC`, `PESSIMISTIC`, `OPTIMISTIC_WITH_ENTITY_GROUPS`. | false | None | None |
| `app_engine_integration_mode` | The App Engine integration mode to use for this database. Possible values are: `ENABLED`, `DISABLED`. | false | None | None |
| `point_in_time_recovery_enablement` | Whether to enable the PITR feature on this database. If `POINT_IN_TIME_RECOVERY_ENABLED` is selected, reads are supported on selected versions of the data from within the past 7 days. versionRetentionPeriod and earliestVersionTime can be used to determine the supported versions. These include reads against any timestamp within the past hour and reads against 1-minute snapshots beyond 1 hour and within 7 days. If `POINT_IN_TIME_RECOVERY_DISABLED` is selected, reads are supported on any version of the data from within the past 1 hour. Default value is `POINT_IN_TIME_RECOVERY_DISABLED`. Possible values are: `POINT_IN_TIME_RECOVERY_ENABLED`, `POINT_IN_TIME_RECOVERY_DISABLED`. | false | None | None |
| `delete_protection_state` | State of delete protection for the database. When delete protection is enabled, this database cannot be deleted. The default value is `DELETE_PROTECTION_STATE_UNSPECIFIED`, which is currently equivalent to `DELETE_PROTECTION_DISABLED`. **Note:** Additionally, to delete this database using `terraform destroy`, `deletion_policy` must be set to `DELETE`. Possible values are: `DELETE_PROTECTION_STATE_UNSPECIFIED`, `DELETE_PROTECTION_ENABLED`, `DELETE_PROTECTION_DISABLED`. | false | None | None |
| `tags` | Input only. A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. The field is ignored when empty. The field is immutable and causes resource replacement when mutated. To apply tags to an existing resource, see the `google_tags_tag_value` resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` | If the deletion policy is `ABANDON`, the database will be removed from Terraform state but not deleted from Google Cloud upon destruction. If the deletion policy is `DELETE`, the database will both be removed from Terraform state and deleted from Google Cloud upon destruction. The default value is `ABANDON`. See also `delete_protection`. | none | None | None |

### cmek_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_name` | The resource ID of a Cloud KMS key. If set, the database created will be a Customer-managed Encryption Key (CMEK) database encrypted with this key. This feature is allowlist only in initial launch. Only keys in the same location as this database are allowed to be used for encryption. For Firestore's nam5 multi-region, this corresponds to Cloud KMS multi-region us. For Firestore's eur3 multi-region, this corresponds to Cloud KMS multi-region europe. See https://cloud.google.com/kms/docs/locations. This value should be the KMS key resource ID in the format of `projects/{project_id}/locations/{kms_location}/keyRings/{key_ring}/cryptoKeys/{crypto_key}`. How to retrieve this resource ID is listed at https://cloud.google.com/kms/docs/getting-resource-ids#getting_the_id_for_a_key_and_version. | true | None | None |
| `active_key_version` | (Output) Currently in-use KMS key versions (https://cloud.google.com/kms/docs/resource-hierarchy#key_versions). During key rotation (https://cloud.google.com/kms/docs/key-rotation), there can be multiple in-use key versions. The expected format is `projects/{project_id}/locations/{kms_location}/keyRings/{key_ring}/cryptoKeys/{crypto_key}/cryptoKeyVersions/{key_version}`. | none | None | None |
