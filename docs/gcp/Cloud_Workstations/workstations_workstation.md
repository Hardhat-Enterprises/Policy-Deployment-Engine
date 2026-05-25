## 🛡️ Policy Deployment Engine: `workstations_workstation`

This section provides a concise policy evaluation for the `workstations_workstation` resource in GCP.

Reference: [Terraform Registry – workstations_workstation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workstations_workstation)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `workstation_id` | ID to use for the workstation. | true | true | Workstation IDs should follow an approved naming standard so that resources can be clearly identified and managed consistently. | The workstation uses an approved workstation ID, such as work-station | The workstation uses an unapproved workstation ID, such as work-station1 |
| `workstation_config_id` | The ID of the parent workstation cluster config. | true | true | Workstations should only use approved workstation configurations that follow the required security and operational standards. | The workstation uses an approved workstation_config_id, such as workstation-config | The workstation uses an unapproved workstation_config_id, such as wrong-config |
| `workstation_cluster_id` | The ID of the parent workstation cluster. | true | true | Workstations should be created only under approved workstation clusters to ensure they are managed within trusted infrastructure. | The workstation uses an approved workstation_cluster_id, such as workstation-cluster | The workstation uses an unapproved workstation_cluster_id, such as wrong-cluster  |
| `location` | The location where the workstation parent resources reside. | true | true | Workstations should be deployed only in approved regions to meet organisational, compliance, and data governance requirements. | The workstation is deployed in an approved location, such as us-central1. | The workstation is deployed in an unapproved location, such as us-east1 |
| `display_name` | Human-readable name for this resource. | false | false | Display name is mainly used as a human-readable identifier and does not directly control workstation security settings. | None | None |
| `labels` | Client-specified labels that are applied to the resource and that are also propagated to the underlying Compute Engine resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are mainly used for organisation, identification, and cost tracking. They do not directly control access or security behaviour for the workstation. | None | None |
| `annotations` | Client-specified annotations. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotation are to store extra metadata about workstation. They do not directly control access or security behaviour for the workstation  | None | None |
| `env` | 'Client-specified environment variables passed to the workstation container's entrypoint.' | false | false | env does not affect security behaviour. | None | None |
| `source_workstation` | Full resource name of the source workstation from which the workstation's persistent directories will be cloned from during creation. | false | false | Source workstation cloning may affect data inheritance, but this policy set does not validate approved source workstations. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The project can affect governance and resource ownership, but this workstation policy set does not validate approved project IDs. | None | None |
