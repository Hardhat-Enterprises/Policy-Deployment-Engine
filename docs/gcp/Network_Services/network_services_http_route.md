## 🛡️ Policy Deployment Engine: `network_services_http_route`

This section provides a concise policy evaluation for the `network_services_http_route` resource in GCP.

Reference: [Terraform Registry – network_services_http_route](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_http_route)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hostnames` | Set of hosts that should match against the HTTP host header to select a HttpRoute to process the request. | true | None | None |
| `name` | Name of the HttpRoute resource. | true | None | None |
| `labels` | Set of label tags associated with the HttpRoute resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `meshes` | Meshes defines a list of meshes this HttpRoute is attached to, as one of the routing rules to route the requests served by the mesh. Each mesh reference should match the pattern: projects/*/locations/global/meshes/<mesh_name>. The attached Mesh should be of a type SIDECAR. | false | None | None |
| `gateways` | Gateways defines a list of gateways this HttpRoute is attached to, as one of the routing rules to route the requests served by the gateway. Each gateway reference should match the pattern: projects/*/locations/global/gateways/<gateway_name> | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `matches` | A list of matches define conditions used for matching the rule against incoming HTTP requests. Each match is independent, i.e. this rule will be matched if ANY one of the matches is satisfied. If no matches field is specified, this rule will unconditionally match traffic. If a default rule is desired to be configured, add a rule with no matches specified to the end of the rules list. Structure is [documented below](#nested_rules_rules_matches). | false | None | None |
| `action` | The detailed rule defining how to route matched traffic. Structure is [documented below](#nested_rules_rules_action). | false | None | None |

### matches Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ignore_case` | Specifies if prefixMatch and fullPathMatch matches are case sensitive. The default value is false. | false | None | None |
| `full_path_match` | The HTTP request path value should exactly match this value. | false | None | None |
| `prefix_match` | The HTTP request path value must begin with specified prefixMatch. prefixMatch must begin with a /. | false | None | None |
| `regex_match` | The HTTP request path value must satisfy the regular expression specified by regexMatch after removing any query parameters and anchor supplied with the original URL. For regular expression grammar, please see https://github.com/google/re2/wiki/Syntax | false | None | None |
| `query_parameters` | Specifies a list of query parameters to match against. Structure is [documented below](#nested_rules_rules_matches_matches_query_parameters). | false | None | None |
| `headers` | Specifies a list of HTTP request headers to match against. Structure is [documented below](#nested_rules_rules_matches_matches_headers). | false | None | None |

### query_parameters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_parameter` | The name of the query parameter to match. | false | None | None |
| `exact_match` | The value of the query parameter must exactly match the contents of exactMatch. | false | None | None |
| `regex_match` | The value of the query parameter must match the regular expression specified by regexMatch.For regular expression grammar, please see https://github.com/google/re2/wiki/Syntax | false | None | None |
| `present_match` | Specifies that the QueryParameterMatcher matches if request contains query parameter, irrespective of whether the parameter has a value or not. | false | None | None |

### headers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `header` | The name of the HTTP header to match against. | false | None | None |
| `invert_match` | If specified, the match result will be inverted before checking. Default value is set to false. | false | None | None |
| `exact_match` | The value of the header should match exactly the content of exactMatch. | false | None | None |
| `regex_match` | The value of the header must match the regular expression specified in regexMatch. | false | None | None |
| `prefix_match` | The value of the header must start with the contents of prefixMatch. | false | None | None |
| `present_match` | A header with headerName must exist. The match takes place whether or not the header has a value. | false | None | None |
| `suffix_match` | The value of the header must end with the contents of suffixMatch. | false | None | None |
| `range_match` | If specified, the rule will match if the request header value is within the range. Structure is [documented below](#nested_rules_rules_matches_matches_headers_headers_range_match). | false | None | None |

### range_match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start` | Start of the range (inclusive). | true | None | None |
| `end` | End of the range (exclusive). | true | None | None |

### action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `destinations` | The destination to which traffic should be forwarded. Structure is [documented below](#nested_rules_rules_action_destinations). | false | None | None |
| `redirect` | If set, the request is directed as configured by this field. Structure is [documented below](#nested_rules_rules_action_redirect). | false | None | None |
| `fault_injection_policy` | The specification for fault injection introduced into traffic to test the resiliency of clients to backend service failure. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy). | false | None | None |
| `request_header_modifier` | The specification for modifying the headers of a matching request prior to delivery of the request to the destination. Structure is [documented below](#nested_rules_rules_action_request_header_modifier). | false | None | None |
| `response_header_modifier` | The specification for modifying the headers of a response prior to sending the response back to the client. Structure is [documented below](#nested_rules_rules_action_response_header_modifier). | false | None | None |
| `url_rewrite` | The specification for rewrite URL before forwarding requests to the destination. Structure is [documented below](#nested_rules_rules_action_url_rewrite). | false | None | None |
| `timeout` | Specifies the timeout for selected route. | false | None | None |
| `retry_policy` | Specifies the retry policy associated with this route. Structure is [documented below](#nested_rules_rules_action_retry_policy). | false | None | None |
| `request_mirror_policy` | Specifies the policy on how requests intended for the routes destination are shadowed to a separate mirrored destination. Structure is [documented below](#nested_rules_rules_action_request_mirror_policy). | false | None | None |
| `cors_policy` | The specification for allowing client side cross-origin requests. Structure is [documented below](#nested_rules_rules_action_cors_policy). | false | None | None |

### destinations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_name` | The URL of a BackendService to route traffic to. | false | None | None |
| `weight` | Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. This is computed as: weight/Sum(weights in this destination list). For non-zero values, there may be some epsilon from the exact proportion defined here depending on the precision an implementation supports. If only one serviceName is specified and it has a weight greater than 0, 100% of the traffic is forwarded to that backend. If weights are specified for any one service name, they need to be specified for all of them. If weights are unspecified for all services, then, traffic is distributed in equal proportions to all of them. | false | None | None |

### redirect Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host_redirect` | The host that will be used in the redirect response instead of the one that was supplied in the request. | false | None | None |
| `path_redirect` | The path that will be used in the redirect response instead of the one that was supplied in the request. pathRedirect can not be supplied together with prefixRedirect. Supply one alone or neither. If neither is supplied, the path of the original request will be used for the redirect. | false | None | None |
| `prefix_rewrite` | Indicates that during redirection, the matched prefix (or path) should be swapped with this value. | false | None | None |
| `response_code` | The HTTP Status code to use for the redirect. | false | None | None |
| `https_redirect` | If set to true, the URL scheme in the redirected request is set to https. | false | None | None |
| `strip_query` | If set to true, any accompanying query portion of the original URL is removed prior to redirecting the request. | false | None | None |
| `port_redirect` | The port that will be used in the redirected request instead of the one that was supplied in the request. | false | None | None |

### fault_injection_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `delay` | Specification of how client requests are delayed as part of fault injection before being sent to a destination. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy_delay). | false | None | None |
| `abort` | Specification of how client requests are aborted as part of fault injection before being sent to a destination. Structure is [documented below](#nested_rules_rules_action_fault_injection_policy_abort). | false | None | None |

### delay Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed_delay` | Specify a fixed delay before forwarding the request. | false | None | None |
| `percentage` | The percentage of traffic on which delay will be injected. | false | None | None |

### abort Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `http_status` | The HTTP status code used to abort the request. | false | None | None |
| `percentage` | The percentage of traffic which will be aborted. | false | None | None |

### request_header_modifier Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `set` | Completely overwrite/replace the headers with given map where key is the name of the header, value is the value of the header. | false | None | None |
| `add` | Add the headers with given map where key is the name of the header, value is the value of the header. | false | None | None |
| `remove` | Remove headers (matching by header names) specified in the list. | false | None | None |

### response_header_modifier Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `set` | Completely overwrite/replace the headers with given map where key is the name of the header, value is the value of the header. | false | None | None |
| `add` | Add the headers with given map where key is the name of the header, value is the value of the header. | false | None | None |
| `remove` | Remove headers (matching by header names) specified in the list. | false | None | None |

### url_rewrite Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path_prefix_rewrite` | Prior to forwarding the request to the selected destination, the matching portion of the requests path is replaced by this value. | false | None | None |
| `host_rewrite` | Prior to forwarding the request to the selected destination, the requests host header is replaced by this value. | false | None | None |

### retry_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `retry_conditions` | Specifies one or more conditions when this retry policy applies. | false | None | None |
| `num_retries` | Specifies the allowed number of retries. | false | None | None |
| `per_try_timeout` | Specifies a non-zero timeout per retry attempt. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |

### request_mirror_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `destination` | The destination the requests will be mirrored to. Structure is [documented below](#nested_rules_rules_action_request_mirror_policy_destination). | false | None | None |

### destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_name` | The URL of a BackendService to route traffic to. | false | None | None |
| `weight` | Specifies the proportion of requests forwarded to the backend referenced by the serviceName field. This is computed as: weight/Sum(weights in this destination list). For non-zero values, there may be some epsilon from the exact proportion defined here depending on the precision an implementation supports. If only one serviceName is specified and it has a weight greater than 0, 100% of the traffic is forwarded to that backend. If weights are specified for any one service name, they need to be specified for all of them. If weights are unspecified for all services, then, traffic is distributed in equal proportions to all of them. | false | None | None |

### cors_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_origins` | Specifies the list of origins that will be allowed to do CORS requests. | false | None | None |
| `allow_origin_regexes` | Specifies the regular expression patterns that match allowed origins. | false | None | None |
| `allow_methods` | Specifies the content for Access-Control-Allow-Methods header. | false | None | None |
| `allow_headers` | Specifies the content for Access-Control-Allow-Headers header. | false | None | None |
| `expose_headers` | Specifies the content for Access-Control-Expose-Headers header. | false | None | None |
| `max_age` | Specifies how long result of a preflight request can be cached in seconds. | false | None | None |
| `allow_credentials` | In response to a preflight request, setting this to true indicates that the actual request can include user credentials. | false | None | None |
| `disabled` | If true, the CORS policy is disabled. The default value is false, which indicates that the CORS policy is in effect. | false | None | None |
