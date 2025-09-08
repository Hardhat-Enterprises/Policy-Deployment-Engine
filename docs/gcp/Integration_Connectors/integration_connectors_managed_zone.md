## 🛡️ Policy Deployment Engine: `integration_connectors_managed_zone`

This section provides a concise policy evaluation for the `integration_connectors_managed_zone` resource in GCP.

Reference: [Terraform Registry – integration_connectors_managed_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_managed_zone)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dns` | DNS Name of the resource. | true | None | None |
| `target_project` | The name of the Target Project. | true | None | None |
| `target_vpc` | The name of the Target Project VPC Network. | true | None | None |
| `name` | Name of Managed Zone needs to be created. | true | None | None |
| `description` | Description of the resource. | false | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
