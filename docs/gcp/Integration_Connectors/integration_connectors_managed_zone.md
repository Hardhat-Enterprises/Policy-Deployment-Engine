## 🛡️ Policy Deployment Engine: `integration_connectors_managed_zone`

This section provides a concise policy evaluation for the `integration_connectors_managed_zone` resource in GCP.

Reference: [Terraform Registry – integration_connectors_managed_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_managed_zone)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dns` | DNS Name of the resource. | true | false | the DNS name is not security related. | None | None |
| `target_project` | The name of the Target Project. | true | false | target project is not security related. | None | None |
| `target_vpc` | The name of the Target Project VPC Network. | true | false | target vpn is not security related. | None | None |
| `name` | Name of Managed Zone needs to be created. | true | false | name is not security related as it is just an identifier. | None | None |
| `description` | Description of the resource. | false | false | description is not security related. | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | labels are not security related. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | project is not security related as it's just a data resource. | None | None |
