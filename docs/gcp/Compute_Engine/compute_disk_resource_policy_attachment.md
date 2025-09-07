## 🛡️ Policy Deployment Engine: `compute_disk_resource_policy_attachment`

This section provides a concise policy evaluation for the `compute_disk_resource_policy_attachment` resource in GCP.

Reference: [Terraform Registry – compute_disk_resource_policy_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk_resource_policy_attachment)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource policy to be attached to the disk for scheduling snapshot creation. Do not specify the self link.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk`
- Description: (Required) The name of the disk in which the resource policies are attached to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) A reference to the zone where the disk resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
