## 🛡️ Policy Deployment Engine: `apigee_instance_attachment`

This section provides a concise policy evaluation for the `apigee_instance_attachment` resource in GCP.

Reference: [Terraform Registry – apigee_instance_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_instance_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `environment` | The resource ID of the environment. | true | None | None |
| `instance_id` | The Apigee instance associated with the Apigee environment, in the format `organizations/{{org_name}}/instances/{{instance_name}}`. | true | None | None |
