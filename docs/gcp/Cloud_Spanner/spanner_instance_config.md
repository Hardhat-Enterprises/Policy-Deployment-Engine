## 🛡️ Policy Deployment Engine: `spanner_instance_config`

This section provides a concise policy evaluation for the `spanner_instance_config` resource in GCP.

Reference: [Terraform Registry – spanner_instance_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance_config)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The name of this instance configuration as it appears in UIs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replicas`
- Description: (Required) The geographic placement of nodes in this instance configuration and their replication properties. Structure is [documented below](#nested_replicas).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) A unique identifier for the instance configuration. Values are of the form projects/<project>/instanceConfigs/[a-z][-a-z0-9]*
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `base_config`
- Description: (Optional) Base configuration name, e.g. nam3, based on which this configuration is created. Only set for user managed configurations. baseConfig must refer to a configuration of type GOOGLE_MANAGED in the same project as this configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_replicas"></a>The `replicas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location of the serving resources, e.g. "us-central1".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Indicates the type of replica.  See the [replica types documentation](https://cloud.google.com/spanner/docs/replication#replica_types) for more details. Possible values are: `READ_WRITE`, `READ_ONLY`, `WITNESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_leader_location`
- Description: (Optional) If true, this location is designated as the default leader location where leader replicas are placed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
