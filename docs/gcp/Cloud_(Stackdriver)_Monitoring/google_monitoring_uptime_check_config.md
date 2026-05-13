## 🛡️ Policy Deployment Engine: `google_monitoring_uptime_check_config`

This section provides a concise policy evaluation for the `google_monitoring_uptime_check_config` resource in GCP.

Reference: [Terraform Registry – google_monitoring_uptime_check_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_uptime_check_config)

---

## Argument Reference

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | Human-friendly name for the uptime check. | true | false | Display metadata with no security impact. | None | None |
| `timeout` | Maximum time to wait for the request to complete. | true | false | Operational setting with no direct security impact. | None | None |
| `period` | How often the uptime check is performed. | false | false | Frequency setting with no direct security impact. | None | None |
| `content_matchers` | Expected content to match in the response. | false | false | Functional matching with no direct security impact. | None | None |
| `selected_regions` | Regions from which the check will run. | false | false | Geographic setting with no direct security impact. | None | None |
| `log_check_failures` | Whether to log failed probe results to Cloud Logging. | false | false | Logging failures is good practice but not enforced as a security policy since it is not directly exploitable. | None | None |
| `checker_type` | The checker type (STATIC_IP_CHECKERS or VPC_CHECKERS). | false | false | Infrastructure routing choice with no direct security impact. | None | None |
| `user_labels` | User-supplied key/value data for organising the check. | false | false | Organisational metadata with no security impact. | None | None |
| `project` | The project in which the check resides. | false | false | Organisational field, not a security control. | None | None |

### http_check Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `request_method` | HTTP method (GET or POST). | false | false | Request method choice with no direct security impact. | None | None |
| `content_type` | Content type header for the check. | false | false | Functional setting with no security impact. | None | None |
| `auth_info` | Username/password authentication for the check. | false | false | Authentication is handled at the application level; no policy enforced here. | None | None |
| `service_agent_authentication` | Authentication using the Monitoring Service Agent. | false | false | Authentication method choice with no direct security impact. | None | None |
| `port` | Port to run the check against. | false | false | Operational setting with no direct security impact. | None | None |
| `headers` | Headers to send with the check request. | false | false | Functional setting; security is addressed via mask_headers policy. | None | None |
| `path` | Path to run the check against. | false | false | Functional setting with no security impact. | None | None |
| `use_ssl` | If true, use HTTPS instead of HTTP. | false | false | SSL usage is enforced indirectly via validate_ssl_required policy. | None | None |
| `validate_ssl` | Whether to validate the SSL certificate for HTTPS checks. | false | true | Disabling SSL validation on HTTPS uptime checks allows the check to pass even when the certificate is invalid, expired, or issued by an untrusted authority, undermining transport security assurances. | `validate_ssl = true` | `validate_ssl = false` |
| `mask_headers` | Whether to encrypt headers when retrieving the check configuration. | false | true | When Authorization or other authentication headers are present, leaving mask_headers false exposes those credentials in plain text via the GCP API on Get/List calls. | `mask_headers = true` | `mask_headers = false` with `Authorization` header |
| `body` | Request body for POST checks. | false | false | Functional setting with no direct security impact. | None | None |
| `accepted_response_status_codes` | HTTP status codes considered passing. | false | false | Functional setting with no direct security impact. | None | None |

### monitored_resource Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | The monitored resource type. | true | false | Resource type selector with no direct security impact. | None | None |
| `labels` | Labels for the monitored resource. | true | false | Functional identifiers with no security impact. | None | None |

---

## Policies Written

| Policy | Type | Attribute | Situation |
|--------|------|-----------|-----------|
| `validate_ssl_required` | whitelist | `http_check.validate_ssl` | Enforces SSL certificate validation on HTTPS uptime checks to prevent checks passing against invalid or untrusted certificates |
| `mask_headers` | whitelist | `http_check.mask_headers` | Enforces header masking when Authorization headers are present to prevent credential exposure via API responses |

## Policies Considered but Not Written

| Attribute | Reason |
|-----------|--------|
| `log_check_failures` | While enabling failure logging is good practice, its absence does not directly introduce a security vulnerability |
| `checker_type` | Both STATIC_IP_CHECKERS and VPC_CHECKERS are valid and their security implications depend on network topology, not a blanket policy |
| `selected_regions` | Region selection is an operational decision with no direct security impact |
