## 🛡️ Policy Deployment Engine: `monitoring_uptime_check_config`

This section provides a concise policy evaluation for the `monitoring_uptime_check_config` resource in GCP.

Reference: [Terraform Registry – monitoring_uptime_check_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_uptime_check_config)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) A human-friendly name for the uptime check configuration. The display name should be unique within a Stackdriver Workspace in order to make it easier to identify; however, uniqueness is not enforced.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Required) The maximum amount of time to wait for the request to complete (must be between 1 and 60 seconds). [See the accepted formats]( https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.Duration)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `period`
- Description: (Optional) How often, in seconds, the uptime check is performed. Currently, the only supported values are 60s (1 minute), 300s (5 minutes), 600s (10 minutes), and 900s (15 minutes). Optional, defaults to 300s.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_matchers`
- Description: (Optional) The expected content on the page the check is run against. Currently, only the first entry in the list is supported, and other entries will be ignored. The server will look for an exact match of the string in the page response's content. This field is optional and should only be specified if a content match is required. Structure is [documented below](#nested_content_matchers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selected_regions`
- Description: (Optional) The list of regions from which the check will be run. Some regions contain one location, and others contain more than one. If this field is specified, enough regions to include a minimum of 3 locations must be provided, or an error message is returned. Not specifying this field will result in uptime checks running from all regions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_check_failures`
- Description: (Optional) Specifies whether to log the results of failed probes to Cloud Logging.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `checker_type`
- Description: (Optional) The checker type to use for the check. If the monitored resource type is `servicedirectory_service`, `checker_type` must be set to `VPC_CHECKERS`. Possible values are: `STATIC_IP_CHECKERS`, `VPC_CHECKERS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_labels`
- Description: (Optional) User-supplied key/value data to be used for organizing and identifying the `UptimeCheckConfig` objects. The field can contain up to 64 entries. Each key and value is limited to 63 Unicode characters or 128 bytes, whichever is smaller. Labels and values can contain only lowercase letters, numerals, underscores, and dashes. Keys must begin with a letter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_check`
- Description: (Optional) Contains information needed to make an HTTP or HTTPS check. Structure is [documented below](#nested_http_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tcp_check`
- Description: (Optional) Contains information needed to make a TCP check. Structure is [documented below](#nested_tcp_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_group`
- Description: (Optional) The group resource associated with the configuration. Structure is [documented below](#nested_resource_group).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitored_resource`
- Description: (Optional) The [monitored resource] (https://cloud.google.com/monitoring/api/resources) associated with the configuration. The following monitored resource types are supported for uptime checks:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `synthetic_monitor`
- Description: (Optional) A Synthetic Monitor deployed to a Cloud Functions V2 instance. Structure is [documented below](#nested_synthetic_monitor).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_content_matchers"></a>The `content_matchers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content`
- Description: (Required) String or regex content to match (max 1024 bytes)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matcher`
- Description: (Optional) The type of content matcher that will be applied to the server output, compared to the content string when the check is run. Default value is `CONTAINS_STRING`. Possible values are: `CONTAINS_STRING`, `NOT_CONTAINS_STRING`, `MATCHES_REGEX`, `NOT_MATCHES_REGEX`, `MATCHES_JSON_PATH`, `NOT_MATCHES_JSON_PATH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_path_matcher`
- Description: (Optional) Information needed to perform a JSONPath content match. Used for `ContentMatcherOption::MATCHES_JSON_PATH` and `ContentMatcherOption::NOT_MATCHES_JSON_PATH`. Structure is [documented below](#nested_content_matchers_content_matchers_json_path_matcher). <a name="nested_content_matchers_content_matchers_json_path_matcher"></a>The `json_path_matcher` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_path`
- Description: (Required) JSONPath within the response output pointing to the expected `ContentMatcher::content` to match against.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `json_matcher`
- Description: (Optional) Options to perform JSONPath content matching. Default value is `EXACT_MATCH`. Possible values are: `EXACT_MATCH`, `REGEX_MATCH`. <a name="nested_http_check"></a>The `http_check` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_method`
- Description: (Optional) The HTTP request method to use for the check. If set to `METHOD_UNSPECIFIED` then `request_method` defaults to `GET`. Default value is `GET`. Possible values are: `METHOD_UNSPECIFIED`, `GET`, `POST`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_type`
- Description: (Optional) The content type to use for the check. Possible values are: `TYPE_UNSPECIFIED`, `URL_ENCODED`, `USER_PROVIDED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_content_type`
- Description: (Optional) A user provided content type header to use for the check. The invalid configurations outlined in the `content_type` field apply to custom_content_type`, as well as the following 1. `content_type` is `URL_ENCODED` and `custom_content_type` is set. 2. `content_type` is `USER_PROVIDED` and `custom_content_type` is not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_info`
- Description: (Optional) The authentication information using username and password. Optional when creating an HTTP check; defaults to empty. Do not use with other authentication fields. Structure is [documented below](#nested_http_check_auth_info).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_agent_authentication`
- Description: (Optional) The authentication information using the Monitoring Service Agent. Optional when creating an HTTPS check; defaults to empty. Do not use with other authentication fields. Structure is [documented below](#nested_http_check_service_agent_authentication).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The port to the page to run the check against. Will be combined with `host` (specified within the [`monitored_resource`](#nested_monitored_resource)) and path to construct the full URL. Optional (defaults to 80 without SSL, or 443 with SSL).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Optional) The list of headers to send as part of the uptime check request. If two headers have the same key and different values, they should be entered as a single header, with the value being a comma-separated list of all the desired values as described in [RFC 2616 (page 31)](https://www.w3.org/Protocols/rfc2616/rfc2616.txt). Entering two separate headers with the same key in a Create call will cause the first to be overwritten by the second. The maximum number of headers allowed is 100.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) The path to the page to run the check against. Will be combined with the host (specified within the MonitoredResource) and port to construct the full URL. If the provided path does not begin with `/`, a `/` will be prepended automatically. Optional (defaults to `/`).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_ssl`
- Description: (Optional) If true, use HTTPS instead of HTTP to run the check.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validate_ssl`
- Description: (Optional) Boolean specifying whether to include SSL certificate validation as a part of the Uptime check. Only applies to checks where `monitored_resource` is set to `uptime_url`. If `use_ssl` is `false`, setting `validate_ssl` to `true` has no effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mask_headers`
- Description: (Optional) Boolean specifying whether to encrypt the header information. Encryption should be specified for any headers related to authentication that you do not wish to be seen when retrieving the configuration. The server will be responsible for encrypting the headers. On Get/List calls, if `mask_headers` is set to `true` then the headers will be obscured with `******`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `body`
- Description: (Optional) The request body associated with the HTTP POST request. If `content_type` is `URL_ENCODED`, the body passed in must be URL-encoded. Users can provide a `Content-Length` header via the `headers` field or the API will do so. If the `request_method` is `GET` and `body` is not empty, the API will return an error. The maximum byte size is 1 megabyte. Note - As with all bytes fields JSON representations are base64 encoded. e.g. `foo=bar` in URL-encoded form is `foo%3Dbar` and in base64 encoding is `Zm9vJTI1M0RiYXI=`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accepted_response_status_codes`
- Description: (Optional) If present, the check will only pass if the HTTP response status code is in this set of status codes. If empty, the HTTP status code will only pass if the HTTP status code is 200-299. Structure is [documented below](#nested_http_check_accepted_response_status_codes).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ping_config`
- Description: (Optional) Contains information needed to add pings to an HTTP check. Structure is [documented below](#nested_http_check_ping_config). <a name="nested_http_check_service_agent_authentication"></a>The `service_agent_authentication` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of authentication to use. Possible values are: `SERVICE_AGENT_AUTHENTICATION_TYPE_UNSPECIFIED`, `OIDC_TOKEN`. <a name="nested_http_check_accepted_response_status_codes"></a>The `accepted_response_status_codes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status_value`
- Description: (Optional) A status code to accept.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status_class`
- Description: (Optional) A class of status codes to accept. Possible values are: `STATUS_CLASS_1XX`, `STATUS_CLASS_2XX`, `STATUS_CLASS_3XX`, `STATUS_CLASS_4XX`, `STATUS_CLASS_5XX`, `STATUS_CLASS_ANY`. <a name="nested_http_check_ping_config"></a>The `ping_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pings_count`
- Description: (Required) Number of ICMP pings. A maximum of 3 ICMP pings is currently supported. <a name="nested_tcp_check"></a>The `tcp_check` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Required) The port to the page to run the check against. Will be combined with host (specified within the `monitored_resource`) to construct the full URL.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ping_config`
- Description: (Optional) Contains information needed to add pings to a TCP check. Structure is [documented below](#nested_tcp_check_ping_config). <a name="nested_tcp_check_ping_config"></a>The `ping_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pings_count`
- Description: (Required) Number of ICMP pings. A maximum of 3 ICMP pings is currently supported. <a name="nested_resource_group"></a>The `resource_group` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_type`
- Description: (Optional) The resource type of the group members. Possible values are: `RESOURCE_TYPE_UNSPECIFIED`, `INSTANCE`, `AWS_ELB_LOAD_BALANCER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_id`
- Description: (Optional) The group of resources being monitored. Should be the `name` of a group <a name="nested_monitored_resource"></a>The `monitored_resource` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The monitored resource type. This field must match the type field of a [`MonitoredResourceDescriptor`](https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.monitoredResourceDescriptors#MonitoredResourceDescriptor) object. For example, the type of a Compute Engine VM instance is `gce_instance`. For a list of types, see [Monitoring resource types](https://cloud.google.com/monitoring/api/resources) and [Logging resource types](https://cloud.google.com/logging/docs/api/v2/resource-list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Required) Values for all of the labels listed in the associated monitored resource descriptor. For example, Compute Engine VM instances use the labels `project_id`, `instance_id`, and `zone`. <a name="nested_synthetic_monitor"></a>The `synthetic_monitor` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_function_v2`
- Description: (Required) Target a Synthetic Monitor GCFv2 Instance Structure is [documented below](#nested_synthetic_monitor_cloud_function_v2). <a name="nested_synthetic_monitor_cloud_function_v2"></a>The `cloud_function_v2` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The fully qualified name of the cloud function resource. ## Ephemeral Attributes Reference The following write-only attributes are supported:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
