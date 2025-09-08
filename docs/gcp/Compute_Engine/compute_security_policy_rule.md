## 🛡️ Policy Deployment Engine: `compute_security_policy_rule`

This section provides a concise policy evaluation for the `compute_security_policy_rule` resource in GCP.

Reference: [Terraform Registry – compute_security_policy_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_security_policy_rule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `priority` | An integer indicating the priority of a rule in the list. The priority must be a positive value between 0 and 2147483647. Rules are evaluated from highest to lowest priority where 0 is the highest priority and 2147483647 is the lowest priority. | true | None | None |
| `action` | The Action to perform when the rule is matched. The following are the valid actions: * allow: allow access to target. * deny(STATUS): deny access to target, returns the HTTP response code specified. Valid values for STATUS are 403, 404, and 502. * rate_based_ban: limit client traffic to the configured threshold and ban the client if the traffic exceeds the threshold. Configure parameters for this action in RateLimitOptions. Requires rateLimitOptions to be set. * redirect: redirect to a different target. This can either be an internal reCAPTCHA redirect, or an external URL-based redirect via a 302 response. Parameters for this action can be configured via redirectOptions. This action is only supported in Global Security Policies of type CLOUD_ARMOR. * throttle: limit client traffic to the configured threshold. Configure parameters for this action in rateLimitOptions. Requires rateLimitOptions to be set for this. | true | None | None |
| `security_policy` | The name of the security policy this rule belongs to. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `preview` | If set to true, the specified action is not enforced. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `versioned_expr` | Preconfigured versioned expression. If this field is specified, config must also be specified. Available preconfigured expressions along with their requirements are: SRC_IPS_V1 - must specify the corresponding srcIpRange field in config. Possible values are: `SRC_IPS_V1`. | false | None | None |
| `expr` | User defined CEVAL expression. A CEVAL expression is used to specify match criteria such as origin.ip, source.region_code and contents in the request header. Structure is [documented below](#nested_match_expr). | false | None | None |
| `expr_options` | The configuration options available when specifying a user defined CEVAL expression (i.e., 'expr'). Structure is [documented below](#nested_match_expr_options). | false | None | None |
| `config` | The configuration options available when specifying versionedExpr. This field must be specified if versionedExpr is specified and cannot be specified if versionedExpr is not specified. Structure is [documented below](#nested_match_config). | false | None | None |

### preconfigured_waf_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exclusion` | An exclusion to apply during preconfigured WAF evaluation. Structure is [documented below](#nested_preconfigured_waf_config_exclusion). | false | None | None |

### rate_limit_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rate_limit_threshold` | Threshold at which to begin ratelimiting. Structure is [documented below](#nested_rate_limit_options_rate_limit_threshold). | false | None | None |
| `conform_action` | Action to take for requests that are under the configured rate limit threshold. Valid option is "allow" only. | false | None | None |
| `exceed_redirect_options` | Parameters defining the redirect action that is used as the exceed action. Cannot be specified if the exceed action is not redirect. This field is only supported in Global Security Policies of type CLOUD_ARMOR. Structure is [documented below](#nested_rate_limit_options_exceed_redirect_options). | false | None | None |
| `exceed_action` | Action to take for requests that are above the configured rate limit threshold, to either deny with a specified HTTP response code, or redirect to a different endpoint. Valid options are deny(STATUS), where valid values for STATUS are 403, 404, 429, and 502. | false | None | None |
| `enforce_on_key` | Determines the key to enforce the rateLimitThreshold on. Possible values are: * ALL: A single rate limit threshold is applied to all the requests matching this rule. This is the default value if "enforceOnKey" is not configured. * IP: The source IP address of the request is the key. Each IP has this limit enforced separately. * HTTP_HEADER: The value of the HTTP header whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the header value. If no such header is present in the request, the key type defaults to ALL. * XFF_IP: The first IP address (i.e. the originating client IP address) specified in the list of IPs under X-Forwarded-For HTTP header. If no such header is present or the value is not a valid IP, the key defaults to the source IP address of the request i.e. key type IP. * HTTP_COOKIE: The value of the HTTP cookie whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the cookie value. If no such cookie is present in the request, the key type defaults to ALL. * HTTP_PATH: The URL path of the HTTP request. The key value is truncated to the first 128 bytes. * SNI: Server name indication in the TLS session of the HTTPS request. The key value is truncated to the first 128 bytes. The key type defaults to ALL on a HTTP session. * REGION_CODE: The country/region from which the request originates. * TLS_JA3_FINGERPRINT: JA3 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. * TLS_JA4_FINGERPRINT: JA4 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. * USER_IP: The IP address of the originating client, which is resolved based on "userIpRequestHeaders" configured with the security policy. If there is no "userIpRequestHeaders" configuration or an IP address cannot be resolved from it, the key type defaults to IP. Possible values are: `ALL`, `IP`, `HTTP_HEADER`, `XFF_IP`, `HTTP_COOKIE`, `HTTP_PATH`, `SNI`, `REGION_CODE`, `TLS_JA3_FINGERPRINT`, `TLS_JA4_FINGERPRINT`, `USER_IP`. | false | None | None |
| `enforce_on_key_name` | Rate limit key name applicable only for the following key types: HTTP_HEADER -- Name of the HTTP header whose value is taken as the key value. HTTP_COOKIE -- Name of the HTTP cookie whose value is taken as the key value. | false | None | None |
| `enforce_on_key_configs` | If specified, any combination of values of enforceOnKeyType/enforceOnKeyName is treated as the key on which ratelimit threshold/action is enforced. You can specify up to 3 enforceOnKeyConfigs. If enforceOnKeyConfigs is specified, enforceOnKey must not be specified. Structure is [documented below](#nested_rate_limit_options_enforce_on_key_configs). | false | None | None |
| `ban_threshold` | Can only be specified if the action for the rule is "rate_based_ban". If specified, the key will be banned for the configured 'banDurationSec' when the number of requests that exceed the 'rateLimitThreshold' also exceed this 'banThreshold'. Structure is [documented below](#nested_rate_limit_options_ban_threshold). | false | None | None |
| `ban_duration_sec` | Can only be specified if the action for the rule is "rate_based_ban". If specified, determines the time (in seconds) the traffic will continue to be banned by the rate limit after the rate falls below the threshold. | false | None | None |

### redirect_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Type of the redirect action. | false | None | None |
| `target` | Target for the redirect action. This is required if the type is EXTERNAL_302 and cannot be specified for GOOGLE_RECAPTCHA. | false | None | None |

### header_action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `request_headers_to_adds` | The list of request headers to add or overwrite if they're already present. Structure is [documented below](#nested_header_action_request_headers_to_adds). | false | None | None |

### expr Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | Textual representation of an expression in Common Expression Language syntax. The application context of the containing message determines which well-known feature set of CEL is supported. | true | None | None |

### expr_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `recaptcha_options` | reCAPTCHA configuration options to be applied for the rule. If the rule does not evaluate reCAPTCHA tokens, this field has no effect. Structure is [documented below](#nested_match_expr_options_recaptcha_options). | true | None | None |

### recaptcha_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `action_token_site_keys` | A list of site keys to be used during the validation of reCAPTCHA action-tokens. The provided site keys need to be created from reCAPTCHA API under the same project where the security policy is created. | false | None | None |
| `session_token_site_keys` | A list of site keys to be used during the validation of reCAPTCHA session-tokens. The provided site keys need to be created from reCAPTCHA API under the same project where the security policy is created. | false | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `src_ip_ranges` | CIDR IP address range. Maximum number of srcIpRanges allowed is 10. | false | None | None |

### exclusion Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `request_header` | Request header whose value will be excluded from inspection during preconfigured WAF evaluation. Structure is [documented below](#nested_preconfigured_waf_config_exclusion_exclusion_request_header). | false | None | None |
| `request_cookie` | Request cookie whose value will be excluded from inspection during preconfigured WAF evaluation. Structure is [documented below](#nested_preconfigured_waf_config_exclusion_exclusion_request_cookie). | false | None | None |
| `request_uri` | Request URI from the request line to be excluded from inspection during preconfigured WAF evaluation. When specifying this field, the query or fragment part should be excluded. Structure is [documented below](#nested_preconfigured_waf_config_exclusion_exclusion_request_uri). | false | None | None |
| `request_query_param` | Request query parameter whose value will be excluded from inspection during preconfigured WAF evaluation. Note that the parameter can be in the query string or in the POST body. Structure is [documented below](#nested_preconfigured_waf_config_exclusion_exclusion_request_query_param). | false | None | None |
| `target_rule_set` | Target WAF rule set to apply the preconfigured WAF exclusion. | true | None | None |
| `target_rule_ids` | A list of target rule IDs under the WAF rule set to apply the preconfigured WAF exclusion. If omitted, it refers to all the rule IDs under the WAF rule set. | false | None | None |

### request_header Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `operator` | You can specify an exact match or a partial match by using a field operator and a field value. Available options: EQUALS: The operator matches if the field value equals the specified value. STARTS_WITH: The operator matches if the field value starts with the specified value. ENDS_WITH: The operator matches if the field value ends with the specified value. CONTAINS: The operator matches if the field value contains the specified value. EQUALS_ANY: The operator matches if the field value is any value. | true | None | None |
| `value` | A request field matching the specified value will be excluded from inspection during preconfigured WAF evaluation. The field value must be given if the field operator is not EQUALS_ANY, and cannot be given if the field operator is EQUALS_ANY. | false | None | None |

### request_cookie Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `operator` | You can specify an exact match or a partial match by using a field operator and a field value. Available options: EQUALS: The operator matches if the field value equals the specified value. STARTS_WITH: The operator matches if the field value starts with the specified value. ENDS_WITH: The operator matches if the field value ends with the specified value. CONTAINS: The operator matches if the field value contains the specified value. EQUALS_ANY: The operator matches if the field value is any value. | true | None | None |
| `value` | A request field matching the specified value will be excluded from inspection during preconfigured WAF evaluation. The field value must be given if the field operator is not EQUALS_ANY, and cannot be given if the field operator is EQUALS_ANY. | false | None | None |

### request_uri Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `operator` | You can specify an exact match or a partial match by using a field operator and a field value. Available options: EQUALS: The operator matches if the field value equals the specified value. STARTS_WITH: The operator matches if the field value starts with the specified value. ENDS_WITH: The operator matches if the field value ends with the specified value. CONTAINS: The operator matches if the field value contains the specified value. EQUALS_ANY: The operator matches if the field value is any value. | true | None | None |
| `value` | A request field matching the specified value will be excluded from inspection during preconfigured WAF evaluation. The field value must be given if the field operator is not EQUALS_ANY, and cannot be given if the field operator is EQUALS_ANY. | false | None | None |

### request_query_param Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `operator` | You can specify an exact match or a partial match by using a field operator and a field value. Available options: EQUALS: The operator matches if the field value equals the specified value. STARTS_WITH: The operator matches if the field value starts with the specified value. ENDS_WITH: The operator matches if the field value ends with the specified value. CONTAINS: The operator matches if the field value contains the specified value. EQUALS_ANY: The operator matches if the field value is any value. | true | None | None |
| `value` | A request field matching the specified value will be excluded from inspection during preconfigured WAF evaluation. The field value must be given if the field operator is not EQUALS_ANY, and cannot be given if the field operator is EQUALS_ANY. | false | None | None |

### rate_limit_threshold Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `count` | Number of HTTP(S) requests for calculating the threshold. | false | None | None |
| `interval_sec` | Interval over which the threshold is computed. | false | None | None |

### exceed_redirect_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Type of the redirect action. | false | None | None |
| `target` | Target for the redirect action. This is required if the type is EXTERNAL_302 and cannot be specified for GOOGLE_RECAPTCHA. | false | None | None |

### enforce_on_key_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enforce_on_key_type` | Determines the key to enforce the rateLimitThreshold on. Possible values are: * ALL: A single rate limit threshold is applied to all the requests matching this rule. This is the default value if "enforceOnKeyConfigs" is not configured. * IP: The source IP address of the request is the key. Each IP has this limit enforced separately. * HTTP_HEADER: The value of the HTTP header whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the header value. If no such header is present in the request, the key type defaults to ALL. * XFF_IP: The first IP address (i.e. the originating client IP address) specified in the list of IPs under X-Forwarded-For HTTP header. If no such header is present or the value is not a valid IP, the key defaults to the source IP address of the request i.e. key type IP. * HTTP_COOKIE: The value of the HTTP cookie whose name is configured under "enforceOnKeyName". The key value is truncated to the first 128 bytes of the cookie value. If no such cookie is present in the request, the key type defaults to ALL. * HTTP_PATH: The URL path of the HTTP request. The key value is truncated to the first 128 bytes. * SNI: Server name indication in the TLS session of the HTTPS request. The key value is truncated to the first 128 bytes. The key type defaults to ALL on a HTTP session. * REGION_CODE: The country/region from which the request originates. * TLS_JA3_FINGERPRINT: JA3 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. * TLS_JA4_FINGERPRINT: JA4 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. * USER_IP: The IP address of the originating client, which is resolved based on "userIpRequestHeaders" configured with the security policy. If there is no "userIpRequestHeaders" configuration or an IP address cannot be resolved from it, the key type defaults to IP. Possible values are: `ALL`, `IP`, `HTTP_HEADER`, `XFF_IP`, `HTTP_COOKIE`, `HTTP_PATH`, `SNI`, `REGION_CODE`, `TLS_JA3_FINGERPRINT`, `TLS_JA4_FINGERPRINT`, `USER_IP`. | false | None | None |
| `enforce_on_key_name` | Rate limit key name applicable only for the following key types: HTTP_HEADER -- Name of the HTTP header whose value is taken as the key value. HTTP_COOKIE -- Name of the HTTP cookie whose value is taken as the key value. | false | None | None |

### ban_threshold Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `count` | Number of HTTP(S) requests for calculating the threshold. | false | None | None |
| `interval_sec` | Interval over which the threshold is computed. | false | None | None |

### request_headers_to_adds Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `header_name` | The name of the header to set. | false | None | None |
| `header_value` | The value to set the named header to. | false | None | None |
