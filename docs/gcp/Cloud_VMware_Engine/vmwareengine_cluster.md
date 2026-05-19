## 🛡️ Policy Deployment Engine: `vmwareengine_cluster`

This section provides a concise policy evaluation for the `vmwareengine_cluster` resource in GCP.

Reference: [Terraform Registry – vmwareengine_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_cluster)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `parent` | The resource name of the private cloud to create a new cluster in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-west1-a/privateClouds/my-cloud | true | true | The parent value controls which private cloud the cluster is created under. Using an approved parent helps ensure that the cluster is deployed within a trusted private cloud, approved location, and managed environment. | projects/599444694846/locations/us-west1-a/privateClouds/c | projects/599444694846/locations/us-west1-a/privateClouds/nc |
| `name` | The ID of the Cluster. | true | true | Cluster names should follow an approved naming standard so that resources can be clearly identified, audited, and managed consistently | c, ext-cluster  | c, wrong-cluster |
| `node_type_configs` | The map of cluster node types in this cluster, where the key is canonical identifier of the node type (corresponds to the NodeType). Structure is [documented below](#nested_node_type_configs). | false | true | Node type configuration affects the cluster capacity, cost, and operational profile. Approved node types and node counts help maintain secure and controlled infrastructure sizing. | None | None |
| `autoscaling_settings` | Configuration of the autoscaling applied to this cluster Structure is [documented below](#nested_autoscaling_settings). | false | false | This field was not included in the implemented policy checks for this resource. | None | None |
| `autoscaling_policies` | Autoscaling policy settings that define how compute nodes are added or removed from the cluster. | false | false | Autoscaling policies were not included in the implemented policy checks for this resource. | None | None |
| `cpu_thresholds` |  | false | false | None | None | None |
| `consumed_memory_thresholds` |  | false | false | None | None | None |
| `storage_thresholds` |  | false | false | None | None | None |

### node_type_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_type_id` | The canonical identifier of the node type used by the cluster. | true | true | Only approved node types should be used to ensure the cluster runs on authorised hardware profiles that meet organisational security, performance, and cost requirements. | standard-72 | wrong-node-type |
| `node_count` | The number of nodes of this type in the cluster. | true | true | Node count affects availability, capacity, and cost. Enforcing an approved node count helps prevent under-provisioned or over-provisioned clusters. | 3 | 1 |
| `custom_core_count` | Customized number of cores available to each node of the type. This number must always be one of `nodeType.availableCustomCoreCounts`. If zero is provided max value from `nodeType.availableCustomCoreCounts` will be used. Once the customer is created then corecount cannot be changed. | false | false | This field was not included in the implemented policy checks for this resource. | None | None |

### autoscaling_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autoscaling_policies` | The map with autoscaling policies applied to the cluster. The key is the identifier of the policy. It must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with [RFC 1034](https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5) Currently the map must contain only one element that describes the autoscaling policy for compute nodes. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies). | true | false | This field was not included in the implemented policy checks for this resource. | None | None |
| `min_cluster_node_count` | Minimum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster. | false | false | This field was not included in the implemented policy checks for this resource. | None | None |
| `max_cluster_node_count` | Maximum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster. | false | false | This field was not included in the implemented policy checks for this resource. | None | None |
| `cool_down_period` | The minimum duration between consecutive autoscale operations. It starts once addition or removal of nodes is fully completed. Minimum cool down period is 30m. Cool down period must be in whole minutes (for example, 30m, 31m, 50m). Mandatory for successful addition of autoscaling settings in cluster. | false | false | This field was not included in the implemented policy checks for this resource. | None | None |

### autoscaling_policies Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autoscale_policy_id` | The identifier of the autoscaling policy. | false | false | This field was not included in the implemented policy checks for this resource. | None | None |
| `node_type_id` | The canonical identifier of the node type to add or remove. | true | false | Autoscaling policy node type was not included in the implemented policy checks for this resource. | None | None |
| `scale_out_size` | Number of nodes to add to a cluster during a scale-out operation. Must be divisible by 2 for stretched clusters. | true | false | This field was not included in the implemented policy checks for this resource. | None | None |
| `cpu_thresholds` | Utilization thresholds pertaining to CPU utilization. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_cpu_thresholds). | false | false | This field was not included in the implemented policy checks for this resource. | None | None |
| `consumed_memory_thresholds` | Utilization thresholds pertaining to amount of consumed memory. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_consumed_memory_thresholds). | false | false | This field was not included in the implemented policy checks for this resource. | None | None |
| `storage_thresholds` | Utilization thresholds pertaining to amount of consumed storage. Structure is [documented below](#nested_autoscaling_settings_autoscaling_policies_autoscaling_policy_storage_thresholds). | false | false | This field was not included in the implemented policy checks for this resource. | None | None |

### cpu_thresholds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | false | None | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | false | None | None | None |

### consumed_memory_thresholds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | false | None | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | false | None | None | None |

### storage_thresholds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | false | None | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | false | None | None | None |
