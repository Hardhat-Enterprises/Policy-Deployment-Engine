## 🛡️ Policy Deployment Engine: `gke_hub_membership_binding`

This section provides a concise policy evaluation for the `gke_hub_membership_binding` resource in GCP.

Reference: [Terraform Registry – gke_hub_membership_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_membership_binding)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `membership_binding_id` | The client-provided identifier of the membership binding. | true | None | None |
| `scope` | A Workspace resource name in the format `projects/*/locations/*/scopes/*`. | true | None | None |
| `membership_id` | Id of the membership | true | None | None |
| `location` | Location of the membership | true | None | None |
| `labels` | Labels for this Membership binding. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
