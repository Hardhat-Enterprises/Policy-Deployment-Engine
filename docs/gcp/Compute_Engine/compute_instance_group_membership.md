## 🛡️ Policy Deployment Engine: `compute_instance_group_membership`

This section provides a concise policy evaluation for the `compute_instance_group_membership` resource in GCP.

Reference: [Terraform Registry – compute_instance_group_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group_membership)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance` | An instance being added to the InstanceGroup | true | None | None |
| `instance_group` | Represents an Instance Group resource name that the instance belongs to. | true | None | None |
| `zone` | A reference to the zone where the instance group resides. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
