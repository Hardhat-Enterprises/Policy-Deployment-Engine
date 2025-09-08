## 🛡️ Policy Deployment Engine: `cloud_tasks_queue`

This section provides a concise policy evaluation for the `cloud_tasks_queue` resource in GCP.

Reference: [Terraform Registry – cloud_tasks_queue](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_tasks_queue)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the queue | true | None | None |
| `name` | The queue name. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### app_engine_routing_override Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | App service. By default, the task is sent to the service which is the default service when the task is attempted. | false | None | None |
| `version` | App version. By default, the task is sent to the version which is the default version when the task is attempted. | false | None | None |
| `instance` | App instance. By default, the task is sent to an instance which is available when the task is attempted. | false | None | None |
| `host` | (Output) The host that the task is sent to. | none | None | None |

### rate_limits Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_dispatches_per_second` | The maximum rate at which tasks are dispatched from this queue. If unspecified when the queue is created, Cloud Tasks will pick the default. | false | None | None |
| `max_concurrent_dispatches` | The maximum number of concurrent tasks that Cloud Tasks allows to be dispatched for this queue. After this threshold has been reached, Cloud Tasks stops dispatching tasks until the number of concurrent requests decreases. | false | None | None |
| `max_burst_size` | (Output) The max burst size. Max burst size limits how fast tasks in queue are processed when many tasks are in the queue and the rate is high. This field allows the queue to have a high rate so processing starts shortly after a task is enqueued, but still limits resource usage when many tasks are enqueued in a short period of time. | none | None | None |

### retry_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_attempts` | Number of attempts per task. Cloud Tasks will attempt the task maxAttempts times (that is, if the first attempt fails, then there will be maxAttempts - 1 retries). Must be >= -1. If unspecified when the queue is created, Cloud Tasks will pick the default. -1 indicates unlimited attempts. | false | None | None |
| `max_retry_duration` | If positive, maxRetryDuration specifies the time limit for retrying a failed task, measured from when the task was first attempted. Once maxRetryDuration time has passed and the task has been attempted maxAttempts times, no further attempts will be made and the task will be deleted. If zero, then the task age is unlimited. | false | None | None |
| `min_backoff` | A task will be scheduled for retry between minBackoff and maxBackoff duration after it fails, if the queue's RetryConfig specifies that the task should be retried. | false | None | None |
| `max_backoff` | A task will be scheduled for retry between minBackoff and maxBackoff duration after it fails, if the queue's RetryConfig specifies that the task should be retried. | false | None | None |
| `max_doublings` | The time between retries will double maxDoublings times. A task's retry interval starts at minBackoff, then doubles maxDoublings times, then increases linearly, and finally retries retries at intervals of maxBackoff up to maxAttempts times. | false | None | None |

### stackdriver_logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sampling_ratio` | Specifies the fraction of operations to write to Stackdriver Logging. This field may contain any value between 0.0 and 1.0, inclusive. 0.0 is the default and means that no operations are logged. | true | None | None |

### http_target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `http_method` | The HTTP method to use for the request. When specified, it overrides HttpRequest for the task. Note that if the value is set to GET the body of the task will be ignored at execution time. Possible values are: `HTTP_METHOD_UNSPECIFIED`, `POST`, `GET`, `HEAD`, `PUT`, `DELETE`, `PATCH`, `OPTIONS`. | false | None | None |
| `uri_override` | URI override. When specified, overrides the execution URI for all the tasks in the queue. Structure is [documented below](#nested_http_target_uri_override). | false | None | None |
| `header_overrides` | HTTP target headers. This map contains the header field names and values. Headers will be set when running the CreateTask and/or BufferTask. These headers represent a subset of the headers that will be configured for the task's HTTP request. Some HTTP request headers will be ignored or replaced. Headers which can have multiple values (according to RFC2616) can be specified using comma-separated values. The size of the headers must be less than 80KB. Queue-level headers to override headers of all the tasks in the queue. Structure is [documented below](#nested_http_target_header_overrides). | false | None | None |
| `oauth_token` | If specified, an OAuth token is generated and attached as the Authorization header in the HTTP request. This type of authorization should generally be used only when calling Google APIs hosted on *.googleapis.com. Note that both the service account email and the scope MUST be specified when using the queue-level authorization override. Structure is [documented below](#nested_http_target_oauth_token). | false | None | None |
| `oidc_token` | If specified, an OIDC token is generated and attached as an Authorization header in the HTTP request. This type of authorization can be used for many scenarios, including calling Cloud Run, or endpoints where you intend to validate the token yourself. Note that both the service account email and the audience MUST be specified when using the queue-level authorization override. Structure is [documented below](#nested_http_target_oidc_token). | false | None | None |

### uri_override Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scheme` | Scheme override. When specified, the task URI scheme is replaced by the provided value (HTTP or HTTPS). Possible values are: `HTTP`, `HTTPS`. | false | None | None |
| `host` | Host override. When specified, replaces the host part of the task URL. For example, if the task URL is "https://www.google.com", and host value is set to "example.net", the overridden URI will be changed to "https://example.net". Host value cannot be an empty string (INVALID_ARGUMENT). | false | None | None |
| `port` | Port override. When specified, replaces the port part of the task URI. For instance, for a URI http://www.google.com/foo and port=123, the overridden URI becomes http://www.google.com:123/foo. Note that the port value must be a positive integer. Setting the port to 0 (Zero) clears the URI port. | false | None | None |
| `path_override` | URI path. When specified, replaces the existing path of the task URL. Setting the path value to an empty string clears the URI path segment. Structure is [documented below](#nested_http_target_uri_override_path_override). | false | None | None |
| `query_override` | URI query. When specified, replaces the query part of the task URI. Setting the query value to an empty string clears the URI query segment. Structure is [documented below](#nested_http_target_uri_override_query_override). | false | None | None |
| `uri_override_enforce_mode` | URI Override Enforce Mode When specified, determines the Target UriOverride mode. If not specified, it defaults to ALWAYS. Possible values are: `ALWAYS`, `IF_NOT_EXISTS`. | false | None | None |

### path_override Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | The URI path (e.g., /users/1234). Default is an empty string. | false | None | None |

### query_override Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `query_params` | The query parameters (e.g., qparam1=123&qparam2=456). Default is an empty string. | false | None | None |

### header_overrides Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `header` | Header embodying a key and a value. Structure is [documented below](#nested_http_target_header_overrides_header_overrides_header). | true | None | None |

### header Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | The Key of the header. | true | None | None |
| `value` | The Value of the header. | true | None | None |

### oauth_token Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account_email` | Service account email to be used for generating OAuth token. The service account must be within the same project as the queue. The caller must have iam.serviceAccounts.actAs permission for the service account. | true | None | None |
| `scope` | OAuth scope to be used for generating OAuth access token. If not specified, "https://www.googleapis.com/auth/cloud-platform" will be used. | false | None | None |

### oidc_token Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account_email` | Service account email to be used for generating OIDC token. The service account must be within the same project as the queue. The caller must have iam.serviceAccounts.actAs permission for the service account. | true | None | None |
| `audience` | Audience to be used when generating OIDC token. If not specified, the URI specified in target will be used. | false | None | None |
