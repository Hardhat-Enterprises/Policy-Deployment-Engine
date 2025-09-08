## 🛡️ Policy Deployment Engine: `compute_backend_bucket`

This section provides a concise policy evaluation for the `compute_backend_bucket` resource in GCP.

Reference: [Terraform Registry – compute_backend_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_bucket)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_name` | Cloud Storage bucket name. | true | None | None |
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `compression_mode` | Compress text responses using Brotli or gzip compression, based on the client's Accept-Encoding header. Possible values are: `AUTOMATIC`, `DISABLED`. | false | None | None |
| `edge_security_policy` | The security policy associated with this backend bucket. | false | None | None |
| `custom_response_headers` | Headers that the HTTP/S load balancer should add to proxied responses. | false | None | None |
| `description` | An optional textual description of the resource; provided by the client when the resource is created. | false | None | None |
| `enable_cdn` | If true, enable Cloud CDN for this BackendBucket. | false | None | None |
| `load_balancing_scheme` | The value can only be INTERNAL_MANAGED for cross-region internal layer 7 load balancer. If loadBalancingScheme is not specified, the backend bucket can be used by classic global external load balancers, or global application external load balancers, or both. Possible values are: `INTERNAL_MANAGED`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### cdn_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cache_key_policy` | The CacheKeyPolicy for this CdnPolicy. Structure is [documented below](#nested_cdn_policy_cache_key_policy). | false | None | None |
| `signed_url_cache_max_age_sec` | Maximum number of seconds the response to a signed URL request will be considered fresh. After this time period, the response will be revalidated before being served. When serving responses to signed URL requests, Cloud CDN will internally behave as though all responses from this backend had a "Cache-Control: public, max-age=[TTL]" header, regardless of any existing Cache-Control header. The actual headers served in responses will not be altered. | false | None | None |
| `default_ttl` | Specifies the default TTL for cached content served by this origin for responses that do not have an existing valid TTL (max-age or s-max-age). When the `cache_mode` is set to "USE_ORIGIN_HEADERS", you must omit this field. | false | None | None |
| `max_ttl` | Specifies the maximum allowed TTL for cached content served by this origin. When the `cache_mode` is set to "USE_ORIGIN_HEADERS", you must omit this field. | false | None | None |
| `client_ttl` | Specifies the maximum allowed TTL for cached content served by this origin. When the `cache_mode` is set to "USE_ORIGIN_HEADERS", you must omit this field. | false | None | None |
| `negative_caching` | Negative caching allows per-status code TTLs to be set, in order to apply fine-grained caching for common errors or redirects. | false | None | None |
| `negative_caching_policy` | Sets a cache TTL for the specified HTTP status code. negativeCaching must be enabled to configure negativeCachingPolicy. Omitting the policy and leaving negativeCaching enabled will use Cloud CDN's default cache TTLs. Structure is [documented below](#nested_cdn_policy_negative_caching_policy). | false | None | None |
| `cache_mode` | Specifies the cache setting for all responses from this backend. The possible values are: USE_ORIGIN_HEADERS, FORCE_CACHE_ALL and CACHE_ALL_STATIC Possible values are: `USE_ORIGIN_HEADERS`, `FORCE_CACHE_ALL`, `CACHE_ALL_STATIC`. | false | None | None |
| `serve_while_stale` | Serve existing content from the cache (if available) when revalidating content with the origin, or when an error is encountered when refreshing the cache. | false | None | None |
| `request_coalescing` | If true then Cloud CDN will combine multiple concurrent cache fill requests into a small number of requests to the origin. | false | None | None |
| `bypass_cache_on_request_headers` | Bypass the cache when the specified request headers are matched - e.g. Pragma or Authorization headers. Up to 5 headers can be specified. The cache is bypassed for all cdnPolicy.cacheMode settings. Structure is [documented below](#nested_cdn_policy_bypass_cache_on_request_headers). | false | None | None |

### cache_key_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_string_whitelist` | Names of query string parameters to include in cache keys. Default parameters are always included. '&' and '=' will be percent encoded and not treated as delimiters. | false | None | None |
| `include_http_headers` | Allows HTTP request headers (by name) to be used in the cache key. | false | None | None |

### negative_caching_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `code` | The HTTP status code to define a TTL against. Only HTTP status codes 300, 301, 308, 404, 405, 410, 421, 451 and 501 can be specified as values, and you cannot specify a status code more than once. | false | None | None |
| `ttl` | The TTL (in seconds) for which to cache responses with the corresponding status code. The maximum allowed value is 1800s (30 minutes), noting that infrequently accessed objects may be evicted from the cache before the defined TTL. | false | None | None |

### bypass_cache_on_request_headers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `header_name` | The header field name to match on when bypassing cache. Values are case-insensitive. | false | None | None |
