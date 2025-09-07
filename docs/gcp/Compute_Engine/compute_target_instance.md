## 🛡️ Policy Deployment Engine: `compute_target_instance`

This section provides a concise policy evaluation for the `compute_target_instance` resource in GCP.

Reference: [Terraform Registry – compute_target_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The Compute instance VM handling traffic for this target instance. Accepts the instance self-link, relative path (e.g. `projects/project/zones/zone/instances/instance`) or name. If name is given, the zone will default to the given zone or the provider-default zone and the project will default to the provider-level project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The URL of the network this target instance uses to forward traffic. If not specified, the traffic will be forwarded to the network that the default network interface belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nat_policy`
- Description: (Optional) NAT option controlling how IPs are NAT'ed to the instance. Currently only NO_NAT (default value) is supported. Default value is `NO_NAT`. Possible values are: `NO_NAT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_policy`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The resource URL for the security policy associated with this target instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) URL of the zone where the target instance resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
