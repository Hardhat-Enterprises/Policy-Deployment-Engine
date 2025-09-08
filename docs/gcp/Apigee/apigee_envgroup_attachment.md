## 🛡️ Policy Deployment Engine: `apigee_envgroup_attachment`

This section provides a concise policy evaluation for the `apigee_envgroup_attachment` resource in GCP.

Reference: [Terraform Registry – apigee_envgroup_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_envgroup_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `environment` | The resource ID of the environment. | true | None | None |
| `envgroup_id` | The Apigee environment group associated with the Apigee environment, in the format `organizations/{{org_name}}/envgroups/{{envgroup_name}}`. | true | None | None |
