## 🛡️ Policy Deployment Engine: `bigtable_instance`

This section provides a concise policy evaluation for the `bigtable_instance` resource in GCP.

Reference: [Terraform Registry – bigtable_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` |  | none | None | None |
| `cluster` | to as many as possible within 8 cloud regions. Removing the field entirely from the config will cause the provider to default to the backend value. See [structure below](#nested_cluster). ----- | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `instance_type` | It is recommended to leave this field unspecified since the distinction between `"DEVELOPMENT"` and `"PRODUCTION"` instances is going away, and all instances will become `"PRODUCTION"` instances. This means that new and existing `"DEVELOPMENT"` instances will be converted to `"PRODUCTION"` instances. It is recommended for users to use `"PRODUCTION"` instances in any case, since a 1-node `"PRODUCTION"` instance is functionally identical to a `"DEVELOPMENT"` instance, but without the accompanying restrictions. | none | None | None |
| `display_name` |  | none | None | None |
| `force_destroy` |  | none | None | None |
| `deletion_protection` | When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the instance will fail. When the field is set to false, deleting the instance is allowed. | none | None | None |
| `labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. ----- The `cluster` block supports the following arguments: | none | None | None |
| `cluster_id` |  | none | None | None |
| `zone` | specified, the provider zone is used. Each cluster must have a different zone in the same region. Zones that support Bigtable instances are noted on the [Cloud Bigtable locations page](https://cloud.google.com/bigtable/docs/locations). | none | None | None |
| `num_nodes` | If no value is set, Cloud Bigtable automatically allocates nodes based on your data footprint and optimized for 50% storage utilization. | none | None | None |
| `autoscaling_config` |  | none | None | None |
| `min_nodes` |  | none | None | None |
| `max_nodes` |  | none | None | None |
| `cpu_target` |  | none | None | None |
| `storage_target` | !> **Warning**: Only one of `autoscaling_config` or `num_nodes` should be set for a cluster. If both are set, `num_nodes` is ignored. If none is set, autoscaling will be disabled and sized to the current node count. | none | None | None |
| `storage_type` | `"HDD"`. Defaults to `"SSD"`. | none | None | None |
| `kms_key_name` |  | none | None | None |
| `node_scaling_factor` | -> **Note**: Removing the field entirely from the config will cause the provider to default to the backend value. !> **Warning:** Modifying the `storage_type`, `zone` or `kms_key_name` of an existing cluster (by `cluster_id`) will cause Terraform to delete/recreate the entire `google_bigtable_instance` resource. If these values are changing, use a new `cluster_id`. | none | None | None |
