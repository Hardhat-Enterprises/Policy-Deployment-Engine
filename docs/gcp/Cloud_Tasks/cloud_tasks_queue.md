## 🛡️ Policy Deployment Engine: `cloud_tasks_queue`

This section provides a concise policy evaluation for the `cloud_tasks_queue` resource in GCP.

Reference: [Terraform Registry – cloud_tasks_queue](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_tasks_queue)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | The location of the queue | true | false | Location mainly defines where the queue is created and does not directly control access, authentication, encryption, or logging. | us-central1 | None |
| `name` | The queue name. | false | false | The queue name is used to identify the resource and does not directly affect the security posture. | secure-cloud-tasks-queue | None |
| `app_engine_routing_override` | Overrides for task-level appEngineRouting. These settings apply only to App Engine tasks in this queue Structure is [documented below](#nested_app_engine_routing_override). | false | false | None | None | None |
| `rate_limits` | Rate limits for task dispatches. The queue's actual dispatch rate is the result of: * Number of tasks in the queue * User-specified throttling: rateLimits, retryConfig, and the queue's state. * System throttling due to 429 (Too Many Requests) or 503 (Service Unavailable) responses from the worker, high error rates, or to smooth sudden large traffic spikes. Structure is [documented below](#nested_rate_limits). | false | true | Rate limits help prevent uncontrolled task dispatch, backend overload, and denial-of-service style resource exhaustion | rate_limits configured with controlled dispatch and concurrency values | rate_limits omitted or configured with excessive values |
| `retry_config` | Settings that determine the retry behavior. Structure is [documented below](#nested_retry_config). | false | true | Retry settings affect availability and resource usage. Poor retry configuration can cause retry storms or prolonged failed task execution. | retry_config configured with limited attempts and safe backoff values | retry_config configured with unlimited retries or very small backoff |
| `stackdriver_logging_config` | Configuration options for writing logs to Stackdriver Logging. Structure is [documented below](#nested_stackdriver_logging_config). | false | true | Logging is important for monitoring, auditing, incident investigation, and detecting abnormal task behaviour. | stackdriver_logging_config configured with sampling_ratio greater than 0 | stackdriver_logging_config omitted or sampling_ratio set to 0 |
| `http_target` | Modifies HTTP target for HTTP tasks. Structure is [documented below](#nested_http_target). | false | true | HTTP target controls how tasks call external endpoints. Insecure methods, HTTP transport, or missing authentication can expose data or allow unauthorised access. | http_target uses HTTPS and OIDC or OAuth authentication. | http_target uses HTTP, GET, or no authentication |
| `project` | If it is not provided, the provider project is used. | false | false | Project identifies where the resource belongs. It is required for correct deployment but is not itself a direct security control.  | pde-project-vindya | None |
| `uri_override` | URI override. When specified, overrides the execution URI for all tasks in the queue. Structure is documented below. | false | true | URI override controls the endpoint used by tasks. Incorrect URI settings may redirect tasks to insecure or unintended endpoints. | HTTPS URI override pointing to a trusted host. | HTTP URI override or untrusted host. |
| `path_override` | URI path override. When specified, replaces the existing path of the task URL. | false | false | Path override mainly controls request routing and does not directly enforce security. | /tasks/process | None |
| `query_override` | URI query override. When specified, replaces the query part of the task URI. | false | true | Sensitive values in URL query strings may be exposed in logs, browser history, or monitoring systems. | Only non-sensitive query parameters are configured. | Secrets or passwords are included in query parameters. |
| `header_overrides` | HTTP target headers override configuration. | false | true | HTTP headers may contain authentication tokens, cookies, or sensitive metadata. Misconfigured headers may expose secrets. | Only non-sensitive application headers are configured. | Sensitive authentication headers or hardcoded secrets are configured. |
| `header` | HTTP header configuration. | false | true | Headers may contain sensitive authentication or session information. | Only non-sensitive headers are configured. | Sensitive headers containing secrets or tokens are configured. |
| `oauth_token` | OAuth token configuration used for authentication to Google APIs. | false | true | OAuth tokens provide authorization to Google APIs. Incorrect scopes or overprivileged service accounts may violate least privilege principles. | OAuth token configured with limited scope and valid service account. | OAuth token configured with excessive scope or privileged service account. |
| `oidc_token` | OIDC token configuration used for identity-based authentication. | false | true | OIDC tokens provide identity-based authentication for HTTP targets. Missing or incorrect configuration may allow unauthorised access. | OIDC token configured with valid service account and audience. | OIDC token omitted or configured with invalid audience. |

### app_engine_routing_override Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | App service. By default, the task is sent to the service which is the default service when the task is attempted. | false | false | None | None | None |
| `version` | App version. By default, the task is sent to the version which is the default version when the task is attempted. | false | false | None | None | None |
| `instance` | App instance. By default, the task is sent to an instance which is available when the task is attempted. | false | false | None | None | None |
| `host` | (Output) The host that the task is sent to. | false | false | None | None | None |

### rate_limits Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `max_dispatches_per_second` | The maximum rate at which tasks are dispatched from this queue. If unspecified when the queue is created, Cloud Tasks will pick the default. | false | true | A very high dispatch rate can overload downstream services and increase denial-of-service risk | 50 | 1000 |
| `max_concurrent_dispatches` | The maximum number of concurrent tasks that Cloud Tasks allows to be dispatched for this queue. After this threshold has been reached, Cloud Tasks stops dispatching tasks until the number of concurrent requests decreases. | false | true | Too many concurrent dispatches can exhaust backend resources and cause service instability. | 5 | 100 |
| `max_burst_size` | (Output) The max burst size. Max burst size limits how fast tasks in queue are processed when many tasks are in the queue and the rate is high. This field allows the queue to have a high rate so processing starts shortly after a task is enqueued, but still limits resource usage when many tasks are enqueued in a short period of time. | false | false | This is an output-only attribute and is not directly configured by the user. | None | None |

### retry_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `max_attempts` | Number of attempts per task. Cloud Tasks will attempt the task maxAttempts times (that is, if the first attempt fails, then there will be maxAttempts - 1 retries). Must be >= -1. If unspecified when the queue is created, Cloud Tasks will pick the default. -1 indicates unlimited attempts. | false | true | Setting max_attempts to -1 allows unlimited retries, which can cause retry storms and resource exhaustion. | 5 | -1 |
| `max_retry_duration` | If positive, maxRetryDuration specifies the time limit for retrying a failed task, measured from when the task was first attempted. Once maxRetryDuration time has passed and the task has been attempted maxAttempts times, no further attempts will be made and the task will be deleted. If zero, then the task age is unlimited. | false | true | A zero retry duration means the task age is unlimited, allowing failed tasks to continue retrying indefinitely. | 60s | 0s |
| `min_backoff` | A task will be scheduled for retry between minBackoff and maxBackoff duration after it fails, if the queue's RetryConfig specifies that the task should be retried. | false | true | Very small backoff values can cause rapid retry loops and increase load on downstream services. | 5s | 0s |
| `max_backoff` | A task will be scheduled for retry between minBackoff and maxBackoff duration after it fails, if the queue's RetryConfig specifies that the task should be retried. | false | true | Very large max_backoff values may delay task recovery and cause poor availability or operational issues. | 30s | 3600s |
| `max_doublings` | The time between retries will double maxDoublings times. A task's retry interval starts at minBackoff, then doubles maxDoublings times, then increases linearly, and finally retries retries at intervals of maxBackoff up to maxAttempts times. | false | true | High max_doublings can cause retry intervals to grow excessively and make retry behaviour harder to control. | 2 | 20 |

### stackdriver_logging_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `sampling_ratio` | Specifies the fraction of operations to write to Stackdriver Logging. This field may contain any value between 0.0 and 1.0, inclusive. 0.0 is the default and means that no operations are logged. | true | true | A sampling_ratio of 0 disables operation logging, reducing visibility into queue activity and security events. | 0.8 | 0.0 |

### http_target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `http_method` | The HTTP method to use for the request. When specified, it overrides HttpRequest for the task. Note that if the value is set to GET the body of the task will be ignored at execution time. Possible values are: `HTTP_METHOD_UNSPECIFIED`, `POST`, `GET`, `HEAD`, `PUT`, `DELETE`, `PATCH`, `OPTIONS`. | false | true | GET ignores the request body and may expose data in URLs. POST is safer for task payload execution. | POST | GET |
| `uri_override` | URI override. When specified, overrides the execution URI for all the tasks in the queue. Structure is [documented below](#nested_http_target_uri_override). | false | true | URI override controls the endpoint used by tasks. Incorrect URI settings may redirect tasks to insecure or unintended endpoints. | HTTPS URI override pointing to a trusted host. | HTTP URI override or untrusted host. |
| `header_overrides` | HTTP target headers. This map contains the header field names and values. Headers will be set when running the CreateTask and/or BufferTask. These headers represent a subset of the headers that will be configured for the task's HTTP request. Some HTTP request headers will be ignored or replaced. Headers which can have multiple values (according to RFC2616) can be specified using comma-separated values. The size of the headers must be less than 80KB. Queue-level headers to override headers of all the tasks in the queue. Structure is [documented below](#nested_http_target_header_overrides). | false | true | HTTP headers may contain authentication tokens, cookies, or sensitive metadata. Misconfigured headers may expose secrets or weaken request security. | Only non-sensitive application headers are configured. | Sensitive authentication headers or hardcoded secrets are configured. |
| `oauth_token` | If specified, an OAuth token is generated and attached as the Authorization header in the HTTP request. This type of authorization should generally be used only when calling Google APIs hosted on *.googleapis.com. Note that both the service account email and the scope MUST be specified when using the queue-level authorization override. Structure is [documented below](#nested_http_target_oauth_token). | false | true | OAuth tokens provide authorization to Google APIs. Incorrect scopes or overprivileged service accounts may violate least privilege principles. | OAuth token configured with limited scope and valid service account. | OAuth token configured with excessive scope or privileged service account. |
| `oidc_token` | If specified, an OIDC token is generated and attached as an Authorization header in the HTTP request. This type of authorization can be used for many scenarios, including calling Cloud Run, or endpoints where you intend to validate the token yourself. Note that both the service account email and the audience MUST be specified when using the queue-level authorization override. Structure is [documented below](#nested_http_target_oidc_token). | false | true | OIDC tokens provide identity-based authentication for HTTP targets. Missing or incorrect configuration may allow unauthorised access. | OIDC token configured with valid service account and audience. | OIDC token omitted or configured with invalid audience. |

### uri_override Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scheme` | Scheme override. When specified, the task URI scheme is replaced by the provided value (HTTP or HTTPS). Possible values are: `HTTP`, `HTTPS`. | false | true | Using HTTP instead of HTTPS may expose task data during transmission. | HTTPS | HTTP |
| `host` | Host override. When specified, replaces the host part of the task URL. For example, if the task URL is "https://www.google.com", and host value is set to "example.net", the overridden URI will be changed to "https://example.net". Host value cannot be an empty string (INVALID_ARGUMENT). | false | true | The host controls where tasks are sent. An incorrect or untrusted host may redirect tasks to an unsafe endpoint. | secure.example.com | insecure.example.com |
| `port` | Port override. When specified, replaces the port part of the task URI. For instance, for a URI http://www.google.com/foo and port=123, the overridden URI becomes http://www.google.com:123/foo. Note that the port value must be a positive integer. Setting the port to 0 (Zero) clears the URI port. | false | true | Unexpected ports may expose traffic to unintended services or insecure endpoints. | 443 | 8080 |
| `path_override` | URI path. When specified, replaces the existing path of the task URL. Setting the path value to an empty string clears the URI path segment. Structure is [documented below](#nested_http_target_uri_override_path_override). | false | false | Path override mainly controls request routing and does not directly enforce security. | /tasks/process | None |
| `query_override` | URI query. When specified, replaces the query part of the task URI. Setting the query value to an empty string clears the URI query segment. Structure is [documented below](#nested_http_target_uri_override_query_override). | false | true | Sensitive values in URL query strings may be exposed in logs, browser history, or monitoring systems.  | Only non-sensitive query parameters are configured. | Secrets or passwords are included in query parameters. |
| `uri_override_enforce_mode` | URI Override Enforce Mode When specified, determines the Target UriOverride mode. If not specified, it defaults to ALWAYS. Possible values are: `ALWAYS`, `IF_NOT_EXISTS`. | false | true | ALWAYS consistently enforces the configured URI override, reducing the risk of unexpected task routing. | ALWAYS | IF_NOT_EXISTS |

### path_override Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The URI path (e.g., /users/1234). Default is an empty string. | false | false | The request path is functional routing information and does not directly affect authentication or access control. | /users/1234 | None |

### query_override Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `query_params` | The query parameters (e.g., qparam1=123&qparam2=456). Default is an empty string. | false | true | Query parameters may expose sensitive information if secrets are included in URLs. | qparam=123 | password=mysecret |

### header_overrides Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `header` | Header embodying a key and a value. Structure is [documented below](#nested_http_target_header_overrides_header_overrides_header). | true | true | Header key-value pairs may expose sensitive authentication or session information if configured insecurely. | X-Task-Source: cloud-tasks | Authorization: Bearer hardcoded-secret |

### header Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | The Key of the header. | true | true | Sensitive header keys such as Authorization or Cookie may expose authentication information if misused. | X-Task-Source | Authorization |
| `value` | The Value of the header. | true | true | Hardcoded secrets or tokens in header values may expose credentials. | cloud-tasks | Bearer secret-token |

### oauth_token Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account_email` | Service account email to be used for generating OAuth token. The service account must be within the same project as the queue. The caller must have iam.serviceAccounts.actAs permission for the service account. | true | true | The service account defines the identity used for authentication. Overprivileged service accounts increase security risk. | tasks-oauth@pde-project-vindya.iam.gserviceaccount.com | owner-account@pde-project-vindya.iam.gserviceaccount.com |
| `scope` | OAuth scope to be used for generating OAuth access token. If not specified, "https://www.googleapis.com/auth/cloud-platform" will be used. | false | true | Broad OAuth scopes may grant unnecessary access to Google Cloud resources. | openid https://www.googleapis.com/auth/userinfo.email | https://www.googleapis.com/auth/cloud-platform |

### oidc_token Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account_email` | Service account email to be used for generating OIDC token. The service account must be within the same project as the queue. The caller must have iam.serviceAccounts.actAs permission for the service account. | true | true | The service account represents the identity used for OIDC authentication. | tasks-oidc@pde-project-vindya.iam.gserviceaccount.com | overprivileged@pde-project-vindya.iam.gserviceaccount.com |
| `audience` | Audience to be used when generating OIDC token. If not specified, the URI specified in target will be used. | false | true | Audience restricts where the OIDC token is intended to be used. Incorrect audience values may allow token misuse. | https://secure.example.com | https://untrusted.example.com |
