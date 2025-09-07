## 🛡️ Policy Deployment Engine: `storage_bucket_object`

This section provides a concise policy evaluation for the `storage_bucket_object` resource in GCP.

Reference: [Terraform Registry – storage_bucket_object](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object)

---

## 1. Argument Reference

### `bucket`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: One of the following is required:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: if `content` is not. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cache_control`
- Description: directive to specify caching behavior of object data. If omitted and object is accessible to all anonymous users, the default will be public, max-age=3600
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_disposition`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_encoding`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_language`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `customer_encryption`
- Description: Structure is [documented below](#nested_customer_encryption).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_based_hold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `temporary_hold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `detect_md5hash`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_class`
- Description: Supported values include: `MULTI_REGIONAL`, `REGIONAL`, `NEARLINE`, `COLDLINE`, `ARCHIVE`. If not provided, this defaults to the bucket's default storage class or to a [standard](https://cloud.google.com/storage/docs/storage-classes#standard) class.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_md5hash`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_empty_content_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: --- <a name="nested_customer_encryption"></a>The `customer_encryption` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_algorithm`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key`
- Description: <a name="nested_retention"></a>The `retention` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retain_until_time`
- Description: <a name>
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
