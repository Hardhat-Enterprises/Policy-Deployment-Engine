## 🛡️ Policy Deployment Engine: `integration_connectors_endpoint_attachment`

This section provides a concise policy evaluation for the `integration_connectors_endpoint_attachment` resource in GCP.

Reference: [Terraform Registry – integration_connectors_endpoint_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_endpoint_attachment)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_attachment` | The path of the service attachment. | true | true | service attachment is used to create a secure connection between service producer and service consumer. | projects/connectors-example/regions/us-central1/serviceAttachments/test | fake_project |
| `location` | Location in which Endpoint Attachment needs to be created. | true | false | location does not impact security. | None | None |
| `name` | Name of Endpoint Attachment needs to be created. | true | false | name of engpoint attachment is not security related. | None | None |
| `description` | Description of the resource. | false | false | description is not security related. | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | labels are not security related. | None | None |
| `endpoint_global_access` | Enable global access for endpoint attachment. | false | false | global access does not impact security. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | project is not security related. | None | None |
