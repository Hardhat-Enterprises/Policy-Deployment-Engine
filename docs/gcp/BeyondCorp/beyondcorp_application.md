## 🛡️ Policy Deployment Engine: `beyondcorp_application`

This section provides a concise policy evaluation for the `beyondcorp_application` resource in GCP.

Reference: [Terraform Registry – beyondcorp_application](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_application)

---

## 1. Argument Reference

### `endpoint_matchers`
- Description: (Required) Required. Endpoint matchers associated with an application. A combination of hostname and ports as endpoint matcher is used to match the application. Match conditions for OR logic. An array of match conditions to allow for multiple matching criteria. The rule is considered a match if one the conditions are met. The conditions can be one of the following combination (Hostname), (Hostname & Ports) EXAMPLES: Hostname - ("*.abc.com"), ("xyz.abc.com") Hostname and Ports - ("abc.com" and "22"), ("abc.com" and "22,33") etc Structure is [documented below](#nested_endpoint_matchers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_gateways_id`
- Description: (Required) Part of `parent`. See documentation of `projectsId`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `application_id`
- Description: (Required) Optional. User-settable Application resource ID. * Must start with a letter. * Must contain between 4-63 characters from `/a-z-/`. * Must end with a number or letter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. An arbitrary user-provided name for the Application resource. Cannot exceed 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upstreams`
- Description: (Optional) Optional. List of which upstream resource(s) to forward traffic to. Structure is [documented below](#nested_upstreams).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_endpoint_matchers"></a>The `endpoint_matchers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Required) Required. Hostname of the application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ports`
- Description: (Optional) Optional. Ports of the application. <a name="nested_upstreams"></a>The `upstreams` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `egress_policy`
- Description: (Optional) Optional. Routing policy information. Structure is [documented below](#nested_upstreams_upstreams_egress_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) Network to forward traffic to. Structure is [documented below](#nested_upstreams_upstreams_network). <a name="nested_upstreams_upstreams_egress_policy"></a>The `egress_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regions`
- Description: (Required) Required. List of regions where the application sends traffic to. <a name="nested_upstreams_upstreams_network"></a>The `network` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Required. Network name is of the format: `projects/{project}/global/networks/{network}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
