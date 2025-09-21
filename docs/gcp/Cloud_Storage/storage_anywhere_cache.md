## 🛡️ Policy Deployment Engine: `storage_anywhere_cache`

This section provides a concise policy evaluation for the `storage_anywhere_cache` resource in GCP.

Reference: [Terraform Registry – storage_anywhere_cache](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_anywhere_cache)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `zone` | The zone in which the cache instance needs to be created. For example, `us-central1-a.` | true | true | Zone location need to be set in Aus regions for data sovereignty purposes | australia-southeast1-b | us-west-2 |
| `bucket` | A reference to Bucket resource | true | false | Bucket name is required field and does not relate to security | None | None |
| `admission_policy` | The cache admission policy dictates whether a block should be inserted upon a cache miss. Default value is `admit-on-first-miss`. Possible values are: `admit-on-first-miss`, `admit-on-second-miss`. | false | false | Caching is not security related | None | None |
| `ttl` | The TTL of all cache entries in whole seconds. e.g., "7200s". It defaults to `86400s` | false | false | TTL of cache entries is not security related | None | None |
