## 🛡️ Policy Deployment Engine: `lustre_instance`

This section provides a concise policy evaluation for the `lustre_instance` resource in GCP.

Reference: [Terraform Registry – lustre_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/lustre_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `capacity_gib` | The storage capacity of the instance in gibibytes (GiB). Allowed values are from `18000` to `954000`, in increments of 9000. | true | None | None |
| `filesystem` | The filesystem name for this instance. This name is used by client-side tools, including when mounting the instance. Must be eight characters or less and can only contain letters and numbers. | true | None | None |
| `network` | The full name of the VPC network to which the instance is connected. Must be in the format `projects/{project_id}/global/networks/{network_name}`. | true | None | None |
| `per_unit_storage_throughput` | The throughput of the instance in MB/s/TiB. Valid values are 125, 250, 500, 1000. | true | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | None | None |
| `instance_id` | The name of the Managed Lustre instance. * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. | true | None | None |
| `gke_support_enabled` | Indicates whether you want to enable support for GKE clients. By default, GKE clients are not supported. | false | None | None |
| `description` | A user-readable description of the instance. | false | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
