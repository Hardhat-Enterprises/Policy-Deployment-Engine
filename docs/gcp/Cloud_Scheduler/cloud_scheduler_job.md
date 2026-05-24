## 🛡️ Policy Deployment Engine: `cloud_scheduler_job`

This section provides a concise policy evaluation for the `cloud_scheduler_job` resource in GCP.

Reference: [Terraform Registry – cloud_scheduler_job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the job. | true | false | Is not related to security practices as is only used for naming purposes | None | None |
| `description` | A human-readable description for the job. This string must not contain more than 500 characters. | false | false | Only used to describe the purpose of the job thus does not have security related impact | None | None |
| `schedule` | Describes the schedule on which the job will be executed. | false | false | Only used to set the timer for the job which would not affect the data security | None | None |
| `time_zone` | Specifies the time zone to be used in interpreting schedule. The value of this field must be a time zone name from the tz database. | false | false | Only used for schedule operational purposes thus does not have an effect on security principles | None | None |
| `paused` | Sets the job to a paused state. Jobs default to being enabled when this property is not set. | false | true | Controls the whether the job is haulted thus should be manually set to either true or false to prevent accidental immediate execution | TRUE |  |
| `attempt_deadline` | The deadline for job attempts. If the request handler does not respond by this deadline then the request is cancelled and the attempt is marked as a DEADLINE_EXCEEDED failure. The failed attempt can be viewed in execution logs. Cloud Scheduler will retry the job according to the RetryConfig. The allowed duration for this deadline is: * For HTTP targets, between 15 seconds and 30 minutes. * For App Engine HTTP targets, between 15 seconds and 24 hours. * **Note**: For PubSub targets, this field is ignored - setting it will introduce an unresolvable diff. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s" | false | false | Only needed for controlling the time of timeouts which does not affect the security intergrity of the service | None | None |
| `retry_config` | By default, if a job does not complete successfully, meaning that an acknowledgement is not received from the handler, then it will be retried with exponential backoff according to the settings Structure is [documented below](#nested_retry_config). | false | false | Used for the configuration for retries thus not security related | None | None |
| `pubsub_target` | Pub/Sub target If the job providers a Pub/Sub target the cron will publish a message to the provided topic Structure is [documented below](#nested_pubsub_target). | false | false | Purpose is just the target of pubsub which would not affect the security of the security of the service | None | None |
| `app_engine_http_target` | App Engine HTTP target. If the job providers a App Engine HTTP target the cron will send a request to the service instance Structure is [documented below](#nested_app_engine_http_target). | false | true | Should use a http method that can not be used maliciously, service set so that it does not have an unintended service routed, and relative_uri which does not contain any sensitive values | GET | DELETE |
| `http_target` | HTTP target. If the job providers a http_target the cron will send a request to the targeted url Structure is [documented below](#nested_http_target). | false | false | The http target itself which would have no impact on security properties | None | None |
| `region` | Region where the scheduler job resides. If it is not provided, Terraform will use the provider default. | false | true | Region must be set to australia to enforce data residency | australia-southeast1 | us-central1 |
| `project` | If it is not provided, the provider project is used. | false | false | Used for the project idenfication but does not have direct effects on the security of the service | None | None |
| `app_engine_routing` |  | false | false | Used to route the request to the specified service and does not have any effect on security | None | None |
| `oauth_token` |  | false | true | Need to be implemented to add a level of authentication when required | c_scheduler@pde.iam.gserviceaccount.com |  |
| `oidc_token` |  | false | true | Need to be implemented to add a level of authentication when required | c_scheduler@pde.iam.gserviceaccount.com |  |

### retry_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retry_count` | The number of attempts that the system will make to run a job using the exponential backoff procedure described by maxDoublings. Values greater than 5 and negative values are not allowed. | false | true | Controls the amount of retries so must be limited in order to prevent exessive attempts | 3 | 10 |
| `max_retry_duration` | The time limit for retrying a failed job, measured from time when an execution was first attempted. If specified with retryCount, the job will be retried until both limits are reached. A duration in seconds with up to nine fractional digits, terminated by 's'. | false | false | Used to dictate the maxiumum amount of retries thus not a security related attribute | None | None |
| `min_backoff_duration` | The minimum amount of time to wait before retrying a job after it fails. A duration in seconds with up to nine fractional digits, terminated by 's'. | false | false | Only used to dictate the minimum backoff thus not a security related attribute | None | None |
| `max_backoff_duration` | The maximum amount of time to wait before retrying a job after it fails. A duration in seconds with up to nine fractional digits, terminated by 's'. | false | false | Only used to dictate the maximum backoff thus not a security related attribute | None | None |
| `max_doublings` | The time between retries will double maxDoublings times. A job's retry interval starts at minBackoffDuration, then doubles maxDoublings times, then increases linearly, and finally retries retries at intervals of maxBackoffDuration up to retryCount times. | false | false | Used to control the timer of max_doublings and has no impact on the securtiy of the service | None | None |

### pubsub_target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `topic_name` | The full resource name for the Cloud Pub/Sub topic to which messages will be published when a job is delivered. ~>**NOTE:** The topic name must be in the same format as required by PubSub's PublishRequest.name, e.g. `projects/my-project/topics/my-topic`. | true | false | Does not impact security as is only used as a naming convention | None | None |
| `data` | The message payload for PubsubMessage. Pubsub message must contain either non-empty data, or at least one attribute. A base64-encoded string. | false | false | Holds the data of the message but does not have direct impact on security attruibutes of the service | None | None |
| `attributes` | Attributes for PubsubMessage. Pubsub message must contain either non-empty data, or at least one attribute. | false | false | The metadata of the pubsubmessage which does not have influence on securty aspects of the service | None | None |

### app_engine_http_target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `http_method` | Which HTTP method to use for the request. | false | true | Indicates http method thus methods that can be used maliciously should be banned | POST | DELETE |
| `app_engine_routing` | App Engine Routing setting for the job. Structure is [documented below](#nested_app_engine_http_target_app_engine_routing). | false | false | The configuration of the route for app_engine which does not have an effect on the security principles | None | None |
| `relative_uri` | The relative URI. The relative URL must begin with "/" and must be a valid HTTP relative URL. It can contain a path, query string arguments, and \# fragments. If the relative URL is empty, then the root path "/" will be used. No spaces are allowed, and the maximum length allowed is 2083 characters | true | true | uri should not contain any sensitive information to prevent leak | /api/v1/resource | /password/fakeuri/api |
| `body` | HTTP request body. A request body is allowed only if the HTTP method is POST or PUT. It will result in invalid argument error to set a body on a job with an incompatible HttpMethod. A base64-encoded string. | false | false | Only used in methods POST or PUT and is just HTTP data thus would not affect security aspects | None | None |
| `headers` | HTTP request headers. This map contains the header field names and values. Headers can be set when the job is created. | false | false | Only used to provide addtional context which has no effect on the security | None | None |

### http_target Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | The full URI path that the request will be sent to. | true | true | Must use HTTPS in order to improve upon encryption | https://example.com/ | http://example.com/ |
| `http_method` | Which HTTP method to use for the request. | false | true | Indicates http method thus methods that can be used maliciously should be banned | POST | DELETE |
| `body` | HTTP request body. A request body is allowed only if the HTTP method is POST, PUT, or PATCH. It is an error to set body on a job with an incompatible HttpMethod. A base64-encoded string. | false | true | Contains the main data for http and body should only be used if HTTP method is POST, PUT or PATCH | POST | GET |
| `headers` | This map contains the header field names and values. Repeated headers are not supported, but a header value can contain commas. | false | false | Only used to provide addtional context which has no effect on the security | None | None |
| `oauth_token` | Contains information needed for generating an OAuth token. This type of authorization should be used when sending requests to a GCP endpoint. Structure is [documented below](#nested_http_target_oauth_token). | false | true | Must be implemented to apply authentication upon the use of this service | c_scheduler@pde.iam.gserviceaccount.com |  |
| `oidc_token` | Contains information needed for generating an OpenID Connect token. This type of authorization should be used when sending requests to third party endpoints or Cloud Run. Structure is [documented below](#nested_http_target_oidc_token). | false | true | Must be implemented to apply authentication upon the use of this service | c_scheduler@pde.iam.gserviceaccount.com |  |

### app_engine_routing Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | App service. By default, the job is sent to the service which is the default service when the job is attempted. | false | true | Should be specifically set as if not, routing may be set to an unintended service | my-service |  |
| `version` | App version. By default, the job is sent to the version which is the default version when the job is attempted. | false | false | Only used to select version of service thus does not directly affect security | None | None |
| `instance` | App instance. By default, the job is sent to an instance which is available when the job is attempted. | false | false | The available app instance which does not directly affect the security. | None | None |

### oauth_token Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account_email` | Service account email to be used for generating OAuth token. The service account must be within the same project as the job. | true | true | Service account email should be correctly configured and not use overly priviledged default service accounts | c_scheduler@pde.iam.gserviceaccount.com | nc_pde-compute@developer.gserviceaccount.com |
| `scope` | OAuth scope to be used for generating OAuth access token. If not specified, "https://www.googleapis.com/auth/cloud-platform" will be used. | false | true | Defines the set of Google APIs that the access token is able access, thus to enforce security using the least priviledges, narrower scopes specific to the API should be used. | https://www.googleapis.com/auth/pubsub | https://www.googleapis.com/auth/cloud-platform |

### oidc_token Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account_email` | Service account email to be used for generating OAuth token. The service account must be within the same project as the job. | true | true | Service account email should be correctly configured and not use overly priviledged default service accounts | c_scheduler@pde.iam.gserviceaccount.com | nc_pde-compute@developer.gserviceaccount.com |
| `audience` | Audience to be used when generating OIDC token. If not specified, the URI specified in target will be used. | false | false | Will not provide addtional security as mismatched and misconfigured uri is automatically rejected thus making it more of a configuration | None | None |
