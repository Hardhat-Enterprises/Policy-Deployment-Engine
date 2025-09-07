## 🛡️ Policy Deployment Engine: `network_services_edge_cache_service`

This section provides a concise policy evaluation for the `network_services_edge_cache_service` resource in GCP.

Reference: [Terraform Registry – network_services_edge_cache_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_edge_cache_service)

---

## 1. Argument Reference

### `routing`
- Description: (Required) Defines how requests are routed, modified, cached and/or which origin content is filled from. Structure is [documented below](#nested_routing).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the resource; provided by the client when the resource is created. The name must be 1-64 characters long, and match the regular expression [a-zA-Z][a-zA-Z0-9_-]* which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the EdgeCache resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_quic`
- Description: (Optional) HTTP/3 (IETF QUIC) and Google QUIC are enabled by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_http2`
- Description: (Optional) Disables HTTP/2. HTTP/2 (h2) is enabled by default and recommended for performance. HTTP/2 improves connection re-use and reduces connection setup overhead by sending multiple streams over the same connection. Some legacy HTTP clients may have issues with HTTP/2 connections due to broken HTTP/2 implementations. Setting this to true will prevent HTTP/2 from being advertised and negotiated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_tls`
- Description: (Optional) Require TLS (HTTPS) for all clients connecting to this service. Clients who connect over HTTP (port 80) will receive a HTTP 301 to the same URL over HTTPS (port 443). You must have at least one (1) edgeSslCertificate specified to enable this.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edge_ssl_certificates`
- Description: (Optional) URLs to sslCertificate resources that are used to authenticate connections between users and the EdgeCacheService. Note that only "global" certificates with a "scope" of "EDGE_CACHE" can be attached to an EdgeCacheService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_policy`
- Description: (Optional) URL of the SslPolicy resource that will be associated with the EdgeCacheService. If not set, the EdgeCacheService has no SSL policy configured, and will default to the "COMPATIBLE" policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_config`
- Description: (Optional) Specifies the logging options for the traffic served by this service. If logging is enabled, logs will be exported to Cloud Logging. Structure is [documented below](#nested_log_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edge_security_policy`
- Description: (Optional) Resource URL that points at the Cloud Armor edge security policy that is applied on each request against the EdgeCacheService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_routing"></a>The `routing` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_rule`
- Description: (Required) The list of hostRules to match against. These rules define which hostnames the EdgeCacheService will match against, and which route configurations apply. Structure is [documented below](#nested_routing_host_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_matcher`
- Description: (Required) The list of pathMatchers referenced via name by hostRules. PathMatcher is used to match the path portion of the URL when a HostRule matches the URL's host portion. Structure is [documented below](#nested_routing_path_matcher). <a name="nested_routing_host_rule"></a>The `host_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the hostRule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hosts`
- Description: (Required) The list of host patterns to match. Host patterns must be valid hostnames. Ports are not allowed. Wildcard hosts are supported in the suffix or prefix form. * matches any string of ([a-z0-9-.]*). It does not match the empty string. When multiple hosts are specified, hosts are matched in the following priority: 1. Exact domain names: ``www.foo.com``. 2. Suffix domain wildcards: ``*.foo.com`` or ``*-bar.foo.com``. 3. Prefix domain wildcards: ``foo.*`` or ``foo-*``. 4. Special wildcard ``*`` matching any domain. Notes: The wildcard will not match the empty string. e.g. ``*-bar.foo.com`` will match ``baz-bar.foo.com`` but not ``-bar.foo.com``. The longest wildcards match first. Only a single host in the entire service can match on ``*``. A domain must be unique across all configured hosts within a service. Hosts are matched against the HTTP Host header, or for HTTP/2 and HTTP/3, the ":authority" header, from the incoming request. You may specify up to 10 hosts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_matcher`
- Description: (Required) The name of the pathMatcher associated with this hostRule. <a name="nested_routing_path_matcher"></a>The `path_matcher` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name to which this PathMatcher is referred by the HostRule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `route_rule`
- Description: (Required) The routeRules to match against. routeRules support advanced routing behaviour, and can match on paths, headers and query parameters, as well as status codes and HTTP methods. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule). <a name="nested_routing_path_matcher_path_matcher_route_rule"></a>The `route_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Required) The priority of this route rule, where 1 is the highest priority. You cannot configure two or more routeRules with the same priority. Priority for each rule must be set to a number between 1 and 999 inclusive. Priority numbers can have gaps, which enable you to add or remove rules in the future without affecting the rest of the rules. For example, 1, 2, 3, 4, 5, 9, 12, 16 is a valid series of priority numbers to which you could add rules numbered from 6 to 8, 10 to 11, and 13 to 15 in the future without any impact on existing rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description of the routeRule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match_rule`
- Description: (Required) The list of criteria for matching attributes of a request to this routeRule. This list has OR semantics: the request matches this routeRule when any of the matchRules are satisfied. However predicates within a given matchRule have AND semantics. All predicates within a matchRule must match for the request to match the rule. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_match_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `route_methods`
- Description: (Optional) Allow overriding the set of methods that are allowed for this route. When not set, Media CDN allows only "GET", "HEAD", and "OPTIONS". Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_methods).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: (Optional) The header actions, including adding & removing headers, for requests that match this route. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `route_action`
- Description: (Optional) In response to a matching path, the routeAction performs advanced routing actions like URL rewrites, header transformations, etc. prior to forwarding the request to the selected origin. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `origin`
- Description: (Optional) The Origin resource that requests to this route should fetch from when a matching response is not in cache. Origins can be defined as short names ("my-origin") or fully-qualified resource URLs - e.g. "networkservices.googleapis.com/projects/my-project/global/edgecacheorigins/my-origin" Only one of origin or urlRedirect can be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_redirect`
- Description: (Optional) The URL redirect configuration for requests that match this route. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_url_redirect). <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_match_rule"></a>The `match_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_case`
- Description: (Optional) Specifies that prefixMatch and fullPathMatch matches are case sensitive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_match`
- Description: (Optional) Specifies a list of header match criteria, all of which must match corresponding headers in the request. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_match_rule_match_rule_header_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_parameter_match`
- Description: (Optional) Specifies a list of query parameter match criteria, all of which must match corresponding query parameters in the request. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_match_rule_match_rule_query_parameter_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_match`
- Description: (Optional) For satisfying the matchRule condition, the request's path must begin with the specified prefixMatch. prefixMatch must begin with a /.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_template_match`
- Description: (Optional) For satisfying the matchRule condition, the path of the request must match the wildcard pattern specified in pathTemplateMatch after removing any query parameters and anchor that may be part of the original URL. pathTemplateMatch must be between 1 and 255 characters (inclusive).  The pattern specified by pathTemplateMatch may have at most 5 wildcard operators and at most 5 variable captures in total.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `full_path_match`
- Description: (Optional) For satisfying the matchRule condition, the path of the request must exactly match the value specified in fullPathMatch after removing any query parameters and anchor that may be part of the original URL. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_match_rule_match_rule_header_match"></a>The `header_match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The header name to match on.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `present_match`
- Description: (Optional) A header with the contents of headerName must exist. The match takes place whether or not the request's header has a value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exact_match`
- Description: (Optional) The value of the header should exactly match contents of exactMatch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_match`
- Description: (Optional) The value of the header must start with the contents of prefixMatch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `suffix_match`
- Description: (Optional) The value of the header must end with the contents of suffixMatch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_match`
- Description: (Optional) If set to false (default), the headerMatch is considered a match if the match criteria above are met. If set to true, the headerMatch is considered a match if the match criteria above are NOT met. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_match_rule_match_rule_query_parameter_match"></a>The `query_parameter_match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the query parameter to match. The query parameter must exist in the request, in the absence of which the request match fails.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `present_match`
- Description: (Optional) Specifies that the queryParameterMatch matches if the request contains the query parameter, irrespective of whether the parameter has a value or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exact_match`
- Description: (Optional) The queryParameterMatch matches if the value of the parameter exactly matches the contents of exactMatch. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_methods"></a>The `route_methods` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_methods`
- Description: (Optional) The non-empty set of HTTP methods that are allowed for this route. Any combination of "GET", "HEAD", "OPTIONS", "PUT", "POST", "DELETE", and "PATCH". <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action"></a>The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_header_to_add`
- Description: (Optional) Describes a header to add. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action_request_header_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_header_to_add`
- Description: (Optional) Headers to add to the response prior to sending it back to the client. Response headers are only sent to the client, and do not have an effect on the cache serving the response. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action_response_header_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_header_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the origin. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action_request_header_to_remove).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_header_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the origin. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action_response_header_to_remove). <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action_request_header_to_add"></a>The `request_header_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Optional) Whether to replace all existing headers with the same name. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action_response_header_to_add"></a>The `response_header_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Optional) Whether to replace all existing headers with the same name. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action_request_header_to_remove"></a>The `request_header_to_remove` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header to remove. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_header_action_response_header_to_remove"></a>The `response_header_to_remove` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) Headers to remove from the response prior to sending it back to the client. Response headers are only sent to the client, and do not have an effect on the cache serving the response. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action"></a>The `route_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cdn_policy`
- Description: (Optional) The policy to use for defining caching and signed request behaviour for requests that match this route. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cdn_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_rewrite`
- Description: (Optional) The URL rewrite configuration for requests that match this route. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_url_rewrite).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cors_policy`
- Description: (Optional) CORSPolicy defines Cross-Origin-Resource-Sharing configuration, including which CORS response headers will be set. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cors_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compression_mode`
- Description: (Optional) Setting the compression mode to automatic enables dynamic compression for every eligible response. When dynamic compression is enabled, it is recommended to also set a cache policy to maximize efficiency. Possible values are: `DISABLED`, `AUTOMATIC`. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cdn_policy"></a>The `cdn_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cache_mode`
- Description: (Optional) Cache modes allow users to control the behaviour of the cache, what content it should cache automatically, whether to respect origin headers, or whether to unconditionally cache all responses. For all cache modes, Cache-Control headers will be passed to the client. Use clientTtl to override what is sent to the client. Possible values are: `CACHE_ALL_STATIC`, `USE_ORIGIN_HEADERS`, `FORCE_CACHE_ALL`, `BYPASS_CACHE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_ttl`
- Description: (Optional) Specifies a separate client (e.g. browser client) TTL, separate from the TTL used by the edge caches. Leaving this empty will use the same cache TTL for both the CDN and the client-facing response. - The TTL must be > 0 and <= 86400s (1 day) - The clientTtl cannot be larger than the defaultTtl (if set) - Fractions of a second are not allowed. Omit this field to use the defaultTtl, or the max-age set by the origin, as the client-facing TTL. When the cache mode is set to "USE_ORIGIN_HEADERS" or "BYPASS_CACHE", you must omit this field. A duration in seconds terminated by 's'. Example: "3s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_ttl`
- Description: (Optional) Specifies the default TTL for cached content served by this origin for responses that do not have an existing valid TTL (max-age or s-max-age). Defaults to 3600s (1 hour). - The TTL must be >= 0 and <= 31,536,000 seconds (1 year) - Setting a TTL of "0" means "always revalidate" (equivalent to must-revalidate) - The value of defaultTTL cannot be set to a value greater than that of maxTTL. - Fractions of a second are not allowed. - When the cacheMode is set to FORCE_CACHE_ALL, the defaultTTL will overwrite the TTL set in all responses. Note that infrequently accessed objects may be evicted from the cache before the defined TTL. Objects that expire will be revalidated with the origin. When the cache mode is set to "USE_ORIGIN_HEADERS" or "BYPASS_CACHE", you must omit this field. A duration in seconds terminated by 's'. Example: "3s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_ttl`
- Description: (Optional) Specifies the maximum allowed TTL for cached content served by this origin. Defaults to 86400s (1 day). Cache directives that attempt to set a max-age or s-maxage higher than this, or an Expires header more than maxTtl seconds in the future will be capped at the value of maxTTL, as if it were the value of an s-maxage Cache-Control directive. - The TTL must be >= 0 and <= 31,536,000 seconds (1 year) - Setting a TTL of "0" means "always revalidate" - The value of maxTtl must be equal to or greater than defaultTtl. - Fractions of a second are not allowed. When the cache mode is set to "USE_ORIGIN_HEADERS", "FORCE_CACHE_ALL", or "BYPASS_CACHE", you must omit this field. A duration in seconds terminated by 's'. Example: "3s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cache_key_policy`
- Description: (Optional) Defines the request parameters that contribute to the cache key. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cdn_policy_cache_key_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `negative_caching`
- Description: (Optional) Negative caching allows per-status code TTLs to be set, in order to apply fine-grained caching for common errors or redirects. This can reduce the load on your origin and improve end-user experience by reducing response latency. By default, the CDNPolicy will apply the following default TTLs to these status codes: - HTTP 300 (Multiple Choice), 301, 308 (Permanent Redirects): 10m - HTTP 404 (Not Found), 410 (Gone), 451 (Unavailable For Legal Reasons): 120s - HTTP 405 (Method Not Found), 414 (URI Too Long), 501 (Not Implemented): 60s These defaults can be overridden in negativeCachingPolicy
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `negative_caching_policy`
- Description: (Optional) Sets a cache TTL for the specified HTTP status code. negativeCaching must be enabled to configure negativeCachingPolicy. - Omitting the policy and leaving negativeCaching enabled will use the default TTLs for each status code, defined in negativeCaching. - TTLs must be >= 0 (where 0 is "always revalidate") and <= 86400s (1 day) Note that when specifying an explicit negativeCachingPolicy, you should take care to specify a cache TTL for all response codes that you wish to cache. The CDNPolicy will not apply any default negative caching when a policy exists.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signed_request_mode`
- Description: (Optional) Whether to enforce signed requests. The default value is DISABLED, which means all content is public, and does not authorize access. You must also set a signedRequestKeyset to enable signed requests. When set to REQUIRE_SIGNATURES, all matching requests will have their signature validated. Requests that were not signed with the corresponding private key, or that are otherwise invalid (expired, do not match the signature, IP address, or header) will be rejected with a HTTP 403 and (if enabled) logged. Possible values are: `DISABLED`, `REQUIRE_SIGNATURES`, `REQUIRE_TOKENS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signed_request_keyset`
- Description: (Optional) The EdgeCacheKeyset containing the set of public keys used to validate signed requests at the edge.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signed_token_options`
- Description: (Optional) Additional options for signed tokens. signedTokenOptions may only be specified when signedRequestMode is REQUIRE_TOKENS. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cdn_policy_signed_token_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `add_signatures`
- Description: (Optional) Enable signature generation or propagation on this route. This field may only be specified when signedRequestMode is set to REQUIRE_TOKENS. Structure is [documented below](#nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cdn_policy_add_signatures).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signed_request_maximum_expiration_ttl`
- Description: (Optional) Limit how far into the future the expiration time of a signed request may be. When set, a signed request is rejected if its expiration time is later than now + signedRequestMaximumExpirationTtl, where now is the time at which the signed request is first handled by the CDN. - The TTL must be > 0. - Fractions of a second are not allowed. By default, signedRequestMaximumExpirationTtl is not set and the expiration time of a signed request may be arbitrarily far into future. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cdn_policy_cache_key_policy"></a>The `cache_key_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_protocol`
- Description: (Optional) If true, http and https requests will be cached separately.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_query_string`
- Description: (Optional) If true, exclude query string parameters from the cache key If false (the default), include the query string parameters in the cache key according to includeQueryParameters and excludeQueryParameters. If neither includeQueryParameters nor excludeQueryParameters is set, the entire query string will be included.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_host`
- Description: (Optional) If true, requests to different hosts will be cached separately. Note: this should only be enabled if hosts share the same origin and content. Removing the host from the cache key may inadvertently result in different objects being cached than intended, depending on which route the first user matched.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_query_parameters`
- Description: (Optional) Names of query string parameters to include in cache keys. All other parameters will be excluded. Either specify includedQueryParameters or excludedQueryParameters, not both. '&' and '=' will be percent encoded and not treated as delimiters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_query_parameters`
- Description: (Optional) Names of query string parameters to exclude from cache keys. All other parameters will be included. Either specify includedQueryParameters or excludedQueryParameters, not both. '&' and '=' will be percent encoded and not treated as delimiters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_header_names`
- Description: (Optional) Names of HTTP request headers to include in cache keys. The value of the header field will be used as part of the cache key. - Header names must be valid HTTP RFC 7230 header field values. - Header field names are case insensitive - To include the HTTP method, use ":method" Note that specifying several headers, and/or headers that have a large range of values (e.g. per-user) will dramatically impact the cache hit rate, and may result in a higher eviction rate and reduced performance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_cookie_names`
- Description: (Optional) Names of Cookies to include in cache keys.  The cookie name and cookie value of each cookie named will be used as part of the cache key. Cookie names: - must be valid RFC 6265 "cookie-name" tokens - are case sensitive - cannot start with "Edge-Cache-" (case insensitive) Note that specifying several cookies, and/or cookies that have a large range of values (e.g., per-user) will dramatically impact the cache hit rate, and may result in a higher eviction rate and reduced performance. You may specify up to three cookie names. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cdn_policy_signed_token_options"></a>The `signed_token_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_query_parameter`
- Description: (Optional) The query parameter in which to find the token. The name must be 1-64 characters long and match the regular expression `[a-zA-Z]([a-zA-Z0-9_-])*` which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit. Defaults to `edge-cache-token`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_signature_algorithms`
- Description: (Optional) The allowed signature algorithms to use. Defaults to using only ED25519. You may specify up to 3 signature algorithms to use. Each value may be one of: `ED25519`, `HMAC_SHA_256`, `HMAC_SHA1`. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cdn_policy_add_signatures"></a>The `add_signatures` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Required) The actions to take to add signatures to responses. Each value may be one of: `GENERATE_COOKIE`, `GENERATE_TOKEN_HLS_COOKIELESS`, `PROPAGATE_TOKEN_HLS_COOKIELESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `keyset`
- Description: (Optional) The keyset to use for signature generation. The following are both valid paths to an EdgeCacheKeyset resource:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_ttl`
- Description: (Optional) The duration the token is valid starting from the moment the token is first generated. Defaults to `86400s` (1 day). The TTL must be >= 0 and <= 604,800 seconds (1 week). This field may only be specified when the GENERATE_COOKIE or GENERATE_TOKEN_HLS_COOKIELESS actions are specified. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_query_parameter`
- Description: (Optional) The query parameter in which to put the generated token. If not specified, defaults to `edge-cache-token`. If specified, the name must be 1-64 characters long and match the regular expression `[a-zA-Z]([a-zA-Z0-9_-])*` which means the first character must be a letter, and all following characters must be a dash, underscore, letter or digit. This field may only be set when the GENERATE_TOKEN_HLS_COOKIELESS or PROPAGATE_TOKEN_HLS_COOKIELESS actions are specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `copied_parameters`
- Description: (Optional) The parameters to copy from the verified token to the generated token. Only the following parameters may be copied:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_prefix_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected origin, the matching portion of the request's path is replaced by pathPrefixRewrite.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected origin, the request's host header is replaced with contents of hostRewrite.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_template_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected origin, if the request matched a pathTemplateMatch, the matching portion of the request's path is replaced re-written using the pattern specified by pathTemplateRewrite. pathTemplateRewrite must be between 1 and 255 characters (inclusive), must start with a '/', and must only use variables captured by the route's pathTemplate matchers. pathTemplateRewrite may only be used when all of a route's MatchRules specify pathTemplate. Only one of pathPrefixRewrite and pathTemplateRewrite may be specified. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_route_action_cors_policy"></a>The `cors_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age`
- Description: (Required) Specifies how long results of a preflight request can be cached by a client in seconds. Note that many browser clients enforce a maximum TTL of 600s (10 minutes). - Setting the value to -1 forces a pre-flight check for all requests (not recommended) - A maximum TTL of 86400s can be set, but note that (as above) some clients may force pre-flight checks at a more regular interval. - This translates to the Access-Control-Max-Age header. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_credentials`
- Description: (Optional) In response to a preflight request, setting this to true indicates that the actual request can include user credentials. This translates to the Access-Control-Allow-Credentials response header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origins`
- Description: (Optional) Specifies the list of origins that will be allowed to do CORS requests. This translates to the Access-Control-Allow-Origin response header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_methods`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Methods response header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_headers`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Headers response header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expose_headers`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Headers response header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) If true, specifies the CORS policy is disabled. The default value is false, which indicates that the CORS policy is in effect. <a name="nested_routing_path_matcher_path_matcher_route_rule_route_rule_url_redirect"></a>The `url_redirect` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_redirect`
- Description: (Optional) The host that will be used in the redirect response instead of the one that was supplied in the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_redirect`
- Description: (Optional) The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect cannot be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The path value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_redirect`
- Description: (Optional) The prefix that replaces the prefixMatch specified in the routeRule, retaining the remaining portion of the URL before redirecting the request. prefixRedirect cannot be supplied together with pathRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_response_code`
- Description: (Optional) The HTTP Status code to use for this RedirectAction. The supported values are: - `MOVED_PERMANENTLY_DEFAULT`, which is the default value and corresponds to 301. - `FOUND`, which corresponds to 302. - `SEE_OTHER` which corresponds to 303. - `TEMPORARY_REDIRECT`, which corresponds to 307. in this case, the request method will be retained. - `PERMANENT_REDIRECT`, which corresponds to 308. in this case, the request method will be retained. Possible values are: `MOVED_PERMANENTLY_DEFAULT`, `FOUND`, `SEE_OTHER`, `TEMPORARY_REDIRECT`, `PERMANENT_REDIRECT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_redirect`
- Description: (Optional) If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This can only be set if there is at least one (1) edgeSslCertificate set on the service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strip_query`
- Description: (Optional) If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained. <a name="nested_log_config"></a>The `log_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: (Required) Specifies whether to enable logging for traffic served by this service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sample_rate`
- Description: (Optional) Configures the sampling rate of requests, where 1.0 means all logged requests are reported and 0.0 means no logged requests are reported. The default value is 1.0, and the value of the field must be in [0, 1]. This field can only be specified if logging is enabled for this service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
