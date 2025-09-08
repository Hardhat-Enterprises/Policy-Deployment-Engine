## 🛡️ Policy Deployment Engine: `compute_target_ssl_proxy`

This section provides a concise policy evaluation for the `compute_target_ssl_proxy` resource in GCP.

Reference: [Terraform Registry – compute_target_ssl_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_ssl_proxy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `backend_service` | A reference to the BackendService resource. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `proxy_header` | Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`. | false | None | None |
| `ssl_certificates` | A list of SslCertificate resources that are used to authenticate connections between users and the load balancer. At least one SSL certificate must be specified. | false | None | None |
| `certificate_map` | A reference to the CertificateMap resource uri that identifies a certificate map associated with the given target proxy. This field can only be set for global target proxies. Accepted format is `//certificatemanager.googleapis.com/projects/{project}/locations/{location}/certificateMaps/{resourceName}`. | false | None | None |
| `ssl_policy` | A reference to the SslPolicy resource that will be associated with the TargetSslProxy resource. If not set, the TargetSslProxy resource will not have any SSL policy configured. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
