## 🛡️ Policy Deployment Engine: `compute_url_map`

This section provides a concise policy evaluation for the `compute_url_map` resource in GCP.

Reference: [Terraform Registry – compute_url_map](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_service`
- Description: (Optional) The backend service or backend bucket to use when none of the given rules match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: (Optional) Specifies changes to request and response headers that need to take effect for the selected backendService. The headerAction specified here take effect after headerAction specified under pathMatcher. Structure is [documented below](#nested_header_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_rule`
- Description: (Optional) The list of HostRules to use against the URL. Structure is [documented below](#nested_host_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_matcher`
- Description: (Optional) The list of named PathMatchers to use against the URL. Structure is [documented below](#nested_path_matcher).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_custom_error_response_policy`
- Description: (Optional) defaultCustomErrorResponsePolicy specifies how the Load Balancer returns error responses when BackendService or BackendBucket responds with an error. This policy takes effect at the PathMatcher level and applies only when no policy has been defined for the error code at lower levels like RouteRule and PathRule within this PathMatcher. If an error code does not have a policy defined in defaultCustomErrorResponsePolicy, then a policy defined for the error code in UrlMap.defaultCustomErrorResponsePolicy takes effect. For example, consider a UrlMap with the following configuration: UrlMap.defaultCustomErrorResponsePolicy is configured with policies for 5xx and 4xx errors A RouteRule for /coming_soon/ is configured for the error code 404. If the request is for www.myotherdomain.com and a 404 is encountered, the policy under UrlMap.defaultCustomErrorResponsePolicy takes effect. If a 404 response is encountered for the request www.example.com/current_events/, the pathMatcher's policy takes effect. If however, the request for www.example.com/coming_soon/ encounters a 404, the policy in RouteRule.customErrorResponsePolicy takes effect. If any of the requests in this example encounter a 500 error code, the policy at UrlMap.defaultCustomErrorResponsePolicy takes effect. When used in conjunction with pathMatcher.defaultRouteAction.retryPolicy, retries take precedence. Only once all retries are exhausted, the defaultCustomErrorResponsePolicy is applied. While attempting a retry, if load balancer is successful in reaching the service, the defaultCustomErrorResponsePolicy is ignored and the response from the service is returned to the client. defaultCustomErrorResponsePolicy is supported only for global external Application Load Balancers. Structure is [documented below](#nested_default_custom_error_response_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `test`
- Description: (Optional) The list of expected URL mapping tests. Request to update this UrlMap will succeed only if all of the test cases pass. You can specify a maximum of 100 tests per UrlMap. Structure is [documented below](#nested_test).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_url_redirect`
- Description: (Optional) When none of the specified hostRules match, the request is redirected to a URL specified by defaultUrlRedirect. If defaultUrlRedirect is specified, defaultService or defaultRouteAction must not be set. Structure is [documented below](#nested_default_url_redirect).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_route_action`
- Description: (Optional) defaultRouteAction takes effect when none of the hostRules match. The load balancer performs advanced routing actions like URL rewrites, header transformations, etc. prior to forwarding the request to the selected backend. If defaultRouteAction specifies any weightedBackendServices, defaultService must not be set. Conversely if defaultService is set, defaultRouteAction cannot contain any weightedBackendServices. Only one of defaultRouteAction or defaultUrlRedirect must be set. Structure is [documented below](#nested_default_route_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_header_action"></a>The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_add`
- Description: (Optional) Headers to add to a matching request prior to forwarding the request to the backendService. Structure is [documented below](#nested_header_action_request_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_add`
- Description: (Optional) Headers to add the response prior to sending the response back to the client. Structure is [documented below](#nested_header_action_response_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the response prior to sending the response back to the client. <a name="nested_header_action_request_headers_to_add"></a>The `request_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_header_action_response_headers_to_add"></a>The `response_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_host_rule"></a>The `host_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hosts`
- Description: (Required) The list of host patterns to match. They must be valid hostnames, except * will match any string of ([a-z0-9-.]*). In that case, * must be the first character and must be followed in the pattern by either - or ..
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_matcher`
- Description: (Required) The name of the PathMatcher to use to match the path portion of the URL if the hostRule matches the URL's host portion. <a name="nested_path_matcher"></a>The `path_matcher` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_service`
- Description: (Optional) The backend service or backend bucket to use when none of the given paths match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_custom_error_response_policy`
- Description: (Optional) defaultCustomErrorResponsePolicy specifies how the Load Balancer returns error responses when BackendService or BackendBucket responds with an error. This policy takes effect at the PathMatcher level and applies only when no policy has been defined for the error code at lower levels like RouteRule and PathRule within this PathMatcher. If an error code does not have a policy defined in defaultCustomErrorResponsePolicy, then a policy defined for the error code in UrlMap.defaultCustomErrorResponsePolicy takes effect. For example, consider a UrlMap with the following configuration: UrlMap.defaultCustomErrorResponsePolicy is configured with policies for 5xx and 4xx errors A RouteRule for /coming_soon/ is configured for the error code 404. If the request is for www.myotherdomain.com and a 404 is encountered, the policy under UrlMap.defaultCustomErrorResponsePolicy takes effect. If a 404 response is encountered for the request www.example.com/current_events/, the pathMatcher's policy takes effect. If however, the request for www.example.com/coming_soon/ encounters a 404, the policy in RouteRule.customErrorResponsePolicy takes effect. If any of the requests in this example encounter a 500 error code, the policy at UrlMap.defaultCustomErrorResponsePolicy takes effect. When used in conjunction with pathMatcher.defaultRouteAction.retryPolicy, retries take precedence. Only once all retries are exhausted, the defaultCustomErrorResponsePolicy is applied. While attempting a retry, if load balancer is successful in reaching the service, the defaultCustomErrorResponsePolicy is ignored and the response from the service is returned to the client. defaultCustomErrorResponsePolicy is supported only for global external Application Load Balancers. Structure is [documented below](#nested_path_matcher_path_matcher_default_custom_error_response_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: (Optional) Specifies changes to request and response headers that need to take effect for the selected backendService. HeaderAction specified here are applied after the matching HttpRouteRule HeaderAction and before the HeaderAction in the UrlMap Structure is [documented below](#nested_path_matcher_path_matcher_header_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name to which this PathMatcher is referred by the HostRule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_rule`
- Description: (Optional) The list of path rules. Use this list instead of routeRules when routing based on simple path matching is all that's required. The order by which path rules are specified does not matter. Matches are always done on the longest-path-first basis. For example: a pathRule with a path /a/b/c/* will match before /a/b/* irrespective of the order in which those paths appear in this list. Within a given pathMatcher, only one of pathRules or routeRules must be set. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `route_rules`
- Description: (Optional) The list of ordered HTTP route rules. Use this list instead of pathRules when advanced route matching and routing actions are desired. The order of specifying routeRules matters: the first rule that matches will cause its specified routing action to take effect. Within a given pathMatcher, only one of pathRules or routeRules must be set. routeRules are not supported in UrlMaps intended for External load balancers. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_url_redirect`
- Description: (Optional) When none of the specified hostRules match, the request is redirected to a URL specified by defaultUrlRedirect. If defaultUrlRedirect is specified, defaultService or defaultRouteAction must not be set. Structure is [documented below](#nested_path_matcher_path_matcher_default_url_redirect).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_route_action`
- Description: (Optional) defaultRouteAction takes effect when none of the pathRules or routeRules match. The load balancer performs advanced routing actions like URL rewrites, header transformations, etc. prior to forwarding the request to the selected backend. If defaultRouteAction specifies any weightedBackendServices, defaultService must not be set. Conversely if defaultService is set, defaultRouteAction cannot contain any weightedBackendServices. Only one of defaultRouteAction or defaultUrlRedirect must be set. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action). <a name="nested_path_matcher_path_matcher_default_custom_error_response_policy"></a>The `default_custom_error_response_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_response_rule`
- Description: (Optional) Specifies rules for returning error responses. In a given policy, if you specify rules for both a range of error codes as well as rules for specific error codes then rules with specific error codes have a higher priority. For example, assume that you configure a rule for 401 (Un-authorized) code, and another for all 4 series error codes (4XX). If the backend service returns a 401, then the rule for 401 will be applied. However if the backend service returns a 403, the rule for 4xx takes effect. Structure is [documented below](#nested_path_matcher_path_matcher_default_custom_error_response_policy_error_response_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_service`
- Description: (Optional) The full or partial URL to the BackendBucket resource that contains the custom error content. Examples are: https://www.googleapis.com/compute/v1/projects/project/global/backendBuckets/myBackendBucket compute/v1/projects/project/global/backendBuckets/myBackendBucket global/backendBuckets/myBackendBucket If errorService is not specified at lower levels like pathMatcher, pathRule and routeRule, an errorService specified at a higher level in the UrlMap will be used. If UrlMap.defaultCustomErrorResponsePolicy contains one or more errorResponseRules[], it must specify errorService. If load balancer cannot reach the backendBucket, a simple Not Found Error will be returned, with the original response code (or overrideResponseCode if configured). <a name="nested_path_matcher_path_matcher_default_custom_error_response_policy_error_response_rule"></a>The `error_response_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match_response_codes`
- Description: (Optional) Valid values include: - A number between 400 and 599: For example 401 or 503, in which case the load balancer applies the policy if the error code exactly matches this value. - 5xx: Load Balancer will apply the policy if the backend service responds with any response code in the range of 500 to 599. - 4xx: Load Balancer will apply the policy if the backend service responds with any response code in the range of 400 to 499. Values must be unique within matchResponseCodes and across all errorResponseRules of CustomErrorResponsePolicy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) The full path to a file within backendBucket . For example: /errors/defaultError.html path must start with a leading slash. path cannot have trailing slashes. If the file is not available in backendBucket or the load balancer cannot reach the BackendBucket, a simple Not Found Error is returned to the client. The value must be from 1 to 1024 characters
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `override_response_code`
- Description: (Optional) The HTTP status code returned with the response containing the custom error content. If overrideResponseCode is not supplied, the same response code returned by the original backend bucket or backend service is returned to the client. <a name="nested_path_matcher_path_matcher_header_action"></a>The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_add`
- Description: (Optional) Headers to add to a matching request prior to forwarding the request to the backendService. Structure is [documented below](#nested_path_matcher_path_matcher_header_action_request_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_add`
- Description: (Optional) Headers to add the response prior to sending the response back to the client. Structure is [documented below](#nested_path_matcher_path_matcher_header_action_response_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the response prior to sending the response back to the client. <a name="nested_path_matcher_path_matcher_header_action_request_headers_to_add"></a>The `request_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_header_action_response_headers_to_add"></a>The `response_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_path_rule"></a>The `path_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) The backend service or backend bucket to use if any of the given paths match.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `paths`
- Description: (Required) The list of path patterns to match. Each must start with / and the only place a \* is allowed is at the end following a /. The string fed to the path matcher does not include any text after the first ? or #, and those chars are not allowed here.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_error_response_policy`
- Description: (Optional) customErrorResponsePolicy specifies how the Load Balancer returns error responses when BackendService or BackendBucket responds with an error. If a policy for an error code is not configured for the PathRule, a policy for the error code configured in pathMatcher.defaultCustomErrorResponsePolicy is applied. If one is not specified in pathMatcher.defaultCustomErrorResponsePolicy, the policy configured in UrlMap.defaultCustomErrorResponsePolicy takes effect. For example, consider a UrlMap with the following configuration: UrlMap.defaultCustomErrorResponsePolicy are configured with policies for 5xx and 4xx errors A PathRule for /coming_soon/ is configured for the error code 404. If the request is for www.myotherdomain.com and a 404 is encountered, the policy under UrlMap.defaultCustomErrorResponsePolicy takes effect. If a 404 response is encountered for the request www.example.com/current_events/, the pathMatcher's policy takes effect. If however, the request for www.example.com/coming_soon/ encounters a 404, the policy in PathRule.customErrorResponsePolicy takes effect. If any of the requests in this example encounter a 500 error code, the policy at UrlMap.defaultCustomErrorResponsePolicy takes effect. customErrorResponsePolicy is supported only for global external Application Load Balancers. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_custom_error_response_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `route_action`
- Description: (Optional) In response to a matching path, the load balancer performs advanced routing actions like URL rewrites, header transformations, etc. prior to forwarding the request to the selected backend. If routeAction specifies any weightedBackendServices, service must not be set. Conversely if service is set, routeAction cannot contain any  weightedBackendServices. Only one of routeAction or urlRedirect must be set. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_redirect`
- Description: (Optional) When a path pattern is matched, the request is redirected to a URL specified by urlRedirect. If urlRedirect is specified, service or routeAction must not be set. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_url_redirect). <a name="nested_path_matcher_path_matcher_path_rule_path_rule_custom_error_response_policy"></a>The `custom_error_response_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_response_rule`
- Description: (Optional) Specifies rules for returning error responses. In a given policy, if you specify rules for both a range of error codes as well as rules for specific error codes then rules with specific error codes have a higher priority. For example, assume that you configure a rule for 401 (Un-authorized) code, and another for all 4 series error codes (4XX). If the backend service returns a 401, then the rule for 401 will be applied. However if the backend service returns a 403, the rule for 4xx takes effect. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_custom_error_response_policy_error_response_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_service`
- Description: (Optional) The full or partial URL to the BackendBucket resource that contains the custom error content. Examples are: https://www.googleapis.com/compute/v1/projects/project/global/backendBuckets/myBackendBucket compute/v1/projects/project/global/backendBuckets/myBackendBucket global/backendBuckets/myBackendBucket If errorService is not specified at lower levels like pathMatcher, pathRule and routeRule, an errorService specified at a higher level in the UrlMap will be used. If UrlMap.defaultCustomErrorResponsePolicy contains one or more errorResponseRules[], it must specify errorService. If load balancer cannot reach the backendBucket, a simple Not Found Error will be returned, with the original response code (or overrideResponseCode if configured). <a name="nested_path_matcher_path_matcher_path_rule_path_rule_custom_error_response_policy_error_response_rule"></a>The `error_response_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match_response_codes`
- Description: (Optional) Valid values include: - A number between 400 and 599: For example 401 or 503, in which case the load balancer applies the policy if the error code exactly matches this value. - 5xx: Load Balancer will apply the policy if the backend service responds with any response code in the range of 500 to 599. - 4xx: Load Balancer will apply the policy if the backend service responds with any response code in the range of 400 to 499. Values must be unique within matchResponseCodes and across all errorResponseRules of CustomErrorResponsePolicy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) The full path to a file within backendBucket . For example: /errors/defaultError.html path must start with a leading slash. path cannot have trailing slashes. If the file is not available in backendBucket or the load balancer cannot reach the BackendBucket, a simple Not Found Error is returned to the client. The value must be from 1 to 1024 characters
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `override_response_code`
- Description: (Optional) The HTTP status code returned with the response containing the custom error content. If overrideResponseCode is not supplied, the same response code returned by the original backend bucket or backend service is returned to the client. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action"></a>The `route_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cors_policy`
- Description: (Optional) The specification for allowing client side cross-origin requests. Please see W3C Recommendation for Cross Origin Resource Sharing Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_cors_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fault_injection_policy`
- Description: (Optional) The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. As part of fault injection, when clients send requests to a backend service, delays can be introduced by Loadbalancer on a percentage of requests before sending those request to the backend service. Similarly requests from clients can be aborted by the Loadbalancer for a percentage of requests. timeout and retry_policy will be ignored by clients that are configured with a fault_injection_policy. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_fault_injection_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_mirror_policy`
- Description: (Optional) Specifies the policy on how requests intended for the route's backends are shadowed to a separate mirrored backend service. Loadbalancer does not wait for responses from the shadow service. Prior to sending traffic to the shadow service, the host / authority header is suffixed with -shadow. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_request_mirror_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_policy`
- Description: (Optional) Specifies the retry policy associated with this route. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_retry_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Specifies the timeout for the selected route. Timeout is computed from the time the request is has been fully processed (i.e. end-of-stream) up until the response has been completely processed. Timeout includes all retries. If not specified, the default value is 15 seconds. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_timeout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_stream_duration`
- Description: (Optional) Specifies the maximum duration (timeout) for streams on the selected route. Unlike the `Timeout` field where the timeout duration starts from the time the request has been fully processed (known as end-of-stream), the duration in this field is computed from the beginning of the stream until the response has been processed, including all retries. A stream that does not complete in this duration is closed. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_max_stream_duration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_rewrite`
- Description: (Optional) The spec to modify the URL of the request, prior to forwarding the request to the matched service Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_url_rewrite).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weighted_backend_services`
- Description: (Optional) A list of weighted backend services to send traffic to when a route match occurs. The weights determine the fraction of traffic that flows to their corresponding backend service. If all traffic needs to go to a single backend service, there must be one  weightedBackendService with weight set to a non 0 number. Once a backendService is identified and before forwarding the request to the backend service, advanced routing actions like Url rewrites and header transformations are applied depending on additional settings specified in this HttpRouteAction. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_weighted_backend_services). <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_cors_policy"></a>The `cors_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_credentials`
- Description: (Optional) In response to a preflight request, setting this to true indicates that the actual request can include user credentials. This translates to the Access- Control-Allow-Credentials header. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_headers`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_methods`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Methods header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origin_regexes`
- Description: (Optional) Specifies the regular expression patterns that match allowed origins. For regular expression grammar please see en.cppreference.com/w/cpp/regex/ecmascript An origin is allowed if it matches either allow_origins or allow_origin_regex.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origins`
- Description: (Optional) Specifies the list of origins that will be allowed to do CORS requests. An origin is allowed if it matches either allow_origins or allow_origin_regex.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Required) If true, specifies the CORS policy is disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expose_headers`
- Description: (Optional) Specifies the content for the Access-Control-Expose-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age`
- Description: (Optional) Specifies how long the results of a preflight request can be cached. This translates to the content for the Access-Control-Max-Age header. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_fault_injection_policy"></a>The `fault_injection_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `abort`
- Description: (Optional) The specification for how client requests are aborted as part of fault injection. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_fault_injection_policy_abort).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delay`
- Description: (Optional) The specification for how client requests are delayed as part of fault injection, before being sent to a backend service. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_fault_injection_policy_delay). <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_fault_injection_policy_abort"></a>The `abort` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_status`
- Description: (Required) The HTTP status code used to abort the request. The value must be between 200 and 599 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Required) The percentage of traffic (connections/operations/requests) which will be aborted as part of fault injection. The value must be between 0.0 and 100.0 inclusive. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_fault_injection_policy_delay"></a>The `delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_delay`
- Description: (Required) Specifies the value of the fixed delay interval. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_fault_injection_policy_delay_fixed_delay).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Required) The percentage of traffic (connections/operations/requests) on which delay will be introduced as part of fault injection. The value must be between 0.0 and 100.0 inclusive. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_fault_injection_policy_delay_fixed_delay"></a>The `fixed_delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_request_mirror_policy"></a>The `request_mirror_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Required) The BackendService resource being mirrored to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mirror_percent`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The percentage of requests to be mirrored to backendService. The value must be between 0.0 and 100.0 inclusive. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_retry_policy"></a>The `retry_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_retries`
- Description: (Optional) Specifies the allowed number retries. This number must be > 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `per_try_timeout`
- Description: (Optional) Specifies a non-zero timeout per retry attempt. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_retry_policy_per_try_timeout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_conditions`
- Description: (Optional) Specifies one or more conditions when this retry rule applies. Valid values are: * 5xx: Loadbalancer will attempt a retry if the backend service responds with any 5xx response code, or if the backend service does not respond at all, for example: disconnects, reset, read timeout, connection failure, and refused streams. * gateway-error: Similar to 5xx, but only applies to response codes 502, 503 or 504. * connect-failure: Loadbalancer will retry on failures connecting to backend services, for example due to connection timeouts. * retriable-4xx: Loadbalancer will retry for retriable 4xx response codes. Currently the only retriable error supported is 409. * refused-stream: Loadbalancer will retry if the backend service resets the stream with a REFUSED_STREAM error code. This reset type indicates that it is safe to retry. * cancelled: Loadbalancer will retry if the gRPC status code in the response header is set to cancelled * deadline-exceeded: Loadbalancer will retry if the gRPC status code in the response header is set to deadline-exceeded * resource-exhausted: Loadbalancer will retry if the gRPC status code in the response header is set to resource-exhausted * unavailable: Loadbalancer will retry if the gRPC status code in the response header is set to unavailable <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_retry_policy_per_try_timeout"></a>The `per_try_timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_timeout"></a>The `timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_max_stream_duration"></a>The `max_stream_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_url_rewrite"></a>The `url_rewrite` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected service, the request's host header is replaced with contents of hostRewrite. The value must be between 1 and 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_prefix_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected backend service, the matching portion of the request's path is replaced by pathPrefixRewrite. The value must be between 1 and 1024 characters. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_weighted_backend_services"></a>The `weighted_backend_services` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Required) The default BackendService resource. Before forwarding the request to backendService, the loadbalancer applies any relevant headerActions specified as part of this backendServiceWeight.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: (Optional) Specifies changes to request and response headers that need to take effect for the selected backendService. headerAction specified here take effect before headerAction in the enclosing HttpRouteRule, PathMatcher and UrlMap. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_weighted_backend_services_weighted_backend_services_header_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Required) Specifies the fraction of traffic sent to backendService, computed as weight / (sum of all weightedBackendService weights in routeAction) . The selection of a backend service is determined only for new traffic. Once a user's request has been directed to a backendService, subsequent requests will be sent to the same backendService as determined by the BackendService's session affinity policy. The value must be between 0 and 1000 <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_weighted_backend_services_weighted_backend_services_header_action"></a>The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_add`
- Description: (Optional) Headers to add to a matching request prior to forwarding the request to the backendService. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_weighted_backend_services_weighted_backend_services_header_action_request_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_add`
- Description: (Optional) Headers to add the response prior to sending the response back to the client. Structure is [documented below](#nested_path_matcher_path_matcher_path_rule_path_rule_route_action_weighted_backend_services_weighted_backend_services_header_action_response_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the response prior to sending the response back to the client. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_weighted_backend_services_weighted_backend_services_header_action_request_headers_to_add"></a>The `request_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_route_action_weighted_backend_services_weighted_backend_services_header_action_response_headers_to_add"></a>The `response_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_path_rule_path_rule_url_redirect"></a>The `url_redirect` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_redirect`
- Description: (Optional) The host that will be used in the redirect response instead of the one that was supplied in the request. The value must be between 1 and 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_redirect`
- Description: (Optional) If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This must only be set for UrlMaps used in TargetHttpProxys. Setting this true for TargetHttpsProxy is not permitted. The default is set to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_redirect`
- Description: (Optional) The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect cannot be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_redirect`
- Description: (Optional) The prefix that replaces the prefixMatch specified in the HttpRouteRuleMatch, retaining the remaining portion of the URL before redirecting the request. prefixRedirect cannot be supplied together with pathRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_response_code`
- Description: (Optional) The HTTP Status code to use for this RedirectAction. Supported values are: * MOVED_PERMANENTLY_DEFAULT, which is the default value and corresponds to 301. * FOUND, which corresponds to 302. * SEE_OTHER which corresponds to 303. * TEMPORARY_REDIRECT, which corresponds to 307. In this case, the request method will be retained. * PERMANENT_REDIRECT, which corresponds to 308. In this case, the request method will be retained.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strip_query`
- Description: (Required) If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained. This field is required to ensure an empty block is not set. The normal default value is false. <a name="nested_path_matcher_path_matcher_route_rules"></a>The `route_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Required) For routeRules within a given pathMatcher, priority determines the order in which load balancer will interpret routeRules. RouteRules are evaluated in order of priority, from the lowest to highest number. The priority of a rule decreases as its number increases (1, 2, 3, N+1). The first rule that matches the request is applied. You cannot configure two or more routeRules with the same priority. Priority for each rule must be set to a number between 0 and 2147483647 inclusive. Priority numbers can have gaps, which enable you to add or remove rules in the future without affecting the rest of the rules. For example, 1, 2, 3, 4, 5, 9, 12, 16 is a valid series of priority numbers to which you could add rules numbered from 6 to 8, 10 to 11, and 13 to 15 in the future without any impact on existing rules.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) The backend service resource to which traffic is directed if this rule is matched. If routeAction is additionally specified, advanced routing actions like URL Rewrites, etc. take effect prior to sending the request to the backend. However, if service is specified, routeAction cannot contain any weightedBackendService s. Conversely, if routeAction specifies any weightedBackendServices, service must not be specified. Only one of urlRedirect, service or routeAction.weightedBackendService must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: (Optional) Specifies changes to request and response headers that need to take effect for the selected backendService. The headerAction specified here are applied before the matching pathMatchers[].headerAction and after pathMatchers[].routeRules[].r outeAction.weightedBackendService.backendServiceWeightAction[].headerAction Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_header_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match_rules`
- Description: (Optional) The rules for determining a match. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_match_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `route_action`
- Description: (Optional) In response to a matching matchRule, the load balancer performs advanced routing actions like URL rewrites, header transformations, etc. prior to forwarding the request to the selected backend. If  routeAction specifies any weightedBackendServices, service must not be set. Conversely if service is set, routeAction cannot contain any  weightedBackendServices. Only one of routeAction or urlRedirect must be set. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_redirect`
- Description: (Optional) When this rule is matched, the request is redirected to a URL specified by urlRedirect. If urlRedirect is specified, service or routeAction must not be set. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_url_redirect).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_error_response_policy`
- Description: (Optional) customErrorResponsePolicy specifies how the Load Balancer returns error responses when BackendService or BackendBucket responds with an error. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_custom_error_response_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_filter_configs`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Outbound route specific configuration for networkservices.HttpFilter resources enabled by Traffic Director. httpFilterConfigs only applies for load balancers with loadBalancingScheme set to INTERNAL_SELF_MANAGED. See ForwardingRule for more details. Not supported when the URL map is bound to a target gRPC proxy that has validateForProxyless field set to true. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_http_filter_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_filter_metadata`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Outbound route specific metadata supplied to networkservices.HttpFilter resources enabled by Traffic Director. httpFilterMetadata only applies for load balancers with loadBalancingScheme set to INTERNAL_SELF_MANAGED. See ForwardingRule for more details. Not supported when the URL map is bound to a target gRPC proxy that has validateForProxyless field set to true. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_http_filter_metadata). <a name="nested_path_matcher_path_matcher_route_rules_route_rules_header_action"></a>The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_add`
- Description: (Optional) Headers to add to a matching request prior to forwarding the request to the backendService. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_header_action_request_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_add`
- Description: (Optional) Headers to add the response prior to sending the response back to the client. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_header_action_response_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the response prior to sending the response back to the client. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_header_action_request_headers_to_add"></a>The `request_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_header_action_response_headers_to_add"></a>The `response_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_match_rules"></a>The `match_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `full_path_match`
- Description: (Optional) For satisfying the matchRule condition, the path of the request must exactly match the value specified in fullPathMatch after removing any query parameters and anchor that may be part of the original URL. FullPathMatch must be between 1 and 1024 characters. Only one of prefixMatch, fullPathMatch or regexMatch must be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_matches`
- Description: (Optional) Specifies a list of header match criteria, all of which must match corresponding headers in the request. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_header_matches).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_case`
- Description: (Optional) Specifies that prefixMatch and fullPathMatch matches are case sensitive. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_filters`
- Description: (Optional) Opaque filter criteria used by Loadbalancer to restrict routing configuration to a limited set xDS compliant clients. In their xDS requests to Loadbalancer, xDS clients present node metadata. If a match takes place, the relevant routing configuration is made available to those proxies. For each metadataFilter in this list, if its filterMatchCriteria is set to MATCH_ANY, at least one of the filterLabels must match the corresponding label provided in the metadata. If its filterMatchCriteria is set to MATCH_ALL, then all of its filterLabels must match with corresponding labels in the provided metadata. metadataFilters specified here can be overrides those specified in ForwardingRule that refers to this UrlMap. metadataFilters only applies to Loadbalancers that have their loadBalancingScheme set to INTERNAL_SELF_MANAGED. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_metadata_filters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_match`
- Description: (Optional) For satisfying the matchRule condition, the request's path must begin with the specified prefixMatch. prefixMatch must begin with a /. The value must be between 1 and 1024 characters. Only one of prefixMatch, fullPathMatch or regexMatch must be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_parameter_matches`
- Description: (Optional) Specifies a list of query parameter match criteria, all of which must match corresponding query parameters in the request. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_query_parameter_matches).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_match`
- Description: (Optional) For satisfying the matchRule condition, the path of the request must satisfy the regular expression specified in regexMatch after removing any query parameters and anchor supplied with the original URL. For regular expression grammar please see en.cppreference.com/w/cpp/regex/ecmascript  Only one of prefixMatch, fullPathMatch or regexMatch must be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_template_match`
- Description: (Optional) For satisfying the matchRule condition, the path of the request must match the wildcard pattern specified in pathTemplateMatch after removing any query parameters and anchor that may be part of the original URL. pathTemplateMatch must be between 1 and 255 characters (inclusive).  The pattern specified by pathTemplateMatch may have at most 5 wildcard operators and at most 5 variable captures in total. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_header_matches"></a>The `header_matches` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exact_match`
- Description: (Optional) The value should exactly match contents of exactMatch. Only one of exactMatch, prefixMatch, suffixMatch, regexMatch, presentMatch or rangeMatch must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the HTTP header to match. For matching against the HTTP request's authority, use a headerMatch with the header name ":authority". For matching a request's method, use the headerName ":method".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invert_match`
- Description: (Optional) If set to false, the headerMatch is considered a match if the match criteria above are met. If set to true, the headerMatch is considered a match if the match criteria above are NOT met. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_match`
- Description: (Optional) The value of the header must start with the contents of prefixMatch. Only one of exactMatch, prefixMatch, suffixMatch, regexMatch, presentMatch or rangeMatch must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `present_match`
- Description: (Optional) A header with the contents of headerName must exist. The match takes place whether or not the request's header has a value or not. Only one of exactMatch, prefixMatch, suffixMatch, regexMatch, presentMatch or rangeMatch must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range_match`
- Description: (Optional) The header value must be an integer and its value must be in the range specified in rangeMatch. If the header does not contain an integer, number or is empty, the match fails. For example for a range [-5, 0]   - -3 will match.  - 0 will not match.  - 0.25 will not match.  - -3someString will not match.   Only one of exactMatch, prefixMatch, suffixMatch, regexMatch, presentMatch or rangeMatch must be set. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_header_matches_header_matches_range_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_match`
- Description: (Optional) The value of the header must match the regular expression specified in regexMatch. For regular expression grammar, please see: en.cppreference.com/w/cpp/regex/ecmascript  For matching against a port specified in the HTTP request, use a headerMatch with headerName set to PORT and a regular expression that satisfies the RFC2616 Host header's port specifier. Only one of exactMatch, prefixMatch, suffixMatch, regexMatch, presentMatch or rangeMatch must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `suffix_match`
- Description: (Optional) The value of the header must end with the contents of suffixMatch. Only one of exactMatch, prefixMatch, suffixMatch, regexMatch, presentMatch or rangeMatch must be set. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_header_matches_header_matches_range_match"></a>The `range_match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range_end`
- Description: (Required) The end of the range (exclusive).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `range_start`
- Description: (Required) The start of the range (inclusive). <a name="nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_metadata_filters"></a>The `metadata_filters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_labels`
- Description: (Required) The list of label value pairs that must match labels in the provided metadata based on filterMatchCriteria  This list must not be empty and can have at the most 64 entries. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_metadata_filters_metadata_filters_filter_labels).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_match_criteria`
- Description: (Required) Specifies how individual filterLabel matches within the list of filterLabels contribute towards the overall metadataFilter match. Supported values are: - MATCH_ANY: At least one of the filterLabels must have a matching label in the provided metadata. - MATCH_ALL: All filterLabels must have matching labels in the provided metadata. Possible values are: `MATCH_ALL`, `MATCH_ANY`. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_metadata_filters_metadata_filters_filter_labels"></a>The `filter_labels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of metadata label. The name can have a maximum length of 1024 characters and must be at least 1 character long.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) The value of the label must match the specified value. value can have a maximum length of 1024 characters. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_match_rules_match_rules_query_parameter_matches"></a>The `query_parameter_matches` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exact_match`
- Description: (Optional) The queryParameterMatch matches if the value of the parameter exactly matches the contents of exactMatch. Only one of presentMatch, exactMatch and regexMatch must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the query parameter to match. The query parameter must exist in the request, in the absence of which the request match fails.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `present_match`
- Description: (Optional) Specifies that the queryParameterMatch matches if the request contains the query parameter, irrespective of whether the parameter has a value or not. Only one of presentMatch, exactMatch and regexMatch must be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_match`
- Description: (Optional) The queryParameterMatch matches if the value of the parameter matches the regular expression specified by regexMatch. For the regular expression grammar, please see en.cppreference.com/w/cpp/regex/ecmascript  Only one of presentMatch, exactMatch and regexMatch must be set. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action"></a>The `route_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cors_policy`
- Description: (Optional) The specification for allowing client side cross-origin requests. Please see W3C Recommendation for Cross Origin Resource Sharing Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_cors_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fault_injection_policy`
- Description: (Optional) The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. As part of fault injection, when clients send requests to a backend service, delays can be introduced by Loadbalancer on a percentage of requests before sending those request to the backend service. Similarly requests from clients can be aborted by the Loadbalancer for a percentage of requests. timeout and retry_policy will be ignored by clients that are configured with a fault_injection_policy. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_fault_injection_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_mirror_policy`
- Description: (Optional) Specifies the policy on how requests intended for the route's backends are shadowed to a separate mirrored backend service. Loadbalancer does not wait for responses from the shadow service. Prior to sending traffic to the shadow service, the host / authority header is suffixed with -shadow. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_request_mirror_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_policy`
- Description: (Optional) Specifies the retry policy associated with this route. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_retry_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Specifies the timeout for the selected route. Timeout is computed from the time the request is has been fully processed (i.e. end-of-stream) up until the response has been completely processed. Timeout includes all retries. If not specified, the default value is 15 seconds. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_timeout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_stream_duration`
- Description: (Optional) Specifies the maximum duration (timeout) for streams on the selected route. Unlike the `Timeout` field where the timeout duration starts from the time the request has been fully processed (known as end-of-stream), the duration in this field is computed from the beginning of the stream until the response has been processed, including all retries. A stream that does not complete in this duration is closed. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_max_stream_duration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_rewrite`
- Description: (Optional) The spec to modify the URL of the request, prior to forwarding the request to the matched service Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_url_rewrite).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weighted_backend_services`
- Description: (Optional) A list of weighted backend services to send traffic to when a route match occurs. The weights determine the fraction of traffic that flows to their corresponding backend service. If all traffic needs to go to a single backend service, there must be one  weightedBackendService with weight set to a non 0 number. Once a backendService is identified and before forwarding the request to the backend service, advanced routing actions like Url rewrites and header transformations are applied depending on additional settings specified in this HttpRouteAction. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_weighted_backend_services). <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_cors_policy"></a>The `cors_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_credentials`
- Description: (Optional) In response to a preflight request, setting this to true indicates that the actual request can include user credentials. This translates to the Access- Control-Allow-Credentials header. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_headers`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_methods`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Methods header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origin_regexes`
- Description: (Optional) Specifies the regular expression patterns that match allowed origins. For regular expression grammar please see en.cppreference.com/w/cpp/regex/ecmascript An origin is allowed if it matches either allow_origins or allow_origin_regex.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origins`
- Description: (Optional) Specifies the list of origins that will be allowed to do CORS requests. An origin is allowed if it matches either allow_origins or allow_origin_regex.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) If true, specifies the CORS policy is disabled. which indicates that the CORS policy is in effect. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expose_headers`
- Description: (Optional) Specifies the content for the Access-Control-Expose-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age`
- Description: (Optional) Specifies how long the results of a preflight request can be cached. This translates to the content for the Access-Control-Max-Age header. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_fault_injection_policy"></a>The `fault_injection_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `abort`
- Description: (Optional) The specification for how client requests are aborted as part of fault injection. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_fault_injection_policy_abort).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delay`
- Description: (Optional) The specification for how client requests are delayed as part of fault injection, before being sent to a backend service. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_fault_injection_policy_delay). <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_fault_injection_policy_abort"></a>The `abort` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_status`
- Description: (Optional) The HTTP status code used to abort the request. The value must be between 200 and 599 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic (connections/operations/requests) which will be aborted as part of fault injection. The value must be between 0.0 and 100.0 inclusive. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_fault_injection_policy_delay"></a>The `delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_delay`
- Description: (Optional) Specifies the value of the fixed delay interval. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_fault_injection_policy_delay_fixed_delay).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic (connections/operations/requests) on which delay will be introduced as part of fault injection. The value must be between 0.0 and 100.0 inclusive. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_fault_injection_policy_delay_fixed_delay"></a>The `fixed_delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_request_mirror_policy"></a>The `request_mirror_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Required) The BackendService resource being mirrored to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mirror_percent`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The percentage of requests to be mirrored to backendService. The value must be between 0.0 and 100.0 inclusive. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_retry_policy"></a>The `retry_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_retries`
- Description: (Required) Specifies the allowed number retries. This number must be > 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `per_try_timeout`
- Description: (Optional) Specifies a non-zero timeout per retry attempt. If not specified, will use the timeout set in HttpRouteAction. If timeout in HttpRouteAction is not set, will use the largest timeout among all backend services associated with the route. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_retry_policy_per_try_timeout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_conditions`
- Description: (Optional) Specfies one or more conditions when this retry rule applies. Valid values are: * 5xx: Loadbalancer will attempt a retry if the backend service responds with any 5xx response code, or if the backend service does not respond at all, for example: disconnects, reset, read timeout, connection failure, and refused streams. * gateway-error: Similar to 5xx, but only applies to response codes 502, 503 or 504. * connect-failure: Loadbalancer will retry on failures connecting to backend services, for example due to connection timeouts. * retriable-4xx: Loadbalancer will retry for retriable 4xx response codes. Currently the only retriable error supported is 409. * refused-stream: Loadbalancer will retry if the backend service resets the stream with a REFUSED_STREAM error code. This reset type indicates that it is safe to retry. * cancelled: Loadbalancer will retry if the gRPC status code in the response header is set to cancelled * deadline-exceeded: Loadbalancer will retry if the gRPC status code in the response header is set to deadline-exceeded * resource-exhausted: Loadbalancer will retry if the gRPC status code in the response header is set to resource-exhausted * unavailable: Loadbalancer will retry if the gRPC status code in the response header is set to unavailable <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_retry_policy_per_try_timeout"></a>The `per_try_timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_timeout"></a>The `timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_max_stream_duration"></a>The `max_stream_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_url_rewrite"></a>The `url_rewrite` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected service, the request's host header is replaced with contents of hostRewrite. The value must be between 1 and 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_prefix_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected backend service, the matching portion of the request's path is replaced by pathPrefixRewrite. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_template_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected origin, if the request matched a pathTemplateMatch, the matching portion of the request's path is replaced re-written using the pattern specified by pathTemplateRewrite. pathTemplateRewrite must be between 1 and 255 characters (inclusive), must start with a '/', and must only use variables captured by the route's pathTemplate matchers. pathTemplateRewrite may only be used when all of a route's MatchRules specify pathTemplate. Only one of pathPrefixRewrite and pathTemplateRewrite may be specified. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_weighted_backend_services"></a>The `weighted_backend_services` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Required) The default BackendService resource. Before forwarding the request to backendService, the loadbalancer applies any relevant headerActions specified as part of this backendServiceWeight.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: (Optional) Specifies changes to request and response headers that need to take effect for the selected backendService. headerAction specified here take effect before headerAction in the enclosing HttpRouteRule, PathMatcher and UrlMap. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_weighted_backend_services_weighted_backend_services_header_action).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Required) Specifies the fraction of traffic sent to backendService, computed as weight / (sum of all weightedBackendService weights in routeAction) . The selection of a backend service is determined only for new traffic. Once a user's request has been directed to a backendService, subsequent requests will be sent to the same backendService as determined by the BackendService's session affinity policy. The value must be between 0 and 1000 <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_weighted_backend_services_weighted_backend_services_header_action"></a>The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_add`
- Description: (Optional) Headers to add to a matching request prior to forwarding the request to the backendService. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_weighted_backend_services_weighted_backend_services_header_action_request_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_add`
- Description: (Optional) Headers to add the response prior to sending the response back to the client. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_route_action_weighted_backend_services_weighted_backend_services_header_action_response_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the response prior to sending the response back to the client. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_weighted_backend_services_weighted_backend_services_header_action_request_headers_to_add"></a>The `request_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_route_action_weighted_backend_services_weighted_backend_services_header_action_response_headers_to_add"></a>The `response_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Required) The name of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Required) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Required) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_url_redirect"></a>The `url_redirect` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_redirect`
- Description: (Optional) The host that will be used in the redirect response instead of the one that was supplied in the request. The value must be between 1 and 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_redirect`
- Description: (Optional) If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This must only be set for UrlMaps used in TargetHttpProxys. Setting this true for TargetHttpsProxy is not permitted. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_redirect`
- Description: (Optional) The path that will be used in the redirect response instead of the one that was supplied in the request. Only one of pathRedirect or prefixRedirect must be specified. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_redirect`
- Description: (Optional) The prefix that replaces the prefixMatch specified in the HttpRouteRuleMatch, retaining the remaining portion of the URL before redirecting the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_response_code`
- Description: (Optional) The HTTP Status code to use for this RedirectAction. Supported values are: * MOVED_PERMANENTLY_DEFAULT, which is the default value and corresponds to 301. * FOUND, which corresponds to 302. * SEE_OTHER which corresponds to 303. * TEMPORARY_REDIRECT, which corresponds to 307. In this case, the request method will be retained. * PERMANENT_REDIRECT, which corresponds to 308. In this case, the request method will be retained.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strip_query`
- Description: (Optional) If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained. Defaults to false. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_custom_error_response_policy"></a>The `custom_error_response_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_response_rule`
- Description: (Optional) Specifies rules for returning error responses. In a given policy, if you specify rules for both a range of error codes as well as rules for specific error codes then rules with specific error codes have a higher priority. For example, assume that you configure a rule for 401 (Un-authorized) code, and another for all 4 series error codes (4XX). If the backend service returns a 401, then the rule for 401 will be applied. However if the backend service returns a 403, the rule for 4xx takes effect. Structure is [documented below](#nested_path_matcher_path_matcher_route_rules_route_rules_custom_error_response_policy_error_response_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_service`
- Description: (Optional) The full or partial URL to the BackendBucket resource that contains the custom error content. Examples are: https://www.googleapis.com/compute/v1/projects/project/global/backendBuckets/myBackendBucket compute/v1/projects/project/global/backendBuckets/myBackendBucket global/backendBuckets/myBackendBucket If errorService is not specified at lower levels like pathMatcher, pathRule and routeRule, an errorService specified at a higher level in the UrlMap will be used. If UrlMap.defaultCustomErrorResponsePolicy contains one or more errorResponseRules[], it must specify errorService. If load balancer cannot reach the backendBucket, a simple Not Found Error will be returned, with the original response code (or overrideResponseCode if configured). <a name="nested_path_matcher_path_matcher_route_rules_route_rules_custom_error_response_policy_error_response_rule"></a>The `error_response_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match_response_codes`
- Description: (Optional) Valid values include: - A number between 400 and 599: For example 401 or 503, in which case the load balancer applies the policy if the error code exactly matches this value. - 5xx: Load Balancer will apply the policy if the backend service responds with any response code in the range of 500 to 599. - 4xx: Load Balancer will apply the policy if the backend service responds with any response code in the range of 400 to 499. Values must be unique within matchResponseCodes and across all errorResponseRules of CustomErrorResponsePolicy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) The full path to a file within backendBucket . For example: /errors/defaultError.html path must start with a leading slash. path cannot have trailing slashes. If the file is not available in backendBucket or the load balancer cannot reach the BackendBucket, a simple Not Found Error is returned to the client. The value must be from 1 to 1024 characters
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `override_response_code`
- Description: (Optional) The HTTP status code returned with the response containing the custom error content. If overrideResponseCode is not supplied, the same response code returned by the original backend bucket or backend service is returned to the client. <a name="nested_path_matcher_path_matcher_route_rules_route_rules_http_filter_configs"></a>The `http_filter_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_name`
- Description: (Optional) Name of the networkservices.HttpFilter resource this configuration belongs to. This name must be known to the xDS client. Example: envoy.wasm
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_type_url`
- Description: (Optional) The fully qualified versioned proto3 type url of the protobuf that the filter expects for its contextual settings, for example: type.googleapis.com/google.protobuf.Struct
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Optional) The configuration needed to enable the networkservices.HttpFilter resource. The configuration must be YAML formatted and only contain fields defined in the protobuf identified in configTypeUrl <a name="nested_path_matcher_path_matcher_route_rules_route_rules_http_filter_metadata"></a>The `http_filter_metadata` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_name`
- Description: (Optional) Name of the networkservices.HttpFilter resource this configuration belongs to. This name must be known to the xDS client. Example: envoy.wasm
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_type_url`
- Description: (Optional) The fully qualified versioned proto3 type url of the protobuf that the filter expects for its contextual settings, for example: type.googleapis.com/google.protobuf.Struct
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Optional) The configuration needed to enable the networkservices.HttpFilter resource. The configuration must be YAML formatted and only contain fields defined in the protobuf identified in configTypeUrl <a name="nested_path_matcher_path_matcher_default_url_redirect"></a>The `default_url_redirect` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_redirect`
- Description: (Optional) The host that will be used in the redirect response instead of the one that was supplied in the request. The value must be between 1 and 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_redirect`
- Description: (Optional) If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This must only be set for UrlMaps used in TargetHttpProxys. Setting this true for TargetHttpsProxy is not permitted. The default is set to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_redirect`
- Description: (Optional) The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect cannot be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_redirect`
- Description: (Optional) The prefix that replaces the prefixMatch specified in the HttpRouteRuleMatch, retaining the remaining portion of the URL before redirecting the request. prefixRedirect cannot be supplied together with pathRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_response_code`
- Description: (Optional) The HTTP Status code to use for this RedirectAction. Supported values are: * MOVED_PERMANENTLY_DEFAULT, which is the default value and corresponds to 301. * FOUND, which corresponds to 302. * SEE_OTHER which corresponds to 303. * TEMPORARY_REDIRECT, which corresponds to 307. In this case, the request method will be retained. * PERMANENT_REDIRECT, which corresponds to 308. In this case, the request method will be retained.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strip_query`
- Description: (Required) If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained. This field is required to ensure an empty block is not set. The normal default value is false. <a name="nested_path_matcher_path_matcher_default_route_action"></a>The `default_route_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weighted_backend_services`
- Description: (Optional) A list of weighted backend services to send traffic to when a route match occurs. The weights determine the fraction of traffic that flows to their corresponding backend service. If all traffic needs to go to a single backend service, there must be one weightedBackendService with weight set to a non 0 number. Once a backendService is identified and before forwarding the request to the backend service, advanced routing actions like Url rewrites and header transformations are applied depending on additional settings specified in this HttpRouteAction. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_weighted_backend_services).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_rewrite`
- Description: (Optional) The spec to modify the URL of the request, prior to forwarding the request to the matched service. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_url_rewrite).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Specifies the timeout for the selected route. Timeout is computed from the time the request has been fully processed (i.e. end-of-stream) up until the response has been completely processed. Timeout includes all retries. If not specified, will use the largest timeout among all backend services associated with the route. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_timeout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_stream_duration`
- Description: (Optional) Specifies the maximum duration (timeout) for streams on the selected route. Unlike the `Timeout` field where the timeout duration starts from the time the request has been fully processed (known as end-of-stream), the duration in this field is computed from the beginning of the stream until the response has been processed, including all retries. A stream that does not complete in this duration is closed. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_max_stream_duration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_policy`
- Description: (Optional) Specifies the retry policy associated with this route. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_retry_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_mirror_policy`
- Description: (Optional) Specifies the policy on how requests intended for the route's backends are shadowed to a separate mirrored backend service. Loadbalancer does not wait for responses from the shadow service. Prior to sending traffic to the shadow service, the host / authority header is suffixed with -shadow. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_request_mirror_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cors_policy`
- Description: (Optional) The specification for allowing client side cross-origin requests. Please see [W3C Recommendation for Cross Origin Resource Sharing](https://www.w3.org/TR/cors/) Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_cors_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fault_injection_policy`
- Description: (Optional) The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. As part of fault injection, when clients send requests to a backend service, delays can be introduced by Loadbalancer on a percentage of requests before sending those request to the backend service. Similarly requests from clients can be aborted by the Loadbalancer for a percentage of requests. timeout and retryPolicy will be ignored by clients that are configured with a faultInjectionPolicy. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_fault_injection_policy). <a name="nested_path_matcher_path_matcher_default_route_action_weighted_backend_services"></a>The `weighted_backend_services` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Optional) The full or partial URL to the default BackendService resource. Before forwarding the request to backendService, the loadbalancer applies any relevant headerActions specified as part of this backendServiceWeight.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Specifies the fraction of traffic sent to backendService, computed as weight / (sum of all weightedBackendService weights in routeAction) . The selection of a backend service is determined only for new traffic. Once a user's request has been directed to a backendService, subsequent requests will be sent to the same backendService as determined by the BackendService's session affinity policy. The value must be between 0 and 1000
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: (Optional) Specifies changes to request and response headers that need to take effect for the selected backendService. headerAction specified here take effect before headerAction in the enclosing HttpRouteRule, PathMatcher and UrlMap. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_weighted_backend_services_weighted_backend_services_header_action). <a name="nested_path_matcher_path_matcher_default_route_action_weighted_backend_services_weighted_backend_services_header_action"></a>The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_add`
- Description: (Optional) Headers to add to a matching request prior to forwarding the request to the backendService. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_weighted_backend_services_weighted_backend_services_header_action_request_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the response prior to sending the response back to the client.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_add`
- Description: (Optional) Headers to add the response prior to sending the response back to the client. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_weighted_backend_services_weighted_backend_services_header_action_response_headers_to_add). <a name="nested_path_matcher_path_matcher_default_route_action_weighted_backend_services_weighted_backend_services_header_action_request_headers_to_add"></a>The `request_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Optional) The name of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Optional) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Optional) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_default_route_action_weighted_backend_services_weighted_backend_services_header_action_response_headers_to_add"></a>The `response_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Optional) The name of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Optional) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Optional) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_path_matcher_path_matcher_default_route_action_url_rewrite"></a>The `url_rewrite` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_prefix_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected backend service, the matching portion of the request's path is replaced by pathPrefixRewrite. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected service, the request's host header is replaced with contents of hostRewrite. The value must be between 1 and 255 characters. <a name="nested_path_matcher_path_matcher_default_route_action_timeout"></a>The `timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_path_matcher_path_matcher_default_route_action_max_stream_duration"></a>The `max_stream_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years <a name="nested_path_matcher_path_matcher_default_route_action_retry_policy"></a>The `retry_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_conditions`
- Description: (Optional) Specfies one or more conditions when this retry rule applies. Valid values are: * 5xx: Loadbalancer will attempt a retry if the backend service responds with any 5xx response code, or if the backend service does not respond at all, example: disconnects, reset, read timeout, * connection failure, and refused streams. * gateway-error: Similar to 5xx, but only applies to response codes 502, 503 or 504. * connect-failure: Loadbalancer will retry on failures connecting to backend services, for example due to connection timeouts. * retriable-4xx: Loadbalancer will retry for retriable 4xx response codes. Currently the only retriable error supported is 409. * refused-stream:Loadbalancer will retry if the backend service resets the stream with a REFUSED_STREAM error code. This reset type indicates that it is safe to retry. * cancelled: Loadbalancer will retry if the gRPC status code in the response header is set to cancelled * deadline-exceeded: Loadbalancer will retry if the gRPC status code in the response header is set to deadline-exceeded * resource-exhausted: Loadbalancer will retry if the gRPC status code in the response header is set to resource-exhausted * unavailable: Loadbalancer will retry if the gRPC status code in the response header is set to unavailable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_retries`
- Description: (Optional) Specifies the allowed number retries. This number must be > 0. If not specified, defaults to 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `per_try_timeout`
- Description: (Optional) Specifies a non-zero timeout per retry attempt. If not specified, will use the timeout set in HttpRouteAction. If timeout in HttpRouteAction is not set, will use the largest timeout among all backend services associated with the route. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_retry_policy_per_try_timeout). <a name="nested_path_matcher_path_matcher_default_route_action_retry_policy_per_try_timeout"></a>The `per_try_timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_path_matcher_path_matcher_default_route_action_request_mirror_policy"></a>The `request_mirror_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Required) The full or partial URL to the BackendService resource being mirrored to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mirror_percent`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The percentage of requests to be mirrored to backendService. The value must be between 0.0 and 100.0 inclusive. <a name="nested_path_matcher_path_matcher_default_route_action_cors_policy"></a>The `cors_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origins`
- Description: (Optional) Specifies the list of origins that will be allowed to do CORS requests. An origin is allowed if it matches either an item in allowOrigins or an item in allowOriginRegexes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origin_regexes`
- Description: (Optional) Specifies the regular expression patterns that match allowed origins. For regular expression grammar please see en.cppreference.com/w/cpp/regex/ecmascript An origin is allowed if it matches either an item in allowOrigins or an item in allowOriginRegexes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_methods`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Methods header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_headers`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expose_headers`
- Description: (Optional) Specifies the content for the Access-Control-Expose-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age`
- Description: (Optional) Specifies how long results of a preflight request can be cached in seconds. This translates to the Access-Control-Max-Age header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_credentials`
- Description: (Optional) In response to a preflight request, setting this to true indicates that the actual request can include user credentials. This translates to the Access-Control-Allow-Credentials header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) If true, specifies the CORS policy is disabled. The default value is false, which indicates that the CORS policy is in effect. <a name="nested_path_matcher_path_matcher_default_route_action_fault_injection_policy"></a>The `fault_injection_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delay`
- Description: (Optional) The specification for how client requests are delayed as part of fault injection, before being sent to a backend service. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_fault_injection_policy_delay).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `abort`
- Description: (Optional) The specification for how client requests are aborted as part of fault injection. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_fault_injection_policy_abort). <a name="nested_path_matcher_path_matcher_default_route_action_fault_injection_policy_delay"></a>The `delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_delay`
- Description: (Optional) Specifies the value of the fixed delay interval. Structure is [documented below](#nested_path_matcher_path_matcher_default_route_action_fault_injection_policy_delay_fixed_delay).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic (connections/operations/requests) on which delay will be introduced as part of fault injection. The value must be between 0.0 and 100.0 inclusive. <a name="nested_path_matcher_path_matcher_default_route_action_fault_injection_policy_delay_fixed_delay"></a>The `fixed_delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_path_matcher_path_matcher_default_route_action_fault_injection_policy_abort"></a>The `abort` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_status`
- Description: (Optional) The HTTP status code used to abort the request. The value must be between 200 and 599 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic (connections/operations/requests) which will be aborted as part of fault injection. The value must be between 0.0 and 100.0 inclusive. <a name="nested_default_custom_error_response_policy"></a>The `default_custom_error_response_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_response_rule`
- Description: (Optional) Specifies rules for returning error responses. In a given policy, if you specify rules for both a range of error codes as well as rules for specific error codes then rules with specific error codes have a higher priority. For example, assume that you configure a rule for 401 (Un-authorized) code, and another for all 4 series error codes (4XX). If the backend service returns a 401, then the rule for 401 will be applied. However if the backend service returns a 403, the rule for 4xx takes effect. Structure is [documented below](#nested_default_custom_error_response_policy_error_response_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_service`
- Description: (Optional) The full or partial URL to the BackendBucket resource that contains the custom error content. Examples are: https://www.googleapis.com/compute/v1/projects/project/global/backendBuckets/myBackendBucket compute/v1/projects/project/global/backendBuckets/myBackendBucket global/backendBuckets/myBackendBucket If errorService is not specified at lower levels like pathMatcher, pathRule and routeRule, an errorService specified at a higher level in the UrlMap will be used. If UrlMap.defaultCustomErrorResponsePolicy contains one or more errorResponseRules[], it must specify errorService. If load balancer cannot reach the backendBucket, a simple Not Found Error will be returned, with the original response code (or overrideResponseCode if configured). <a name="nested_default_custom_error_response_policy_error_response_rule"></a>The `error_response_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match_response_codes`
- Description: (Optional) Valid values include: - A number between 400 and 599: For example 401 or 503, in which case the load balancer applies the policy if the error code exactly matches this value. - 5xx: Load Balancer will apply the policy if the backend service responds with any response code in the range of 500 to 599. - 4xx: Load Balancer will apply the policy if the backend service responds with any response code in the range of 400 to 499. Values must be unique within matchResponseCodes and across all errorResponseRules of CustomErrorResponsePolicy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) The full path to a file within backendBucket. For example: /errors/defaultError.html path must start with a leading slash. path cannot have trailing slashes. If the file is not available in backendBucket or the load balancer cannot reach the BackendBucket, a simple Not Found Error is returned to the client. The value must be from 1 to 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `override_response_code`
- Description: (Optional) The HTTP status code returned with the response containing the custom error content. If overrideResponseCode is not supplied, the same response code returned by the original backend bucket or backend service is returned to the client. <a name="nested_test"></a>The `test` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of this test case.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Required) Host portion of the URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) Path portion of the URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Optional) HTTP headers for this request. Structure is [documented below](#nested_test_test_headers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) The backend service or backend bucket link that should be matched by this test.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expected_output_url`
- Description: (Optional) The expected output URL evaluated by the load balancer containing the scheme, host, path and query parameters. For rules that forward requests to backends, the test passes only when expectedOutputUrl matches the request forwarded by the load balancer to backends. For rules with urlRewrite, the test verifies that the forwarded request matches hostRewrite and pathPrefixRewrite in the urlRewrite action. When service is specified, expectedOutputUrl`s scheme is ignored. For rules with urlRedirect, the test passes only if expectedOutputUrl matches the URL in the load balancer's redirect response. If urlRedirect specifies httpsRedirect, the test passes only if the scheme in expectedOutputUrl is also set to HTTPS. If urlRedirect specifies stripQuery, the test passes only if expectedOutputUrl does not contain any query parameters. expectedOutputUrl is optional when service is specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expected_redirect_response_code`
- Description: (Optional) For rules with urlRedirect, the test passes only if expectedRedirectResponseCode matches the HTTP status code in load balancer's redirect response. expectedRedirectResponseCode cannot be set when service is set. <a name="nested_test_test_headers"></a>The `headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Header name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Header value. <a name="nested_default_url_redirect"></a>The `default_url_redirect` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_redirect`
- Description: (Optional) The host that will be used in the redirect response instead of the one that was supplied in the request. The value must be between 1 and 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `https_redirect`
- Description: (Optional) If set to true, the URL scheme in the redirected request is set to https. If set to false, the URL scheme of the redirected request will remain the same as that of the request. This must only be set for UrlMaps used in TargetHttpProxys. Setting this true for TargetHttpsProxy is not permitted. The default is set to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_redirect`
- Description: (Optional) The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect cannot be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `prefix_redirect`
- Description: (Optional) The prefix that replaces the prefixMatch specified in the HttpRouteRuleMatch, retaining the remaining portion of the URL before redirecting the request. prefixRedirect cannot be supplied together with pathRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_response_code`
- Description: (Optional) The HTTP Status code to use for this RedirectAction. Supported values are: * MOVED_PERMANENTLY_DEFAULT, which is the default value and corresponds to 301. * FOUND, which corresponds to 302. * SEE_OTHER which corresponds to 303. * TEMPORARY_REDIRECT, which corresponds to 307. In this case, the request method will be retained. * PERMANENT_REDIRECT, which corresponds to 308. In this case, the request method will be retained.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `strip_query`
- Description: (Required) If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. If set to false, the query portion of the original URL is retained. The default is set to false. This field is required to ensure an empty block is not set. The normal default value is false. <a name="nested_default_route_action"></a>The `default_route_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weighted_backend_services`
- Description: (Optional) A list of weighted backend services to send traffic to when a route match occurs. The weights determine the fraction of traffic that flows to their corresponding backend service. If all traffic needs to go to a single backend service, there must be one weightedBackendService with weight set to a non 0 number. Once a backendService is identified and before forwarding the request to the backend service, advanced routing actions like Url rewrites and header transformations are applied depending on additional settings specified in this HttpRouteAction. Structure is [documented below](#nested_default_route_action_weighted_backend_services).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_rewrite`
- Description: (Optional) The spec to modify the URL of the request, prior to forwarding the request to the matched service. Structure is [documented below](#nested_default_route_action_url_rewrite).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Specifies the timeout for the selected route. Timeout is computed from the time the request has been fully processed (i.e. end-of-stream) up until the response has been completely processed. Timeout includes all retries. If not specified, will use the largest timeout among all backend services associated with the route. Structure is [documented below](#nested_default_route_action_timeout).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_stream_duration`
- Description: (Optional) Specifies the maximum duration (timeout) for streams on the selected route. Unlike the `Timeout` field where the timeout duration starts from the time the request has been fully processed (known as end-of-stream), the duration in this field is computed from the beginning of the stream until the response has been processed, including all retries. A stream that does not complete in this duration is closed. Structure is [documented below](#nested_default_route_action_max_stream_duration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_policy`
- Description: (Optional) Specifies the retry policy associated with this route. Structure is [documented below](#nested_default_route_action_retry_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_mirror_policy`
- Description: (Optional) Specifies the policy on how requests intended for the route's backends are shadowed to a separate mirrored backend service. Loadbalancer does not wait for responses from the shadow service. Prior to sending traffic to the shadow service, the host / authority header is suffixed with -shadow. Structure is [documented below](#nested_default_route_action_request_mirror_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cors_policy`
- Description: (Optional) The specification for allowing client side cross-origin requests. Please see [W3C Recommendation for Cross Origin Resource Sharing](https://www.w3.org/TR/cors/) Structure is [documented below](#nested_default_route_action_cors_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fault_injection_policy`
- Description: (Optional) The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. As part of fault injection, when clients send requests to a backend service, delays can be introduced by Loadbalancer on a percentage of requests before sending those request to the backend service. Similarly requests from clients can be aborted by the Loadbalancer for a percentage of requests. timeout and retryPolicy will be ignored by clients that are configured with a faultInjectionPolicy. Structure is [documented below](#nested_default_route_action_fault_injection_policy). <a name="nested_default_route_action_weighted_backend_services"></a>The `weighted_backend_services` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Optional) The full or partial URL to the default BackendService resource. Before forwarding the request to backendService, the loadbalancer applies any relevant headerActions specified as part of this backendServiceWeight.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weight`
- Description: (Optional) Specifies the fraction of traffic sent to backendService, computed as weight / (sum of all weightedBackendService weights in routeAction) . The selection of a backend service is determined only for new traffic. Once a user's request has been directed to a backendService, subsequent requests will be sent to the same backendService as determined by the BackendService's session affinity policy. The value must be between 0 and 1000
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: (Optional) Specifies changes to request and response headers that need to take effect for the selected backendService. headerAction specified here take effect before headerAction in the enclosing HttpRouteRule, PathMatcher and UrlMap. Structure is [documented below](#nested_default_route_action_weighted_backend_services_weighted_backend_services_header_action). <a name="nested_default_route_action_weighted_backend_services_weighted_backend_services_header_action"></a>The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the request prior to forwarding the request to the backendService.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_add`
- Description: (Optional) Headers to add to a matching request prior to forwarding the request to the backendService. Structure is [documented below](#nested_default_route_action_weighted_backend_services_weighted_backend_services_header_action_request_headers_to_add).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_remove`
- Description: (Optional) A list of header names for headers that need to be removed from the response prior to sending the response back to the client.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_headers_to_add`
- Description: (Optional) Headers to add the response prior to sending the response back to the client. Structure is [documented below](#nested_default_route_action_weighted_backend_services_weighted_backend_services_header_action_response_headers_to_add). <a name="nested_default_route_action_weighted_backend_services_weighted_backend_services_header_action_request_headers_to_add"></a>The `request_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Optional) The name of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Optional) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Optional) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_default_route_action_weighted_backend_services_weighted_backend_services_header_action_response_headers_to_add"></a>The `response_headers_to_add` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: (Optional) The name of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: (Optional) The value of the header to add.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replace`
- Description: (Optional) If false, headerValue is appended to any values that already exist for the header. If true, headerValue is set for the header, discarding any values that were set for that header. <a name="nested_default_route_action_url_rewrite"></a>The `url_rewrite` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_prefix_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected backend service, the matching portion of the request's path is replaced by pathPrefixRewrite. The value must be between 1 and 1024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_rewrite`
- Description: (Optional) Prior to forwarding the request to the selected service, the request's host header is replaced with contents of hostRewrite. The value must be between 1 and 255 characters. <a name="nested_default_route_action_timeout"></a>The `timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_default_route_action_max_stream_duration"></a>The `max_stream_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Required) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years <a name="nested_default_route_action_retry_policy"></a>The `retry_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_conditions`
- Description: (Optional) Specfies one or more conditions when this retry rule applies. Valid values are: * 5xx: Loadbalancer will attempt a retry if the backend service responds with any 5xx response code, or if the backend service does not respond at all, example: disconnects, reset, read timeout, * connection failure, and refused streams. * gateway-error: Similar to 5xx, but only applies to response codes 502, 503 or 504. * connect-failure: Loadbalancer will retry on failures connecting to backend services, for example due to connection timeouts. * retriable-4xx: Loadbalancer will retry for retriable 4xx response codes. Currently the only retriable error supported is 409. * refused-stream:Loadbalancer will retry if the backend service resets the stream with a REFUSED_STREAM error code. This reset type indicates that it is safe to retry. * cancelled: Loadbalancer will retry if the gRPC status code in the response header is set to cancelled * deadline-exceeded: Loadbalancer will retry if the gRPC status code in the response header is set to deadline-exceeded * resource-exhausted: Loadbalancer will retry if the gRPC status code in the response header is set to resource-exhausted * unavailable: Loadbalancer will retry if the gRPC status code in the response header is set to unavailable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_retries`
- Description: (Optional) Specifies the allowed number retries. This number must be > 0. If not specified, defaults to 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `per_try_timeout`
- Description: (Optional) Specifies a non-zero timeout per retry attempt. If not specified, will use the timeout set in HttpRouteAction. If timeout in HttpRouteAction is not set, will use the largest timeout among all backend services associated with the route. Structure is [documented below](#nested_default_route_action_retry_policy_per_try_timeout). <a name="nested_default_route_action_retry_policy_per_try_timeout"></a>The `per_try_timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_default_route_action_request_mirror_policy"></a>The `request_mirror_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Required) The full or partial URL to the BackendService resource being mirrored to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mirror_percent`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The percentage of requests to be mirrored to backendService. The value must be between 0.0 and 100.0 inclusive. <a name="nested_default_route_action_cors_policy"></a>The `cors_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origins`
- Description: (Optional) Specifies the list of origins that will be allowed to do CORS requests. An origin is allowed if it matches either an item in allowOrigins or an item in allowOriginRegexes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_origin_regexes`
- Description: (Optional) Specifies the regular expression patterns that match allowed origins. For regular expression grammar please see en.cppreference.com/w/cpp/regex/ecmascript An origin is allowed if it matches either an item in allowOrigins or an item in allowOriginRegexes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_methods`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Methods header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_headers`
- Description: (Optional) Specifies the content for the Access-Control-Allow-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expose_headers`
- Description: (Optional) Specifies the content for the Access-Control-Expose-Headers header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_age`
- Description: (Optional) Specifies how long results of a preflight request can be cached in seconds. This translates to the Access-Control-Max-Age header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_credentials`
- Description: (Optional) In response to a preflight request, setting this to true indicates that the actual request can include user credentials. This translates to the Access-Control-Allow-Credentials header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) If true, specifies the CORS policy is disabled. The default value is false, which indicates that the CORS policy is in effect. <a name="nested_default_route_action_fault_injection_policy"></a>The `fault_injection_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delay`
- Description: (Optional) The specification for how client requests are delayed as part of fault injection, before being sent to a backend service. Structure is [documented below](#nested_default_route_action_fault_injection_policy_delay).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `abort`
- Description: (Optional) The specification for how client requests are aborted as part of fault injection. Structure is [documented below](#nested_default_route_action_fault_injection_policy_abort). <a name="nested_default_route_action_fault_injection_policy_delay"></a>The `delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_delay`
- Description: (Optional) Specifies the value of the fixed delay interval. Structure is [documented below](#nested_default_route_action_fault_injection_policy_delay_fixed_delay).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic (connections/operations/requests) on which delay will be introduced as part of fault injection. The value must be between 0.0 and 100.0 inclusive. <a name="nested_default_route_action_fault_injection_policy_delay_fixed_delay"></a>The `fixed_delay` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_default_route_action_fault_injection_policy_abort"></a>The `abort` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_status`
- Description: (Optional) The HTTP status code used to abort the request. The value must be between 200 and 599 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `percentage`
- Description: (Optional) The percentage of traffic (connections/operations/requests) which will be aborted as part of fault injection. The value must be between 0.0 and 100.0 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
