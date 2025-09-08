## 🛡️ Policy Deployment Engine: `spanner_instance_config`

This section provides a concise policy evaluation for the `spanner_instance_config` resource in GCP.

Reference: [Terraform Registry – spanner_instance_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/spanner_instance_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The name of this instance configuration as it appears in UIs. | true | None | None |
| `name` | A unique identifier for the instance configuration. Values are of the form projects/<project>/instanceConfigs/[a-z][-a-z0-9]* | false | None | None |
| `base_config` | Base configuration name, e.g. nam3, based on which this configuration is created. Only set for user managed configurations. baseConfig must refer to a configuration of type GOOGLE_MANAGED in the same project as this configuration. | false | None | None |
| `labels` | An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### replicas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the serving resources, e.g. "us-central1". | false | None | None |
| `type` | Indicates the type of replica.  See the [replica types documentation](https://cloud.google.com/spanner/docs/replication#replica_types) for more details. Possible values are: `READ_WRITE`, `READ_ONLY`, `WITNESS`. | false | None | None |
| `default_leader_location` | If true, this location is designated as the default leader location where leader replicas are placed. | false | None | None |
