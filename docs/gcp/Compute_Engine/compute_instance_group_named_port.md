## 🛡️ Policy Deployment Engine: `compute_instance_group_named_port`

This section provides a concise policy evaluation for the `compute_instance_group_named_port` resource in GCP.

Reference: [Terraform Registry – compute_instance_group_named_port](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group_named_port)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name for this named port. The name must be 1-63 characters long, and comply with RFC1035.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Required) The port number, which can be a value between 1 and 65535.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group`
- Description: (Required) The name of the instance group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) The zone of the instance group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
