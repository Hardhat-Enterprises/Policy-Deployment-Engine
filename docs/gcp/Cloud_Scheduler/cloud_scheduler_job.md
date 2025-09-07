## 🛡️ Policy Deployment Engine: `cloud_scheduler_job`

This section provides a concise policy evaluation for the `cloud_scheduler_job` resource in GCP.

Reference: [Terraform Registry – cloud_scheduler_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human-readable description for the job. This string must not contain more than 500 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Optional) Describes the schedule on which the job will be executed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Optional) Specifies the time zone to be used in interpreting schedule. The value of this field must be a time zone name from the tz database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `paused`
- Description: (Optional) Sets the job to a paused state. Jobs default to being enabled when this property is not set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attempt_deadline`
- Description: (Optional) The deadline for job attempts. If the request handler does not respond by this deadline then the request is cancelled and the attempt is marked as a DEADLINE_EXCEEDED failure. The failed attempt can be viewed in execution logs. Cloud Scheduler will retry the job according to the RetryConfig. The allowed duration for this deadline is: * For HTTP targets, between 15 seconds and 30 minutes. * For App Engine HTTP targets, between 15 seconds and 24 hours. * **Note**: For PubSub targets, this field is ignored - setting it will introduce an unresolvable diff. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_config`
- Description: (Optional) By default, if a job does not complete successfully, meaning that an acknowledgement is not received from the handler, then it will be retried with exponential backoff according to the settings Structure is [documented below](#nested_retry_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pubsub_target`
- Description: (Optional) Pub/Sub target If the job providers a Pub/Sub target the cron will publish a message to the provided topic Structure is [documented below](#nested_pubsub_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_engine_http_target`
- Description: (Optional) App Engine HTTP target. If the job providers a App Engine HTTP target the cron will send a request to the service instance Structure is [documented below](#nested_app_engine_http_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_target`
- Description: (Optional) HTTP target. If the job providers a http_target the cron will send a request to the targeted url Structure is [documented below](#nested_http_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where the scheduler job resides. If it is not provided, Terraform will use the provider default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_retry_config"></a>The `retry_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry_count`
- Description: (Optional) The number of attempts that the system will make to run a job using the exponential backoff procedure described by maxDoublings. Values greater than 5 and negative values are not allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_retry_duration`
- Description: (Optional) The time limit for retrying a failed job, measured from time when an execution was first attempted. If specified with retryCount, the job will be retried until both limits are reached. A duration in seconds with up to nine fractional digits, terminated by 's'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_backoff_duration`
- Description: (Optional) The minimum amount of time to wait before retrying a job after it fails. A duration in seconds with up to nine fractional digits, terminated by 's'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_backoff_duration`
- Description: (Optional) The maximum amount of time to wait before retrying a job after it fails. A duration in seconds with up to nine fractional digits, terminated by 's'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_doublings`
- Description: (Optional) The time between retries will double maxDoublings times. A job's retry interval starts at minBackoffDuration, then doubles maxDoublings times, then increases linearly, and finally retries retries at intervals of maxBackoffDuration up to retryCount times. <a name="nested_pubsub_target"></a>The `pubsub_target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic_name`
- Description: (Required) The full resource name for the Cloud Pub/Sub topic to which messages will be published when a job is delivered. ~>**NOTE:** The topic name must be in the same format as required by PubSub's PublishRequest.name, e.g. `projects/my-project/topics/my-topic`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data`
- Description: (Optional) The message payload for PubsubMessage. Pubsub message must contain either non-empty data, or at least one attribute. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attributes`
- Description: (Optional) Attributes for PubsubMessage. Pubsub message must contain either non-empty data, or at least one attribute. <a name="nested_app_engine_http_target"></a>The `app_engine_http_target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_method`
- Description: (Optional) Which HTTP method to use for the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_engine_routing`
- Description: (Optional) App Engine Routing setting for the job. Structure is [documented below](#nested_app_engine_http_target_app_engine_routing).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `relative_uri`
- Description: (Required) The relative URI. The relative URL must begin with "/" and must be a valid HTTP relative URL. It can contain a path, query string arguments, and \# fragments. If the relative URL is empty, then the root path "/" will be used. No spaces are allowed, and the maximum length allowed is 2083 characters
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `body`
- Description: (Optional) HTTP request body. A request body is allowed only if the HTTP method is POST or PUT. It will result in invalid argument error to set a body on a job with an incompatible HttpMethod. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Optional) HTTP request headers. This map contains the header field names and values. Headers can be set when the job is created. <a name="nested_app_engine_http_target_app_engine_routing"></a>The `app_engine_routing` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Optional) App service. By default, the job is sent to the service which is the default service when the job is attempted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) App version. By default, the job is sent to the version which is the default version when the job is attempted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) App instance. By default, the job is sent to an instance which is available when the job is attempted. <a name="nested_http_target"></a>The `http_target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The full URI path that the request will be sent to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_method`
- Description: (Optional) Which HTTP method to use for the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `body`
- Description: (Optional) HTTP request body. A request body is allowed only if the HTTP method is POST, PUT, or PATCH. It is an error to set body on a job with an incompatible HttpMethod. A base64-encoded string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `headers`
- Description: (Optional) This map contains the header field names and values. Repeated headers are not supported, but a header value can contain commas.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_token`
- Description: (Optional) Contains information needed for generating an OAuth token. This type of authorization should be used when sending requests to a GCP endpoint. Structure is [documented below](#nested_http_target_oauth_token).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oidc_token`
- Description: (Optional) Contains information needed for generating an OpenID Connect token. This type of authorization should be used when sending requests to third party endpoints or Cloud Run. Structure is [documented below](#nested_http_target_oidc_token). <a name="nested_http_target_oauth_token"></a>The `oauth_token` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Required) Service account email to be used for generating OAuth token. The service account must be within the same project as the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) OAuth scope to be used for generating OAuth access token. If not specified, "https://www.googleapis.com/auth/cloud-platform" will be used. <a name="nested_http_target_oidc_token"></a>The `oidc_token` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Required) Service account email to be used for generating OAuth token. The service account must be within the same project as the job.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audience`
- Description: (Optional) Audience to be used when generating OIDC token. If not specified, the URI specified in target will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
