## 🛡️ Policy Deployment Engine: `compute_security_policy`

This section provides a concise policy evaluation for the `compute_security_policy` resource in GCP.

Reference: [Terraform Registry – compute_security_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_security_policy)

---

## 1. Argument Reference

### `name`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule`
- Description: rule (rule with priority 2147483647 and match "\*"). If no rules are provided when creating a security policy, a default rule with action "allow" will be added. Structure is [documented below](#nested_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_options_config`
- Description: Structure is [documented below](#nested_advanced_options_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `adaptive_protection_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recaptcha_options_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `CLOUD_ARMOR`
- Description: They filter requests before they hit the origin servers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `CLOUD_ARMOR_EDGE`
- Description: (including Cloud CDN-enabled) as well as backend buckets (Cloud Storage). They filter requests before the request is served from Google's cache.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `CLOUD_ARMOR_INTERNAL_SERVICE`
- Description: managed by Traffic Director in a service mesh. They filter requests before the request is served from the application. <a name="nested_advanced_options_config"></a>The `advanced_options_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_parsing`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `DISABLED`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `STANDARD`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `STANDARD_WITH_GRAPHQL`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_custom_config`
- Description: `json_parsing` is set to `STANDARD`. Structure is [documented below](#nested_json_custom_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_level`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `NORMAL`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `VERBOSE`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_ip_request_headers`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_body_inspection_size`
- Description: <a name="nested_json_custom_config"></a>The `json_custom_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_types`
- Description: format of the Content-Type header values is defined in [RFC 1341](https://www.ietf.org/rfc/rfc1341.txt). When configuring a custom Content-Type header value, only the type/subtype needs to be specified, and the parameters should be excluded. <a name="nested_rule"></a>The `rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: Rules are evaluated from highest priority (lowest numerically) to lowest priority (highest numerically) in order.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `match`
- Description: If it evaluates to true, the corresponding `action` is enforced. Structure is [documented below](#nested_match).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preconfigured_waf_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preview`
- Description: Stackdriver logs for requests that trigger a preview action are annotated as such.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rate_limit_options`
- Description: Must be specified if the `action` is `rate_based_ban` or `throttle`. Cannot be specified for other actions. Structure is [documented below](#nested_rate_limit_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_options`
- Description: Can be specified if the `action` is `redirect`. Cannot be specified for other actions. Structure is [documented below](#nested_redirect_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_action`
- Description: Additional actions that are performed on headers. Structure is [documented below](#nested_header_action). <a name="nested_match"></a>The `match` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: This field must be specified if `versioned_expr` is specified and cannot be specified if `versioned_expr` is not specified. Structure is [documented below](#nested_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `versioned_expr`
- Description: Available options:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expr`
- Description: such as `origin.ip`, `source.region_code` and `contents` in the request header. Structure is [documented below](#nested_expr).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expr_options`
- Description: (Optional) The configuration options available when specifying a user defined CEVAL expression (i.e., 'expr'). Structure is [documented below](#nested_expr_options). <a name="nested_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `src_ip_ranges`
- Description: to match against inbound traffic. There is a limit of 10 IP ranges per rule. A value of `*` matches all IPs (can be used to override the default behavior). <a name="nested_expr"></a>The `expr` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expression`
- Description: The application context of the containing message determines which well-known feature set of CEL is supported. <a name="nested_expr_options"></a>The `expr_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recaptcha_options`
- Description: (Required) reCAPTCHA configuration options to be applied for the rule. If the rule does not evaluate reCAPTCHA tokens, this field has no effect. Structure is [documented below](#nested_recaptcha_options). <a name="nested_recaptcha_options"></a>The `recaptcha_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action_token_site_keys`
- Description: (Optional) A list of site keys to be used during the validation of reCAPTCHA action-tokens. The provided site keys need to be created from reCAPTCHA API under the same project where the security policy is created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_token_site_keys`
- Description: (Optional) A list of site keys to be used during the validation of reCAPTCHA session-tokens. The provided site keys need to be created from reCAPTCHA API under the same project where the security policy is created. <a name="nested_preconfigured_waf_config"></a>The `preconfigured_waf_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusion`
- Description: <a name="nested_exclusion"></a>The `exclusion` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_header`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_cookie`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_uri`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_query_param`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_rule_set`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_rule_ids`
- Description: <a name="nested_field_params"></a>The `request_header`, `request_cookie`, `request_uri` and `request_query_param` blocks support:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operator`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: The field value must be given if the field `operator` is not `EQUALS_ANY`, and cannot be given if the field `operator` is `EQUALS_ANY`. <a name="nested_rate_limit_options"></a>The `rate_limit_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conform_action`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exceed_action`
- Description: Valid options are `deny()` where valid values for status are 403, 404, 429, and 502.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rate_limit_threshold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ban_duration_sec`
- Description: If specified, determines the time (in seconds) the traffic will continue to be banned by the rate limit after the rate falls below the threshold.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ban_threshold`
- Description: If specified, the key will be banned for the configured `ban_duration_sec` when the number of requests that exceed the `rate_limit_threshold` also exceed this `ban_threshold`. Structure is [documented below](#nested_threshold).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce_on_key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce_on_key_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `HTTP_HEADER`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `HTTP_COOKIE`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce_on_key_configs`
- Description: **Note:** To avoid the conflict between `enforce_on_key` and `enforce_on_key_configs`, the field [`enforce_on_key`](#enforce_on_key) needs to be set to an empty string. <a name="nested_enforce_on_key_configs"></a>The `enforce_on_key_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce_on_key_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `HTTP_HEADER`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `HTTP_COOKIE`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforce_on_key_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exceed_redirect_options`
- Description: <a name="nested_threshold"></a>The `{ban/rate_limit}_threshold` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `count`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interval_sec`
- Description: <a  name="nested_exceed_redirect_options"></a>The `exceed_redirect_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: <a name="nested_redirect_options"></a>The `redirect_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: <a name="nested_header_action"></a> The `header_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers_to_adds`
- Description: <a name="nested_request_headers_to_adds"><a> The `request_headers_to_adds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_value`
- Description: <a name="nested_adaptive_protection_config"></a>The `adaptive_protection_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `layer_7_ddos_defense_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_deploy_config`
- Description: <a name="nested_layer_7_ddos_defense_config"></a>The `layer_7_ddos_defense_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule_visibility`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `STANDARD`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `PREMIUM`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threshold_configs`
- Description: <a name="nested_threshold_configs"></a>The `threshold_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_deploy_load_threshold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_deploy_confidence_threshold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_deploy_impacted_baseline_threshold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_deploy_expiration_sec`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `detection_load_threshold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `detection_absolute_qps`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `detection_relative_to_baseline_qps`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `traffic_granularity_configs`
- Description: <a name="nested_traffic_granularity_configs"></a>The `traffic_granularity_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_each_unique_value`
- Description: <a name="nested_auto_deploy_config"></a>The `auto_deploy_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_threshold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidence_threshold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `impacted_baseline_threshold`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration_sec`
- Description: <a name="nested_recaptcha_options_config"></a>The `recaptcha_options_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_site_key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
