## 🛡️ Policy Deployment Engine: `service_directory_namespace`

This section provides a concise policy evaluation for the `service_directory_namespace` resource in GCP.

Reference: [Terraform Registry – service_directory_namespace](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_directory_namespace)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location for the Namespace. A full list of valid locations can be found by running `gcloud beta service-directory locations list`. | true | None | None |
| `namespace_id` | The Resource ID must be 1-63 characters long, including digits, lowercase letters or the hyphen character. | true | None | None |
| `labels` | Resource labels associated with this Namespace. No more than 64 user labels can be associated with a given resource. Label keys and values can be no longer than 63 characters. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
