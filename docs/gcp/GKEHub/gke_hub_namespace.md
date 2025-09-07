## 🛡️ Policy Deployment Engine: `gke_hub_namespace`

This section provides a concise policy evaluation for the `gke_hub_namespace` resource in GCP.

Reference: [Terraform Registry – gke_hub_namespace](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_namespace)

---

## 1. Argument Reference

### `scope_namespace_id`
- Description: (Required) The client-provided identifier of the namespace.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Required) The name of the Scope instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope_id`
- Description: (Required) Id of the scope
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace_labels`
- Description: (Optional) Namespace-level cluster namespace labels. These labels are applied to the related namespace of the member clusters bound to the parent Scope. Scope-level labels (`namespace_labels` in the Fleet Scope resource) take precedence over Namespace-level labels if they share a key. Keys and values must be Kubernetes-conformant.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels for this Namespace. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
