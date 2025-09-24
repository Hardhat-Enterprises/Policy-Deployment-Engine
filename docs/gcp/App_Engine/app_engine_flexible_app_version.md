## 🛡️ Policy Deployment Engine: `app_engine_flexible_app_version`

This section provides a concise policy evaluation for the `app_engine_flexible_app_version` resource in GCP.

Reference: [Terraform Registry – app_engine_flexible_app_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_flexible_app_version)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `runtime` | Desired runtime. Example python27. | true | false | Choose only supported and patched runtimes to avoid exposure to CVEs. | Use a supported runtime (e.g., python39, nodejs16). | Using legacy runtimes such as python27 which are deprecated. |
| `readiness_check` | Configures readiness health checking for instances. Unhealthy instances are not put into the backend traffic rotation. | true | false | Prevents partially initialized or failing instances from being exposed to end users. | Readiness checks with strict thresholds and low failure tolerance. | No readiness checks, allowing unhealthy instances into traffic rotation. |
| `liveness_check` | Health checking configuration for VM instances. Unhealthy instances are killed and replaced with new instances. | true | false | Ensures self-healing by replacing non-functional instances quickly. | Configured liveness check with sensible intervals and thresholds. | Disabling liveness checks or using very high thresholds. |
| `service` | AppEngine service resource. Can contain numbers, letters, and hyphens. | true | false | Use clear, unique service names to separate workloads. | service = "payments-service" | service = "default" for all workloads. |
| `service_account` | The identity that the deployed version will run as. | false | false | Always run with least-privilege service accounts to reduce blast radius. | service_account = "app-engine-runtime@project.iam.gserviceaccount.com" with restricted IAM roles. | Using default App Engine service account with Owner/Editor permissions. |
| `network` | Extra network settings. | false | false | Use internal-only IPs and VPC connectors where possible. | instance_ip_mode = "INTERNAL" with VPC access connector. | instance_ip_mode = "EXTERNAL" without restrictions. |
| `handlers` | An ordered list of URL-matching patterns applied to incoming requests. | false | false | Use handlers with HTTPS (`SECURE_ALWAYS`) and enforce login for sensitive routes. | security_level = "SECURE_ALWAYS", login = "LOGIN_REQUIRED". | security_level = "SECURE_NEVER", exposing admin URLs over HTTP. |
| `env_variables` | Environment variables available to the application. | false | false | Do not hardcode secrets. Use Secret Manager for sensitive values. | env_variables only for non-sensitive configs (e.g., LOG_LEVEL). | env_variables with plaintext DB passwords or API keys. |
| `resources` | Machine resources for a version. | false | false | Limit resources to business need, prevent over-provisioning. | cpu=2, memory_gb=4, disk_gb=10. | Allocating excessive resources without justification. |
| `vpc_access_connector` | Enables VPC connectivity for standard apps. | false | false | Use VPC connectors to restrict egress to private services. | Configured connector: projects/my-project/locations/us-central1/connectors/app-vpc. | No VPC connector, forcing internet egress. |
