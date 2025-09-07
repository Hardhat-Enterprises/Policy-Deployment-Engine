## 🛡️ Policy Deployment Engine: `compute_target_ssl_proxy`

This section provides a concise policy evaluation for the `compute_target_ssl_proxy` resource in GCP.

Reference: [Terraform Registry – compute_target_ssl_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_ssl_proxy)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backend_service`
- Description: (Required) A reference to the BackendService resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_header`
- Description: (Optional) Specifies the type of proxy header to append before sending data to the backend. Default value is `NONE`. Possible values are: `NONE`, `PROXY_V1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_certificates`
- Description: (Optional) A list of SslCertificate resources that are used to authenticate connections between users and the load balancer. At least one SSL certificate must be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `certificate_map`
- Description: (Optional) A reference to the CertificateMap resource uri that identifies a certificate map associated with the given target proxy. This field can only be set for global target proxies. Accepted format is `//certificatemanager.googleapis.com/projects/{project}/locations/{location}/certificateMaps/{resourceName}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_policy`
- Description: (Optional) A reference to the SslPolicy resource that will be associated with the TargetSslProxy resource. If not set, the TargetSslProxy resource will not have any SSL policy configured.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
