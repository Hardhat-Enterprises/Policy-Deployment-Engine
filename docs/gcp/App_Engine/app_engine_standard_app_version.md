## 🛡️ Policy Deployment Engine: `app_engine_standard_app_version`

This section provides a concise policy evaluation for the `app_engine_standard_app_version` resource in GCP.

Reference: [Terraform Registry – app_engine_standard_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_standard_app_version)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `runtime` | Desired runtime. Example python27. | true | true | Ensuring the application executes in the correct environment with the specific language version required for its dependencies. | nodejs20 | nodejs10 |
| `deployment` | Code and application artifacts that make up this version. Structure is [documented below](#nested_deployment). | true | true | To define the specific source code and files that constitute the application version ensuring that Terraform can verify and upload the correct assets to the environment. | None | None |
| `entrypoint` | The entrypoint for the application. Structure is [documented below](#nested_entrypoint). | true | true | To provide the specific command required to start the application, ensuring that the environment knows how to execute the code, with which port/startup script to initialize. | None | None |
| `service` | AppEngine service resource | true | true | Ensuring the application is deployed as a specific microservice, allowing for independent scaling and routing logic within the larger App Engine project. | default | unauthorized-app-name |
| `version_id` | Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-". | false | false | To automatically generate unique timestamp identifiers for each deployment, inturn preventing naming conflicts and ensuring that new releases do not accidentally overwrite existing versions. | None | None |
| `service_account` | The identity that the deployed version will run as. Admin API will use the App Engine Appspot service account as default if this field is neither provided in app.yaml file nor through CLI flag. | false | false | Having utilise the default App Engine service account, simplifying permission management by leveraging the standard identity provided by the platform for accessing Google Cloud resources. | None | None |
| `threadsafe` | Whether multiple requests can be dispatched to this version at once. | false | false | Environment to use its default concurrency settings, ensuring the application remains stable and avoids race conditions if the codebase is not optimized for parallel request handling. | None | None |
| `app_engine_apis` | Allows App Engine second generation runtimes to access the legacy bundled services. | false | false | To ensure the application remains modern and portable | None | None |
| `runtime_api_version` | The version of the API in the given runtime environment. Please see the app.yaml reference for valid values at `https://cloud.google.com/appengine/docs/standard/<language>/config/appref`\ Substitute `<language>` with `python`, `java`, `php`, `ruby`, `go` or `nodejs`. | false | false | The application utilises a second-generation runtime where the API version is automatically managed by the platform, ensuring the environment always uses the most compatible interface without manual intervention. | None | None |
| `handlers` | An ordered list of URL-matching patterns that should be applied to incoming requests. The first matching URL handles the request and other request handlers are not attempted. Structure is [documented below](#nested_handlers). | false | false | For a more flexible and unified approach to request handling without platform-specific configuration. | None | None |
| `libraries` | Configuration for third-party Python runtime libraries that are required by the application. Structure is [documented below](#nested_libraries). | false | false | Uses a second-generation runtime that manages dependencies through standard package managers. | None | None |
| `env_variables` | Environment variables available to the application. | false | false | Avoid hardcoding sensitive/environment-specific data in the deployment manifest. | None | None |
| `vpc_access_connector` | Enables VPC connectivity for standard apps. Structure is [documented below](#nested_vpc_access_connector). | false | false | interacts with public APIs/managed services that do not require a private connection to a Virtual Private Cloud which reduces infrastructure complexity. | None | None |
| `inbound_services` | A list of the types of messages that this application is able to receive. Each value may be one of: `INBOUND_SERVICE_MAIL`, `INBOUND_SERVICE_MAIL_BOUNCE`, `INBOUND_SERVICE_XMPP_ERROR`, `INBOUND_SERVICE_XMPP_MESSAGE`, `INBOUND_SERVICE_XMPP_SUBSCRIBE`, `INBOUND_SERVICE_XMPP_PRESENCE`, `INBOUND_SERVICE_CHANNEL_PRESENCE`, `INBOUND_SERVICE_WARMUP`. | false | false | Does not require specialised App Engine-specific features, allowing it to remain a standard web service with a smaller configuration footprint. | None | None |
| `instance_class` | Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G BasicScaling or ManualScaling: B1, B2, B4, B4_1G, B8 Defaults to F1 for AutomaticScaling and B2 for ManualScaling and BasicScaling. If no scaling is specified, AutomaticScaling is chosen. | false | true | Defined to ensure the application has the specific CPU and memory resources required for its workload. | F1 | F2 |
| `automatic_scaling` | Automatic scaling is based on request rate, response latencies, and other application metrics. Structure is [documented below](#nested_automatic_scaling). | false | false | To prevent the application from scaling up to aggressively during minor traffic fluctuations. | None | None |
| `basic_scaling` | Basic scaling creates instances when your application receives requests. Each instance will be shut down when the application becomes idle. Basic scaling is ideal for work that is intermittent or driven by user activity. Structure is [documented below](#nested_basic_scaling). | false | false | Avoid the latency delays in relation with starting instances from zero after periods of inactivity. | None | None |
| `manual_scaling` | A service with manual scaling runs continuously, allowing you to perform complex initialization and rely on the state of its memory over time. Structure is [documented below](#nested_manual_scaling). | false | false | To ensure the system can instead respond dynamically to traffic changes without the risk of over-provisioning/service outages during unexpected load. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | To automatically inherit the provider-level project ID. | None | None |
| `noop_on_destroy` | If set to true, the application version will not be deleted. | false | false | To ensure Terraform can fully decommission the application version. | None | None |
| `delete_service_on_destroy` | If set to true, the service will be deleted if it is the last version. | false | false | Prevent the accidental removal of the entire service and its versions when a specific version is decommissioned. | None | None |
| `zip` | Zip | false | true | Provides a direct way to package the application's source code. | None | None |
| `files` |  | false | false | None | None | None |
| `script` |  | false | false | None | None | None |
| `static_files` |  | false | false | None | None | None |
| `standard_scheduler_settings` |  | false | false | None | None | None |

### deployment Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `zip` | Zip File Structure is [documented below](#nested_deployment_zip). | false | true | Provides a direct way to package the application's source code. | None | None |
| `files` | Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call. Structure is [documented below](#nested_deployment_files). | false | false | To simplify the configuration and ensure that the application package is deployed as a single consistent unit rather than managing individual file paths manually. | None | None |

### entrypoint Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `shell` | The format should be a shell command that can be fed to bash -c. | true | true | To define the startup command, as it allows for the execution of complex scripts/multiple commands within the standard shell environment. | node ./app.js | bash ./app.js |

### handlers Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `url_regex` | URL prefix. Uses regular expression syntax, which means regexp special characters must be escaped, but should not contain groupings. All URLs that begin with this prefix are handled by this handler, using the portion of the URL after the prefix as part of the file path. | false | false | None | None | None |
| `security_level` | Security (HTTPS) enforcement for this URL. Possible values are: `SECURE_DEFAULT`, `SECURE_NEVER`, `SECURE_OPTIONAL`, `SECURE_ALWAYS`. | false | false | None | None | None |
| `login` | Methods to restrict access to a URL based on login status. Possible values are: `LOGIN_OPTIONAL`, `LOGIN_ADMIN`, `LOGIN_REQUIRED`. | false | false | None | None | None |
| `auth_fail_action` | Actions to take when the user is not logged in. Possible values are: `AUTH_FAIL_ACTION_REDIRECT`, `AUTH_FAIL_ACTION_UNAUTHORIZED`. | false | false | None | None | None |
| `redirect_http_response_code` | 30x code to use when performing redirects for the secure field. Possible values are: `REDIRECT_HTTP_RESPONSE_CODE_301`, `REDIRECT_HTTP_RESPONSE_CODE_302`, `REDIRECT_HTTP_RESPONSE_CODE_303`, `REDIRECT_HTTP_RESPONSE_CODE_307`. | false | false | None | None | None |
| `script` | Executes a script to handle the requests that match this URL pattern. Only the auto value is supported for Node.js in the App Engine standard environment, for example "script:" "auto". Structure is [documented below](#nested_handlers_handlers_script). | false | false | None | None | None |
| `static_files` | Files served directly to the user for a given URL, such as images, CSS stylesheets, or JavaScript source files. Static file handlers describe which files in the application directory are static files, and which URLs serve them. Structure is [documented below](#nested_handlers_handlers_static_files). | false | false | None | None | None |

### libraries Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the library. Example "django". | false | false | None | None | None |
| `version` | Version of the library to select, or "latest". | false | false | None | None | None |

### vpc_access_connector Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Full Serverless VPC Access Connector name e.g. /projects/my-project/locations/us-central1/connectors/c1. | true | false | None | None | None |
| `egress_setting` | The egress setting for the connector, controlling what traffic is diverted through it. | false | false | None | None | None |

### automatic_scaling Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `max_concurrent_requests` | Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. Defaults to a runtime-specific value. | false | false | None | None | None |
| `max_idle_instances` | Maximum number of idle instances that should be maintained for this version. | false | false | None | None | None |
| `max_pending_latency` | Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |
| `min_idle_instances` | Minimum number of idle instances that should be maintained for this version. Only applicable for the default version of a service. | false | false | None | None | None |
| `min_pending_latency` | Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |
| `standard_scheduler_settings` | Scheduler settings for standard environment. Structure is [documented below](#nested_automatic_scaling_standard_scheduler_settings). | false | false | None | None | None |

### basic_scaling Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `idle_timeout` | Duration of time after the last request that an instance must wait before the instance is shut down. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Defaults to 900s. | false | false | None | None | None |
| `max_instances` | Maximum number of instances to create for this version. Must be in the range [1.0, 200.0]. | true | false | None | None | None |

### manual_scaling Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `instances` | Number of instances to assign to the service at the start. **Note:** When managing the number of instances at runtime through the App Engine Admin API or the (now deprecated) Python 2 Modules API set_num_instances() you must use `lifecycle.ignore_changes = ["manual_scaling"[0].instances]` to prevent drift detection. | true | false | None | None | None |

### zip Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_url` | Source URL | true | true | Ensuring that the deployment process uses a verified artifact that is consistent across all environments. | https://storage.googleapis.com/appengine-static-content/hello-world.zip | https://storage.googleapis.com/malicious-bucket/exploit.zip |
| `files_count` | files count | false | false | None | None | None |

### files Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` |  | false | false | None | None | None |
| `sha1_sum` | SHA1 checksum of the file | false | false | None | None | None |
| `source_url` | Source URL | true | false | None | None | None |

### script Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `script_path` | Path to the script from the application root directory. | true | false | None | None | None |

### static_files Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | Path to the static files matched by the URL pattern, from the application root directory. The path can refer to text matched in groupings in the URL pattern. | false | false | None | None | None |
| `upload_path_regex` | Regular expression that matches the file paths for all files that should be referenced by this handler. | false | false | None | None | None |
| `http_headers` | HTTP headers to use for all responses from these URLs. An object containing a list of "key:value" value pairs.". | false | false | None | None | None |
| `mime_type` | MIME type used to serve all files served by this handler. Defaults to file-specific MIME types, which are derived from each file's filename extension. | false | false | None | None | None |
| `expiration` | Time a static file served by this handler should be cached by web proxies and browsers. A duration in seconds with up to nine fractional digits, terminated by 's'. Example "3.5s". | false | false | None | None | None |
| `require_matching_file` | Whether this handler should match the request if the file referenced by the handler does not exist. | false | false | None | None | None |
| `application_readable` | Whether files should also be uploaded as code data. By default, files declared in static file handlers are uploaded as static data and are only served to end users; they cannot be read by the application. If enabled, uploads are charged against both your code and static data storage resource quotas. | false | false | None | None | None |

### standard_scheduler_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_cpu_utilization` | Target CPU utilization ratio to maintain when scaling. Should be a value in the range [0.50, 0.95], zero, or a negative value. | false | false | None | None | None |
| `target_throughput_utilization` | Target throughput utilization ratio to maintain when scaling. Should be a value in the range [0.50, 0.95], zero, or a negative value. | false | false | None | None | None |
| `min_instances` | Minimum number of instances to run for this version. Set to zero to disable minInstances configuration. | false | false | None | None | None |
| `max_instances` | Maximum number of instances to run for this version. Set to zero to disable maxInstances configuration. **Note:** Starting from March 2025, App Engine sets the maxInstances default for standard environment deployments to 20. This change doesn't impact existing apps. To override the default, specify a new value between 0 and 2147483647, and deploy a new version or redeploy over an existing version. To disable the maxInstances default configuration setting, specify the maximum permitted value 2147483647. | false | false | None | None | None |
