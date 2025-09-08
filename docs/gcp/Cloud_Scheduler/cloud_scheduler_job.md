## 🛡️ Policy Deployment Engine: `cloud_scheduler_job`

This section provides a concise policy evaluation for the `cloud_scheduler_job` resource in GCP.

Reference: [Terraform Registry – cloud_scheduler_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the job. | true | None | None |
| `description` | A human-readable description for the job. This string must not contain more than 500 characters. | false | None | None |
| `schedule` | Describes the schedule on which the job will be executed. | false | None | None |
| `time_zone` | Specifies the time zone to be used in interpreting schedule. The value of this field must be a time zone name from the tz database. | false | None | None |
| `paused` | Sets the job to a paused state. Jobs default to being enabled when this property is not set. | false | None | None |
| `attempt_deadline` | The deadline for job attempts. If the request handler does not respond by this deadline then the request is cancelled and the attempt is marked as a DEADLINE_EXCEEDED failure. The failed attempt can be viewed in execution logs. Cloud Scheduler will retry the job according to the RetryConfig. The allowed duration for this deadline is: * For HTTP targets, between 15 seconds and 30 minutes. * For App Engine HTTP targets, between 15 seconds and 24 hours. * **Note**: For PubSub targets, this field is ignored - setting it will introduce an unresolvable diff. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s" | false | None | None |
| `region` | Region where the scheduler job resides. If it is not provided, Terraform will use the provider default. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### retry_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `retry_count` | The number of attempts that the system will make to run a job using the exponential backoff procedure described by maxDoublings. Values greater than 5 and negative values are not allowed. | false | None | None |
| `max_retry_duration` | The time limit for retrying a failed job, measured from time when an execution was first attempted. If specified with retryCount, the job will be retried until both limits are reached. A duration in seconds with up to nine fractional digits, terminated by 's'. | false | None | None |
| `min_backoff_duration` | The minimum amount of time to wait before retrying a job after it fails. A duration in seconds with up to nine fractional digits, terminated by 's'. | false | None | None |
| `max_backoff_duration` | The maximum amount of time to wait before retrying a job after it fails. A duration in seconds with up to nine fractional digits, terminated by 's'. | false | None | None |
| `max_doublings` | The time between retries will double maxDoublings times. A job's retry interval starts at minBackoffDuration, then doubles maxDoublings times, then increases linearly, and finally retries retries at intervals of maxBackoffDuration up to retryCount times. | false | None | None |

### pubsub_target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `topic_name` | The full resource name for the Cloud Pub/Sub topic to which messages will be published when a job is delivered. ~>**NOTE:** The topic name must be in the same format as required by PubSub's PublishRequest.name, e.g. `projects/my-project/topics/my-topic`. | true | None | None |
| `data` | The message payload for PubsubMessage. Pubsub message must contain either non-empty data, or at least one attribute. A base64-encoded string. | false | None | None |
| `attributes` | Attributes for PubsubMessage. Pubsub message must contain either non-empty data, or at least one attribute. | false | None | None |

### app_engine_http_target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `http_method` | Which HTTP method to use for the request. | false | None | None |
| `app_engine_routing` | App Engine Routing setting for the job. Structure is [documented below](#nested_app_engine_http_target_app_engine_routing). | false | None | None |
| `relative_uri` | The relative URI. The relative URL must begin with "/" and must be a valid HTTP relative URL. It can contain a path, query string arguments, and \# fragments. If the relative URL is empty, then the root path "/" will be used. No spaces are allowed, and the maximum length allowed is 2083 characters | true | None | None |
| `body` | HTTP request body. A request body is allowed only if the HTTP method is POST or PUT. It will result in invalid argument error to set a body on a job with an incompatible HttpMethod. A base64-encoded string. | false | None | None |
| `headers` | HTTP request headers. This map contains the header field names and values. Headers can be set when the job is created. | false | None | None |

### http_target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The full URI path that the request will be sent to. | true | None | None |
| `http_method` | Which HTTP method to use for the request. | false | None | None |
| `body` | HTTP request body. A request body is allowed only if the HTTP method is POST, PUT, or PATCH. It is an error to set body on a job with an incompatible HttpMethod. A base64-encoded string. | false | None | None |
| `headers` | This map contains the header field names and values. Repeated headers are not supported, but a header value can contain commas. | false | None | None |
| `oauth_token` | Contains information needed for generating an OAuth token. This type of authorization should be used when sending requests to a GCP endpoint. Structure is [documented below](#nested_http_target_oauth_token). | false | None | None |
| `oidc_token` | Contains information needed for generating an OpenID Connect token. This type of authorization should be used when sending requests to third party endpoints or Cloud Run. Structure is [documented below](#nested_http_target_oidc_token). | false | None | None |

### app_engine_routing Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | App service. By default, the job is sent to the service which is the default service when the job is attempted. | false | None | None |
| `version` | App version. By default, the job is sent to the version which is the default version when the job is attempted. | false | None | None |
| `instance` | App instance. By default, the job is sent to an instance which is available when the job is attempted. | false | None | None |

### oauth_token Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account_email` | Service account email to be used for generating OAuth token. The service account must be within the same project as the job. | true | None | None |
| `scope` | OAuth scope to be used for generating OAuth access token. If not specified, "https://www.googleapis.com/auth/cloud-platform" will be used. | false | None | None |

### oidc_token Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account_email` | Service account email to be used for generating OAuth token. The service account must be within the same project as the job. | true | None | None |
| `audience` | Audience to be used when generating OIDC token. If not specified, the URI specified in target will be used. | false | None | None |
