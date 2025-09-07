## 🛡️ Policy Deployment Engine: `compute_region_target_tcp_proxy`

This section provides a concise policy evaluation for the `compute_region_target_tcp_proxy` resource in GCP.

Reference: [Terraform Registry – compute_region_target_tcp_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_target_tcp_proxy)

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

### `proxy_bind`
- Description: (Optional) This field only applies when the forwarding rule that references this target proxy has a loadBalancingScheme set to INTERNAL_SELF_MANAGED.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The Region in which the created target TCP proxy should reside. If it is not provided, the provider region is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
