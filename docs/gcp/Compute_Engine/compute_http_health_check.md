## 🛡️ Policy Deployment Engine: `compute_http_health_check`

This section provides a concise policy evaluation for the `compute_http_health_check` resource in GCP.

Reference: [Terraform Registry – compute_http_health_check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_http_health_check)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035.  Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `check_interval_sec` | How often (in seconds) to send a health check. The default value is 5 seconds. | false | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `healthy_threshold` | A so-far unhealthy instance will be marked healthy after this many consecutive successes. The default value is 2. | false | None | None |
| `host` | The value of the host header in the HTTP health check request. If left empty (default value), the public IP on behalf of which this health check is performed will be used. | false | None | None |
| `port` | The TCP port number for the HTTP health check request. The default value is 80. | false | None | None |
| `request_path` | The request path of the HTTP health check request. The default value is /. | false | None | None |
| `timeout_sec` | How long (in seconds) to wait before claiming failure. The default value is 5 seconds.  It is invalid for timeoutSec to have greater value than checkIntervalSec. | false | None | None |
| `unhealthy_threshold` | A so-far healthy instance will be marked unhealthy after this many consecutive failures. The default value is 2. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
