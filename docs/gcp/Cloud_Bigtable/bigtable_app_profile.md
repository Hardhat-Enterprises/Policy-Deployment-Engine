## 🛡️ Policy Deployment Engine: `bigtable_app_profile`

This section provides a concise policy evaluation for the `bigtable_app_profile` resource in GCP.

Reference: [Terraform Registry – bigtable_app_profile](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_app_profile)

---

## 1. Argument Reference

### `app_profile_id`
- Description: (Required) The unique name of the app profile in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Long form description of the use case for this app profile.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multi_cluster_routing_use_any`
- Description: (Optional) If true, read/write requests are routed to the nearest cluster in the instance, and will fail over to the nearest cluster that is available in the event of transient errors or delays. Clusters in a region are considered equidistant. Choosing this option sacrifices read-your-writes consistency to improve availability.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `single_cluster_routing`
- Description: (Optional) Use a single-cluster routing policy. Structure is [documented below](#nested_single_cluster_routing).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standard_isolation`
- Description: (Optional) The standard options used for isolating this app profile's traffic from other use cases. Structure is [documented below](#nested_standard_isolation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_boost_isolation_read_only`
- Description: (Optional) Specifies that this app profile is intended for read-only usage via the Data Boost feature. Structure is [documented below](#nested_data_boost_isolation_read_only).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) The name of the instance to create the app profile within.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_warnings`
- Description: (Optional) If true, ignore safety checks when deleting/updating the app profile.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_single_cluster_routing"></a>The `single_cluster_routing` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_id`
- Description: (Required) The cluster to which read/write requests should be routed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_transactional_writes`
- Description: (Optional) If true, CheckAndMutateRow and ReadModifyWriteRow requests are allowed by this app profile. It is unsafe to send these requests to the same table/row/column in multiple clusters. <a name="nested_standard_isolation"></a>The `standard_isolation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `priority`
- Description: (Required) The priority of requests sent using this app profile. Possible values are: `PRIORITY_LOW`, `PRIORITY_MEDIUM`, `PRIORITY_HIGH`. <a name="nested_data_boost_isolation_read_only"></a>The `data_boost_isolation_read_only` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `compute_billing_owner`
- Description: (Required) The Compute Billing Owner for this Data Boost App Profile. Possible values are: `HOST_PAYS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
