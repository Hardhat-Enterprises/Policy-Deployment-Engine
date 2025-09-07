## 🛡️ Policy Deployment Engine: `gke_hub_scope`

This section provides a concise policy evaluation for the `gke_hub_scope` resource in GCP.

Reference: [Terraform Registry – gke_hub_scope](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_scope)

---

## 1. Argument Reference

### `scope_id`
- Description: (Required) The client-provided identifier of the scope.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace_labels`
- Description: (Optional) Scope-level cluster namespace labels. For the member clusters bound to the Scope, these labels are applied to each namespace under the Scope. Scope-level labels take precedence over Namespace-level labels (`namespace_labels` in the Fleet Namespace resource) if they share a key. Keys and values must be Kubernetes-conformant.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels for this Scope. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
