## 🛡️ Policy Deployment Engine: `compute_resource_policy_attachment`

This section provides a concise policy evaluation for the `compute_resource_policy_attachment` resource in GCP.

Reference: [Terraform Registry – compute_resource_policy_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource policy to be attached to the instance for scheduling start/stop operations. Do not specify the self link. | true | None | None |
| `instance` | The name of the instance in which the resource policies are attached to. | true | None | None |
| `zone` | A reference to the zone where the instance resides. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
