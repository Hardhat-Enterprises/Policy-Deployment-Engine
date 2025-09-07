## 🛡️ Policy Deployment Engine: `bigtable_instance`

This section provides a concise policy evaluation for the `bigtable_instance` resource in GCP.

Reference: [Terraform Registry – bigtable_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: to as many as possible within 8 cloud regions. Removing the field entirely from the config will cause the provider to default to the backend value. See [structure below](#nested_cluster). -----
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_type`
- Description: It is recommended to leave this field unspecified since the distinction between `"DEVELOPMENT"` and `"PRODUCTION"` instances is going away, and all instances will become `"PRODUCTION"` instances. This means that new and existing `"DEVELOPMENT"` instances will be converted to `"PRODUCTION"` instances. It is recommended for users to use `"PRODUCTION"` instances in any case, since a 1-node `"PRODUCTION"` instance is functionally identical to a `"DEVELOPMENT"` instance, but without the accompanying restrictions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_destroy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: When the field is set to true or unset in Terraform state, a `terraform apply` or `terraform destroy` that would delete the instance will fail. When the field is set to false, deleting the instance is allowed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terraform_labels`
- Description: The combination of labels configured directly on the resource and default labels configured on the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_labels`
- Description: All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. ----- <a name="nested_cluster"></a>The `cluster` block supports the following arguments:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: specified, the provider zone is used. Each cluster must have a different zone in the same region. Zones that support Bigtable instances are noted on the [Cloud Bigtable locations page](https://cloud.google.com/bigtable/docs/locations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `num_nodes`
- Description: If no value is set, Cloud Bigtable automatically allocates nodes based on your data footprint and optimized for 50% storage utilization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `autoscaling_config`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_nodes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_nodes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_target`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_target`
- Description: !> **Warning**: Only one of `autoscaling_config` or `num_nodes` should be set for a cluster. If both are set, `num_nodes` is ignored. If none is set, autoscaling will be disabled and sized to the current node count.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_type`
- Description: `"HDD"`. Defaults to `"SSD"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_scaling_factor`
- Description: -> **Note**: Removing the field entirely from the config will cause the provider to default to the backend value. !> **Warning:** Modifying the `storage_type`, `zone` or `kms_key_name` of an existing cluster (by `cluster_id`) will cause Terraform to delete/recreate the entire `google_bigtable_instance` resource. If these values are changing, use a new `cluster_id`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
