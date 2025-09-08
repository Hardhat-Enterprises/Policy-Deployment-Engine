## 🛡️ Policy Deployment Engine: `storage_batch_operations_job`

This section provides a concise policy evaluation for the `storage_batch_operations_job` resource in GCP.

Reference: [Terraform Registry – storage_batch_operations_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_batch_operations_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `job_id` | The ID of the job. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `delete_protection` |  | none | None | None |

### bucket_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `buckets` | List of buckets and their objects to be transformed. Structure is [documented below](#nested_bucket_list_buckets). | true | None | None |

### delete_object Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `permanent_object_deletion_enabled` | enable flag to permanently delete object and all object versions if versioning is enabled on bucket. | true | None | None |

### put_metadata Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `custom_time` | Updates the objects fixed custom time metadata. | false | None | None |
| `content_disposition` | Content-Disposition of the object data. | false | None | None |
| `content_encoding` | Content Encoding of the object data. | false | None | None |
| `content_type` | Content-Type of the object data. | false | None | None |
| `content_language` | Content-Language of the object data. | false | None | None |
| `cache_control` | Cache-Control directive to specify caching behavior of object data. If omitted and object is accessible to all anonymous users, the default will be public, max-age=3600 | false | None | None |
| `custom_metadata` | User-provided metadata, in key/value pairs. | false | None | None |

### rewrite_object Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key` | valid kms key | true | None | None |

### put_object_hold Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `event_based_hold` | set/unset to update event based hold for objects. | false | None | None |
| `temporary_hold` | set/unset to update temporary based hold for objects. | false | None | None |

### buckets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` | Bucket name for the objects to be transformed. | true | None | None |
| `prefix_list` | Specifies objects matching a prefix set. Structure is [documented below](#nested_bucket_list_buckets_buckets_prefix_list). | false | None | None |
| `manifest` | contain the manifest source file that is a CSV file in a Google Cloud Storage bucket. Structure is [documented below](#nested_bucket_list_buckets_buckets_manifest). | false | None | None |

### prefix_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `included_object_prefixes` |  | false | None | None |

### manifest Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `manifest_location` | Specifies objects in a manifest file. | false | None | None |
