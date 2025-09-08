## 🛡️ Policy Deployment Engine: `network_services_service_binding`

This section provides a concise policy evaluation for the `network_services_service_binding` resource in GCP.

Reference: [Terraform Registry – network_services_service_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_services_service_binding)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | The full Service Directory Service name of the format projects/*/locations/*/namespaces/*/services/* | true | None | None |
| `name` | Name of the ServiceBinding resource. | true | None | None |
| `labels` | Set of label tags associated with the ServiceBinding resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | A free-text description of the resource. Max length 1024 characters. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
