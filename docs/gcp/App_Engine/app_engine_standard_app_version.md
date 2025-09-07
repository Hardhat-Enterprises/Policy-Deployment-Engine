## 🛡️ Policy Deployment Engine: `app_engine_standard_app_version`

This section provides a concise policy evaluation for the `app_engine_standard_app_version` resource in GCP.

Reference: [Terraform Registry – app_engine_standard_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_standard_app_version)

---

## 1. Argument Reference

### `runtime`
- Description: (Required) Desired runtime. Example python27.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment`
- Description: (Required) Code and application artifacts that make up this version. Structure is [documented below](#nested_deployment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entrypoint`
- Description: (Required) The entrypoint for the application. Structure is [documented below](#nested_entrypoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) AppEngine service resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version_id`
- Description: (Optional) Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The identity that the deployed version will run as. Admin API will use the App Engine Appspot service account as default if this field is neither provided in app.yaml file nor through CLI flag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threadsafe`
- Description: (Optional) Whether multiple requests can be dispatched to this version at once.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_engine_apis`
- Description: (Optional) Allows App Engine second generation runtimes to access the legacy bundled services.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_api_version`
- Description: (Optional) The version of the API in the given runtime environment. Please see the app.yaml reference for valid values at `https://cloud.google.com/appengine/docs/standard/<language>/config/appref`\ Substitute `<language>` with `python`, `java`, `php`, `ruby`, `go` or `nodejs`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `handlers`
- Description: (Optional) An ordered list of URL-matching patterns that should be applied to incoming requests. The first matching URL handles the request and other request handlers are not attempted. Structure is [documented below](#nested_handlers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `libraries`
- Description: (Optional) Configuration for third-party Python runtime libraries that are required by the application. Structure is [documented below](#nested_libraries).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env_variables`
- Description: (Optional) Environment variables available to the application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_access_connector`
- Description: (Optional) Enables VPC connectivity for standard apps. Structure is [documented below](#nested_vpc_access_connector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inbound_services`
- Description: (Optional) A list of the types of messages that this application is able to receive. Each value may be one of: `INBOUND_SERVICE_MAIL`, `INBOUND_SERVICE_MAIL_BOUNCE`, `INBOUND_SERVICE_XMPP_ERROR`, `INBOUND_SERVICE_XMPP_MESSAGE`, `INBOUND_SERVICE_XMPP_SUBSCRIBE`, `INBOUND_SERVICE_XMPP_PRESENCE`, `INBOUND_SERVICE_CHANNEL_PRESENCE`, `INBOUND_SERVICE_WARMUP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_class`
- Description: (Optional) Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G BasicScaling or ManualScaling: B1, B2, B4, B4_1G, B8 Defaults to F1 for AutomaticScaling and B2 for ManualScaling and BasicScaling. If no scaling is specified, AutomaticScaling is chosen.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automatic_scaling`
- Description: (Optional) Automatic scaling is based on request rate, response latencies, and other application metrics. Structure is [documented below](#nested_automatic_scaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `basic_scaling`
- Description: (Optional) Basic scaling creates instances when your application receives requests. Each instance will be shut down when the application becomes idle. Basic scaling is ideal for work that is intermittent or driven by user activity. Structure is [documented below](#nested_basic_scaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual_scaling`
- Description: (Optional) A service with manual scaling runs continuously, allowing you to perform complex initialization and rely on the state of its memory over time. Structure is [documented below](#nested_manual_scaling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `noop_on_destroy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_service_on_destroy`
- Description: <a name="nested_deployment"></a>The `deployment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zip`
- Description: (Optional) Zip File Structure is [documented below](#nested_deployment_zip).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `files`
- Description: (Optional) Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call. Structure is [documented below](#nested_deployment_files). <a name="nested_deployment_zip"></a>The `zip` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_url`
- Description: (Required) Source URL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `files_count`
- Description: (Optional) files count <a name="nested_deployment_files"></a>The `files` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sha1_sum`
- Description: (Optional) SHA1 checksum of the file
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_url`
- Description: (Required) Source URL <a name="nested_entrypoint"></a>The `entrypoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shell`
- Description: (Required) The format should be a shell command that can be fed to bash -c. <a name="nested_handlers"></a>The `handlers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url_regex`
- Description: (Optional) URL prefix. Uses regular expression syntax, which means regexp special characters must be escaped, but should not contain groupings. All URLs that begin with this prefix are handled by this handler, using the portion of the URL after the prefix as part of the file path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_level`
- Description: (Optional) Security (HTTPS) enforcement for this URL. Possible values are: `SECURE_DEFAULT`, `SECURE_NEVER`, `SECURE_OPTIONAL`, `SECURE_ALWAYS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `login`
- Description: (Optional) Methods to restrict access to a URL based on login status. Possible values are: `LOGIN_OPTIONAL`, `LOGIN_ADMIN`, `LOGIN_REQUIRED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_fail_action`
- Description: (Optional) Actions to take when the user is not logged in. Possible values are: `AUTH_FAIL_ACTION_REDIRECT`, `AUTH_FAIL_ACTION_UNAUTHORIZED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redirect_http_response_code`
- Description: (Optional) 30x code to use when performing redirects for the secure field. Possible values are: `REDIRECT_HTTP_RESPONSE_CODE_301`, `REDIRECT_HTTP_RESPONSE_CODE_302`, `REDIRECT_HTTP_RESPONSE_CODE_303`, `REDIRECT_HTTP_RESPONSE_CODE_307`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script`
- Description: (Optional) Executes a script to handle the requests that match this URL pattern. Only the auto value is supported for Node.js in the App Engine standard environment, for example "script:" "auto". Structure is [documented below](#nested_handlers_handlers_script).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `static_files`
- Description: (Optional) Files served directly to the user for a given URL, such as images, CSS stylesheets, or JavaScript source files. Static file handlers describe which files in the application directory are static files, and which URLs serve them. Structure is [documented below](#nested_handlers_handlers_static_files). <a name="nested_handlers_handlers_script"></a>The `script` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script_path`
- Description: (Required) Path to the script from the application root directory. <a name="nested_handlers_handlers_static_files"></a>The `static_files` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Optional) Path to the static files matched by the URL pattern, from the application root directory. The path can refer to text matched in groupings in the URL pattern.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upload_path_regex`
- Description: (Optional) Regular expression that matches the file paths for all files that should be referenced by this handler.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_headers`
- Description: (Optional) HTTP headers to use for all responses from these URLs. An object containing a list of "key:value" value pairs.".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mime_type`
- Description: (Optional) MIME type used to serve all files served by this handler. Defaults to file-specific MIME types, which are derived from each file's filename extension.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration`
- Description: (Optional) Time a static file served by this handler should be cached by web proxies and browsers. A duration in seconds with up to nine fractional digits, terminated by 's'. Example "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_matching_file`
- Description: (Optional) Whether this handler should match the request if the file referenced by the handler does not exist.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_readable`
- Description: (Optional) Whether files should also be uploaded as code data. By default, files declared in static file handlers are uploaded as static data and are only served to end users; they cannot be read by the application. If enabled, uploads are charged against both your code and static data storage resource quotas. <a name="nested_libraries"></a>The `libraries` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) Name of the library. Example "django".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of the library to select, or "latest". <a name="nested_vpc_access_connector"></a>The `vpc_access_connector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Full Serverless VPC Access Connector name e.g. /projects/my-project/locations/us-central1/connectors/c1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `egress_setting`
- Description: (Optional) The egress setting for the connector, controlling what traffic is diverted through it. <a name="nested_automatic_scaling"></a>The `automatic_scaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_concurrent_requests`
- Description: (Optional) Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. Defaults to a runtime-specific value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_idle_instances`
- Description: (Optional) Maximum number of idle instances that should be maintained for this version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_pending_latency`
- Description: (Optional) Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_idle_instances`
- Description: (Optional) Minimum number of idle instances that should be maintained for this version. Only applicable for the default version of a service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_pending_latency`
- Description: (Optional) Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standard_scheduler_settings`
- Description: (Optional) Scheduler settings for standard environment. Structure is [documented below](#nested_automatic_scaling_standard_scheduler_settings). <a name="nested_automatic_scaling_standard_scheduler_settings"></a>The `standard_scheduler_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_cpu_utilization`
- Description: (Optional) Target CPU utilization ratio to maintain when scaling. Should be a value in the range [0.50, 0.95], zero, or a negative value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_throughput_utilization`
- Description: (Optional) Target throughput utilization ratio to maintain when scaling. Should be a value in the range [0.50, 0.95], zero, or a negative value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_instances`
- Description: (Optional) Minimum number of instances to run for this version. Set to zero to disable minInstances configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_instances`
- Description: (Optional) Maximum number of instances to run for this version. Set to zero to disable maxInstances configuration. **Note:** Starting from March 2025, App Engine sets the maxInstances default for standard environment deployments to 20. This change doesn't impact existing apps. To override the default, specify a new value between 0 and 2147483647, and deploy a new version or redeploy over an existing version. To disable the maxInstances default configuration setting, specify the maximum permitted value 2147483647. <a name="nested_basic_scaling"></a>The `basic_scaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_timeout`
- Description: (Optional) Duration of time after the last request that an instance must wait before the instance is shut down. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Defaults to 900s.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_instances`
- Description: (Required) Maximum number of instances to create for this version. Must be in the range [1.0, 200.0]. <a name="nested_manual_scaling"></a>The `manual_scaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: (Required) Number of instances to assign to the service at the start. **Note:** When managing the number of instances at runtime through the App Engine Admin API or the (now deprecated) Python 2 Modules API set_num_instances() you must use `lifecycle.ignore_changes = ["manual_scaling"[0].instances]` to prevent drift detection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
