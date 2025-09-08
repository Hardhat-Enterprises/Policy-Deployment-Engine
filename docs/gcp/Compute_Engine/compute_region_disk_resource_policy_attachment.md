## 🛡️ Policy Deployment Engine: `compute_region_disk_resource_policy_attachment`

This section provides a concise policy evaluation for the `compute_region_disk_resource_policy_attachment` resource in GCP.

Reference: [Terraform Registry – compute_region_disk_resource_policy_attachment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_disk_resource_policy_attachment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource policy to be attached to the disk for scheduling snapshot creation. Do not specify the self link. | true | None | None |
| `disk` | The name of the regional disk in which the resource policies are attached to. | true | None | None |
| `region` | A reference to the region where the disk resides. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
