## 🛡️ Policy Deployment Engine: `storage_batch_operations_job`

This section provides a concise policy evaluation for the `storage_batch_operations_job` resource in GCP.

Reference: [Terraform Registry – storage_batch_operations_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_batch_operations_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket_list` | List of buckets and their objects to be transformed. Currently, only one bucket configuration is supported. If multiple buckets are specified, an error will be returned Structure is [documented below](#nested_bucket_list). | false | false | None | None | None |
| `delete_object` | allows batch operations to delete objects in bucket Structure is [documented below](#nested_delete_object). | false | false | None | None | None |
| `put_metadata` | allows batch operations to update metadata for objects in bucket Structure is [documented below](#nested_put_metadata). | false | false | None | None | None |
| `rewrite_object` | allows to update encryption key for objects in bucket. Structure is [documented below](#nested_rewrite_object). | false | false | None | None | None |
| `put_object_hold` | allows to update temporary hold or eventBased hold for objects in bucket. Structure is [documented below](#nested_put_object_hold). | false | false | None | None | None |
| `job_id` | The ID of the job. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `delete_protection` |  | false | false | None | None | None |
| `buckets` |  | false | false | None | None | None |
| `prefix_list` |  | false | false | None | None | None |
| `manifest` |  | false | false | None | None | None |

### bucket_list Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `buckets` | List of buckets and their objects to be transformed. Structure is [documented below](#nested_bucket_list_buckets). | true | false | None | None | None |

### delete_object Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `permanent_object_deletion_enabled` | enable flag to permanently delete object and all object versions if versioning is enabled on bucket. | true | false | None | None | None |

### put_metadata Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `custom_time` | Updates the objects fixed custom time metadata. | false | false | None | None | None |
| `content_disposition` | Content-Disposition of the object data. | false | false | None | None | None |
| `content_encoding` | Content Encoding of the object data. | false | false | None | None | None |
| `content_type` | Content-Type of the object data. | false | false | None | None | None |
| `content_language` | Content-Language of the object data. | false | false | None | None | None |
| `cache_control` | Cache-Control directive to specify caching behavior of object data. If omitted and object is accessible to all anonymous users, the default will be public, max-age=3600 | false | false | None | None | None |
| `custom_metadata` | User-provided metadata, in key/value pairs. | false | false | None | None | None |

### rewrite_object Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key` | valid kms key | true | false | None | None | None |

### put_object_hold Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `event_based_hold` | set/unset to update event based hold for objects. | false | false | None | None | None |
| `temporary_hold` | set/unset to update temporary based hold for objects. | false | false | None | None | None |

### buckets Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` | Bucket name for the objects to be transformed. | true | false | None | None | None |
| `prefix_list` | Specifies objects matching a prefix set. Structure is [documented below](#nested_bucket_list_buckets_buckets_prefix_list). | false | false | None | None | None |
| `manifest` | contain the manifest source file that is a CSV file in a Google Cloud Storage bucket. Structure is [documented below](#nested_bucket_list_buckets_buckets_manifest). | false | false | None | None | None |

### prefix_list Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `included_object_prefixes` |  | false | false | None | None | None |

### manifest Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `manifest_location` | Specifies objects in a manifest file. | false | false | None | None | None |
