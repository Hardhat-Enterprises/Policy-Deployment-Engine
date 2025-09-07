## 🛡️ Policy Deployment Engine: `vmwareengine_external_access_rule`

This section provides a concise policy evaluation for the `vmwareengine_external_access_rule` resource in GCP.

Reference: [Terraform Registry – vmwareengine_external_access_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_external_access_rule)

---

## 1. Argument Reference

### `priority`
- Description: (Required) External access rule priority, which determines the external access rule to use when multiple rules apply.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `action`
- Description: (Required) The action that the external access rule performs. Possible values are: `ALLOW`, `DENY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_protocol`
- Description: (Required) The IP protocol to which the external access rule applies.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_ip_ranges`
- Description: (Required) If source ranges are specified, the external access rule applies only to traffic that has a source IP address in these ranges. Structure is [documented below](#nested_source_ip_ranges).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_ports`
- Description: (Required) A list of source ports to which the external access rule applies.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_ip_ranges`
- Description: (Required) If destination ranges are specified, the external access rule applies only to traffic that has a destination IP address in these ranges. Structure is [documented below](#nested_destination_ip_ranges).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_ports`
- Description: (Required) A list of destination ports to which the external access rule applies.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The resource name of the network policy. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/networkPolicies/my-policy
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The ID of the external access rule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description for the external access rule. <a name="nested_source_ip_ranges"></a>The `source_ip_ranges` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Optional) A single IP address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address_range`
- Description: (Optional) An IP address range in the CIDR format. <a name="nested_destination_ip_ranges"></a>The `destination_ip_ranges` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address_range`
- Description: (Optional) An IP address range in the CIDR format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_address`
- Description: (Optional) The name of an `ExternalAddress` resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
