## 🛡️ Policy Deployment Engine: `compute_backend_service`

This section provides a concise policy evaluation for the `compute_backend_service` resource in GCP.

Reference: [Terraform Registry – compute_backend_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `affinity_cookie_ttl_sec`
- Description: (Optional) Lifetime of cookies in seconds if session_affinity is GENERATED_COOKIE. If set to 0, the cookie is non-persistent and lasts only until the end of the browser session (or equivalent). The maximum allowed value for TTL is one day. When the load balancing scheme is INTERNAL, this field is not used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend`
- Description: (Optional) The set of backends that serve this BackendService. Structure is [documented below](#nested_backend).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `circuit_breakers`
- Description: (Optional) Settings controlling the volume of connections to a backend service. This field is applicable only when the load_balancing_scheme is set to INTERNAL_SELF_MANAGED. Structure is [documented below](#nested_circuit_breakers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compression_mode`
- Description: (Optional) Compress text responses using Brotli or gzip compression, based on the client's Accept-Encoding header. Possible values are: `AUTOMATIC`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consistent_hash`
- Description: (Optional) Consistent Hash-based load balancing can be used to provide soft session affinity based on HTTP headers, cookies or other properties. This load balancing policy is applicable only for HTTP connections. The affinity to a particular destination host will be lost when one or more hosts are added/removed from the destination service. This field specifies parameters that control consistent hashing. This field only applies if the load_balancing_scheme is set to INTERNAL_SELF_MANAGED. This field is only applicable when locality_lb_policy is set to MAGLEV or RING_HASH. Structure is [documented below](#nested_consistent_hash).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cdn_policy`
- Description: (Optional) Cloud CDN configuration for this BackendService. Structure is [documented below](#nested_cdn_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connection_draining_timeout_sec`
- Description: (Optional) Time for which instance will be drained (not accept new connections, but still work to finish started).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_request_headers`
- Description: (Optional) Headers that the HTTP/S load balancer should add to proxied requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_response_headers`
- Description: (Optional) Headers that the HTTP/S load balancer should add to proxied responses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_cdn`
- Description: (Optional) If true, enable Cloud CDN for this BackendService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `health_checks`
- Description: (Optional) The set of URLs to the HttpHealthCheck or HttpsHealthCheck resource for health checking this BackendService. Currently at most one health check can be specified. A health check must be specified unless the backend service uses an internet or serverless NEG as a backend. For internal load balancing, a URL to a HealthCheck resource must be specified instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `iap`
- Description: (Optional) Settings for enabling Cloud Identity Aware Proxy. If OAuth client is not set, the Google-managed OAuth client is used. Structure is [documented below](#nested_iap).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address_selection_policy`
- Description: (Optional) Specifies preference of traffic to the backend (from the proxy and from the client for proxyless gRPC). Possible values are: `IPV4_ONLY`, `PREFER_IPV6`, `IPV6_ONLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancing_scheme`
- Description: (Optional) Indicates whether the backend service will be used with internal or external load balancing. A backend service created for one type of load balancing cannot be used with the other. For more information, refer to [Choosing a load balancer](https://cloud.google.com/load-balancing/docs/backend-service). Default value is `EXTERNAL`. Possible values are: `EXTERNAL`, `INTERNAL_SELF_MANAGED`, `INTERNAL_MANAGED`, `EXTERNAL_MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_managed_migration_state`
- Description: (Optional) Specifies the canary migration state. Possible values are PREPARE, TEST_BY_PERCENTAGE, and TEST_ALL_TRAFFIC. To begin the migration from EXTERNAL to EXTERNAL_MANAGED, the state must be changed to PREPARE. The state must be changed to TEST_ALL_TRAFFIC before the loadBalancingScheme can be changed to EXTERNAL_MANAGED. Optionally, the TEST_BY_PERCENTAGE state can be used to migrate traffic by percentage using externalManagedMigrationTestingPercentage. Rolling back a migration requires the states to be set in reverse order. So changing the scheme from EXTERNAL_MANAGED to EXTERNAL requires the state to be set to TEST_ALL_TRAFFIC at the same time. Optionally, the TEST_BY_PERCENTAGE state can be used to migrate some traffic back to EXTERNAL or PREPARE can be used to migrate all traffic back to EXTERNAL. Possible values are: `PREPARE`, `TEST_BY_PERCENTAGE`, `TEST_ALL_TRAFFIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_managed_migration_testing_percentage`
- Description: (Optional) Determines the fraction of requests that should be processed by the Global external Application Load Balancer. The value of this field must be in the range [0, 100]. Session affinity options will slightly affect this routing behavior, for more details, see: Session Affinity. This value can only be set if the loadBalancingScheme in the backend service is set to EXTERNAL (when using the Classic ALB) and the migration state is TEST_BY_PERCENTAGE.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locality_lb_policy`
- Description: (Optional) The load balancing algorithm used within the scope of the locality. The possible values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locality_lb_policies`
- Description: (Optional) A list of locality load balancing policies to be used in order of preference. Either the policy or the customPolicy field should be set. Overrides any value set in the localityLbPolicy field. localityLbPolicies is only supported when the BackendService is referenced by a URL Map that is referenced by a target gRPC proxy that has the validateForProxyless field set to true. Structure is [documented below](#nested_locality_lb_policies).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_metrics`
- Description: (Optional) List of custom metrics that are used for the WEIGHTED_ROUND_ROBIN locality_lb_policy. Structure is [documented below](#nested_custom_metrics).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `outlier_detection`
- Description: (Optional) Settings controlling eviction of unhealthy hosts from the load balancing pool. Applicable backend service types can be a global backend service with the loadBalancingScheme set to INTERNAL_SELF_MANAGED or EXTERNAL_MANAGED. Structure is [documented below](#nested_outlier_detection).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_name`
- Description: (Optional) Name of backend port. The same name should appear in the instance groups referenced by this service. Required when the load balancing scheme is EXTERNAL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol`
- Description: (Optional) The protocol this BackendService uses to communicate with backends. The default is HTTP. Possible values are HTTP, HTTPS, HTTP2, H2C, TCP, SSL, UDP or GRPC. Refer to the documentation for the load balancers or for Traffic Director for more information. Must be set to GRPC when the backend service is referenced by a URL map that is bound to target gRPC proxy. Possible values are: `HTTP`, `HTTPS`, `HTTP2`, `TCP`, `SSL`, `UDP`, `GRPC`, `UNSPECIFIED`, `H2C`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_policy`
- Description: (Optional) The security policy associated with this backend service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `edge_security_policy`
- Description: (Optional) The resource URL for the edge security policy associated with this backend service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_settings`
- Description: (Optional) The security settings that apply to this backend service. This field is applicable to either a regional backend service with the service_protocol set to HTTP, HTTPS, HTTP2 or H2C, and load_balancing_scheme set to INTERNAL_MANAGED; or a global backend service with the load_balancing_scheme set to INTERNAL_SELF_MANAGED. Structure is [documented below](#nested_security_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_affinity`
- Description: (Optional) Type of session affinity to use. The default is NONE. Session affinity is not applicable if the protocol is UDP. Possible values are: `NONE`, `CLIENT_IP`, `CLIENT_IP_PORT_PROTO`, `CLIENT_IP_PROTO`, `GENERATED_COOKIE`, `HEADER_FIELD`, `HTTP_COOKIE`, `STRONG_COOKIE_AFFINITY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strong_session_affinity_cookie`
- Description: (Optional) Describes the HTTP cookie used for stateful session affinity. This field is applicable and required if the sessionAffinity is set to STRONG_COOKIE_AFFINITY. Structure is [documented below](#nested_strong_session_affinity_cookie).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout_sec`
- Description: (Optional) The backend service timeout has a different meaning depending on the type of load balancer. For more information see, [Backend service settings](https://cloud.google.com/compute/docs/reference/rest/v1/backendServices). The default is 30 seconds. The full range of timeout values allowed goes from 1 through 2,147,483,647 seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_config`
- Description: (Optional) This field denotes the logging options for the load balancer traffic served by this backend service. If logging is enabled, logs will be exported to Stackdriver. Structure is [documented below](#nested_log_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_lb_policy`
- Description: (Optional) URL to networkservices.ServiceLbPolicy resource. Can only be set if load balancing scheme is EXTERNAL, EXTERNAL_MANAGED, INTERNAL_MANAGED or INTERNAL_SELF_MANAGED and the scope is global.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_settings`
- Description: (Optional) Configuration for Backend Authenticated TLS and mTLS. May only be specified when the backend protocol is SSL, HTTPS or HTTP2. Structure is [documented below](#nested_tls_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_stream_duration`
- Description: (Optional) Specifies the default maximum duration (timeout) for streams to this service. Duration is computed from the beginning of the stream until the response has been completely processed, including all retries. A stream that does not complete in this duration is closed. If not specified, there will be no timeout limit, i.e. the maximum duration is infinite. This value can be overridden in the PathMatcher configuration of the UrlMap that references this backend service. This field is only allowed when the loadBalancingScheme of the backend service is INTERNAL_SELF_MANAGED. Structure is [documented below](#nested_max_stream_duration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_pass_through_lb_traffic_policy`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Configures traffic steering properties of internal passthrough Network Load Balancers. Structure is [documented below](#nested_network_pass_through_lb_traffic_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dynamic_forwarding`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Dynamic forwarding configuration. This field is used to configure the backend service with dynamic forwarding feature which together with Service Extension allows customized and complex routing logic. Structure is [documented below](#nested_dynamic_forwarding).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_backend"></a>The `backend` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `balancing_mode`
- Description: (Optional) Specifies the balancing mode for this backend. For global HTTP(S) or TCP/SSL load balancing, the default is UTILIZATION. Valid values are UTILIZATION, RATE (for HTTP(S)), CUSTOM_METRICS (for HTTP(s)) and CONNECTION (for TCP/SSL). See the [Backend Services Overview](https://cloud.google.com/load-balancing/docs/backend-service#balancing-mode) for an explanation of load balancing modes. Default value is `UTILIZATION`. Possible values are: `UTILIZATION`, `RATE`, `CONNECTION`, `CUSTOM_METRICS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity_scaler`
- Description: (Optional) A multiplier applied to the group's maximum servicing capacity (based on UTILIZATION, RATE or CONNECTION). Default value is 1, which means the group will serve up to 100% of its configured capacity (depending on balancingMode). A setting of 0 means the group is completely drained, offering 0% of its available Capacity. Valid range is [0.0,1.0].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preference`
- Description: (Optional) This field indicates whether this backend should be fully utilized before sending traffic to backends with default preference. This field cannot be set when loadBalancingScheme is set to 'EXTERNAL'. The possible values are: - PREFERRED: Backends with this preference level will be filled up to their capacity limits first, based on RTT. - DEFAULT: If preferred backends don't have enough capacity, backends in this layer would be used and traffic would be assigned based on the load balancing algorithm you use. This is the default Possible values are: `PREFERRED`, `DEFAULT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group`
- Description: (Required) The fully-qualified URL of an Instance Group or Network Endpoint Group resource. In case of instance group this defines the list of instances that serve traffic. Member virtual machine instances from each instance group must live in the same zone as the instance group itself. No two backends in a backend service are allowed to use same Instance Group resource. For Network Endpoint Groups this defines list of endpoints. All endpoints of Network Endpoint Group must be hosted on instances located in the same zone as the Network Endpoint Group. Backend services cannot mix Instance Group and Network Endpoint Group backends. Note that you must specify an Instance Group or Network Endpoint Group resource using the fully-qualified URL, rather than a partial URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_connections`
- Description: (Optional) The max number of simultaneous connections for the group. Can be used with either CONNECTION or UTILIZATION balancing modes. For CONNECTION mode, either maxConnections or one of maxConnectionsPerInstance or maxConnectionsPerEndpoint, as appropriate for group type, must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_connections_per_instance`
- Description: (Optional) The max number of simultaneous connections that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes. For CONNECTION mode, either maxConnections or maxConnectionsPerInstance must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_connections_per_endpoint`
- Description: (Optional) The max number of simultaneous connections that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either CONNECTION or UTILIZATION balancing modes. For CONNECTION mode, either maxConnections or maxConnectionsPerEndpoint must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_rate`
- Description: (Optional) The max requests per second (RPS) of the group. Can be used with either RATE or UTILIZATION balancing modes, but required if RATE mode. For RATE mode, either maxRate or one of maxRatePerInstance or maxRatePerEndpoint, as appropriate for group type, must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_rate_per_instance`
- Description: (Optional) The max requests per second (RPS) that a single backend instance can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerInstance must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_rate_per_endpoint`
- Description: (Optional) The max requests per second (RPS) that a single backend network endpoint can handle. This is used to calculate the capacity of the group. Can be used in either balancing mode. For RATE mode, either maxRate or maxRatePerEndpoint must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_utilization`
- Description: (Optional) Used when balancingMode is UTILIZATION. This ratio defines the CPU utilization target for the group. Valid range is [0.0, 1.0].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_metrics`
- Description: (Optional) The set of custom metrics that are used for <code>CUSTOM_METRICS</code> BalancingMode. Structure is [documented below](#nested_backend_backend_custom_metrics). <a name="nested_backend_backend_custom_metrics"></a>The `custom_metrics` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of a custom utilization signal. The name must be 1-64 characters long and match the regular expression [a-z]([-_.a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, period, underscore, lowercase letter, or digit, except the last character, which cannot be a dash, period, or underscore. For usage guidelines, see Custom Metrics balancing mode. This field can only be used for a global or regional backend service with the loadBalancingScheme set to <code>EXTERNAL_MANAGED</code>, <code>INTERNAL_MANAGED</code> <code>INTERNAL_SELF_MANAGED</code>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dry_run`
- Description: (Required) If true, the metric data is collected and reported to Cloud Monitoring, but is not used for load balancing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_utilization`
- Description: (Optional) Optional parameter to define a target utilization for the Custom Metrics balancing mode. The valid range is <code>[0.0, 1.0]</code>. <a name="nested_circuit_breakers"></a>The `circuit_breakers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connect_timeout`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The timeout for new network connections to hosts. Structure is [documented below](#nested_circuit_breakers_connect_timeout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_requests_per_connection`
- Description: (Optional) Maximum requests for a single backend connection. This parameter is respected by both the HTTP/1.1 and HTTP/2 implementations. If not specified, there is no limit. Setting this parameter to 1 will effectively disable keep alive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_connections`
- Description: (Optional) The maximum number of connections to the backend cluster. Defaults to 1024.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_pending_requests`
- Description: (Optional) The maximum number of pending requests to the backend cluster. Defaults to 1024.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_requests`
- Description: (Optional) The maximum number of parallel requests to the backend cluster. Defaults to 1024.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_retries`
- Description: (Optional) The maximum number of parallel retries to the backend cluster. Defaults to 3. <a name="nested_circuit_breakers_connect_timeout"></a>The `connect_timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_consistent_hash"></a>The `consistent_hash` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_cookie`
- Description: (Optional) Hash is based on HTTP Cookie. This field describes a HTTP cookie that will be used as the hash key for the consistent hash load balancer. If the cookie is not present, it will be generated. This field is applicable if the sessionAffinity is set to HTTP_COOKIE. Structure is [documented below](#nested_consistent_hash_http_cookie).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_header_name`
- Description: (Optional) The hash based on the value of the specified header field. This field is applicable if the sessionAffinity is set to HEADER_FIELD.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minimum_ring_size`
- Description: (Optional) The minimum number of virtual nodes to use for the hash ring. Larger ring sizes result in more granular load distributions. If the number of hosts in the load balancing pool is larger than the ring size, each host will be assigned a single virtual node. Defaults to 1024. <a name="nested_consistent_hash_http_cookie"></a>The `http_cookie` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Optional) Lifetime of the cookie. Structure is [documented below](#nested_consistent_hash_http_cookie_ttl).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the cookie.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Path to set for the cookie. <a name="nested_consistent_hash_http_cookie_ttl"></a>The `ttl` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_cdn_policy"></a>The `cdn_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_coalescing`
- Description: (Optional) If true then Cloud CDN will combine multiple concurrent cache fill requests into a small number of requests to the origin.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cache_key_policy`
- Description: (Optional) The CacheKeyPolicy for this CdnPolicy. Structure is [documented below](#nested_cdn_policy_cache_key_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signed_url_cache_max_age_sec`
- Description: (Optional) Maximum number of seconds the response to a signed URL request will be considered fresh, defaults to 1hr (3600s). After this time period, the response will be revalidated before being served. When serving responses to signed URL requests, Cloud CDN will internally behave as though all responses from this backend had a "Cache-Control: public, max-age=[TTL]" header, regardless of any existing Cache-Control header. The actual headers served in responses will not be altered.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_ttl`
- Description: (Optional) Specifies the default TTL for cached content served by this origin for responses that do not have an existing valid TTL (max-age or s-max-age).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_ttl`
- Description: (Optional) Specifies the maximum allowed TTL for cached content served by this origin.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_ttl`
- Description: (Optional) Specifies the maximum allowed TTL for cached content served by this origin.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `negative_caching`
- Description: (Optional) Negative caching allows per-status code TTLs to be set, in order to apply fine-grained caching for common errors or redirects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `negative_caching_policy`
- Description: (Optional) Sets a cache TTL for the specified HTTP status code. negativeCaching must be enabled to configure negativeCachingPolicy. Omitting the policy and leaving negativeCaching enabled will use Cloud CDN's default cache TTLs. Structure is [documented below](#nested_cdn_policy_negative_caching_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cache_mode`
- Description: (Optional) Specifies the cache setting for all responses from this backend. The possible values are: USE_ORIGIN_HEADERS, FORCE_CACHE_ALL and CACHE_ALL_STATIC Possible values are: `USE_ORIGIN_HEADERS`, `FORCE_CACHE_ALL`, `CACHE_ALL_STATIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serve_while_stale`
- Description: (Optional) Serve existing content from the cache (if available) when revalidating content with the origin, or when an error is encountered when refreshing the cache.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bypass_cache_on_request_headers`
- Description: (Optional) Bypass the cache when the specified request headers are matched - e.g. Pragma or Authorization headers. Up to 5 headers can be specified. The cache is bypassed for all cdnPolicy.cacheMode settings. Structure is [documented below](#nested_cdn_policy_bypass_cache_on_request_headers). <a name="nested_cdn_policy_cache_key_policy"></a>The `cache_key_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_host`
- Description: (Optional) If true requests to different hosts will be cached separately.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_protocol`
- Description: (Optional) If true, http and https requests will be cached separately.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_query_string`
- Description: (Optional) If true, include query string parameters in the cache key according to query_string_whitelist and query_string_blacklist. If neither is set, the entire query string will be included. If false, the query string will be excluded from the cache key entirely.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_string_blacklist`
- Description: (Optional) Names of query string parameters to exclude in cache keys. All other parameters will be included. Either specify query_string_whitelist or query_string_blacklist, not both. '&' and '=' will be percent encoded and not treated as delimiters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_string_whitelist`
- Description: (Optional) Names of query string parameters to include in cache keys. All other parameters will be excluded. Either specify query_string_whitelist or query_string_blacklist, not both. '&' and '=' will be percent encoded and not treated as delimiters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_http_headers`
- Description: (Optional) Allows HTTP request headers (by name) to be used in the cache key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_named_cookies`
- Description: (Optional) Names of cookies to include in cache keys. <a name="nested_cdn_policy_negative_caching_policy"></a>The `negative_caching_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code`
- Description: (Optional) The HTTP status code to define a TTL against. Only HTTP status codes 300, 301, 308, 404, 405, 410, 421, 451 and 501 can be specified as values, and you cannot specify a status code more than once.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Optional) The TTL (in seconds) for which to cache responses with the corresponding status code. The maximum allowed value is 1800s (30 minutes), noting that infrequently accessed objects may be evicted from the cache before the defined TTL. <a name="nested_cdn_policy_bypass_cache_on_request_headers"></a>The `bypass_cache_on_request_headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The header field name to match on when bypassing cache. Values are case-insensitive. <a name="nested_iap"></a>The `iap` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether the serving infrastructure will authenticate and authorize all incoming requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_id`
- Description: (Optional) OAuth2 Client ID for IAP
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_secret`
- Description: (Optional) OAuth2 Client Secret for IAP **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_secret_sha256`
- Description: (Output) OAuth2 Client Secret SHA-256 for IAP **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_locality_lb_policies"></a>The `locality_lb_policies` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy`
- Description: (Optional) The configuration for a built-in load balancing policy. Structure is [documented below](#nested_locality_lb_policies_locality_lb_policies_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_policy`
- Description: (Optional) The configuration for a custom policy implemented by the user and deployed with the client. Structure is [documented below](#nested_locality_lb_policies_locality_lb_policies_custom_policy). <a name="nested_locality_lb_policies_locality_lb_policies_policy"></a>The `policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of a locality load balancer policy to be used. The value should be one of the predefined ones as supported by localityLbPolicy, although at the moment only ROUND_ROBIN is supported. This field should only be populated when the customPolicy field is not used. Note that specifying the same policy more than once for a backend is not a valid configuration and will be rejected. The possible values are:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Identifies the custom policy. The value should match the type the custom implementation is registered with on the gRPC clients. It should follow protocol buffer message naming conventions and include the full path (e.g. myorg.CustomLbPolicy). The maximum length is 256 characters. Note that specifying the same custom policy more than once for a backend is not a valid configuration and will be rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data`
- Description: (Optional) An optional, arbitrary JSON object with configuration data, understood by a locally installed custom policy implementation. <a name="nested_custom_metrics"></a>The `custom_metrics` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of a custom utilization signal. The name must be 1-64 characters long and match the regular expression [a-z]([-_.a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, period, underscore, lowercase letter, or digit, except the last character, which cannot be a dash, period, or underscore. For usage guidelines, see Custom Metrics balancing mode. This field can only be used for a global or regional backend service with the loadBalancingScheme set to <code>EXTERNAL_MANAGED</code>, <code>INTERNAL_MANAGED</code> <code>INTERNAL_SELF_MANAGED</code>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dry_run`
- Description: (Required) If true, the metric data is not used for load balancing. <a name="nested_outlier_detection"></a>The `outlier_detection` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_ejection_time`
- Description: (Optional) The base time that a host is ejected for. The real time is equal to the base time multiplied by the number of times the host has been ejected. Defaults to 30000ms or 30s. Structure is [documented below](#nested_outlier_detection_base_ejection_time).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consecutive_errors`
- Description: (Optional) Number of errors before a host is ejected from the connection pool. When the backend host is accessed over HTTP, a 5xx return code qualifies as an error. Defaults to 5.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consecutive_gateway_failure`
- Description: (Optional) The number of consecutive gateway failures (502, 503, 504 status or connection errors that are mapped to one of those status codes) before a consecutive gateway failure ejection occurs. Defaults to 5.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforcing_consecutive_errors`
- Description: (Optional) The percentage chance that a host will be actually ejected when an outlier status is detected through consecutive 5xx. This setting can be used to disable ejection or to ramp it up slowly. Defaults to 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforcing_consecutive_gateway_failure`
- Description: (Optional) The percentage chance that a host will be actually ejected when an outlier status is detected through consecutive gateway failures. This setting can be used to disable ejection or to ramp it up slowly. Defaults to 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforcing_success_rate`
- Description: (Optional) The percentage chance that a host will be actually ejected when an outlier status is detected through success rate statistics. This setting can be used to disable ejection or to ramp it up slowly. Defaults to 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interval`
- Description: (Optional) Time interval between ejection sweep analysis. This can result in both new ejections as well as hosts being returned to service. Defaults to 10 seconds. Structure is [documented below](#nested_outlier_detection_interval).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_ejection_percent`
- Description: (Optional) Maximum percentage of hosts in the load balancing pool for the backend service that can be ejected. Defaults to 10%.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `success_rate_minimum_hosts`
- Description: (Optional) The number of hosts in a cluster that must have enough request volume to detect success rate outliers. If the number of hosts is less than this setting, outlier detection via success rate statistics is not performed for any host in the cluster. Defaults to 5.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `success_rate_request_volume`
- Description: (Optional) The minimum number of total requests that must be collected in one interval (as defined by the interval duration above) to include this host in success rate based outlier detection. If the volume is lower than this setting, outlier detection via success rate statistics is not performed for that host. Defaults to 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `success_rate_stdev_factor`
- Description: (Optional) This factor is used to determine the ejection threshold for success rate outlier ejection. The ejection threshold is the difference between the mean success rate, and the product of this factor and the standard deviation of the mean success rate: mean - (stdev * success_rate_stdev_factor). This factor is divided by a thousand to get a double. That is, if the desired factor is 1.9, the runtime value should be 1900. Defaults to 1900. <a name="nested_outlier_detection_base_ejection_time"></a>The `base_ejection_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive. <a name="nested_outlier_detection_interval"></a>The `interval` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive. <a name="nested_security_settings"></a>The `security_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_tls_policy`
- Description: (Optional) ClientTlsPolicy is a resource that specifies how a client should authenticate connections to backends of a service. This resource itself does not affect configuration unless it is attached to a backend service resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject_alt_names`
- Description: (Optional) A list of alternate names to verify the subject identity in the certificate. If specified, the client will verify that the server certificate's subject alt name matches one of the specified values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aws_v4_authentication`
- Description: (Optional) The configuration needed to generate a signature for access to private storage buckets that support AWS's Signature Version 4 for authentication. Allowed only for INTERNET_IP_PORT and INTERNET_FQDN_PORT NEG backends. Structure is [documented below](#nested_security_settings_aws_v4_authentication). <a name="nested_security_settings_aws_v4_authentication"></a>The `aws_v4_authentication` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_key_id`
- Description: (Optional) The identifier of an access key used for s3 bucket authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_key`
- Description: (Optional) The access key used for s3 bucket authentication. Required for updating or creating a backend that uses AWS v4 signature authentication, but will not be returned as part of the configuration when queried with a REST API GET request. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_key_version`
- Description: (Optional) The optional version identifier for the access key. You can use this to keep track of different iterations of your access key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `origin_region`
- Description: (Optional) The name of the cloud region of your origin. This is a free-form field with the name of the region your cloud uses to host your origin. For example, "us-east-1" for AWS or "us-ashburn-1" for OCI. <a name="nested_strong_session_affinity_cookie"></a>The `strong_session_affinity_cookie` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ttl`
- Description: (Optional) Lifetime of the cookie. Structure is [documented below](#nested_strong_session_affinity_cookie_ttl).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the cookie.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Path to set for the cookie. <a name="nested_strong_session_affinity_cookie_ttl"></a>The `ttl` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_log_config"></a>The `log_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: (Optional) Whether to enable logging for the load balancer traffic served by this backend service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sample_rate`
- Description: (Optional) This field can only be specified if logging is enabled for this backend service. The value of the field must be in [0, 1]. This configures the sampling rate of requests to the load balancer where 1.0 means all logged requests are reported and 0.0 means no logged requests are reported. The default value is 1.0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `optional_mode`
- Description: (Optional) Specifies the optional logging mode for the load balancer traffic. Supported values: INCLUDE_ALL_OPTIONAL, EXCLUDE_ALL_OPTIONAL, CUSTOM. Possible values are: `INCLUDE_ALL_OPTIONAL`, `EXCLUDE_ALL_OPTIONAL`, `CUSTOM`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `optional_fields`
- Description: (Optional) This field can only be specified if logging is enabled for this backend service and "logConfig.optionalMode" was set to CUSTOM. Contains a list of optional fields you want to include in the logs. For example: serverInstance, serverGkeDetails.cluster, serverGkeDetails.pod.podNamespace For example: orca_load_report, tls.protocol <a name="nested_tls_settings"></a>The `tls_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sni`
- Description: (Optional) Server Name Indication - see RFC3546 section 3.1. If set, the load balancer sends this string as the SNI hostname in the TLS connection to the backend, and requires that this string match a Subject Alternative Name (SAN) in the backend's server certificate. With a Regional Internet NEG backend, if the SNI is specified here, the load balancer uses it regardless of whether the Regional Internet NEG is specified with FQDN or IP address and port.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject_alt_names`
- Description: (Optional) A list of Subject Alternative Names (SANs) that the Load Balancer verifies during a TLS handshake with the backend. When the server presents its X.509 certificate to the Load Balancer, the Load Balancer inspects the certificate's SAN field, and requires that at least one SAN match one of the subjectAltNames in the list. This field is limited to 5 entries. When both sni and subjectAltNames are specified, the load balancer matches the backend certificate's SAN only to subjectAltNames. Structure is [documented below](#nested_tls_settings_subject_alt_names).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authentication_config`
- Description: (Optional) Reference to the BackendAuthenticationConfig resource from the networksecurity.googleapis.com namespace. Can be used in authenticating TLS connections to the backend, as specified by the authenticationMode field. Can only be specified if authenticationMode is not NONE. <a name="nested_tls_settings_subject_alt_names"></a>The `subject_alt_names` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_name`
- Description: (Optional) The SAN specified as a DNS Name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uniform_resource_identifier`
- Description: (Optional) The SAN specified as a URI. <a name="nested_max_stream_duration"></a>The `max_stream_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. (int64 format)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_network_pass_through_lb_traffic_policy"></a>The `network_pass_through_lb_traffic_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zonal_affinity`
- Description: (Optional) When configured, new connections are load balanced across healthy backend endpoints in the local zone. Structure is [documented below](#nested_network_pass_through_lb_traffic_policy_zonal_affinity). <a name="nested_network_pass_through_lb_traffic_policy_zonal_affinity"></a>The `zonal_affinity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spillover`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) This field indicates whether zonal affinity is enabled or not. Default value is `ZONAL_AFFINITY_DISABLED`. Possible values are: `ZONAL_AFFINITY_DISABLED`, `ZONAL_AFFINITY_SPILL_CROSS_ZONE`, `ZONAL_AFFINITY_STAY_WITHIN_ZONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `spillover_ratio`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The value of the field must be in [0, 1]. When the ratio of the count of healthy backend endpoints in a zone to the count of backend endpoints in that same zone is equal to or above this threshold, the load balancer distributes new connections to all healthy endpoints in the local zone only. When the ratio of the count of healthy backend endpoints in a zone to the count of backend endpoints in that same zone is below this threshold, the load balancer distributes all new connections to all healthy endpoints across all zones. <a name="nested_dynamic_forwarding"></a>The `dynamic_forwarding` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_port_selection`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) IP:PORT based dynamic forwarding configuration. Structure is [documented below](#nested_dynamic_forwarding_ip_port_selection). <a name="nested_dynamic_forwarding_ip_port_selection"></a>The `ip_port_selection` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) A boolean flag enabling IP:PORT based dynamic forwarding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
