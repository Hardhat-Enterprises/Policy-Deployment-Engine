## 🛡️ Policy Deployment Engine: `compute_instance_group`

This section provides a concise policy evaluation for the `compute_instance_group` resource in GCP.

Reference: [Terraform Registry – compute_instance_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group)

---

## 1. Argument Reference

### `name`
- Description: characters long and comply with [RFC1035](https://www.ietf.org/rfc/rfc1035.txt). Supported characters include lowercase letters, numbers, and hyphens.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instances`
- Description: When adding instances they must all be in the same network and zone as the instance group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `named_port`
- Description: for details on configuration. Structure is [documented below](#nested_named_port).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: this is different from the network where the instances are in, the creation fails. Defaults to the network where the instances are in (if neither `network` nor `instances` is specified, this field will be blank). <a name="nested_named_port"></a>The `named_port` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
