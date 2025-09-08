## 🛡️ Policy Deployment Engine: `monitoring_uptime_check_config`

This section provides a concise policy evaluation for the `monitoring_uptime_check_config` resource in GCP.

Reference: [Terraform Registry – monitoring_uptime_check_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_uptime_check_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | A human-friendly name for the uptime check configuration. The display name should be unique within a Stackdriver Workspace in order to make it easier to identify; however, uniqueness is not enforced. | true | None | None |
| `timeout` | The maximum amount of time to wait for the request to complete (must be between 1 and 60 seconds). [See the accepted formats]( https://developers.google.com/protocol-buffers/docs/reference/google.protobuf#google.protobuf.Duration) | true | None | None |
| `period` | How often, in seconds, the uptime check is performed. Currently, the only supported values are 60s (1 minute), 300s (5 minutes), 600s (10 minutes), and 900s (15 minutes). Optional, defaults to 300s. | false | None | None |
| `selected_regions` | The list of regions from which the check will be run. Some regions contain one location, and others contain more than one. If this field is specified, enough regions to include a minimum of 3 locations must be provided, or an error message is returned. Not specifying this field will result in uptime checks running from all regions. | false | None | None |
| `log_check_failures` | Specifies whether to log the results of failed probes to Cloud Logging. | false | None | None |
| `checker_type` | The checker type to use for the check. If the monitored resource type is `servicedirectory_service`, `checker_type` must be set to `VPC_CHECKERS`. Possible values are: `STATIC_IP_CHECKERS`, `VPC_CHECKERS`. | false | None | None |
| `user_labels` | User-supplied key/value data to be used for organizing and identifying the `UptimeCheckConfig` objects. The field can contain up to 64 entries. Each key and value is limited to 63 Unicode characters or 128 bytes, whichever is smaller. Labels and values can contain only lowercase letters, numerals, underscores, and dashes. Keys must begin with a letter. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### content_matchers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `content` | String or regex content to match (max 1024 bytes) | true | None | None |
| `matcher` | The type of content matcher that will be applied to the server output, compared to the content string when the check is run. Default value is `CONTAINS_STRING`. Possible values are: `CONTAINS_STRING`, `NOT_CONTAINS_STRING`, `MATCHES_REGEX`, `NOT_MATCHES_REGEX`, `MATCHES_JSON_PATH`, `NOT_MATCHES_JSON_PATH`. | false | None | None |
| `json_path_matcher` | Information needed to perform a JSONPath content match. Used for `ContentMatcherOption::MATCHES_JSON_PATH` and `ContentMatcherOption::NOT_MATCHES_JSON_PATH`. Structure is [documented below](#nested_content_matchers_content_matchers_json_path_matcher). | false | None | None |

### http_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `request_method` | The HTTP request method to use for the check. If set to `METHOD_UNSPECIFIED` then `request_method` defaults to `GET`. Default value is `GET`. Possible values are: `METHOD_UNSPECIFIED`, `GET`, `POST`. | false | None | None |
| `content_type` | The content type to use for the check. Possible values are: `TYPE_UNSPECIFIED`, `URL_ENCODED`, `USER_PROVIDED`. | false | None | None |
| `custom_content_type` | A user provided content type header to use for the check. The invalid configurations outlined in the `content_type` field apply to custom_content_type`, as well as the following 1. `content_type` is `URL_ENCODED` and `custom_content_type` is set. 2. `content_type` is `USER_PROVIDED` and `custom_content_type` is not set. | false | None | None |
| `auth_info` | The authentication information using username and password. Optional when creating an HTTP check; defaults to empty. Do not use with other authentication fields. Structure is [documented below](#nested_http_check_auth_info). | false | None | None |
| `service_agent_authentication` | The authentication information using the Monitoring Service Agent. Optional when creating an HTTPS check; defaults to empty. Do not use with other authentication fields. Structure is [documented below](#nested_http_check_service_agent_authentication). | false | None | None |
| `port` | The port to the page to run the check against. Will be combined with `host` (specified within the [`monitored_resource`](#nested_monitored_resource)) and path to construct the full URL. Optional (defaults to 80 without SSL, or 443 with SSL). | false | None | None |
| `headers` | The list of headers to send as part of the uptime check request. If two headers have the same key and different values, they should be entered as a single header, with the value being a comma-separated list of all the desired values as described in [RFC 2616 (page 31)](https://www.w3.org/Protocols/rfc2616/rfc2616.txt). Entering two separate headers with the same key in a Create call will cause the first to be overwritten by the second. The maximum number of headers allowed is 100. | false | None | None |
| `path` | The path to the page to run the check against. Will be combined with the host (specified within the MonitoredResource) and port to construct the full URL. If the provided path does not begin with `/`, a `/` will be prepended automatically. Optional (defaults to `/`). | false | None | None |
| `use_ssl` | If true, use HTTPS instead of HTTP to run the check. | false | None | None |
| `validate_ssl` | Boolean specifying whether to include SSL certificate validation as a part of the Uptime check. Only applies to checks where `monitored_resource` is set to `uptime_url`. If `use_ssl` is `false`, setting `validate_ssl` to `true` has no effect. | false | None | None |
| `mask_headers` | Boolean specifying whether to encrypt the header information. Encryption should be specified for any headers related to authentication that you do not wish to be seen when retrieving the configuration. The server will be responsible for encrypting the headers. On Get/List calls, if `mask_headers` is set to `true` then the headers will be obscured with `******`. | false | None | None |
| `body` | The request body associated with the HTTP POST request. If `content_type` is `URL_ENCODED`, the body passed in must be URL-encoded. Users can provide a `Content-Length` header via the `headers` field or the API will do so. If the `request_method` is `GET` and `body` is not empty, the API will return an error. The maximum byte size is 1 megabyte. Note - As with all bytes fields JSON representations are base64 encoded. e.g. `foo=bar` in URL-encoded form is `foo%3Dbar` and in base64 encoding is `Zm9vJTI1M0RiYXI=`. | false | None | None |
| `accepted_response_status_codes` | If present, the check will only pass if the HTTP response status code is in this set of status codes. If empty, the HTTP status code will only pass if the HTTP status code is 200-299. Structure is [documented below](#nested_http_check_accepted_response_status_codes). | false | None | None |
| `ping_config` | Contains information needed to add pings to an HTTP check. Structure is [documented below](#nested_http_check_ping_config). | false | None | None |

### tcp_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | The port to the page to run the check against. Will be combined with host (specified within the `monitored_resource`) to construct the full URL. | true | None | None |
| `ping_config` | Contains information needed to add pings to a TCP check. Structure is [documented below](#nested_tcp_check_ping_config). | false | None | None |

### resource_group Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_type` | The resource type of the group members. Possible values are: `RESOURCE_TYPE_UNSPECIFIED`, `INSTANCE`, `AWS_ELB_LOAD_BALANCER`. | false | None | None |
| `group_id` | The group of resources being monitored. Should be the `name` of a group | false | None | None |

### monitored_resource Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The monitored resource type. This field must match the type field of a [`MonitoredResourceDescriptor`](https://cloud.google.com/monitoring/api/ref_v3/rest/v3/projects.monitoredResourceDescriptors#MonitoredResourceDescriptor) object. For example, the type of a Compute Engine VM instance is `gce_instance`. For a list of types, see [Monitoring resource types](https://cloud.google.com/monitoring/api/resources) and [Logging resource types](https://cloud.google.com/logging/docs/api/v2/resource-list). | true | None | None |
| `labels` | Values for all of the labels listed in the associated monitored resource descriptor. For example, Compute Engine VM instances use the labels `project_id`, `instance_id`, and `zone`. | true | None | None |

### synthetic_monitor Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_function_v2` | Target a Synthetic Monitor GCFv2 Instance Structure is [documented below](#nested_synthetic_monitor_cloud_function_v2). | true | None | None |

### json_path_matcher Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `json_path` | JSONPath within the response output pointing to the expected `ContentMatcher::content` to match against. | true | None | None |
| `json_matcher` | Options to perform JSONPath content matching. Default value is `EXACT_MATCH`. Possible values are: `EXACT_MATCH`, `REGEX_MATCH`. | false | None | None |

### service_agent_authentication Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of authentication to use. Possible values are: `SERVICE_AGENT_AUTHENTICATION_TYPE_UNSPECIFIED`, `OIDC_TOKEN`. | false | None | None |

### accepted_response_status_codes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `status_value` | A status code to accept. | false | None | None |
| `status_class` | A class of status codes to accept. Possible values are: `STATUS_CLASS_1XX`, `STATUS_CLASS_2XX`, `STATUS_CLASS_3XX`, `STATUS_CLASS_4XX`, `STATUS_CLASS_5XX`, `STATUS_CLASS_ANY`. | false | None | None |

### ping_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pings_count` | Number of ICMP pings. A maximum of 3 ICMP pings is currently supported. | true | None | None |

### cloud_function_v2 Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The fully qualified name of the cloud function resource. ## Ephemeral Attributes Reference The following write-only attributes are supported: | true | None | None |
