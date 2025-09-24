## 🛡️ Policy Deployment Engine: `app_engine_standard_app_version`

This section provides a concise policy evaluation for the `app_engine_standard_app_version` resource in GCP.

Reference: [Terraform Registry – app_engine_standard_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_standard_app_version)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `runtime` | Desired runtime. Example python27. | true | false | Ensure only actively supported runtimes are used to avoid CVEs. | runtime = "python39" | runtime = "python27" (deprecated). |
| `deployment` | Code and application artifacts that make up this version. | true | false | Deploy only required, reviewed artifacts. | Deployment includes only signed application zip bundle. | Deployment bundle includes unused debug files or credentials. |
| `entrypoint` | The entrypoint for the application. | true | false | Entrypoint should be minimal and verified to enforce application logic. | shell = "gunicorn -b :$PORT main:app" | shell = "bash debug.sh" |
| `service` | AppEngine service resource | true | false | Separate services logically for clearer security boundaries. | service = "payments-api" | service = "default" for multiple workloads. |
| `service_account` | The identity that the deployed version will run as. | false | false | Always run with least-privilege service accounts. | service_account = "app-runtime@project.iam.gserviceaccount.com" with minimal roles. | service_account = default App Engine service account with Editor. |
| `handlers` | URL-matching patterns applied to requests. | false | false | All admin or internal routes should require authentication and HTTPS. | security_level = "SECURE_ALWAYS" and login = "LOGIN_REQUIRED". | security_level = "SECURE_NEVER" for admin URLs. |
| `env_variables` | Environment variables available to the app. | false | false | Use Secret Manager for sensitive keys. | env_variables = { "LOG_LEVEL" = "DEBUG" } | env_variables = { "DB_PASSWORD" = "plaintext" } |
| `vpc_access_connector` | Enables VPC connectivity for standard apps. | false | false | Use VPC connectors for private service access. | vpc_access_connector { name = "/projects/proj/locations/us-central1/connectors/c1" } | Omitting VPC connector for sensitive apps. |
| `automatic_scaling` | Automatic scaling configuration. | false | false | Set sane min/max instances and latency thresholds. | min_idle_instances = 1, max_instances = 20 | min_idle_instances = 0, unlimited max_instances. |
| `basic_scaling` | Basic scaling configuration. | false | false | Use small idle_timeout for non-critical workloads. | idle_timeout = "300s" | idle_timeout left default, keeping idle instances indefinitely. |
| `manual_scaling` | Manual scaling configuration. | false | false | Use manual scaling only when workload requires persistent memory/state. | instances = 2 for long-running services. | instances = 50 for low-traffic app. |
| `libraries` | Third-party runtime libraries. | false | false | Pin library versions and update regularly. | library = { name = "django", version = "3.2" } | library = { name = "django", version = "latest" } |
| `project` | If it is not provided, the provider project is used. | false | false | Always define project ID for clarity. | project = "secure-app" | Omitting project, relying on provider defaults. |
