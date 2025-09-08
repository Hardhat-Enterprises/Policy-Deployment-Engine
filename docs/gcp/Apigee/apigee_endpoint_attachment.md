## 🛡️ Policy Deployment Engine: `apigee_endpoint_attachment`

This section provides a concise policy evaluation for the `apigee_endpoint_attachment` resource in GCP.

Reference: [Terraform Registry – apigee_endpoint_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_endpoint_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Location of the endpoint attachment. | true | None | None |
| `service_attachment` | Format: projects/*/regions/*/serviceAttachments/* | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee instance, in the format `organizations/{{org_name}}`. | true | None | None |
| `endpoint_attachment_id` | ID of the endpoint attachment. | true | None | None |
