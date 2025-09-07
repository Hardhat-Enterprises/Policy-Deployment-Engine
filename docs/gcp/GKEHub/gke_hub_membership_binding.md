## 🛡️ Policy Deployment Engine: `gke_hub_membership_binding`

This section provides a concise policy evaluation for the `gke_hub_membership_binding` resource in GCP.

Reference: [Terraform Registry – gke_hub_membership_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_membership_binding)

---

## 1. Argument Reference

### `membership_binding_id`
- Description: (Required) The client-provided identifier of the membership binding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Required) A Workspace resource name in the format `projects/*/locations/*/scopes/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `membership_id`
- Description: (Required) Id of the membership
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location of the membership
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels for this Membership binding. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
