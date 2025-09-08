## 🛡️ Policy Deployment Engine: `integration_connectors_endpoint_attachment`

This section provides a concise policy evaluation for the `integration_connectors_endpoint_attachment` resource in GCP.

Reference: [Terraform Registry – integration_connectors_endpoint_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_endpoint_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_attachment` | The path of the service attachment. | true | None | None |
| `location` | Location in which Endpoint Attachment needs to be created. | true | None | None |
| `name` | Name of Endpoint Attachment needs to be created. | true | None | None |
| `description` | Description of the resource. | false | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `endpoint_global_access` | Enable global access for endpoint attachment. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
