## 🛡️ Policy Deployment Engine: `certificate_manager_certificate_map`

This section provides a concise policy evaluation for the `certificate_manager_certificate_map` resource in GCP.

Reference: [Terraform Registry – certificate_manager_certificate_map](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/certificate_manager_certificate_map)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | A user-defined name of the Certificate Map. Certificate Map names must be unique globally and match the pattern `projects/*/locations/*/certificateMaps/*`. | true | None | None |
| `description` | A human-readable description of the resource. | false | None | None |
| `labels` | Set of labels associated with a Certificate Map resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
