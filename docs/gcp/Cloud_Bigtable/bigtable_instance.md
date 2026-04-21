## 🛡️ Policy Deployment Engine: `bigtable_instance`

This section provides a concise policy evaluation for the `bigtable_instance` resource in GCP.

Reference: [Terraform Registry – bigtable_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Configuration for name on this Cloud Bigtable resource. | true | false | Terraform name of the Bigtable instance. | None | None |
| `cluster` | to as many as possible within 8 cloud regions. Removing the field entirely from the config will cause the provider to default to the backend value. See [structure below](#nested_cluster). ----- | false | false | Introduces cluster-level settings (zones, scaling, storage). | None | None |
| `project` | is not provided, the provider project is used. | true | false | GCP project ID that owns this instance. | None | None |
| `instance_type` | It is recommended to leave this field unspecified since the distinction between `"DEVELOPMENT"` and `"PRODUCTION"` instances is going away, and all instances will become `"PRODUCTION"` instances. This means that new and existing `"DEVELOPMENT"` instances will be converted to `"PRODUCTION"` instances. It is recommended for users to use `"PRODUCTION"` instances in any case, since a 1-node `"PRODUCTION"` instance is functionally identical to a `"DEVELOPMENT"` instance, but without the accompanying restrictions. | false | false | Development vs production sizing behavior (being unified by Google). | None | None |
| `display_name` | Configuration for display_name on this Cloud Bigtable resource. | false | false | Human-readable label in consoles. | None | None |
| `force_destroy` | Configuration for force_destroy on this Cloud Bigtable resource. | false | false | Allows Terraform destroy even when constraints would normally block it. | None | None |
| `deletion_protection` | When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the instance will fail. When the field is set to false, deleting the instance is allowed. | false | true | Deletion protection blocks accidental destructive operations on production instances. | true | false |
| `labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | false | false | Resource labels you manage via Terraform. | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | false | false | Merged labels including provider defaults. | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. ----- The `cluster` block supports the following arguments: | false | false | Authoritative union of labels from Terraform and GCP. | None | None |
| `cluster_id` | Configuration for cluster_id on this Cloud Bigtable resource. | false | false | Identifier for this cluster row when multiple clusters exist. | None | None |
| `zone` | specified, the provider zone is used. Each cluster must have a different zone in the same region. Zones that support Bigtable instances are noted on the [Cloud Bigtable locations page](https://cloud.google.com/bigtable/docs/locations). | false | true | Approved-zone enforcement supports data residency and compliance boundaries. | "australia-southeast1-a" | "us-central1-b" |
| `num_nodes` | If no value is set, Cloud Bigtable automatically allocates nodes based on your data footprint and optimized for 50% storage utilization. | false | false | Manual node count when not using autoscaling. | None | None |
| `autoscaling_config` | Configuration for autoscaling_config on this Cloud Bigtable resource. | false | false | Automatic node scaling bounds and signals. | None | None |
| `min_nodes` | Configuration for min_nodes on this Cloud Bigtable resource. | false | false | Autoscaling minimum node count. | None | None |
| `max_nodes` | Configuration for max_nodes on this Cloud Bigtable resource. | false | false | Autoscaling maximum node count. | None | None |
| `cpu_target` | Configuration for cpu_target on this Cloud Bigtable resource. | false | false | CPU target signal for autoscaling. | None | None |
| `storage_target` | !> **Warning**: Only one of `autoscaling_config` or `num_nodes` should be set for a cluster. If both are set, `num_nodes` is ignored. If none is set, autoscaling will be disabled and sized to the current node count. | false | false | Storage target signal for autoscaling. | None | None |
| `storage_type` | `"HDD"`. Defaults to `"SSD"`. | false | false | SSD vs HDD storage class for the cluster. | None | None |
| `kms_key_name` | Configuration for kms_key_name on this Cloud Bigtable resource. | false | true | CMEK is required, and key path must match approved project/location/keyring/key constraints. | "projects/PDE/locations/australia-southeast1/keyRings/bt-kr/cryptoKeys/bt-cmek" | null, "", or "projects/PDE/locations/us-central1/keyRings/bt-kr/cryptoKeys/bt-cmek" |
| `node_scaling_factor` | -> **Note**: Removing the field entirely from the config will cause the provider to default to the backend value. !> **Warning:** Modifying the `storage_type`, `zone` or `kms_key_name` of an existing cluster (by `cluster_id`) will cause Terraform to delete/recreate the entire `google_bigtable_instance` resource. If these values are changing, use a new `cluster_id`. | false | false | Provider-specific scaling granularity for nodes. | None | None |
