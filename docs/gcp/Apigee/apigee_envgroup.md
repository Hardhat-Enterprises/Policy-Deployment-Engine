## 🛡️ Policy Deployment Engine: `apigee_envgroup`

This section provides a concise policy evaluation for the `apigee_envgroup` resource in GCP.

Reference: [Terraform Registry – apigee_envgroup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_envgroup)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource ID of the environment group. | true | None | None |
| `org_id` | The Apigee Organization associated with the Apigee environment group, in the format `organizations/{{org_name}}`. | true | None | None |
| `hostnames` | Hostnames of the environment group. | false | None | None |
