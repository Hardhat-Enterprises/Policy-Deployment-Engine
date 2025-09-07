## 🛡️ Policy Deployment Engine: `workstations_workstation`

This section provides a concise policy evaluation for the `workstations_workstation` resource in GCP.

Reference: [Terraform Registry – workstations_workstation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workstations_workstation)

---

## 1. Argument Reference

### `workstation_id`
- Description: (Required) ID to use for the workstation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workstation_config_id`
- Description: (Required) The ID of the parent workstation cluster config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workstation_cluster_id`
- Description: (Required) The ID of the parent workstation cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the workstation parent resources reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Human-readable name for this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Client-specified labels that are applied to the resource and that are also propagated to the underlying Compute Engine resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Client-specified annotations. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env`
- Description: (Optional) 'Client-specified environment variables passed to the workstation container's entrypoint.'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_workstation`
- Description: (Optional) Full resource name of the source workstation from which the workstation's persistent directories will be cloned from during creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
