## 🛡️ Policy Deployment Engine: `beyondcorp_security_gateway`

This section provides a concise policy evaluation for the `beyondcorp_security_gateway` resource in GCP.

Reference: [Terraform Registry – beyondcorp_security_gateway](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_security_gateway)

---

## 1. Argument Reference

### `security_gateway_id`
- Description: (Required) Optional. User-settable SecurityGateway resource ID. * Must start with a letter. * Must contain between 4-63 characters from `/a-z-/`. * Must end with a number or letter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hubs`
- Description: (Optional) Optional. Map of Hubs that represents regional data path deployment with GCP region as a key. Structure is [documented below](#nested_hubs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Optional. An arbitrary user-provided name for the SecurityGateway. Cannot exceed 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional, Deprecated) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. Must be omitted or set to `global`. ~> **Warning:** `location` is deprecated and will be removed in a future major release.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_hubs"></a>The `hubs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `internet_gateway`
- Description: (Optional) Internet Gateway configuration. Structure is [documented below](#nested_hubs_hub_internet_gateway). <a name="nested_hubs_hub_internet_gateway"></a>The `internet_gateway` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `assigned_ips`
- Description: (Output) Output only. List of IP addresses assigned to the Cloud NAT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
