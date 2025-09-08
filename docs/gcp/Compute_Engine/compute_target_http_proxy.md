## 🛡️ Policy Deployment Engine: `compute_target_http_proxy`

This section provides a concise policy evaluation for the `compute_target_http_proxy` resource in GCP.

Reference: [Terraform Registry – compute_target_http_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `url_map` | A reference to the UrlMap resource that defines the mapping from URL to the BackendService. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `proxy_bind` | This field only applies when the forwarding rule that references this target proxy has a loadBalancingScheme set to INTERNAL_SELF_MANAGED. | false | None | None |
| `http_keep_alive_timeout_sec` | Specifies how long to keep a connection open, after completing a response, while there is no matching traffic (in seconds). If an HTTP keepalive is not specified, a default value will be used. For Global external HTTP(S) load balancer, the default value is 610 seconds, the minimum allowed value is 5 seconds and the maximum allowed value is 1200 seconds. For cross-region internal HTTP(S) load balancer, the default value is 600 seconds, the minimum allowed value is 5 seconds, and the maximum allowed value is 600 seconds. For Global external HTTP(S) load balancer (classic), this option is not available publicly. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
