## 🛡️ Policy Deployment Engine: `compute_instance_group_named_port`

This section provides a concise policy evaluation for the `compute_instance_group_named_port` resource in GCP.

Reference: [Terraform Registry – compute_instance_group_named_port](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group_named_port)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name for this named port. The name must be 1-63 characters long, and comply with RFC1035. | true | None | None |
| `port` | The port number, which can be a value between 1 and 65535. | true | None | None |
| `group` | The name of the instance group. | true | None | None |
| `zone` | The zone of the instance group. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
