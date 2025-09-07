## 🛡️ Policy Deployment Engine: `cloud_tasks_queue`

This section provides a concise policy evaluation for the `cloud_tasks_queue` resource in GCP.

Reference: [Terraform Registry – cloud_tasks_queue](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_tasks_queue)

---

## 1. Argument Reference

### `location`
- Description: (Required) The location of the queue
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The queue name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_engine_routing_override`
- Description: (Optional) Overrides for task-level appEngineRouting. These settings apply only to App Engine tasks in this queue Structure is [documented below](#nested_app_engine_routing_override).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rate_limits`
- Description: (Optional) Rate limits for task dispatches. The queue's actual dispatch rate is the result of: * Number of tasks in the queue * User-specified throttling: rateLimits, retryConfig, and the queue's state. * System throttling due to 429 (Too Many Requests) or 503 (Service Unavailable) responses from the worker, high error rates, or to smooth sudden large traffic spikes. Structure is [documented below](#nested_rate_limits).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_config`
- Description: (Optional) Settings that determine the retry behavior. Structure is [documented below](#nested_retry_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stackdriver_logging_config`
- Description: (Optional) Configuration options for writing logs to Stackdriver Logging. Structure is [documented below](#nested_stackdriver_logging_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_target`
- Description: (Optional) Modifies HTTP target for HTTP tasks. Structure is [documented below](#nested_http_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_app_engine_routing_override"></a>The `app_engine_routing_override` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) App service. By default, the task is sent to the service which is the default service when the task is attempted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) App version. By default, the task is sent to the version which is the default version when the task is attempted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) App instance. By default, the task is sent to an instance which is available when the task is attempted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Output) The host that the task is sent to. <a name="nested_rate_limits"></a>The `rate_limits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_dispatches_per_second`
- Description: (Optional) The maximum rate at which tasks are dispatched from this queue. If unspecified when the queue is created, Cloud Tasks will pick the default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_dispatches`
- Description: (Optional) The maximum number of concurrent tasks that Cloud Tasks allows to be dispatched for this queue. After this threshold has been reached, Cloud Tasks stops dispatching tasks until the number of concurrent requests decreases.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_burst_size`
- Description: (Output) The max burst size. Max burst size limits how fast tasks in queue are processed when many tasks are in the queue and the rate is high. This field allows the queue to have a high rate so processing starts shortly after a task is enqueued, but still limits resource usage when many tasks are enqueued in a short period of time. <a name="nested_retry_config"></a>The `retry_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_attempts`
- Description: (Optional) Number of attempts per task. Cloud Tasks will attempt the task maxAttempts times (that is, if the first attempt fails, then there will be maxAttempts - 1 retries). Must be >= -1. If unspecified when the queue is created, Cloud Tasks will pick the default. -1 indicates unlimited attempts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_retry_duration`
- Description: (Optional) If positive, maxRetryDuration specifies the time limit for retrying a failed task, measured from when the task was first attempted. Once maxRetryDuration time has passed and the task has been attempted maxAttempts times, no further attempts will be made and the task will be deleted. If zero, then the task age is unlimited.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_backoff`
- Description: (Optional) A task will be scheduled for retry between minBackoff and maxBackoff duration after it fails, if the queue's RetryConfig specifies that the task should be retried.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_backoff`
- Description: (Optional) A task will be scheduled for retry between minBackoff and maxBackoff duration after it fails, if the queue's RetryConfig specifies that the task should be retried.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_doublings`
- Description: (Optional) The time between retries will double maxDoublings times. A task's retry interval starts at minBackoff, then doubles maxDoublings times, then increases linearly, and finally retries retries at intervals of maxBackoff up to maxAttempts times. <a name="nested_stackdriver_logging_config"></a>The `stackdriver_logging_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sampling_ratio`
- Description: (Required) Specifies the fraction of operations to write to Stackdriver Logging. This field may contain any value between 0.0 and 1.0, inclusive. 0.0 is the default and means that no operations are logged. <a name="nested_http_target"></a>The `http_target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_method`
- Description: (Optional) The HTTP method to use for the request. When specified, it overrides HttpRequest for the task. Note that if the value is set to GET the body of the task will be ignored at execution time. Possible values are: `HTTP_METHOD_UNSPECIFIED`, `POST`, `GET`, `HEAD`, `PUT`, `DELETE`, `PATCH`, `OPTIONS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri_override`
- Description: (Optional) URI override. When specified, overrides the execution URI for all the tasks in the queue. Structure is [documented below](#nested_http_target_uri_override).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header_overrides`
- Description: (Optional) HTTP target headers. This map contains the header field names and values. Headers will be set when running the CreateTask and/or BufferTask. These headers represent a subset of the headers that will be configured for the task's HTTP request. Some HTTP request headers will be ignored or replaced. Headers which can have multiple values (according to RFC2616) can be specified using comma-separated values. The size of the headers must be less than 80KB. Queue-level headers to override headers of all the tasks in the queue. Structure is [documented below](#nested_http_target_header_overrides).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_token`
- Description: (Optional) If specified, an OAuth token is generated and attached as the Authorization header in the HTTP request. This type of authorization should generally be used only when calling Google APIs hosted on *.googleapis.com. Note that both the service account email and the scope MUST be specified when using the queue-level authorization override. Structure is [documented below](#nested_http_target_oauth_token).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oidc_token`
- Description: (Optional) If specified, an OIDC token is generated and attached as an Authorization header in the HTTP request. This type of authorization can be used for many scenarios, including calling Cloud Run, or endpoints where you intend to validate the token yourself. Note that both the service account email and the audience MUST be specified when using the queue-level authorization override. Structure is [documented below](#nested_http_target_oidc_token). <a name="nested_http_target_uri_override"></a>The `uri_override` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheme`
- Description: (Optional) Scheme override. When specified, the task URI scheme is replaced by the provided value (HTTP or HTTPS). Possible values are: `HTTP`, `HTTPS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) Host override. When specified, replaces the host part of the task URL. For example, if the task URL is "https://www.google.com", and host value is set to "example.net", the overridden URI will be changed to "https://example.net". Host value cannot be an empty string (INVALID_ARGUMENT).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) Port override. When specified, replaces the port part of the task URI. For instance, for a URI http://www.google.com/foo and port=123, the overridden URI becomes http://www.google.com:123/foo. Note that the port value must be a positive integer. Setting the port to 0 (Zero) clears the URI port.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path_override`
- Description: (Optional) URI path. When specified, replaces the existing path of the task URL. Setting the path value to an empty string clears the URI path segment. Structure is [documented below](#nested_http_target_uri_override_path_override).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_override`
- Description: (Optional) URI query. When specified, replaces the query part of the task URI. Setting the query value to an empty string clears the URI query segment. Structure is [documented below](#nested_http_target_uri_override_query_override).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri_override_enforce_mode`
- Description: (Optional) URI Override Enforce Mode When specified, determines the Target UriOverride mode. If not specified, it defaults to ALWAYS. Possible values are: `ALWAYS`, `IF_NOT_EXISTS`. <a name="nested_http_target_uri_override_path_override"></a>The `path_override` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) The URI path (e.g., /users/1234). Default is an empty string. <a name="nested_http_target_uri_override_query_override"></a>The `query_override` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `query_params`
- Description: (Optional) The query parameters (e.g., qparam1=123&qparam2=456). Default is an empty string. <a name="nested_http_target_header_overrides"></a>The `header_overrides` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `header`
- Description: (Required) Header embodying a key and a value. Structure is [documented below](#nested_http_target_header_overrides_header_overrides_header). <a name="nested_http_target_header_overrides_header_overrides_header"></a>The `header` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) The Key of the header.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) The Value of the header. <a name="nested_http_target_oauth_token"></a>The `oauth_token` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Required) Service account email to be used for generating OAuth token. The service account must be within the same project as the queue. The caller must have iam.serviceAccounts.actAs permission for the service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) OAuth scope to be used for generating OAuth access token. If not specified, "https://www.googleapis.com/auth/cloud-platform" will be used. <a name="nested_http_target_oidc_token"></a>The `oidc_token` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Required) Service account email to be used for generating OIDC token. The service account must be within the same project as the queue. The caller must have iam.serviceAccounts.actAs permission for the service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audience`
- Description: (Optional) Audience to be used when generating OIDC token. If not specified, the URI specified in target will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
