## 🛡️ Policy Deployment Engine: `app_engine_flexible_app_version`

This section provides a concise policy evaluation for the `app_engine_flexible_app_version` resource in GCP.

Reference: [Terraform Registry – app_engine_flexible_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_flexible_app_version)

---

## 1. Argument Reference

### `runtime`
- Description: (Required) Desired runtime. Example python27.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `readiness_check`
- Description: (Required) Configures readiness health checking for instances. Unhealthy instances are not put into the backend traffic rotation. Structure is [documented below](#nested_readiness_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `liveness_check`
- Description: (Required) Health checking configuration for VM instances. Unhealthy instances are killed and replaced with new instances. Structure is [documented below](#nested_liveness_check).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) AppEngine service resource. Can contain numbers, letters, and hyphens.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version_id`
- Description: (Optional) Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inbound_services`
- Description: (Optional) A list of the types of messages that this application is able to receive. Each value may be one of: `INBOUND_SERVICE_MAIL`, `INBOUND_SERVICE_MAIL_BOUNCE`, `INBOUND_SERVICE_XMPP_ERROR`, `INBOUND_SERVICE_XMPP_MESSAGE`, `INBOUND_SERVICE_XMPP_SUBSCRIBE`, `INBOUND_SERVICE_XMPP_PRESENCE`, `INBOUND_SERVICE_CHANNEL_PRESENCE`, `INBOUND_SERVICE_WARMUP`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_class`
- Description: (Optional) Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G ManualScaling: B1, B2, B4, B8, B4_1G Defaults to F1 for AutomaticScaling and B1 for ManualScaling.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) Extra network settings Structure is [documented below](#nested_network).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resources`
- Description: (Optional) Machine resources for a version. Structure is [documented below](#nested_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_channel`
- Description: (Optional) The channel of the runtime to use. Only available for some runtimes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `flexible_runtime_settings`
- Description: (Optional) Runtime settings for App Engine flexible environment. Structure is [documented below](#nested_flexible_runtime_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `beta_settings`
- Description: (Optional) Metadata settings that are supplied to this version to enable beta runtime features.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serving_status`
- Description: (Optional) Current serving status of this version. Only the versions with a SERVING status create instances and can be billed. Default value is `SERVING`. Possible values are: `SERVING`, `STOPPED`.
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

### `runtime_main_executable_path`
- Description: (Optional) The path or name of the app's main executable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) The identity that the deployed version will run as. Admin API will use the App Engine Appspot service account as default if this field is neither provided in app.yaml file nor through CLI flag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_config`
- Description: (Optional) Serving configuration for Google Cloud Endpoints. Structure is [documented below](#nested_api_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env_variables`
- Description: (Optional) Environment variables available to the application.  As these are not returned in the API request, Terraform will not detect any changes made outside of the Terraform config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_expiration`
- Description: (Optional) Duration that static files should be cached by web proxies and browsers. Only applicable if the corresponding StaticFilesHandler does not specify its own expiration time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nobuild_files_regex`
- Description: (Optional) Files that match this pattern will not be built into this version. Only applicable for Go runtimes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment`
- Description: (Optional) Code and application artifacts that make up this version. Structure is [documented below](#nested_deployment).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoints_api_service`
- Description: (Optional) Code and application artifacts that make up this version. Structure is [documented below](#nested_endpoints_api_service).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entrypoint`
- Description: (Optional) The entrypoint for the application. Structure is [documented below](#nested_entrypoint).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vpc_access_connector`
- Description: (Optional) Enables VPC connectivity for standard apps. Structure is [documented below](#nested_vpc_access_connector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automatic_scaling`
- Description: (Optional) Automatic scaling is based on request rate, response latencies, and other application metrics. Structure is [documented below](#nested_automatic_scaling).
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
- Description: <a name="nested_readiness_check"></a>The `readiness_check` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) The request path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) Host header to send when performing a HTTP Readiness check. Example: "myapp.appspot.com"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failure_threshold`
- Description: (Optional) Number of consecutive failed checks required before removing traffic. Default: 2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `success_threshold`
- Description: (Optional) Number of consecutive successful checks required before receiving traffic. Default: 2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `check_interval`
- Description: (Optional) Interval between health checks.  Default: "5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Time before the check is considered failed. Default: "4s"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_start_timeout`
- Description: (Optional) A maximum time limit on application initialization, measured from moment the application successfully replies to a healthcheck until it is ready to serve traffic. Default: "300s" <a name="nested_liveness_check"></a>The `liveness_check` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) The request path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) Host header to send when performing a HTTP Readiness check. Example: "myapp.appspot.com"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `failure_threshold`
- Description: (Optional) Number of consecutive failed checks required before considering the VM unhealthy. Default: 4.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `success_threshold`
- Description: (Optional) Number of consecutive successful checks required before considering the VM healthy. Default: 2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `check_interval`
- Description: (Optional) Interval between health checks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Time before the check is considered failed. Default: "4s"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_delay`
- Description: (Optional) The initial delay before starting to execute the checks. Default: "300s" <a name="nested_network"></a>The `network` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forwarded_ports`
- Description: (Optional) List of ports, or port pairs, to forward from the virtual machine to the application container.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_ip_mode`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Prevent instances from receiving an ephemeral external IP address. Possible values are: `EXTERNAL`, `INTERNAL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_tag`
- Description: (Optional) Tag to apply to the instance during creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Google Compute Engine network where the virtual machines are created. Specify the short name, not the resource path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: (Optional) Google Cloud Platform sub-network where the virtual machines are created. Specify the short name, not the resource path. If the network that the instance is being created in is a Legacy network, then the IP address is allocated from the IPv4Range. If the network that the instance is being created in is an auto Subnet Mode Network, then only network name should be specified (not the subnetworkName) and the IP address is created from the IPCidrRange of the subnetwork that exists in that zone for that network. If the network that the instance is being created in is a custom Subnet Mode Network, then the subnetworkName must be specified and the IP address is created from the IPCidrRange of the subnetwork. If specified, the subnetwork must exist in the same region as the App Engine flexible environment application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_affinity`
- Description: (Optional) Enable session affinity. <a name="nested_resources"></a>The `resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu`
- Description: (Optional) Number of CPU cores needed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_gb`
- Description: (Optional) Disk size (GB) needed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_gb`
- Description: (Optional) Memory (GB) needed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volumes`
- Description: (Optional) List of ports, or port pairs, to forward from the virtual machine to the application container. Structure is [documented below](#nested_resources_volumes). <a name="nested_resources_volumes"></a>The `volumes` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Unique name for the volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_type`
- Description: (Required) Underlying volume type, e.g. 'tmpfs'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size_gb`
- Description: (Required) Volume size in gigabytes. <a name="nested_flexible_runtime_settings"></a>The `flexible_runtime_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operating_system`
- Description: (Optional) Operating System of the application runtime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_version`
- Description: (Optional) The runtime version of an App Engine flexible application. <a name="nested_handlers"></a>The `handlers` block supports:
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
- Description: (Optional) Time a static file served by this handler should be cached by web proxies and browsers. A duration in seconds with up to nine fractional digits, terminated by 's'. Example "3.5s". Default is '0s'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `require_matching_file`
- Description: (Optional) Whether this handler should match the request if the file referenced by the handler does not exist.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_readable`
- Description: (Optional) Whether files should also be uploaded as code data. By default, files declared in static file handlers are uploaded as static data and are only served to end users; they cannot be read by the application. If enabled, uploads are charged against both your code and static data storage resource quotas. <a name="nested_api_config"></a>The `api_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_fail_action`
- Description: (Optional) Action to take when users access resources that require authentication. Default value is `AUTH_FAIL_ACTION_REDIRECT`. Possible values are: `AUTH_FAIL_ACTION_REDIRECT`, `AUTH_FAIL_ACTION_UNAUTHORIZED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `login`
- Description: (Optional) Level of login required to access this resource. Default value is `LOGIN_OPTIONAL`. Possible values are: `LOGIN_OPTIONAL`, `LOGIN_ADMIN`, `LOGIN_REQUIRED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `script`
- Description: (Required) Path to the script from the application root directory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_level`
- Description: (Optional) Security (HTTPS) enforcement for this URL. Possible values are: `SECURE_DEFAULT`, `SECURE_NEVER`, `SECURE_OPTIONAL`, `SECURE_ALWAYS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Optional) URL to serve the endpoint at. <a name="nested_deployment"></a>The `deployment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zip`
- Description: (Optional) Zip File Structure is [documented below](#nested_deployment_zip).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `files`
- Description: (Optional) Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call. Structure is [documented below](#nested_deployment_files).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container`
- Description: (Optional) The Docker image for the container that runs the version. Structure is [documented below](#nested_deployment_container).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_build_options`
- Description: (Optional) Options for the build operations performed as a part of the version deployment. Only applicable when creating a version using source code directly. Structure is [documented below](#nested_deployment_cloud_build_options). <a name="nested_deployment_zip"></a>The `zip` block supports:
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
- Description: (Required) Source URL <a name="nested_deployment_container"></a>The `container` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Required) URI to the hosted container image in Google Container Registry. The URI must be fully qualified and include a tag or digest. Examples: "gcr.io/my-project/image:tag" or "gcr.io/my-project/image@digest" <a name="nested_deployment_cloud_build_options"></a>The `cloud_build_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `app_yaml_path`
- Description: (Required) Path to the yaml file used in deployment, used to determine runtime configuration details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_build_timeout`
- Description: (Optional) The Cloud Build timeout used as part of any dependent builds performed by version creation. Defaults to 10 minutes. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". <a name="nested_endpoints_api_service"></a>The `endpoints_api_service` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Endpoints service name which is the name of the "service" resource in the Service Management API. For example "myapi.endpoints.myproject.cloud.goog"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_id`
- Description: (Optional) Endpoints service configuration ID as specified by the Service Management API. For example "2016-09-19r1". By default, the rollout strategy for Endpoints is "FIXED". This means that Endpoints starts up with a particular configuration ID. When a new configuration is rolled out, Endpoints must be given the new configuration ID. The configId field is used to give the configuration ID and is required in this case. Endpoints also has a rollout strategy called "MANAGED". When using this, Endpoints fetches the latest configuration and does not need the configuration ID. In this case, configId must be omitted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollout_strategy`
- Description: (Optional) Endpoints rollout strategy. If FIXED, configId must be specified. If MANAGED, configId must be omitted. Default value is `FIXED`. Possible values are: `FIXED`, `MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_trace_sampling`
- Description: (Optional) Enable or disable trace sampling. By default, this is set to false for enabled. <a name="nested_entrypoint"></a>The `entrypoint` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shell`
- Description: (Required) The format should be a shell command that can be fed to bash -c. <a name="nested_vpc_access_connector"></a>The `vpc_access_connector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Full Serverless VPC Access Connector name e.g. /projects/my-project/locations/us-central1/connectors/c1. <a name="nested_automatic_scaling"></a>The `automatic_scaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cool_down_period`
- Description: (Optional) The time period that the Autoscaler should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. Default: 120s
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_utilization`
- Description: (Required) Target scaling by CPU usage. Structure is [documented below](#nested_automatic_scaling_cpu_utilization).
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

### `max_total_instances`
- Description: (Optional) Maximum number of instances that should be started to handle requests for this version. Default: 20
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_pending_latency`
- Description: (Optional) Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_idle_instances`
- Description: (Optional) Minimum number of idle instances that should be maintained for this version. Only applicable for the default version of a service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_total_instances`
- Description: (Optional) Minimum number of running instances that should be maintained for this version. Default: 2
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_pending_latency`
- Description: (Optional) Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_utilization`
- Description: (Optional) Target scaling by request utilization. Structure is [documented below](#nested_automatic_scaling_request_utilization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_utilization`
- Description: (Optional) Target scaling by disk usage. Structure is [documented below](#nested_automatic_scaling_disk_utilization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_utilization`
- Description: (Optional) Target scaling by network usage. Structure is [documented below](#nested_automatic_scaling_network_utilization). <a name="nested_automatic_scaling_cpu_utilization"></a>The `cpu_utilization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aggregation_window_length`
- Description: (Optional) Period of time over which CPU utilization is calculated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_utilization`
- Description: (Required) Target CPU utilization ratio to maintain when scaling. Must be between 0 and 1. <a name="nested_automatic_scaling_request_utilization"></a>The `request_utilization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_request_count_per_second`
- Description: (Optional) Target requests per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_concurrent_requests`
- Description: (Optional) Target number of concurrent requests. <a name="nested_automatic_scaling_disk_utilization"></a>The `disk_utilization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_write_bytes_per_second`
- Description: (Optional) Target bytes written per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_write_ops_per_second`
- Description: (Optional) Target ops written per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_read_bytes_per_second`
- Description: (Optional) Target bytes read per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_read_ops_per_second`
- Description: (Optional) Target ops read per seconds. <a name="nested_automatic_scaling_network_utilization"></a>The `network_utilization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_sent_bytes_per_second`
- Description: (Optional) Target bytes sent per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_sent_packets_per_second`
- Description: (Optional) Target packets sent per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_received_bytes_per_second`
- Description: (Optional) Target bytes received per second.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_received_packets_per_second`
- Description: (Optional) Target packets received per second. <a name="nested_manual_scaling"></a>The `manual_scaling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: (Required) Number of instances to assign to the service at the start. **Note:** When managing the number of instances at runtime through the App Engine Admin API or the (now deprecated) Python 2 Modules API set_num_instances() you must use `lifecycle.ignore_changes = ["manual_scaling"[0].instances]` to prevent drift detection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
