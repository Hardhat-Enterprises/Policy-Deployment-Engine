## 🛡️ Policy Deployment Engine: `network_services_http_route`

This section provides a concise policy evaluation for the `network_services_http_route` resource in GCP.

Reference: [Terraform Registry – network_services_http_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_http_route)

---

## 1. Argument Reference

### `hostnames`
- Description: (Required) Set of hosts that should match against the HTTP host header to select a HttpRoute to process the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Required) Rules that define how traffic is routed and handled. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the HttpRoute resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Set of label tags associated with the HttpRoute resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A free-text description of the resource. Max length 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `meshes`
- Description: (Optional) Meshes defines a list of meshes this HttpRoute is attached to, as one of the routing rules to route the requests served by the mesh. Each mesh reference should match the pattern: projects/*/locations/global/meshes/<mesh_name>. The attached Mesh should be of a type SIDECAR.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateways`
- Description: (Optional) Gateways defines a list of gateways this HttpRoute is attached to, as one of the routing rules to route the requests served by the gateway. Each gateway reference should match the pattern: projects/*/locations/global/gateways/<gateway_name>
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matches`
- Description: (Optional) A list of matches define conditions used for matching the rule against incoming HTTP requests. Each match is independent, i.e. this rule will be matched if ANY one of the matches is satisfied. If no matches field is specified, this rule will unconditionally match traffic. If a default rule is desired to be configured, add a rule with no matches specified to the end of the rules list. Structure is [documented below](#nested_rules_rules_matches).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Optional) The detailed rule defining how to route matched traffic. Structure is [documented below](#nested_rules_rules_action). <a name="nested_rules_rules_matches"></a>The `matches` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_case`
- Description: (Optional) Specifies if prefixMatch and fullPathMatch matches are case sensitive. The default value is false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `full_path_match`
- Description: (Optional) The HTTP request path value should exactly match this value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_match`
- Description: (Optional) The HTTP request path value must begin with specified prefixMatch. prefixMatch must begin with a /.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_match`
- Description: (Optional) The HTTP request path value must satisfy the regular expression specified by regexMatch after removing any query parameters and anchor supplied with the original URL. For regular expression grammar, please see https://github.com/google/re2/wiki/Syntax
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_parameters`
- Description: (Optional) Specifies a list of query parameters to match against. Structure is [documented below](#nested_rules_rules_matches_matches_query_parameters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Optional) Specifies a list of HTTP request headers to match against. Structure is [documented below](#nested_rules_rules_matches_matches_headers). <a name="nested_rules_rules_matches_matches_query_parameters"></a>The `query_parameters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_parameter`
- Description: (Optional) The name of the query parameter to match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exact_match`
- Description: (Optional) The value of the query parameter must exactly match the contents of exactMatch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_match`
- Description: (Optional) The value of the query parameter must match the regular expression specified by regexMatch.For regular expression grammar, please see https://github.com/google/re2/wiki/Syntax
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `present_match`
- Description: (Optional) Specifies that the QueryParameterMatcher matches if request contains query parameter, irrespective of whether the parameter has a value or not. <a name="nested_rules_rules_matches_matches_headers"></a>The `headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header`
- Description: (Optional) The name of the HTTP header to match against.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_match`
- Description: (Optional) If specified, the match result will be inverted before checking. Default value is set to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exact_match`
- Description: (Optional) The value of the header should match exactly the content of exactMatch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_match`
- Description: (Optional) The value of the header must match the regular expression specified in regexMatch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_match`
- Description: (Optional) The value of the header must start with the contents of prefixMatch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `present_match`
- Description: (Optional) A header with headerName must exist. The match takes place whether or not the header has a value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `suffix_match`
- Description: (Optional) The value of the header must end with the contents of suffixMatch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range_match`
- Description: (Optional) If specified, the rule will match if the request header value is within the range. Structure is [documented below](#nested_rules_rules_matches_matches_headers_headers_range_match). <a name="nested_rules_rules_matches_matches_headers_headers_range_match"></a>The `range_match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start`
- Description: (Required) Start of the range (inclusive).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end`
- Description: (Required) End of the range (exclusive). <a name="nested_rules_rules_action"></a>The `action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destinations`
- Description: (Optional) The destination to which traffic should be forwarded. Structure is [documented below](#nested_rules_rules_action_destinations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect`
- Description: (Optional) If set, the request is directed as configured by this field. Structure is [documented below](#nested_rules_rules_action_redirect).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fault_injection_policy`
- Description: (Optional) The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_header_modifier`
- Description: (Optional) The specification for modifying the headers of a matching request prior to delivery of the request to the destination. Structure is [documented below](#nested_rules_rules_action_request_header_modifier).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_header_modifier`
- Description: (Optional) The specification for modifying the headers of a response prior to sending the response back to the client. Structure is [documented below](#nested_rules_rules_action_response_header_modifier).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_rewrite`
- Description: (Optional) The specification for rewrite URL before forwarding requests to the destination. Structure is [documented below](#nested_rules_rules_action_url_rewrite).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Specifies the timeout for selected route.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_policy`
- Description: (Optional) Specifies the retry policy associated with this route. Structure is [documented below](#nested_rules_rules_action_retry_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_mirror_policy`
- Description: (Optional) Specifies the policy on how requests intended for the routes destination are shadowed to a separate mirrored destination. Structure is [documented below](#nested_rules_rules_action_request_mirror_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cors_policy`
- Description: (Optional) The specification for allowing client side cross-origin requests. Structure is [documented below](#nested_rules_rules_action_cors_policy). <a name="nested_rules_rules_action_destinations"></a>The `destinations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_name`
- Description: (Optional) The URL of a BackendService to route traffic to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. This is computed as: weight/Sum(weights in this destination list). For non-zero values, there may be some epsilon from the exact proportion defined here depending on the precision an implementation supports. If only one serviceName is specified and it has a weight greater than 0, 100% of the traffic is forwarded to that backend. If weights are specified for any one service name, they need to be specified for all of them. If weights are unspecified for all services, then, traffic is distributed in equal proportions to all of them. <a name="nested_rules_rules_action_redirect"></a>The `redirect` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_redirect`
- Description: (Optional) The host that will be used in the redirect response instead of the one that was supplied in the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_redirect`
- Description: (Optional) The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect can not be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_rewrite`
- Description: (Optional) Indicates that during redirection, the matched prefix (or path) should be swapped with this value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_code`
- Description: (Optional) The HTTP Status code to use for the redirect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_redirect`
- Description: (Optional) If set to true, the URL scheme in the redirected request is set to https.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strip_query`
- Description: (Optional) If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_redirect`
- Description: (Optional) The port that will be used in the redirected request instead of the one that was supplied in the request. <a name="nested_rules_rules_action_fault_injection_policy"></a>The `fault_injection_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delay`
- Description: (Optional) Specification of how client requests are delayed as part of fault injection before being sent to a destination. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy_delay).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `abort`
- Description: (Optional) Specification of how client requests are aborted as part of fault injection before being sent to a destination. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy_abort). <a name="nested_rules_rules_action_fault_injection_policy_delay"></a>The `delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_delay`
- Description: (Optional) Specify a fixed delay before forwarding the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic on which delay will be injected. <a name="nested_rules_rules_action_fault_injection_policy_abort"></a>The `abort` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_status`
- Description: (Optional) The HTTP status code used to abort the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic which will be aborted. <a name="nested_rules_rules_action_request_header_modifier"></a>The `request_header_modifier` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `set`
- Description: (Optional) Completely overwrite/replace the headers with given map where key is the name of the header, value is the value of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `add`
- Description: (Optional) Add the headers with given map where key is the name of the header, value is the value of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remove`
- Description: (Optional) Remove headers (matching by header names) specified in the list. <a name="nested_rules_rules_action_response_header_modifier"></a>The `response_header_modifier` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `set`
- Description: (Optional) Completely overwrite/replace the headers with given map where key is the name of the header, value is the value of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `add`
- Description: (Optional) Add the headers with given map where key is the name of the header, value is the value of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `remove`
- Description: (Optional) Remove headers (matching by header names) specified in the list. <a name="nested_rules_rules_action_url_rewrite"></a>The `url_rewrite` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_prefix_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected destination, the matching portion of the requests path is replaced by this value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected destination, the requests host header is replaced by this value. <a name="nested_rules_rules_action_retry_policy"></a>The `retry_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_conditions`
- Description: (Optional) Specifies one or more conditions when this retry policy applies.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_retries`
- Description: (Optional) Specifies the allowed number of retries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `per_try_timeout`
- Description: (Optional) Specifies a non-zero timeout per retry attempt. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". <a name="nested_rules_rules_action_request_mirror_policy"></a>The `request_mirror_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Optional) The destination the requests will be mirrored to. Structure is [documented below](#nested_rules_rules_action_request_mirror_policy_destination). <a name="nested_rules_rules_action_request_mirror_policy_destination"></a>The `destination` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_name`
- Description: (Optional) The URL of a BackendService to route traffic to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. This is computed as: weight/Sum(weights in this destination list). For non-zero values, there may be some epsilon from the exact proportion defined here depending on the precision an implementation supports. If only one serviceName is specified and it has a weight greater than 0, 100% of the traffic is forwarded to that backend. If weights are specified for any one service name, they need to be specified for all of them. If weights are unspecified for all services, then, traffic is distributed in equal proportions to all of them. <a name="nested_rules_rules_action_cors_policy"></a>The `cors_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origins`
- Description: (Optional) Specifies the list of origins that will be allowed to do CORS requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origin_regexes`
- Description: (Optional) Specifies the regular expression patterns that match allowed origins.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_methods`
- Description: (Optional) Specifies the content for Access-Control-Allow-Methods header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_headers`
- Description: (Optional) Specifies the content for Access-Control-Allow-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expose_headers`
- Description: (Optional) Specifies the content for Access-Control-Expose-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age`
- Description: (Optional) Specifies how long result of a preflight request can be cached in seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_credentials`
- Description: (Optional) In response to a preflight request, setting this to true indicates that the actual request can include user credentials.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) If true, the CORS policy is disabled. The default value is false, which indicates that the CORS policy is in effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
