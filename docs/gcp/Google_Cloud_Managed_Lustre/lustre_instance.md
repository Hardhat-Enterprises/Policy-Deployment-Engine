## 🛡️ Policy Deployment Engine: `lustre_instance`

This section provides a concise policy evaluation for the `lustre_instance` resource in GCP.

Reference: [Terraform Registry – lustre_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/lustre_instance)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `capacity_gib` | The storage capacity of the instance in gibibytes (GiB). Allowed values are from `18000` to `954000`, in increments of 9000. | false | false | None | None | None |
| `filesystem` | The filesystem name for this instance. This name is used by client-side tools, including when mounting the instance. Must be eight characters or less and can only contain letters and numbers. | false | false | None | None | None |
| `network` | The full name of the VPC network to which the instance is connected. Must be in the format `projects/{project_id}/global/networks/{network_name}`. | true | true | The full VPC format ensures the instance is bound to a valid and secure GCP network. | `projects/my-project/global/networks/vpc-1` | `vpc-1`, `networks/vpc-1` — missing full path format. |
| `per_unit_storage_throughput` | The throughput of the instance in MB/s/TiB. Valid values are 125, 250, 500, 1000. | true | false | GCP supports specific throughput tiers for predictable performance and resource allocation. | `250`, `500` — valid throughput levels. | `300`, `600` — not among supported values. |
| `location` | The location should be a valid location | true | true | Restricting to allowed locations ensures compliance with regional data residency and service availability. | australia-southeast-1-a, australia-southeast-1-b | europe-west3 |
| `instance_id` | The name of the Managed Lustre instance. * Must contain only lowercase letters, numbers, and hyphens. * Must start with a letter. * Must be between 1-63 characters. * Must end with a number or a letter. | true | false | None | None | None |
| `gke_support_enabled` | Indicates whether you want to enable support for GKE clients. By default, GKE clients are not supported. | true | true | GKE integration must be explicitly enabled for Lustre to be discoverable and mountable by Kubernetes workloads. | `true` — GKE support enabled. | `false` or not set — GKE clients will not be supported. |
| `description` | A user-readable description of the instance. | false | false | None | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
