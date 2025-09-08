## 🛡️ Policy Deployment Engine: `compute_instance_from_machine_image`

This section provides a concise policy evaluation for the `compute_instance_from_machine_image` resource in GCP.

Reference: [Terraform Registry – compute_instance_from_machine_image](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_from_machine_image)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Changing this forces a new resource to be created. | none | None | None |
| `source_machine_image` | image to create the instance based on. - - - | none | None | None |
| `zone` | set, the provider zone is used. In addition to these, most* arguments from `google_compute_instance` are supported as a way to override the properties in the machine image. All exported attributes from `google_compute_instance` are likewise exported here. ~> **Warning:** *Due to API limitations, disk overrides are currently disabled. This includes the "boot_disk", "attached_disk", and "scratch_disk" fields. | none | None | None |
