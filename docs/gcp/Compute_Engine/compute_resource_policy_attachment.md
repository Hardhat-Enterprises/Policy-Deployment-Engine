## 🛡️ Policy Deployment Engine: `compute_resource_policy_attachment`

This section provides a concise policy evaluation for the `compute_resource_policy_attachment` resource in GCP.

Reference: [Terraform Registry – compute_resource_policy_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy_attachment)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource policy to be attached to the instance for scheduling start/stop operations. Do not specify the self link.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Required) The name of the instance in which the resource policies are attached to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) A reference to the zone where the instance resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
