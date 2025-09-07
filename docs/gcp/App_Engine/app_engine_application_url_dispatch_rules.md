## 🛡️ Policy Deployment Engine: `app_engine_application_url_dispatch_rules`

This section provides a concise policy evaluation for the `app_engine_application_url_dispatch_rules` resource in GCP.

Reference: [Terraform Registry – app_engine_application_url_dispatch_rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_application_url_dispatch_rules)

---

## 1. Argument Reference

### `dispatch_rules`
- Description: (Required) Rules to match an HTTP request and dispatch that request to a service. Structure is [documented below](#nested_dispatch_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_dispatch_rules"></a>The `dispatch_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Optional) Domain name to match against. The wildcard "*" is supported if specified before a period: "*.". Defaults to matching all domains: "*".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) Pathname within the host. Must start with a "/". A single "*" can be included at the end of the path. The sum of the lengths of the domain and path may not exceed 100 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) Pathname within the host. Must start with a "/". A single "*" can be included at the end of the path. The sum of the lengths of the domain and path may not exceed 100 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
