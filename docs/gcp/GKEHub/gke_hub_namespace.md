## 🛡️ Policy Deployment Engine: `gke_hub_namespace`

This section provides a concise policy evaluation for the `gke_hub_namespace` resource in GCP.

Reference: [Terraform Registry – gke_hub_namespace](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_namespace)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scope_namespace_id` | The client-provided identifier of the namespace. | true | None | None |
| `scope` | The name of the Scope instance. | true | None | None |
| `scope_id` | Id of the scope | true | None | None |
| `namespace_labels` | Namespace-level cluster namespace labels. These labels are applied to the related namespace of the member clusters bound to the parent Scope. Scope-level labels (`namespace_labels` in the Fleet Scope resource) take precedence over Namespace-level labels if they share a key. Keys and values must be Kubernetes-conformant. | false | None | None |
| `labels` | Labels for this Namespace. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
