## 🛡️ Policy Deployment Engine: `google_storage_batch_operations_job`

This section provides a concise policy evaluation for the `google_storage_batch_operations_job` resource in GCP.

Reference: [Terraform Registry – google_storage_batch_operations_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_storage_batch_operations_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `job_id` | The ID of the job. | false | false | Job ID is an identifier and does not affect security; only identifies the operation. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project ID is an organizational identifier and does not directly impact security. | None | None |
| `bucket_list` | List of buckets and their objects to be transformed. | true | false | Bucket list configuration is required for batch operations but doesn't directly impact security. | None | None |
| `delete_object` | Allows batch operations to delete objects in bucket. | false | true | Permanent deletion can cause data loss if misused. Policy ensures delete safety. | permanent_object_deletion_enabled = false | permanent_object_deletion_enabled = true |
| `rewrite_object` | Allows update of encryption key for objects in bucket. | false | true | All rewrites must use CMEK to ensure customer-controlled encryption. | kms_key = 'projects/my-project/locations/us-central1/keyRings/kr/cryptoKeys/key' | kms_key = '' or kms_key = null |
| `put_object_hold` | Allows update of temporary hold or eventBased hold for objects. | false | true | Unsetting holds can weaken data retention and allow premature deletion. | event_based_hold = 'SET', temporary_hold = 'SET' | event_based_hold = 'UNSET' |
| `put_metadata` | Allows batch operations to update metadata for objects in bucket. | false | false | Metadata updates are generally safe operations that don't affect data integrity or security. | None | None |

### bucket_list Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `buckets` | List of buckets and their objects to be transformed. | true | false | Bucket configuration is required for batch operations but doesn't directly impact security. | None | None |

###   buckets Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `bucket` | Bucket name for the objects to be transformed. | true | false | Bucket name is required for batch operations but doesn't directly impact security. | None | None |
  | `prefix_list` | Specifies objects matching a prefix set. Required for scoping operations to specific objects. | false | true | Without proper prefix scoping, operations may affect unintended objects in the bucket. | prefix_list = [{ included_object_prefixes = ['secure-data/'] }] | prefix_list = [] or missing prefix_list entirely |
  | `manifest` | Contains the manifest source file that is a CSV file in a Google Cloud Storage bucket. | false | true | Manifest files provide explicit object lists, ensuring operations only affect intended objects. | manifest = [{ manifest_location = 'gs://bucket/manifest.csv' }] | manifest = [] or manifest_location = '' |

###     prefix_list Block

    | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
    |----------|-------------|----------|-----------------|-----------|-----------|---------------|
    | `included_object_prefixes` | List of object name prefixes to include in the batch operation. | true | true | Prefixes ensure operations are scoped to specific objects, preventing accidental mass operations. | included_object_prefixes = ['secure-data/', 'backup/'] | included_object_prefixes = [] or included_object_prefixes = [''] |

###     manifest Block

    | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
    |----------|-------------|----------|-----------------|-----------|-----------|---------------|
    | `manifest_location` | Specifies objects in a manifest file stored in Cloud Storage. | true | true | Valid manifest location ensures operations target only explicitly listed objects. | manifest_location = 'gs://secure-bucket/manifest.csv' | manifest_location = '' or manifest_location = null |

### delete_object Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `permanent_object_deletion_enabled` | Enable flag to permanently delete object and all object versions if versioning is enabled on bucket. | true | true | Permanent deletion removes recovery options and poses a major security risk for data loss. | permanent_object_deletion_enabled = false | permanent_object_deletion_enabled = true |

### rewrite_object Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key` | Valid KMS key for encryption during rewrite operations. | true | true | CMEK ensures encryption is customer-managed rather than default Google-managed keys. | kms_key = 'projects/my-project/locations/us-central1/keyRings/kr/cryptoKeys/key' | kms_key = null or kms_key = '' |

### put_object_hold Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `event_based_hold` | Set/unset to update event based hold for objects. | false | true | Unsetting event-based holds can allow premature deletion of objects that should be retained. | event_based_hold = 'SET' | event_based_hold = 'UNSET' |
| `temporary_hold` | Set/unset to update temporary based hold for objects. | false | true | Unsetting temporary holds can allow premature deletion of objects that should be retained. | temporary_hold = 'SET' | temporary_hold = 'UNSET' |

### put_metadata Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `custom_time` | Updates the objects fixed custom time metadata. | false | false | Custom time metadata is informational and doesn't impact security. | None | None |
| `content_disposition` | Content-Disposition of the object data. | false | false | Content disposition is a metadata field that doesn't affect security. | None | None |
| `content_encoding` | Content Encoding of the object data. | false | false | Content encoding is a metadata field that doesn't affect security. | None | None |
| `content_type` | Content-Type of the object data. | false | false | Content type is a metadata field that doesn't affect security. | None | None |
| `content_language` | Content-Language of the object data. | false | false | Content language is a metadata field that doesn't affect security. | None | None |
| `cache_control` | Cache-Control directive to specify caching behavior of object data. If omitted and object is accessible to all anonymous users, the default will be public, max-age=3600 | false | false | Cache control is a metadata field that doesn't affect security. | None | None |
| `custom_metadata` | User-provided metadata, in key/value pairs. | false | false | Custom metadata is informational and doesn't impact security. | None | None |
