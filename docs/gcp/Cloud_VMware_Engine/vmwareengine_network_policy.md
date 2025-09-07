## 🛡️ Policy Deployment Engine: `vmwareengine_network_policy`

This section provides a concise policy evaluation for the `vmwareengine_network_policy` resource in GCP.

Reference: [Terraform Registry – vmwareengine_network_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/vmwareengine_network_policy)

---

## 1. Argument Reference

### `edge_services_cidr`
- Description: (Required) IP address range in CIDR notation used to create internet access and external IP access. An RFC 1918 CIDR block, with a "/26" prefix, is required. The range cannot overlap with any prefixes either in the consumer VPC network or in use by the private clouds attached to that VPC network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vmware_engine_network`
- Description: (Required) The relative resource name of the VMware Engine network. Specify the name in the following form: projects/{project}/locations/{location}/vmwareEngineNetworks/{vmwareEngineNetworkId} where {project} can either be a project number or a project ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The resource name of the location (region) to create the new network policy in. Resource names are schemeless URIs that follow the conventions in https://cloud.google.com/apis/design/resource_names. For example: projects/my-project/locations/us-central1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The ID of the Network Policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User-provided description for this network policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `internet_access`
- Description: (Optional) Network service that allows VMware workloads to access the internet. Structure is [documented below](#nested_internet_access).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_ip`
- Description: (Optional) Network service that allows External IP addresses to be assigned to VMware workloads. This service can only be enabled when internetAccess is also enabled. Structure is [documented below](#nested_external_ip).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_internet_access"></a>The `internet_access` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) True if the service is enabled; false otherwise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) State of the service. New values may be added to this enum when appropriate. <a name="nested_external_ip"></a>The `external_ip` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) True if the service is enabled; false otherwise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) State of the service. New values may be added to this enum when appropriate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
