## 🛡️ Policy Deployment Engine: `storage_batch_operations_job`

This section provides a concise policy evaluation for the `storage_batch_operations_job` resource in GCP.

Reference: [Terraform Registry – storage_batch_operations_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_batch_operations_job)

---

## 1. Argument Reference

### `bucket_list`
- Description: (Optional) List of buckets and their objects to be transformed. Currently, only one bucket configuration is supported. If multiple buckets are specified, an error will be returned Structure is [documented below](#nested_bucket_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_object`
- Description: (Optional) allows batch operations to delete objects in bucket Structure is [documented below](#nested_delete_object).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `put_metadata`
- Description: (Optional) allows batch operations to update metadata for objects in bucket Structure is [documented below](#nested_put_metadata).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rewrite_object`
- Description: (Optional) allows to update encryption key for objects in bucket. Structure is [documented below](#nested_rewrite_object).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `put_object_hold`
- Description: (Optional) allows to update temporary hold or eventBased hold for objects in bucket. Structure is [documented below](#nested_put_object_hold).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `job_id`
- Description: (Optional) The ID of the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_protection`
- Description: <a name="nested_bucket_list"></a>The `bucket_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `buckets`
- Description: (Required) List of buckets and their objects to be transformed. Structure is [documented below](#nested_bucket_list_buckets). <a name="nested_bucket_list_buckets"></a>The `buckets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket`
- Description: (Required) Bucket name for the objects to be transformed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_list`
- Description: (Optional) Specifies objects matching a prefix set. Structure is [documented below](#nested_bucket_list_buckets_buckets_prefix_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manifest`
- Description: (Optional) contain the manifest source file that is a CSV file in a Google Cloud Storage bucket. Structure is [documented below](#nested_bucket_list_buckets_buckets_manifest). <a name="nested_bucket_list_buckets_buckets_prefix_list"></a>The `prefix_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_object_prefixes`
- Description: (Optional) <a name="nested_bucket_list_buckets_buckets_manifest"></a>The `manifest` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manifest_location`
- Description: (Optional) Specifies objects in a manifest file. <a name="nested_delete_object"></a>The `delete_object` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permanent_object_deletion_enabled`
- Description: (Required) enable flag to permanently delete object and all object versions if versioning is enabled on bucket. <a name="nested_put_metadata"></a>The `put_metadata` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_time`
- Description: (Optional) Updates the objects fixed custom time metadata.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_disposition`
- Description: (Optional) Content-Disposition of the object data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_encoding`
- Description: (Optional) Content Encoding of the object data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_type`
- Description: (Optional) Content-Type of the object data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_language`
- Description: (Optional) Content-Language of the object data.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cache_control`
- Description: (Optional) Cache-Control directive to specify caching behavior of object data. If omitted and object is accessible to all anonymous users, the default will be public, max-age=3600
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_metadata`
- Description: (Optional) User-provided metadata, in key/value pairs. <a name="nested_rewrite_object"></a>The `rewrite_object` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Required) valid kms key <a name="nested_put_object_hold"></a>The `put_object_hold` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_based_hold`
- Description: (Optional) set/unset to update event based hold for objects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `temporary_hold`
- Description: (Optional) set/unset to update temporary based hold for objects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
