## 🛡️ Policy Deployment Engine: `vmwareengine_private_cloud`

This section provides a concise policy evaluation for the `vmwareengine_private_cloud` resource in GCP.

Reference: [Terraform Registry – vmwareengine_private_cloud](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_private_cloud)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network_config` | Network configuration in the consumer project with which the peering has to be done. Structure is [documented below](#nested_network_config). | true | true | Network configuration controls the management CIDR and VMware Engine network attached to the private cloud. These values affect private cloud connectivity and should use approved network ranges and networks. | None | None |
| `management_cluster` | The management cluster for this private cloud. This used for creating and managing the default cluster. Structure is [documented below](#nested_management_cluster). | true | true | The management cluster defines core private cloud capacity and availability settings. For this documentation, the implemented policy focuses on stretched cluster zone placement. | None | None |
| `location` | The location where the PrivateCloud should reside. | true | true | The location determines where the private cloud is deployed. Approved locations help meet organisational, compliance, and data governance requirements. | australia-southeast1 | us-west1-a |
| `name` | The ID of the PrivateCloud. | true | true | Private cloud names should follow an approved naming standard | c | nc |
| `description` | User-provided description for this private cloud. | false | false | The description is used for documentation and does not directly change the security posture of the private cloud. | None | None |
| `type` | Initial type of the private cloud. Possible values are STANDARD, TIME_LIMITED, and STRETCHED. | false | true | The private cloud type affects availability and deployment behaviour. STRETCHED private clouds require approved preferred and secondary zones. | STRETCHED | TIME_LIMITED |
| `project` | If it is not provided, the provider project is used. | false | true | The project determines where the private cloud is created. Using an approved project helps keep the resource within the correct governance, access control, and billing boundary. | project-d7f19645-ccba-48ef-bce | unapproved-project |
| `deletion_delay_hours` | The number of hours to delay a deletion request. If no value is set, a default value is set at the API level. | false | false | This field controls deletion timing and was not included in the implemented policy checks for this resource. | None | None |
| `send_deletion_delay_hours_if_zero` | When set to true, deletion_delay_hours is sent in the request even when the value is zero. | false | false | This field controls deletion request behaviour and was not included in the implemented policy checks for this resource. | None | None |
| `node_type_configs` | Node type configuration for the private cloud management cluster. | false | false | Node type configuration was not included in the implemented private cloud policy checks for this resource. | None | None |
| `stretched_cluster_config` | Stretched cluster configuration for the private cloud. | false | true | Stretched cluster zone placement affects availability and compliance. Preferred and secondary locations should be limited to approved zones. | None | None |
| `autoscaling_settings` | Configuration of autoscaling applied to this cluster. | false | false | Autoscaling settings were not included in the implemented private cloud policy checks for this resource. | None | None |
| `autoscaling_policies` | Autoscaling policy settings for the private cloud management cluster. | false | false | Autoscaling policies were not included in the implemented private cloud policy checks for this resource. | None | None |
| `cpu_thresholds` | CPU utilization thresholds used by autoscaling policies. | false | false | CPU threshold fields were not included in the implemented private cloud policy checks for this resource. | None | None |
| `consumed_memory_thresholds` | Consumed memory utilization thresholds used by autoscaling policies. | false | false | Memory threshold fields were not included in the implemented private cloud policy checks for this resource. | None | None |
| `storage_thresholds` | Storage utilization thresholds used by autoscaling policies. | false | false | Storage threshold fields were not included in the implemented private cloud policy checks for this resource. | None | None |

### network_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `management_cidr` | Management CIDR used by VMware management appliances. | true | true | The management CIDR controls the IP range used by VMware management appliances. Approved CIDR ranges help avoid overlap and routing conflicts. | 192.168.30.0/24 | 10.0.0.0/24 |
| `vmware_engine_network` | The relative resource name of the VMware Engine network attached to the private cloud. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID. | false | true | The VMware Engine network determines which network the private cloud connects to. Using an approved network helps keep the private cloud within the intended network boundary. | projects/599444694846/locations/global/vmwareEngineNetworks/c | projects/599444694846/locations/global/vmwareEngineNetworks/nc |
| `vmware_engine_network_canonical` | (Output) The canonical name of the VMware Engine network in the form: projects/{project_number}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} | false | false | This is an output-only field and is not directly configured by the policy. | None | None |
| `management_ip_address_layout_version` | (Output) The IP address layout version of the management IP address range. Possible versions include: * managementIpAddressLayoutVersion=1: Indicates the legacy IP address layout used by some existing private clouds. This is no longer supported for new private clouds as it does not support all features. * managementIpAddressLayoutVersion=2: Indicates the latest IP address layout used by all newly created private clouds. This version supports all current features. | false | false | This is an output-only field and is not directly configured by the policy. | None | None |
| `dns_server_ip` | (Output) DNS Server IP of the Private Cloud. | false | false | This is an output-only field and is not directly configured by the policy. | None | None |

### management_cluster Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_id` | The user-provided identifier of the new Cluster. The identifier must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with RFC 1034 (https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5) | true | true | Cluster identifiers should follow approved naming standards so that management clusters can be clearly identified and audited. | c | nc |
| `node_type_configs` | The map of cluster node types in this cluster, where the key is canonical identifier of the node type (corresponds to the NodeType). Structure is [documented below](#nested_management_cluster_node_type_configs). | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `stretched_cluster_config` | The stretched cluster configuration for the private cloud. Structure is [documented below](#nested_management_cluster_stretched_cluster_config). | false | true | Stretched cluster configuration controls the preferred and secondary zones used for availability. These zones should stay within approved Australian zones. | None | None |
| `autoscaling_settings` | Configuration of the autoscaling applied to this cluster Private cloud must have a minimum of 3 nodes to add autoscale settings Structure is [documented below](#nested_management_cluster_autoscaling_settings). | false | false | Autoscaling settings were not included in the implemented private cloud policy checks for this resource. | None | None |

### node_type_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_type_id` | The identifier of the node type. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `node_count` | The number of nodes of this type in the cluster. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `custom_core_count` | Customized number of cores available to each node of the type. This number must always be one of `nodeType.availableCustomCoreCounts`. If zero is provided max value from `nodeType.availableCustomCoreCounts` will be used. This cannot be changed once the PrivateCloud is created. | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |

### stretched_cluster_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `preferred_location` | Zone that will remain operational when connection between the two zones is lost. Specify the zone in the following format: projects/{project}/locations/{location}. | false | true | The preferred location should be in an approved zone to maintain compliant private cloud placement. | projects/projectabc/locations/australia-southeast1-a | projects/projectabc/locations/asia-southeast2-c |
| `secondary_location` | Additional zone for a higher level of availability and load balancing. Specify the zone in the following format: projects/{project}/locations/{location}. | false | true | The secondary location should be in an approved zone to maintain compliant stretched cluster placement. | projects/projectabc/locations/australia-southeast2-b | projects/projectabc/locations/asia-southeast1-b |

### autoscaling_settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autoscaling_policies` | The map with autoscaling policies applied to the cluster. The key is the identifier of the policy. It must meet the following requirements: * Only contains 1-63 alphanumeric characters and hyphens * Begins with an alphabetical character * Ends with a non-hyphen character * Not formatted as a UUID * Complies with [RFC 1034](https://datatracker.ietf.org/doc/html/rfc1034) (section 3.5) Currently the map must contain only one element that describes the autoscaling policy for compute nodes. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies). | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `min_cluster_node_count` | Minimum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster. | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `max_cluster_node_count` | Maximum number of nodes of any type in a cluster. Mandatory for successful addition of autoscaling settings in cluster. | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `cool_down_period` | The minimum duration between consecutive autoscale operations. It starts once addition or removal of nodes is fully completed. Minimum cool down period is 30m. Cool down period must be in whole minutes (for example, 30m, 31m, 50m). Mandatory for successful addition of autoscaling settings in cluster. | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |

### autoscaling_policies Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `autoscale_policy_id` | The identifier of the autoscaling policy. | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `node_type_id` | The canonical identifier of the node type to add or remove. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `scale_out_size` | Number of nodes to add to a cluster during a scale-out operation. Must be divisible by 2 for stretched clusters. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `cpu_thresholds` | Utilization thresholds pertaining to CPU utilization. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_cpu_thresholds). | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `consumed_memory_thresholds` | Utilization thresholds pertaining to amount of consumed memory. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_consumed_memory_thresholds). | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `storage_thresholds` | Utilization thresholds pertaining to amount of consumed storage. Structure is [documented below](#nested_management_cluster_autoscaling_settings_autoscaling_policies_autoscaling_policy_storage_thresholds). | false | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |

### cpu_thresholds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |

### consumed_memory_thresholds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |

### storage_thresholds Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `scale_out` | The utilization triggering the scale-out operation in percent. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
| `scale_in` | The utilization triggering the scale-in operation in percent. | true | false | This field was not included in the implemented private cloud policy checks for this resource. | None | None |
