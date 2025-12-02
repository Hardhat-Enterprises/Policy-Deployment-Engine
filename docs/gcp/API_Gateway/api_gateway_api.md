## 🛡️ Policy Deployment Engine: `api_gateway_api`

This section provides a concise policy evaluation for the `api_gateway_api` resource in GCP.

Reference: [Terraform Registry – api_gateway_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/api_gateway_api)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `api_id` | Identifier to assign to the API. Must be unique within scope of the parent resource(project) | true | false | None | None | None |
| `display_name` | A user-visible name for the API. | false | false | None | None | None |
| `managed_service` | Immutable. The name of a Google Managed Service ( https://cloud.google.com/service-infrastructure/docs/glossary#managed). If not specified, a new Service will automatically be created in the same project as this API. | false | false | None | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
