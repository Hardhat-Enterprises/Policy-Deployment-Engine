## 🛡️ Policy Deployment Engine: `workstations_workstation`

This section provides a concise policy evaluation for the `workstations_workstation` resource in GCP.

Reference: [Terraform Registry – workstations_workstation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workstations_workstation)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `workstation_id` | ID to use for the workstation. | true | None | None |
| `workstation_config_id` | The ID of the parent workstation cluster config. | true | None | None |
| `workstation_cluster_id` | The ID of the parent workstation cluster. | true | None | None |
| `location` | The location where the workstation parent resources reside. | true | None | None |
| `display_name` | Human-readable name for this resource. | false | None | None |
| `labels` | Client-specified labels that are applied to the resource and that are also propagated to the underlying Compute Engine resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `annotations` | Client-specified annotations. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `env` | 'Client-specified environment variables passed to the workstation container's entrypoint.' | false | None | None |
| `source_workstation` | Full resource name of the source workstation from which the workstation's persistent directories will be cloned from during creation. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
