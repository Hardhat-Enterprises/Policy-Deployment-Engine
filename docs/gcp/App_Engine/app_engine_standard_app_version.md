## 🛡️ Policy Deployment Engine: `app_engine_standard_app_version`

This section provides a concise policy evaluation for the `app_engine_standard_app_version` resource in GCP.

Reference: [Terraform Registry – app_engine_standard_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_standard_app_version)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `runtime` | Desired runtime. Example python27. | true | None | None |
| `service` | AppEngine service resource | true | None | None |
| `version_id` | Relative name of the version within the service. For example, `v1`. Version names can contain only lowercase letters, numbers, or hyphens. Reserved names,"default", "latest", and any name with the prefix "ah-". | false | None | None |
| `service_account` | The identity that the deployed version will run as. Admin API will use the App Engine Appspot service account as default if this field is neither provided in app.yaml file nor through CLI flag. | false | None | None |
| `threadsafe` | Whether multiple requests can be dispatched to this version at once. | false | None | None |
| `app_engine_apis` | Allows App Engine second generation runtimes to access the legacy bundled services. | false | None | None |
| `runtime_api_version` | The version of the API in the given runtime environment. Please see the app.yaml reference for valid values at `https://cloud.google.com/appengine/docs/standard/<language>/config/appref`\ Substitute `<language>` with `python`, `java`, `php`, `ruby`, `go` or `nodejs`. | false | None | None |
| `env_variables` | Environment variables available to the application. | false | None | None |
| `inbound_services` | A list of the types of messages that this application is able to receive. Each value may be one of: `INBOUND_SERVICE_MAIL`, `INBOUND_SERVICE_MAIL_BOUNCE`, `INBOUND_SERVICE_XMPP_ERROR`, `INBOUND_SERVICE_XMPP_MESSAGE`, `INBOUND_SERVICE_XMPP_SUBSCRIBE`, `INBOUND_SERVICE_XMPP_PRESENCE`, `INBOUND_SERVICE_CHANNEL_PRESENCE`, `INBOUND_SERVICE_WARMUP`. | false | None | None |
| `instance_class` | Instance class that is used to run this version. Valid values are AutomaticScaling: F1, F2, F4, F4_1G BasicScaling or ManualScaling: B1, B2, B4, B4_1G, B8 Defaults to F1 for AutomaticScaling and B2 for ManualScaling and BasicScaling. If no scaling is specified, AutomaticScaling is chosen. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `noop_on_destroy` |  | none | None | None |
| `delete_service_on_destroy` |  | none | None | None |

### deployment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `zip` | Zip File Structure is [documented below](#nested_deployment_zip). | false | None | None |
| `files` | Manifest of the files stored in Google Cloud Storage that are included as part of this version. All files must be readable using the credentials supplied with this call. Structure is [documented below](#nested_deployment_files). | false | None | None |

### entrypoint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `shell` | The format should be a shell command that can be fed to bash -c. | true | None | None |

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

### libraries Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the library. Example "django". | false | None | None |
| `version` | Version of the library to select, or "latest". | false | None | None |

### vpc_access_connector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Full Serverless VPC Access Connector name e.g. /projects/my-project/locations/us-central1/connectors/c1. | true | None | None |
| `egress_setting` | The egress setting for the connector, controlling what traffic is diverted through it. | false | None | None |

### automatic_scaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_concurrent_requests` | Number of concurrent requests an automatic scaling instance can accept before the scheduler spawns a new instance. Defaults to a runtime-specific value. | false | None | None |
| `max_idle_instances` | Maximum number of idle instances that should be maintained for this version. | false | None | None |
| `max_pending_latency` | Maximum amount of time that a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |
| `min_idle_instances` | Minimum number of idle instances that should be maintained for this version. Only applicable for the default version of a service. | false | None | None |
| `min_pending_latency` | Minimum amount of time a request should wait in the pending queue before starting a new instance to handle it. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |
| `standard_scheduler_settings` | Scheduler settings for standard environment. Structure is [documented below](#nested_automatic_scaling_standard_scheduler_settings). | false | None | None |

### basic_scaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `idle_timeout` | Duration of time after the last request that an instance must wait before the instance is shut down. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Defaults to 900s. | false | None | None |
| `max_instances` | Maximum number of instances to create for this version. Must be in the range [1.0, 200.0]. | true | None | None |

### manual_scaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instances` | Number of instances to assign to the service at the start. **Note:** When managing the number of instances at runtime through the App Engine Admin API or the (now deprecated) Python 2 Modules API set_num_instances() you must use `lifecycle.ignore_changes = ["manual_scaling"[0].instances]` to prevent drift detection. | true | None | None |

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
| `expiration` | Time a static file served by this handler should be cached by web proxies and browsers. A duration in seconds with up to nine fractional digits, terminated by 's'. Example "3.5s". | false | None | None |
| `require_matching_file` | Whether this handler should match the request if the file referenced by the handler does not exist. | false | None | None |
| `application_readable` | Whether files should also be uploaded as code data. By default, files declared in static file handlers are uploaded as static data and are only served to end users; they cannot be read by the application. If enabled, uploads are charged against both your code and static data storage resource quotas. | false | None | None |

### standard_scheduler_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target_cpu_utilization` | Target CPU utilization ratio to maintain when scaling. Should be a value in the range [0.50, 0.95], zero, or a negative value. | false | None | None |
| `target_throughput_utilization` | Target throughput utilization ratio to maintain when scaling. Should be a value in the range [0.50, 0.95], zero, or a negative value. | false | None | None |
| `min_instances` | Minimum number of instances to run for this version. Set to zero to disable minInstances configuration. | false | None | None |
| `max_instances` | Maximum number of instances to run for this version. Set to zero to disable maxInstances configuration. **Note:** Starting from March 2025, App Engine sets the maxInstances default for standard environment deployments to 20. This change doesn't impact existing apps. To override the default, specify a new value between 0 and 2147483647, and deploy a new version or redeploy over an existing version. To disable the maxInstances default configuration setting, specify the maximum permitted value 2147483647. | false | None | None |
