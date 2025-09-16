## 🛡️ Policy Deployment Engine: `storage_bucket_object`

This section provides a concise policy evaluation for the `storage_bucket_object` resource in GCP.

Reference: [Terraform Registry – storage_bucket_object](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `bucket` |  | false | false | None | None | None |
| `name` |  | false | false | None | None | None |
| `metadata` | One of the following is required: | false | false | None | None | None |
| `content` |  | false | false | None | None | None |
| `source` | if `content` is not. - - - | false | false | None | None | None |
| `cache_control` | directive to specify caching behavior of object data. If omitted and object is accessible to all anonymous users, the default will be public, max-age=3600 | false | false | None | None | None |
| `content_disposition` |  | false | false | None | None | None |
| `content_encoding` |  | false | false | None | None | None |
| `content_language` |  | false | false | None | None | None |
| `content_type` |  | false | false | None | None | None |
| `customer_encryption` | Structure is [documented below](#nested_customer_encryption). | false | true | Encryption should be present either through customer or using kms for data security | my-key | null |
| `retention` |  | false | false | None | None | None |
| `event_based_hold` |  | false | false | None | None | None |
| `temporary_hold` |  | false | false | None | None | None |
| `detect_md5hash` |  | false | false | None | None | None |
| `storage_class` | Supported values include: `MULTI_REGIONAL`, `REGIONAL`, `NEARLINE`, `COLDLINE`, `ARCHIVE`. If not provided, this defaults to the bucket's default storage class or to a [standard](https://cloud.google.com/storage/docs/storage-classes#standard) class. | false | false | None | None | None |
| `kms_key_name` |  | false | true | Encryption should be present either through customer or using kms for data security | kms-key | null |
| `source_md5hash` |  | false | false | None | None | None |
| `force_empty_content_type` |  | false | false | None | None | None |
| `deletion_policy` | --- | false | false | None | None | None |

### customer_encryption Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `encryption_algorithm` |  | false | false | None | None | None |
| `encryption_key` |  | false | false | None | None | None |

### retention Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mode` |  | false | false | None | None | None |
| `retain_until_time` | <a name> | false | false | None | None | None |
