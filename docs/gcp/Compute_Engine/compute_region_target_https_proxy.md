## 🛡️ Policy Deployment Engine: `compute_region_target_https_proxy`

This section provides a concise policy evaluation for the `compute_region_target_https_proxy` resource in GCP.

Reference: [Terraform Registry – compute_region_target_https_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_target_https_proxy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `url_map` | A reference to the RegionUrlMap resource that defines the mapping from URL to the RegionBackendService. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `certificate_manager_certificates` | URLs to certificate manager certificate resources that are used to authenticate connections between users and the load balancer. sslCertificates and certificateManagerCertificates can't be defined together. Accepted format is `//certificatemanager.googleapis.com/projects/{project}/locations/{location}/certificates/{resourceName}` or just the self_link `projects/{project}/locations/{location}/certificates/{resourceName}` | false | None | None |
| `ssl_certificates` | URLs to SslCertificate resources that are used to authenticate connections between users and the load balancer. At least one SSL certificate must be specified. Currently, you may specify up to 15 SSL certificates. sslCertificates do not apply when the load balancing scheme is set to INTERNAL_SELF_MANAGED. | false | None | None |
| `ssl_policy` | A reference to the Region SslPolicy resource that will be associated with the TargetHttpsProxy resource. If not set, the TargetHttpsProxy resource will not have any SSL policy configured. | false | None | None |
| `http_keep_alive_timeout_sec` | Specifies how long to keep a connection open, after completing a response, while there is no matching traffic (in seconds). If an HTTP keepalive is not specified, a default value (600 seconds) will be used. For Regioanl HTTP(S) load balancer, the minimum allowed value is 5 seconds and the maximum allowed value is 600 seconds. | false | None | None |
| `server_tls_policy` | A URL referring to a networksecurity.ServerTlsPolicy resource that describes how the proxy should authenticate inbound traffic. serverTlsPolicy only applies to a global TargetHttpsProxy attached to globalForwardingRules with the loadBalancingScheme set to INTERNAL_SELF_MANAGED or EXTERNAL or EXTERNAL_MANAGED. For details which ServerTlsPolicy resources are accepted with INTERNAL_SELF_MANAGED and which with EXTERNAL, EXTERNAL_MANAGED loadBalancingScheme consult ServerTlsPolicy documentation. If left blank, communications are not encrypted. If you remove this field from your configuration at the same time as deleting or recreating a referenced ServerTlsPolicy resource, you will receive a resourceInUseByAnotherResource error. Use lifecycle.create_before_destroy within the ServerTlsPolicy resource to avoid this. | false | None | None |
| `region` | The Region in which the created target https proxy should reside. If it is not provided, the provider region is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
