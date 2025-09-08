## 🛡️ Policy Deployment Engine: `app_engine_flexible_app_version`

This section provides a concise policy evaluation for the `app_engine_flexible_app_version` resource in GCP.

Reference: [Terraform Registry – app_engine_flexible_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_flexible_app_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `runtime` | Desired runtime. Example python27. | true | None | None |
| `service` | AppEngine service resource. Can contain numbers, letters, and hyphens. | true | None | None |
| `version_id` | Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-". | false | None | None |
| `inbound_services` | A list of the types of messages that this application is able to receive. Each value may be one of: `INBOUND_SERVICE_MAIL`, `INBOUND_SERVICE_MAIL_BOUNCE`, `INBOUND_SERVICE_XMPP_ERROR`, `INBOUND_SERVICE_XMPP_MESSAGE`, `INBOUND_SERVICE_XMPP_SUBSCRIBE`, `INBOUND_SERVICE_XMPP_PRESENCE`, `INBOUND_SERVICE_CHANNEL_PRESENCE`, `INBOUND_SERVICE_WARMUP`. | false | None | None |
| `instance_class` | Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G ManualScaling: B1, B2, B4, B8, B4_1G Defaults to F1 for AutomaticScaling and B1 for ManualScaling. | false | None | None |
| `runtime_channel` | The channel of the runtime to use. Only available for some runtimes. | false | None | None |
| `beta_settings` | Metadata settings that are supplied to this version to enable beta runtime features. | false | None | None |
| `serving_status` | Current serving status of this version. Only the versions with a SERVING status create instances and can be billed. Default value is `SERVING`. Possible values are: `SERVING`, `STOPPED`. | false | None | None |
| `runtime_api_version` | The version of the API in the given runtime environment. Please see the app.yaml reference for valid values at `https://cloud.google.com/appengine/docs/standard/<language>/config/appref`\ Substitute `<language>` with `python`, `java`, `php`, `ruby`, `go` or `nodejs`. | false | None | None |
| `runtime_main_executable_path` | The path or name of the app's main executable. | false | None | None |
| `service_account` | The identity that the deployed version will run as. Admin API will use the App Engine Appspot service account as default if this field is neither provided in app.yaml file nor through CLI flag. | false | None | None |
| `env_variables` | Environment variables available to the application.  As these are not returned in the API request, Terraform will not detect any changes made outside of the Terraform config. | false | None | None |
| `default_expiration` | Duration that static files should be cached by web proxies and browsers. Only applicable if the corresponding StaticFilesHandler does not specify its own expiration time. | false | None | None |
| `nobuild_files_regex` | Files that match this pattern will not be built into this version. Only applicable for Go runtimes. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `noop_on_destroy` |  | none | None | None |
| `delete_service_on_destroy` |  | none | None | None |

### readiness_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | The request path. | true | None | None |
| `host` | Host header to send when performing a HTTP Readiness check. Example: "myapp.appspot.com" | false | None | None |
| `failure_threshold` | Number of consecutive failed checks required before removing traffic. Default: 2. | false | None | None |
| `success_threshold` | Number of consecutive successful checks required before receiving traffic. Default: 2. | false | None | None |
| `check_interval` | Interval between health checks.  Default: "5s". | false | None | None |
| `timeout` | Time before the check is considered failed. Default: "4s" | false | None | None |
| `app_start_timeout` | A maximum time limit on application initialization, measured from moment the application successfully replies to a healthcheck until it is ready to serve traffic. Default: "300s" | false | None | None |

### liveness_check Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | The request path. | true | None | None |
| `host` | Host header to send when performing a HTTP Readiness check. Example: "myapp.appspot.com" | false | None | None |
| `failure_threshold` | Number of consecutive failed checks required before considering the VM unhealthy. Default: 4. | false | None | None |
| `success_threshold` | Number of consecutive successful checks required before considering the VM healthy. Default: 2. | false | None | None |
| `check_interval` | Interval between health checks. | false | None | None |
| `timeout` | Time before the check is considered failed. Default: "4s" | false | None | None |
| `initial_delay` | The initial delay before starting to execute the checks. Default: "300s" | false | None | None |

### network Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `forwarded_ports` | List of ports, or port pairs, to forward from the virtual machine to the application container. | false | None | None |
| `instance_ip_mode` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Prevent instances from receiving an ephemeral external IP address. Possible values are: `EXTERNAL`, `INTERNAL`. | false | None | None |
| `instance_tag` | Tag to apply to the instance during creation. | false | None | None |
| `name` | Google Compute Engine network where the virtual machines are created. Specify the short name, not the resource path. | true | None | None |
| `subnetwork` | Google Cloud Platform sub-network where the virtual machines are created. Specify the short name, not the resource path. If the network that the instance is being created in is a Legacy network, then the IP address is allocated from the IPv4Range. If the network that the instance is being created in is an auto Subnet Mode Network, then only network name should be specified (not the subnetworkName) and the IP address is created from the IPCidrRange of the subnetwork that exists in that zone for that network. If the network that the instance is being created in is a custom Subnet Mode Network, then the subnetworkName must be specified and the IP address is created from the IPCidrRange of the subnetwork. If specified, the subnetwork must exist in the same region as the App Engine flexible environment application. | false | None | None |
| `session_affinity` | Enable session affinity. | false | None | None |

### resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu` | Number of CPU cores needed. | false | None | None |
| `disk_gb` | Disk size (GB) needed. | false | None | None |
| `memory_gb` | Memory (GB) needed. | false | None | None |
| `volumes` | List of ports, or port pairs, to forward from the virtual machine to the application container. Structure is [documented below](#nested_resources_volumes). | false | None | None |

### flexible_runtime_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `operating_system` | Operating System of the application runtime. | false | None | None |
| `runtime_version` | The runtime version of an App Engine flexible application. | false | None | None |

### handlers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url_regex` | URL prefix. Uses regular expression syntax, which means regexp special characters must be escaped, but should not contain groupings. All URLs that begin with this prefix are handled by this handler, using the portion of the URL after the prefix as part of the file path. | false | None | None |
| `security_level` | Security (HTTPS) enforcement for this URL. Possible values are: `SECURE_DEFAULT`, `SECURE_NEVER`, `SECURE_OPTIONAL`, `SECURE_ALWAYS`. | false | None | None |
| `login` | Methods to restrict access to a URL based on login status. Possible values are: `LOGIN_OPTIONAL`, `LOGIN_ADMIN`, `LOGIN_REQUIRED`. | false | None | None |
| `auth_fail_action` | Actions to take when the user is not logged in. Possible values are: `AUTH_FAIL_ACTION_REDIRECT`, `AUTH_FAIL_ACTION_UNAUTHORIZED`. | false | None | None |
| `redirect_http_response_code` | 30x code to use when performing redirects for the secure field. Possible values are: `REDIRECT_HTTP_RESPONSE_CODE_301`, `REDIRECT_HTTP_RESPONSE_CODE_302`, `REDIRECT_HTTP_RESPONSE_CODE_303`, `REDIRECT_HTTP_RESPONSE_CODE_307`. | false | None | None |
| `script` | Executes a script to handle the requests that match this URL pattern. Only the auto value is supported for Node.js in the App Engine standard environment, for example "script:" "auto". Structure is [documented below](#nested_handlers_handlers_script). | false | None | None |
| `static_files` | Files served directly to the user for a given URL, such as images, CSS stylesheets, or JavaScript source files. Static file handlers describe which files in the application directory are static files, and which URLs serve them. Structure is [documented below](#nested_handlers_handlers_static_files). | false | None | None |

### api_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auth_fail_action` | Action to take when users access resources that require authentication. Default value is `AUTH_FAIL_ACTION_REDIRECT`. Possible values are: `AUTH_FAIL_ACTION_REDIRECT`, `AUTH_FAIL_ACTION_UNAUTHORIZED`. | false | None | None |
| `login` | Level of login required to access this resource. Default value is `LOGIN_OPTIONAL`. Possible values are: `LOGIN_OPTIONAL`, `LOGIN_ADMIN`, `LOGIN_REQUIRED`. | false | None | None |
| `script` | Path to the script from the application root directory. | true | None | None |
| `security_level` | Security (HTTPS) enforcement for this URL. Possible values are: `SECURE_DEFAULT`, `SECURE_NEVER`, `SECURE_OPTIONAL`, `SECURE_ALWAYS`. | false | None | None |
| `url` | URL to serve the endpoint at. | false | None | None |

### deployment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `zip` | Zip File Structure is [documented below](#nested_deployment_zip). | false | None | None |
| `files` | Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call. Structure is [documented below](#nested_deployment_files). | false | None | None |
| `container` | The Docker image for the container that runs the version. Structure is [documented below](#nested_deployment_container). | false | None | None |
| `cloud_build_options` | Options for the build operations performed as a part of the version deployment. Only applicable when creating a version using source code directly. Structure is [documented below](#nested_deployment_cloud_build_options). | false | None | None |

### endpoints_api_service Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Endpoints service name which is the name of the "service" resource in the Service Management API. For example "myapi.endpoints.myproject.cloud.goog" | true | None | None |
| `config_id` | Endpoints service configuration ID as specified by the Service Management API. For example "2016-09-19r1". By default, the rollout strategy for Endpoints is "FIXED". This means that Endpoints starts up with a particular configuration ID. When a new configuration is rolled out, Endpoints must be given the new configuration ID. The configId field is used to give the configuration ID and is required in this case. Endpoints also has a rollout strategy called "MANAGED". When using this, Endpoints fetches the latest configuration and does not need the configuration ID. In this case, configId must be omitted. | false | None | None |
| `rollout_strategy` | Endpoints rollout strategy. If FIXED, configId must be specified. If MANAGED, configId must be omitted. Default value is `FIXED`. Possible values are: `FIXED`, `MANAGED`. | false | None | None |
| `disable_trace_sampling` | Enable or disable trace sampling. By default, this is set to false for enabled. | false | None | None |

### entrypoint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `shell` | The format should be a shell command that can be fed to bash -c. | true | None | None |

### vpc_access_connector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Full Serverless VPC Access Connector name e.g. /projects/my-project/locations/us-central1/connectors/c1. | true | None | None |

### automatic_scaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cool_down_period` | The time period that the Autoscaler should wait before it starts collecting information from a new instance. This prevents the autoscaler from collecting information when the instance is initializing, during which the collected usage would not be reliable. Default: 120s | false | None | None |
| `cpu_utilization` | Target scaling by CPU usage. Structure is [documented below](#nested_automatic_scaling_cpu_utilization). | true | None | None |
| `max_concurrent_requests` | Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. Defaults to a runtime-specific value. | false | None | None |
| `max_idle_instances` | Maximum number of idle instances that should be maintained for this version. | false | None | None |
| `max_total_instances` | Maximum number of instances that should be started to handle requests for this version. Default: 20 | false | None | None |
| `max_pending_latency` | Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. | false | None | None |
| `min_idle_instances` | Minimum number of idle instances that should be maintained for this version. Only applicable for the default version of a service. | false | None | None |
| `min_total_instances` | Minimum number of running instances that should be maintained for this version. Default: 2 | false | None | None |
| `min_pending_latency` | Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. | false | None | None |
| `request_utilization` | Target scaling by request utilization. Structure is [documented below](#nested_automatic_scaling_request_utilization). | false | None | None |
| `disk_utilization` | Target scaling by disk usage. Structure is [documented below](#nested_automatic_scaling_disk_utilization). | false | None | None |
| `network_utilization` | Target scaling by network usage. Structure is [documented below](#nested_automatic_scaling_network_utilization). | false | None | None |

### manual_scaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instances` | Number of instances to assign to the service at the start. **Note:** When managing the number of instances at runtime through the App Engine Admin API or the (now deprecated) Python 2 Modules API set_num_instances() you must use `lifecycle.ignore_changes = ["manual_scaling"[0].instances]` to prevent drift detection. | true | None | None |

### volumes Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Unique name for the volume. | true | None | None |
| `volume_type` | Underlying volume type, e.g. 'tmpfs'. | true | None | None |
| `size_gb` | Volume size in gigabytes. | true | None | None |

### script Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `script_path` | Path to the script from the application root directory. | true | None | None |

### static_files Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | Path to the static files matched by the URL pattern, from the application root directory. The path can refer to text matched in groupings in the URL pattern. | false | None | None |
| `upload_path_regex` | Regular expression that matches the file paths for all files that should be referenced by this handler. | false | None | None |
| `http_headers` | HTTP headers to use for all responses from these URLs. An object containing a list of "key:value" value pairs.". | false | None | None |
| `mime_type` | MIME type used to serve all files served by this handler. Defaults to file-specific MIME types, which are derived from each file's filename extension. | false | None | None |
| `expiration` | Time a static file served by this handler should be cached by web proxies and browsers. A duration in seconds with up to nine fractional digits, terminated by 's'. Example "3.5s". Default is '0s' | false | None | None |
| `require_matching_file` | Whether this handler should match the request if the file referenced by the handler does not exist. | false | None | None |
| `application_readable` | Whether files should also be uploaded as code data. By default, files declared in static file handlers are uploaded as static data and are only served to end users; they cannot be read by the application. If enabled, uploads are charged against both your code and static data storage resource quotas. | false | None | None |

### zip Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_url` | Source URL | true | None | None |
| `files_count` | files count | false | None | None |

### files Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `sha1_sum` | SHA1 checksum of the file | false | None | None |
| `source_url` | Source URL | true | None | None |

### container Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `image` | URI to the hosted container image in Google Container Registry. The URI must be fully qualified and include a tag or digest. Examples: "gcr.io/my-project/image:tag" or "gcr.io/my-project/image@digest" | true | None | None |

### cloud_build_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `app_yaml_path` | Path to the yaml file used in deployment, used to determine runtime configuration details. | true | None | None |
| `cloud_build_timeout` | The Cloud Build timeout used as part of any dependent builds performed by version creation. Defaults to 10 minutes. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |

### cpu_utilization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `aggregation_window_length` | Period of time over which CPU utilization is calculated. | false | None | None |
| `target_utilization` | Target CPU utilization ratio to maintain when scaling. Must be between 0 and 1. | true | None | None |

### request_utilization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_request_count_per_second` | Target requests per second. | false | None | None |
| `target_concurrent_requests` | Target number of concurrent requests. | false | None | None |

### disk_utilization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_write_bytes_per_second` | Target bytes written per second. | false | None | None |
| `target_write_ops_per_second` | Target ops written per second. | false | None | None |
| `target_read_bytes_per_second` | Target bytes read per second. | false | None | None |
| `target_read_ops_per_second` | Target ops read per seconds. | false | None | None |

### network_utilization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_sent_bytes_per_second` | Target bytes sent per second. | false | None | None |
| `target_sent_packets_per_second` | Target packets sent per second. | false | None | None |
| `target_received_bytes_per_second` | Target bytes received per second. | false | None | None |
| `target_received_packets_per_second` | Target packets received per second. | false | None | None |
