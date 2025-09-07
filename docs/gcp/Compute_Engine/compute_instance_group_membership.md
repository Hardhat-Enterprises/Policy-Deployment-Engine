## 🛡️ Policy Deployment Engine: `compute_instance_group_membership`

This section provides a concise policy evaluation for the `compute_instance_group_membership` resource in GCP.

Reference: [Terraform Registry – compute_instance_group_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group_membership)

---

## 1. Argument Reference

### `instance`
- Description: (Required) An instance being added to the InstanceGroup
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_group`
- Description: (Required) Represents an Instance Group resource name that the instance belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) A reference to the zone where the instance group resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
