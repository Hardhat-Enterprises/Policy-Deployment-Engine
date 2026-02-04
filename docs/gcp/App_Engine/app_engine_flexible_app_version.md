## 🛡️ Policy Deployment Engine: `app_engine_flexible_app_version`

This section provides a concise policy evaluation for the `app_engine_flexible_app_version` resource in GCP.

Reference: [Terraform Registry – app_engine_flexible_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_flexible_app_version)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `runtime` | Desired runtime. Example python27. | true | true | To ensure the application environment is patched against known vulnerabilities and remains compatible with organizational security tooling. | nodejs | python27 |
| `readiness_check` | Configures readiness health checking for instances. Unhealthy instances are not put into the backend traffic rotation. Structure is [documented below](#nested_readiness_check). | true | true | Mandates the configuration of health probes to ensure that the load balancer only routes traffic to fully initialized and healthy instances which prevents errors and ensures correct deployments. | None | None |
| `liveness_check` | Health checking configuration for VM instances. Unhealthy instances are killed and replaced with new instances. Structure is [documented below](#nested_liveness_check). | true | true | Enforces the configuration of liveness probes to detect deadlocked/zombie processes that are running but no longer functional, allowing the platform to automatically restart the instance and restore service health. | None | None |
| `service` | AppEngine service resource. Can contain numbers, letters, and hyphens. | true | true | Enforces explicit service naming to ensure that application components are logically isolated, preventing accidental resource overwrites. | default | unauthorized-app |
| `version_id` | Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-". | false | false | to allow CI/CD pipelines to dynamically generate unique identifiers, which is essential for maintaining an immutable audit trail and enabling safe rollbacks. | None | None |
| `inbound_services` | A list of the types of messages that this application is able to receive. Each value may be one of: `INBOUND_SERVICE_MAIL`, `INBOUND_SERVICE_MAIL_BOUNCE`, `INBOUND_SERVICE_XMPP_ERROR`, `INBOUND_SERVICE_XMPP_MESSAGE`, `INBOUND_SERVICE_XMPP_SUBSCRIBE`, `INBOUND_SERVICE_XMPP_PRESENCE`, `INBOUND_SERVICE_CHANNEL_PRESENCE`, `INBOUND_SERVICE_WARMUP`. | false | false | As primarily used to enable legacy App Engine services which are largely deprecated/irrelevant in the Flexible Environment, security for incoming traffic is instead governed by modern network and firewall policies. | None | None |
| `instance_class` | Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G ManualScaling: B1, B2, B4, B8, B4_1G Defaults to F1 for AutomaticScaling and B1 for ManualScaling. | false | false | It is a legacy parameter exclusive to the App Engine Standard environment. | None | None |
| `network` | Extra network settings Structure is [documented below](#nested_network). | false | false | App Engine Flexible automatically defaults to the 'default' VPC with managed settings and primary network security is better governed at the VPC and Firewall levels rather than through individual resource declarations. | None | None |
| `resources` | Machine resources for a version. Structure is [documented below](#nested_resources). | false | false | The hardware requirements are tied to the specific application's performance profile, imposing constraints would prevent right-sizing and could lead to resource starvation/unnecessary cloud spend. | None | None |
| `runtime_channel` | The channel of the runtime to use. Only available for some runtimes. | false | false | The platform defaults to the stable channel which ensures that applications run on production-ready environment binaries without requiring manual intervention or the risk of using experimental preview features. | None | None |
| `flexible_runtime_settings` | Runtime settings for App Engine flexible environment. Structure is [documented below](#nested_flexible_runtime_settings). | false | false | The settings are highly specific to individual language runtimes and typically govern performance tuning/debugging than compliance boundaries. | None | None |
| `beta_settings` | Metadata settings that are supplied to this version to enable beta runtime features. | false | false | Parameters are intended for temporary experimental features that are not yet part of the stable API. | None | None |
| `serving_status` | Current serving status of this version. Only the versions with a SERVING status create instances and can be billed. Default value is `SERVING`. Possible values are: `SERVING`, `STOPPED`. | false | false | As it governs the operational state of a version which must remain dynamic to allow automated deployments, traffic splitting and manual emergency interventions without triggering policy violations. | None | None |
| `runtime_api_version` | The version of the API in the given runtime environment. Please see the app.yaml reference for valid values at `https://cloud.google.com/appengine/docs/standard/<language>/config/appref`\ Substitute `<language>` with `python`, `java`, `php`, `ruby`, `go` or `nodejs`. | false | false | As managed internally by the selected runtime, enforcing a specific API version at the policy level would create unnecessary coupling between infrastructure code and language-specific internals. | None | None |
| `handlers` | An ordered list of URL-matching patterns that should be applied to incoming requests. The first matching URL handles the request and other request handlers are not attempted. Structure is [documented below](#nested_handlers). | false | false | Flexible Environment is container-based where routing and static file handling are managed internally by the application's web server. | None | None |
| `runtime_main_executable_path` | The path or name of the app's main executable. | false | false | Within a containerized Flexible environment the execution logic is better governed by the entrypoint or the container's internal configuration and enforcing a path would break standard deployment conventions for multi-language microservices. | None | None |
| `service_account` | The identity that the deployed version will run as. Admin API will use the App Engine Appspot service account as default if this field is neither provided in app.yaml file nor through CLI flag. | false | false | To allow developers to assign unique least-privileged identities to each microservice | None | None |
| `api_config` | Serving configuration for Google Cloud Endpoints. Structure is [documented below](#nested_api_config). | false | false | Is a legacy configuration for Google Cloud Endpoints Frameworks, this block would not be utilised. | None | None |
| `env_variables` | Environment variables available to the application.  As these are not returned in the API request, Terraform will not detect any changes made outside of the Terraform config. | false | false | Intrinsic to the application's runtime logic. | None | None |
| `default_expiration` | Duration that static files should be cached by web proxies and browsers. Only applicable if the corresponding StaticFilesHandler does not specify its own expiration time. | false | false | Cache-control requirements are dictated by the specific nature of the application's static assets. | None | None |
| `nobuild_files_regex` | Files that match this pattern will not be built into this version. Only applicable for Go runtimes. | false | false | File exclusion is more effectively managed via standardized version control ignore files and container-specific exclusion files. | None | None |
| `deployment` | Code and application artifacts that make up this version. Structure is [documented below](#nested_deployment). | false | true | Is enforced to ensure that every application version is derived from a verified immutable source (such as a specific container image or source code hash). | None | None |
| `endpoints_api_service` | Code and application artifacts that make up this version. Structure is [documented below](#nested_endpoints_api_service). | false | false | API management via Cloud Endpoints is a separate service layer with its own lifecycle. | None | None |
| `entrypoint` | The entrypoint for the application. Structure is [documented below](#nested_entrypoint). | false | true | Enforced to ensure that the application starts using a predefined command-string that adheres to organizational standards | None | None |
| `vpc_access_connector` | Enables VPC connectivity for standard apps. Structure is [documented below](#nested_vpc_access_connector). | false | false | To allow for architectural flexibility, while Serverless VPC Access is required for internal-only communication, as not all workloads require connectivity to VPC-hosted resources. | None | None |
| `automatic_scaling` | Automatic scaling is based on request rate, response latencies, and other application metrics. Structure is [documented below](#nested_automatic_scaling). | false | true | Enforced to ensure that every service can respond to traffic fluctuations while maintaining strict guardrails on resource consumption. | None | None |
| `manual_scaling` | A service with manual scaling runs continuously, allowing you to perform complex initialization and rely on the state of its memory over time. Structure is [documented below](#nested_manual_scaling). | false | false | Lacks the ability to adjust to real-time traffic changes, which can lead to unexpected traffic spikes. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | To automatically inherit the provider-level project ID | None | None |
| `noop_on_destroy` | If set to true, the application version will not be deleted. | false | false | Ensure that the Terraform state remains a truthful representation of the cloud environment. | None | None |
| `delete_service_on_destroy` | If set to true, the service will be deleted if it is the last version. | false | false | To prevent the accidental deletion of an entire service logical grouping when only a specific version is being decommissioned | None | None |
| `volumes` |  | false | false | None | None | None |
| `script` |  | false | false | None | None | None |
| `static_files` |  | false | false | None | None | None |
| `zip` | Zip | false | true | Ensure that source-based deployments utilize versioned objects stored in Google Cloud Storage. | None | None |
| `files` |  | false | false | None | None | None |
| `container` |  | false | false | None | None | None |
| `cloud_build_options` |  | false | false | None | None | None |
| `cpu_utilization` |  | false | false | None | None | None |
| `request_utilization` |  | false | false | None | None | None |
| `disk_utilization` |  | false | false | None | None | None |
| `network_utilization` |  | false | false | None | None | None |

### readiness_check Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The request path. | true | true | to enforce a specific dedicated health endpoint to ensure the load balancer validates the actual readiness of the application logic rather than just the availability of the web server/static landing page. | / | /invalid-path |
| `host` | Host header to send when performing a HTTP Readiness check. Example: "myapp.appspot.com" | false | false | App Engine routes health checks to the instance's internal IP, defining a host header is unnecessary and can inadvertently bypass internal security controls if misconfigured. | None | None |
| `failure_threshold` | Number of consecutive failed checks required before removing traffic. Default: 2. | false | true | Configures the specific tolerance level for failed health probes to prevent flapping. | failure_threshold = 4 | failure_threshold = 0 |
| `success_threshold` | Number of consecutive successful checks required before receiving traffic. Default: 2. | false | false | Google Cloud default is sufficiently conservative to prevent flapping and ensures an instance is stable before it is reintroduced to the load balancer. | None | None |
| `check_interval` | Interval between health checks.  Default: "5s". | false | false | As Google-managed default provides an optimal balance between rapid failure detection and the reduction of unnecessary noise. | None | None |
| `timeout` | Time before the check is considered failed. Default: "4s" | false | true | Enforces a strict upper limit on how long a health probe can wait for a response to ensure that stalled requests are terminated quickly to prevent them from clogging the application's request queue. | 4s | 30s |
| `app_start_timeout` | A maximum time limit on application initialization, measured from moment the application successfully replies to a healthcheck until it is ready to serve traffic. Default: "300s" | false | false | Application initialization times vary drastically based on language runtime, dependency loading, and cache warming requirements. | None | None |

### liveness_check Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The request path. | true | true | To enforce a specific dedicated health endpoint to ensure the load balancer validates the actual readiness of the application logic rather than just the availability of the web server/static landing page. | / | /invalid-path |
| `host` | Host header to send when performing a HTTP Readiness check. Example: "myapp.appspot.com" | false | false | App Engine routes health checks to the instance's internal IP, defining a host header is unnecessary and can inadvertently bypass internal security controls if misconfigured. | None | None |
| `failure_threshold` | Number of consecutive failed checks required before considering the VM unhealthy. Default: 4. | false | true | Configures the specific tolerance level for failed health probes to prevent flapping. | failure_threshold = 4 | failure_threshold = 0 |
| `success_threshold` | Number of consecutive successful checks required before considering the VM healthy. Default: 2. | false | false | Google Cloud default is sufficiently conservative to prevent flapping and ensures an instance is stable before it is reintroduced to the load balancer. | None | None |
| `check_interval` | Interval between health checks. | false | false | As Google-managed default provides an optimal balance between rapid failure detection and the reduction of unnecessary noise. | None | None |
| `timeout` | Time before the check is considered failed. Default: "4s" | false | true | Enforces a strict upper limit on how long a health probe can wait for a response to ensure that stalled requests are terminated quickly to prevent them from clogging the application's request queue. | 4s | 30s |
| `initial_delay` | The initial delay before starting to execute the checks. Default: "300s" | false | false | Enforcing a universal delay could lead to premature restarts of slow-starting but healthy applications. | None | None |

### network Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `forwarded_ports` | List of ports, or port pairs, to forward from the virtual machine to the application container. | false | false | None | None | None |
| `instance_ip_mode` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Prevent instances from receiving an ephemeral external IP address. Possible values are: `EXTERNAL`, `INTERNAL`. | false | false | None | None | None |
| `instance_tag` | Tag to apply to the instance during creation. | false | false | None | None | None |
| `name` | Google Compute Engine network where the virtual machines are created. Specify the short name, not the resource path. | true | false | None | None | None |
| `subnetwork` | Google Cloud Platform sub-network where the virtual machines are created. Specify the short name, not the resource path. If the network that the instance is being created in is a Legacy network, then the IP address is allocated from the IPv4Range. If the network that the instance is being created in is an auto Subnet Mode Network, then only network name should be specified (not the subnetworkName) and the IP address is created from the IPCidrRange of the subnetwork that exists in that zone for that network. If the network that the instance is being created in is a custom Subnet Mode Network, then the subnetworkName must be specified and the IP address is created from the IPCidrRange of the subnetwork. If specified, the subnetwork must exist in the same region as the App Engine flexible environment application. | false | false | None | None | None |
| `session_affinity` | Enable session affinity. | false | false | None | None | None |

### resources Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cpu` | Number of CPU cores needed. | false | false | None | None | None |
| `disk_gb` | Disk size (GB) needed. | false | false | None | None | None |
| `memory_gb` | Memory (GB) needed. | false | false | None | None | None |
| `volumes` | List of ports, or port pairs, to forward from the virtual machine to the application container. Structure is [documented below](#nested_resources_volumes). | false | false | None | None | None |

### flexible_runtime_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `operating_system` | Operating System of the application runtime. | false | false | None | None | None |
| `runtime_version` | The runtime version of an App Engine flexible application. | false | false | None | None | None |

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

### api_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `auth_fail_action` | Action to take when users access resources that require authentication. Default value is `AUTH_FAIL_ACTION_REDIRECT`. Possible values are: `AUTH_FAIL_ACTION_REDIRECT`, `AUTH_FAIL_ACTION_UNAUTHORIZED`. | false | false | None | None | None |
| `login` | Level of login required to access this resource. Default value is `LOGIN_OPTIONAL`. Possible values are: `LOGIN_OPTIONAL`, `LOGIN_ADMIN`, `LOGIN_REQUIRED`. | false | false | None | None | None |
| `script` | Path to the script from the application root directory. | true | false | None | None | None |
| `security_level` | Security (HTTPS) enforcement for this URL. Possible values are: `SECURE_DEFAULT`, `SECURE_NEVER`, `SECURE_OPTIONAL`, `SECURE_ALWAYS`. | false | false | None | None | None |
| `url` | URL to serve the endpoint at. | false | false | None | None | None |

### deployment Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `zip` | Zip File Structure is [documented below](#nested_deployment_zip). | false | true | Ensure that source-based deployments utilize versioned objects stored in Google Cloud Storage | None | None |
| `files` | Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call. Structure is [documented below](#nested_deployment_files). | false | false | individual file-level declarations are redundant when deploying via comprehensive archives or Container Images | None | None |
| `container` | The Docker image for the container that runs the version. Structure is [documented below](#nested_deployment_container). | false | false | To prevent configuration overlap, as in workflows where source code is the primary artifact the platform automatically generates the container via Cloud Build. | None | None |
| `cloud_build_options` | Options for the build operations performed as a part of the version deployment. Only applicable when creating a version using source code directly. Structure is [documented below](#nested_deployment_cloud_build_options). | false | false | Build-time configuration is an operational concern distinct from the application's runtime security posture. | None | None |

### endpoints_api_service Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Endpoints service name which is the name of the "service" resource in the Service Management API. For example "myapi.endpoints.myproject.cloud.goog" | true | false | None | None | None |
| `config_id` | Endpoints service configuration ID as specified by the Service Management API. For example "2016-09-19r1". By default, the rollout strategy for Endpoints is "FIXED". This means that Endpoints starts up with a particular configuration ID. When a new configuration is rolled out, Endpoints must be given the new configuration ID. The configId field is used to give the configuration ID and is required in this case. Endpoints also has a rollout strategy called "MANAGED". When using this, Endpoints fetches the latest configuration and does not need the configuration ID. In this case, configId must be omitted. | false | false | None | None | None |
| `rollout_strategy` | Endpoints rollout strategy. If FIXED, configId must be specified. If MANAGED, configId must be omitted. Default value is `FIXED`. Possible values are: `FIXED`, `MANAGED`. | false | false | None | None | None |
| `disable_trace_sampling` | Enable or disable trace sampling. By default, this is set to false for enabled. | false | false | None | None | None |

### entrypoint Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `shell` | The format should be a shell command that can be fed to bash -c. | true | true | Enforced to restrict/standardize the scripts executed during the deployment phase | node ./app.js | sudo node ./app.js |

### vpc_access_connector Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Full Serverless VPC Access Connector name e.g. /projects/my-project/locations/us-central1/connectors/c1. | true | false | None | None | None |

### automatic_scaling Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cool_down_period` | The time period that the Autoscaler should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. Default: 120s | false | false | Prevents the App Engine autoscaler from reacting to sudden traffic spikes as new instances are ignored until the period ends. | None | None |
| `cpu_utilization` | Target scaling by CPU usage. Structure is [documented below](#nested_automatic_scaling_cpu_utilization). | true | true | Enforced to establish a standardized trigger for horizontal scaling, which ensures that the system proactively adds capacity before CPU saturation leads to increased request latency/service instability | target_utilization = 0.5 | target_utilization = 0.9 |
| `max_concurrent_requests` | Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. Defaults to a runtime-specific value. | false | false | Can lead to under-utilisation and higher costs by triggering the creation of new instances before the existing ones are actually CPU/memory constrained. | None | None |
| `max_idle_instances` | Maximum number of idle instances that should be maintained for this version. | false | false | Autoscaler manages idle instances automatically by default, also manually capping too low can cause performance degradation during volatile traffic spikes. | None | None |
| `max_total_instances` | Maximum number of instances that should be started to handle requests for this version. Default: 20 | false | false | Avoid denial-of-service scenarios, as the application cannot scale to meet a legitimate traffic surge and resulting in request timeouts/503 errors. | None | None |
| `max_pending_latency` | Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. | false | false | Forces requests to sit in a queue for too long before the App Engine autoscaler triggers a new instance. | None | None |
| `min_idle_instances` | Minimum number of idle instances that should be maintained for this version. Only applicable for the default version of a service. | false | false | To ensure the App Engine autoscaler can ingest performance metrics during traffic surges. | None | None |
| `min_total_instances` | Minimum number of running instances that should be maintained for this version. Default: 2 | false | false | To ensure of allowing the environment to fully de-provision resources during periods of zero activity. | None | None |
| `min_pending_latency` | Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. | false | false | Optimal wait time before scaling is highly dependent on a specific workload | None | None |
| `request_utilization` | Target scaling by request utilization. Structure is [documented below](#nested_automatic_scaling_request_utilization). | false | false | Can be unreliable if request processing times vary whereas relying on CPU utilisation provides a more accurate measure of when an instance is actually working at its limit. | None | None |
| `disk_utilization` | Target scaling by disk usage. Structure is [documented below](#nested_automatic_scaling_disk_utilization). | false | false | Typically bottlenecked by CPU or memory rather than storage. | None | None |
| `network_utilization` | Target scaling by network usage. Structure is [documented below](#nested_automatic_scaling_network_utilization). | false | false | Scaling based on data throughput can be highly inconsistent while CPU-based scaling provides a more stable and accurate signal for when an instance is reaching its operational capacity. | None | None |

### manual_scaling Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `instances` | Number of instances to assign to the service at the start. **Note:** When managing the number of instances at runtime through the App Engine Admin API or the (now deprecated) Python 2 Modules API set_num_instances() you must use `lifecycle.ignore_changes = ["manual_scaling"[0].instances]` to prevent drift detection. | true | false | None | None | None |

### volumes Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Unique name for the volume. | true | false | None | None | None |
| `volume_type` | Underlying volume type, e.g. 'tmpfs'. | true | false | None | None | None |
| `size_gb` | Volume size in gigabytes. | true | false | None | None | None |

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
| `expiration` | Time a static file served by this handler should be cached by web proxies and browsers. A duration in seconds with up to nine fractional digits, terminated by 's'. Example "3.5s". Default is '0s' | false | false | None | None | None |
| `require_matching_file` | Whether this handler should match the request if the file referenced by the handler does not exist. | false | false | None | None | None |
| `application_readable` | Whether files should also be uploaded as code data. By default, files declared in static file handlers are uploaded as static data and are only served to end users; they cannot be read by the application. If enabled, uploads are charged against both your code and static data storage resource quotas. | false | false | None | None | None |

### zip Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `source_url` | Source URL | true | true | To ensure that the application's source code is retrieved from a managed version-controlled repository, using an immutable path. | https://storage.googleapis.com/hardhat-bucket/hello-world.zip | invalid.com |
| `files_count` | files count | false | false | None | None | None |

### files Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` |  | false | false | None | None | None |
| `sha1_sum` | SHA1 checksum of the file | false | false | None | None | None |
| `source_url` | Source URL | true | false | None | None | None |

### container Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `image` | URI to the hosted container image in Google Container Registry. The URI must be fully qualified and include a tag or digest. Examples: "gcr.io/my-project/image:tag" or "gcr.io/my-project/image@digest" | true | false | None | None | None |

### cloud_build_options Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `app_yaml_path` | Path to the yaml file used in deployment, used to determine runtime configuration details. | true | false | None | None | None |
| `cloud_build_timeout` | The Cloud Build timeout used as part of any dependent builds performed by version creation. Defaults to 10 minutes. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |

### cpu_utilization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `aggregation_window_length` | Period of time over which CPU utilization is calculated. | false | false | None | None | None |
| `target_utilization` | Target CPU utilization ratio to maintain when scaling. Must be between 0 and 1. | true | false | None | None | None |

### request_utilization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_request_count_per_second` | Target requests per second. | false | false | None | None | None |
| `target_concurrent_requests` | Target number of concurrent requests. | false | false | None | None | None |

### disk_utilization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_write_bytes_per_second` | Target bytes written per second. | false | false | None | None | None |
| `target_write_ops_per_second` | Target ops written per second. | false | false | None | None | None |
| `target_read_bytes_per_second` | Target bytes read per second. | false | false | None | None | None |
| `target_read_ops_per_second` | Target ops read per seconds. | false | false | None | None | None |

### network_utilization Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_sent_bytes_per_second` | Target bytes sent per second. | false | false | None | None | None |
| `target_sent_packets_per_second` | Target packets sent per second. | false | false | None | None | None |
| `target_received_bytes_per_second` | Target bytes received per second. | false | false | None | None | None |
| `target_received_packets_per_second` | Target packets received per second. | false | false | None | None | None |
