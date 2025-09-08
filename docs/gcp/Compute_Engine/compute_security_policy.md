## 🛡️ Policy Deployment Engine: `compute_security_policy`

This section provides a concise policy evaluation for the `compute_security_policy` resource in GCP.

Reference: [Terraform Registry – compute_security_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_security_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | - - - | none | None | None |
| `description` |  | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `type` |  | none | None | None |
| `CLOUD_ARMOR` | They filter requests before they hit the origin servers. | none | None | None |
| `CLOUD_ARMOR_EDGE` | (including Cloud CDN-enabled) as well as backend buckets (Cloud Storage). They filter requests before the request is served from Google's cache. | none | None | None |
| `CLOUD_ARMOR_INTERNAL_SERVICE` | managed by Traffic Director in a service mesh. They filter requests before the request is served from the application. | none | None | None |

### rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `action` | * `allow`: allow access to target. * `deny()`: deny access to target, returns the HTTP response code specified (valid values are 403, 404, and 502). * `rate_based_ban`: limit client traffic to the configured threshold and ban the client if the traffic exceeds the threshold. Configure parameters for this action in [`rate_limit_options`](#nested_rate_limit_options). Requires [`rate_limit_options`](#nested_rate_limit_options) to be set. * `redirect`: redirect to a different target. This can either be an internal reCAPTCHA redirect, or an external URL-based redirect via a 302 response. Parameters for this action can be configured via [`redirect_options`](#nested_redirect_options). * `throttle`: limit client traffic to the configured threshold. Configure parameters for this action in [`rate_limit_options`](#nested_rate_limit_options). Requires [`rate_limit_options`](#nested_rate_limit_options) to be set for this. | none | None | None |
| `priority` | Rules are evaluated from highest priority (lowest numerically) to lowest priority (highest numerically) in order. | none | None | None |
| `match` | If it evaluates to true, the corresponding `action` is enforced. Structure is [documented below](#nested_match). | none | None | None |
| `preconfigured_waf_config` |  | none | None | None |
| `description` |  | none | None | None |
| `preview` | Stackdriver logs for requests that trigger a preview action are annotated as such. | none | None | None |
| `rate_limit_options` | Must be specified if the `action` is `rate_based_ban` or `throttle`. Cannot be specified for other actions. Structure is [documented below](#nested_rate_limit_options). | none | None | None |
| `redirect_options` | Can be specified if the `action` is `redirect`. Cannot be specified for other actions. Structure is [documented below](#nested_redirect_options). | none | None | None |
| `header_action` | Additional actions that are performed on headers. Structure is [documented below](#nested_header_action). | none | None | None |

### advanced_options_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `json_parsing` |  | none | None | None |
| `DISABLED` |  | none | None | None |
| `STANDARD` |  | none | None | None |
| `STANDARD_WITH_GRAPHQL` |  | none | None | None |
| `json_custom_config` | `json_parsing` is set to `STANDARD`. Structure is [documented below](#nested_json_custom_config). | none | None | None |
| `log_level` |  | none | None | None |
| `NORMAL` |  | none | None | None |
| `VERBOSE` |  | none | None | None |
| `user_ip_request_headers` |  | none | None | None |
| `request_body_inspection_size` |  | none | None | None |

### adaptive_protection_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `layer_7_ddos_defense_config` |  | none | None | None |
| `auto_deploy_config` |  | none | None | None |

### recaptcha_options_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `redirect_site_key` |  | none | None | None |

### json_custom_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `content_types` | format of the Content-Type header values is defined in [RFC 1341](https://www.ietf.org/rfc/rfc1341.txt). When configuring a custom Content-Type header value, only the type/subtype needs to be specified, and the parameters should be excluded. | none | None | None |

### match Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `config` | This field must be specified if `versioned_expr` is specified and cannot be specified if `versioned_expr` is not specified. Structure is [documented below](#nested_config). | none | None | None |
| `versioned_expr` | Available options: * `SRC_IPS_V1`: Must specify the corresponding `src_ip_ranges` field in `config`. | none | None | None |
| `expr` | such as `origin.ip`, `source.region_code` and `contents` in the request header. Structure is [documented below](#nested_expr). | none | None | None |
| `expr_options` | The configuration options available when specifying a user defined CEVAL expression (i.e., 'expr'). Structure is [documented below](#nested_expr_options). | false | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `src_ip_ranges` | to match against inbound traffic. There is a limit of 10 IP ranges per rule. A value of `*` matches all IPs (can be used to override the default behavior). | none | None | None |

### expr Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `expression` | The application context of the containing message determines which well-known feature set of CEL is supported. | none | None | None |

### expr_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `recaptcha_options` | reCAPTCHA configuration options to be applied for the rule. If the rule does not evaluate reCAPTCHA tokens, this field has no effect. Structure is [documented below](#nested_recaptcha_options). | true | None | None |

### recaptcha_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `action_token_site_keys` | A list of site keys to be used during the validation of reCAPTCHA action-tokens. The provided site keys need to be created from reCAPTCHA API under the same project where the security policy is created. | false | None | None |
| `session_token_site_keys` | A list of site keys to be used during the validation of reCAPTCHA session-tokens. The provided site keys need to be created from reCAPTCHA API under the same project where the security policy is created. | false | None | None |

### preconfigured_waf_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exclusion` |  | none | None | None |

### exclusion Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `request_header` |  | none | None | None |
| `request_cookie` |  | none | None | None |
| `request_uri` |  | none | None | None |
| `request_query_param` |  | none | None | None |
| `target_rule_set` |  | none | None | None |
| `target_rule_ids` | The `request_header`, `request_cookie`, `request_uri` and `request_query_param` blocks support: | none | None | None |
| `operator` | * `EQUALS`: The operator matches if the field value equals the specified value. * `STARTS_WITH`: The operator matches if the field value starts with the specified value. * `ENDS_WITH`: The operator matches if the field value ends with the specified value. * `CONTAINS`: The operator matches if the field value contains the specified value. * `EQUALS_ANY`: The operator matches if the field value is any value. | none | None | None |
| `value` | The field value must be given if the field `operator` is not `EQUALS_ANY`, and cannot be given if the field `operator` is `EQUALS_ANY`. | none | None | None |

### rate_limit_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `conform_action` |  | none | None | None |
| `exceed_action` | Valid options are `deny()` where valid values for status are 403, 404, 429, and 502. | none | None | None |
| `rate_limit_threshold` |  | none | None | None |
| `ban_duration_sec` | If specified, determines the time (in seconds) the traffic will continue to be banned by the rate limit after the rate falls below the threshold. | none | None | None |
| `ban_threshold` | If specified, the key will be banned for the configured `ban_duration_sec` when the number of requests that exceed the `rate_limit_threshold` also exceed this `ban_threshold`. Structure is [documented below](#nested_threshold). | none | None | None |
| `enforce_on_key` | * `ALL`: A single rate limit threshold is applied to all the requests matching this rule. * `IP`: The source IP address of the request is the key. Each IP has this limit enforced separately. * `HTTP_HEADER`: The value of the HTTP header whose name is configured under `enforce_on_key_name`. The key value is truncated to the first 128 bytes of the header value. If no such header is present in the request, the key type defaults to `ALL`. * `XFF_IP`: The first IP address (i.e. the originating client IP address) specified in the list of IPs under `X-Forwarded-For` HTTP header. If no such header is present or the value is not a valid IP, the key type defaults to `ALL`. * `HTTP_COOKIE`: The value of the HTTP cookie whose name is configured under `enforce_on_key_name`. The key value is truncated to the first 128 bytes of the cookie value. If no such cookie is present in the request, the key type defaults to `ALL`. * `HTTP_PATH`: The URL path of the HTTP request. The key value is truncated to the first 128 bytes * `SNI`: Server name indication in the TLS session of the HTTPS request. The key value is truncated to the first 128 bytes. The key type defaults to `ALL` on a HTTP session. * `REGION_CODE`: The country/region from which the request originates. * `TLS_JA3_FINGERPRINT`: JA3 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. * `TLS_JA4_FINGERPRINT`: JA4 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. * `USER_IP`: The IP address of the originating client, which is resolved based on "user_ip_request_headers" configured with the securitypolicy. If there is no "user_ip_request_headers" configuration or an IP address cannot be resolved from it, the key type defaults to IP. | none | None | None |
| `enforce_on_key_name` |  | none | None | None |
| `HTTP_HEADER` |  | none | None | None |
| `HTTP_COOKIE` |  | none | None | None |
| `enforce_on_key_configs` | **Note:** To avoid the conflict between `enforce_on_key` and `enforce_on_key_configs`, the field [`enforce_on_key`](#enforce_on_key) needs to be set to an empty string. | none | None | None |

### enforce_on_key_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enforce_on_key_name` |  | none | None | None |
| `HTTP_HEADER` |  | none | None | None |
| `HTTP_COOKIE` |  | none | None | None |
| `enforce_on_key_type` | * `ALL`: A single rate limit threshold is applied to all the requests matching this rule. * `IP`: The source IP address of the request is the key. Each IP has this limit enforced separately. * `HTTP_HEADER`: The value of the HTTP header whose name is configured on `enforce_on_key_name`. The key value is truncated to the first 128 bytes of the header value. If no such header is present in the request, the key type defaults to `ALL`. * `XFF_IP`: The first IP address (i.e. the originating client IP address) specified in the list of IPs under X-Forwarded-For HTTP header. If no such header is present or the value is not a valid IP, the key type defaults to `ALL`. * `HTTP_COOKIE`: The value of the HTTP cookie whose name is configured under `enforce_on_key_name`. The key value is truncated to the first 128 bytes of the cookie value. If no such cookie is present in the request, the key type defaults to `ALL`. * `HTTP_PATH`: The URL path of the HTTP request. The key value is truncated to the first 128 bytes * `SNI`: Server name indication in the TLS session of the HTTPS request. The key value is truncated to the first 128 bytes. The key type defaults to `ALL` on a HTTP session. * `REGION_CODE`: The country/region from which the request originates. * `TLS_JA3_FINGERPRINT`: JA3 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. * `TLS_JA4_FINGERPRINT`: JA4 TLS/SSL fingerprint if the client connects using HTTPS, HTTP/2 or HTTP/3. If not available, the key type defaults to ALL. * `USER_IP`: The IP address of the originating client, which is resolved based on "user_ip_request_headers" configured with the securitypolicy. If there is no "user_ip_request_headers" configuration or an IP address cannot be resolved from it, the key type defaults to IP. | none | None | None |
| `exceed_redirect_options` |  | none | None | None |

### {ban/rate_limit}_threshold Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `count` |  | none | None | None |
| `interval_sec` |  | none | None | None |

### exceed_redirect_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` |  | none | None | None |
| `target` |  | none | None | None |

### redirect_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | * `EXTERNAL_302`: Redirect to an external address, configured in `target`. * `GOOGLE_RECAPTCHA`: Redirect to Google reCAPTCHA. | none | None | None |
| `target` |  | none | None | None |

### header_action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `request_headers_to_adds` | <a name="nested_request_headers_to_adds"><a> The `request_headers_to_adds` block supports: | none | None | None |
| `header_name` |  | none | None | None |
| `header_value` |  | none | None | None |

### layer_7_ddos_defense_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable` |  | none | None | None |
| `rule_visibility` |  | none | None | None |
| `STANDARD` |  | none | None | None |
| `PREMIUM` |  | none | None | None |
| `threshold_configs` |  | none | None | None |

### threshold_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `auto_deploy_load_threshold` |  | none | None | None |
| `auto_deploy_confidence_threshold` |  | none | None | None |
| `auto_deploy_impacted_baseline_threshold` |  | none | None | None |
| `auto_deploy_expiration_sec` |  | none | None | None |
| `detection_load_threshold` |  | none | None | None |
| `detection_absolute_qps` |  | none | None | None |
| `detection_relative_to_baseline_qps` |  | none | None | None |
| `traffic_granularity_configs` |  | none | None | None |

### traffic_granularity_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | * `HTTP_HEADER_HOST` * `HTTP_PATH` | none | None | None |
| `value` |  | none | None | None |
| `enable_each_unique_value` |  | none | None | None |

### auto_deploy_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `load_threshold` |  | none | None | None |
| `confidence_threshold` |  | none | None | None |
| `impacted_baseline_threshold` |  | none | None | None |
| `expiration_sec` |  | none | None | None |
