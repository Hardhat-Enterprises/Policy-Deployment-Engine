## 🛡️ Policy Deployment Engine: `storage_bucket_object`

This section provides a concise policy evaluation for the `storage_bucket_object` resource in GCP.

Reference: [Terraform Registry – storage_bucket_object](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket` |  | none | None | None |
| `name` |  | none | None | None |
| `metadata` | One of the following is required: | none | None | None |
| `content` |  | none | None | None |
| `source` | if `content` is not. - - - | none | None | None |
| `cache_control` | directive to specify caching behavior of object data. If omitted and object is accessible to all anonymous users, the default will be public, max-age=3600 | none | None | None |
| `content_disposition` |  | none | None | None |
| `content_encoding` |  | none | None | None |
| `content_language` |  | none | None | None |
| `content_type` |  | none | None | None |
| `event_based_hold` |  | none | None | None |
| `temporary_hold` |  | none | None | None |
| `detect_md5hash` |  | none | None | None |
| `storage_class` | Supported values include: `MULTI_REGIONAL`, `REGIONAL`, `NEARLINE`, `COLDLINE`, `ARCHIVE`. If not provided, this defaults to the bucket's default storage class or to a [standard](https://cloud.google.com/storage/docs/storage-classes#standard) class. | none | None | None |
| `kms_key_name` |  | none | None | None |
| `source_md5hash` |  | none | None | None |
| `force_empty_content_type` |  | none | None | None |
| `deletion_policy` | --- | none | None | None |

### customer_encryption Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `encryption_algorithm` |  | none | None | None |
| `encryption_key` |  | none | None | None |

### retention Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mode` |  | none | None | None |
| `retain_until_time` | <a name> | none | None | None |
