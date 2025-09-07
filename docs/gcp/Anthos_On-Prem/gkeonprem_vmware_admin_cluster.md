## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_admin_cluster`

This section provides a concise policy evaluation for the `gkeonprem_vmware_admin_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_admin_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_admin_cluster)

---

## 1. Argument Reference

### `network_config`
- Description: (Required) The VMware admin cluster network configuration. Structure is [documented below](#nested_network_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The VMware admin cluster resource name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human readable description of this VMware admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_prem_version`
- Description: (Optional) The Anthos clusters on the VMware version for the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_type`
- Description: (Optional) The OS image type for the VMware admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bootstrap_cluster_membership`
- Description: (Optional) The bootstrap cluster this VMware admin cluster belongs to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Annotations on the VMware Admin Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_node`
- Description: (Optional) The VMware admin cluster control plane node configuration. Structure is [documented below](#nested_control_plane_node).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `addon_node`
- Description: (Optional) The VMware admin cluster addon node configuration. Structure is [documented below](#nested_addon_node).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancer`
- Description: (Optional) Specifies the load balancer configuration for VMware admin cluster. Structure is [documented below](#nested_load_balancer).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vcenter`
- Description: (Optional) Specifies vCenter config for the admin cluster. Structure is [documented below](#nested_vcenter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `anti_affinity_groups`
- Description: (Optional) AAGConfig specifies whether to spread VMware Admin Cluster nodes across at least three physical hosts in the datacenter. Structure is [documented below](#nested_anti_affinity_groups).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_repair_config`
- Description: (Optional) Configuration for auto repairing. Structure is [documented below](#nested_auto_repair_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization`
- Description: (Optional) The VMware admin cluster authorization configuration. Structure is [documented below](#nested_authorization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `platform_config`
- Description: (Optional) The VMware platform configuration. Structure is [documented below](#nested_platform_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_registry_config`
- Description: (Optional) Configuration for private registry. Structure is [documented below](#nested_private_registry_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_address_cidr_blocks`
- Description: (Required) All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported.. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_address_cidr_blocks`
- Description: (Required) All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `static_ip_config`
- Description: (Optional) Configuration settings for a static IP configuration. Structure is [documented below](#nested_network_config_static_ip_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dhcp_ip_config`
- Description: (Optional) Configuration settings for a DHCP IP configuration. Structure is [documented below](#nested_network_config_dhcp_ip_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vcenter_network`
- Description: (Optional) vcenter_network specifies vCenter network name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_config`
- Description: (Optional) Represents common network settings irrespective of the host's IP address. Structure is [documented below](#nested_network_config_host_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ha_control_plane_config`
- Description: (Optional) Configuration for HA admin cluster control plane. Structure is [documented below](#nested_network_config_ha_control_plane_config). <a name="nested_network_config_static_ip_config"></a>The `static_ip_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_blocks`
- Description: (Optional) Represents the configuration values for static IP allocation to nodes. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks). <a name="nested_network_config_static_ip_config_ip_blocks"></a>The `ip_blocks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `netmask`
- Description: (Required) The netmask used by the VMware Admin Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway`
- Description: (Required) The network gateway used by the VMware Admin Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ips`
- Description: (Required) The node's network configurations used by the VMware Admin Cluster. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks_ip_blocks_ips). <a name="nested_network_config_static_ip_config_ip_blocks_ip_blocks_ips"></a>The `ips` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip`
- Description: (Required) IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2.3.0/24).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Optional) Hostname of the machine. VM's name will be used if this field is empty. <a name="nested_network_config_dhcp_ip_config"></a>The `dhcp_ip_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) enabled is a flag to mark if DHCP IP allocation is used for VMware admin clusters. <a name="nested_network_config_host_config"></a>The `host_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_servers`
- Description: (Optional) DNS servers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ntp_servers`
- Description: (Optional) NTP servers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dns_search_domains`
- Description: (Optional) DNS search domains. <a name="nested_network_config_ha_control_plane_config"></a>The `ha_control_plane_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_ip_block`
- Description: (Optional) Static IP addresses for the control plane nodes. Structure is [documented below](#nested_network_config_ha_control_plane_config_control_plane_ip_block). <a name="nested_network_config_ha_control_plane_config_control_plane_ip_block"></a>The `control_plane_ip_block` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `netmask`
- Description: (Required) The netmask used by the VMware Admin Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway`
- Description: (Required) The network gateway used by the VMware Admin Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ips`
- Description: (Required) The node's network configurations used by the VMware Admin Cluster. Structure is [documented below](#nested_network_config_ha_control_plane_config_control_plane_ip_block_ips). <a name="nested_network_config_ha_control_plane_config_control_plane_ip_block_ips"></a>The `ips` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip`
- Description: (Required) IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2.3.0/24).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Optional) Hostname of the machine. VM's name will be used if this field is empty. <a name="nested_control_plane_node"></a>The `control_plane_node` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpus`
- Description: (Optional) The number of vCPUs for the control-plane node of the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory`
- Description: (Optional) The number of mebibytes of memory for the control-plane node of the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replicas`
- Description: (Optional) The number of control plane nodes for this VMware admin cluster. <a name="nested_addon_node"></a>The `addon_node` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_resize_config`
- Description: (Optional) Specifies auto resize config. Structure is [documented below](#nested_addon_node_auto_resize_config). <a name="nested_addon_node_auto_resize_config"></a>The `auto_resize_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether to enable controle plane node auto resizing. <a name="nested_load_balancer"></a>The `load_balancer` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vip_config`
- Description: (Required) Specified the VMware Load Balancer Config Structure is [documented below](#nested_load_balancer_vip_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `f5_config`
- Description: (Optional) Configuration for F5 Big IP typed load balancers. Structure is [documented below](#nested_load_balancer_f5_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual_lb_config`
- Description: (Optional) Manually configured load balancers. Structure is [documented below](#nested_load_balancer_manual_lb_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metal_lb_config`
- Description: (Optional) Metal LB load balancers. Structure is [documented below](#nested_load_balancer_metal_lb_config). <a name="nested_load_balancer_vip_config"></a>The `vip_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_vip`
- Description: (Required) The VIP which you previously set aside for the Kubernetes API of this VMware Admin Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `addons_vip`
- Description: (Optional) The VIP to configure the load balancer for add-ons. <a name="nested_load_balancer_f5_config"></a>The `f5_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address`
- Description: (Optional) The load balancer's IP address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partition`
- Description: (Optional) he preexisting partition to be used by the load balancer. T his partition is usually created for the admin cluster for example: 'my-f5-admin-partition'.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snat_pool`
- Description: (Optional) The pool name. Only necessary, if using SNAT. <a name="nested_load_balancer_manual_lb_config"></a>The `manual_lb_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress_http_node_port`
- Description: (Optional) NodePort for ingress service's http. The ingress service in the admin cluster is implemented as a Service of type NodePort (ex. 32527).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress_https_node_port`
- Description: (Optional) NodePort for ingress service's https. The ingress service in the admin cluster is implemented as a Service of type NodePort (ex. 30139).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_node_port`
- Description: (Optional) NodePort for control plane service. The Kubernetes API server in the admin cluster is implemented as a Service of type NodePort (ex. 30968).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `konnectivity_server_node_port`
- Description: (Optional) NodePort for konnectivity server service running as a sidecar in each kube-apiserver pod (ex. 30564).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `addons_node_port`
- Description: (Optional) NodePort for add-ons server in the admin cluster. <a name="nested_load_balancer_metal_lb_config"></a>The `metal_lb_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Metal LB is enabled. <a name="nested_vcenter"></a>The `vcenter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_pool`
- Description: (Optional) The name of the vCenter resource pool for the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `datastore`
- Description: (Optional) The name of the vCenter datastore for the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `datacenter`
- Description: (Optional) The name of the vCenter datacenter for the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Optional) The name of the vCenter cluster for the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `folder`
- Description: (Optional) The name of the vCenter folder for the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_cert_data`
- Description: (Optional) Contains the vCenter CA certificate public key for SSL verification.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address`
- Description: (Optional) The vCenter IP address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disk`
- Description: (Optional) The name of the virtual machine disk (VMDK) for the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_policy_name`
- Description: (Optional) The name of the vCenter storage policy for the user cluster. <a name="nested_anti_affinity_groups"></a>The `anti_affinity_groups` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aag_config_disabled`
- Description: (Required) Spread nodes across at least three physical hosts (requires at least three hosts). Enabled by default. <a name="nested_auto_repair_config"></a>The `auto_repair_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether auto repair is enabled. <a name="nested_authorization"></a>The `authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `viewer_users`
- Description: (Optional) Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_authorization_viewer_users). <a name="nested_authorization_viewer_users"></a>The `viewer_users` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) The name of the user, e.g. `my-gcp-id@gmail.com`. <a name="nested_platform_config"></a>The `platform_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `required_platform_version`
- Description: (Optional) The required platform version e.g. 1.13.1. If the current platform version is lower than the target version, the platform version will be updated to the target version. If the target version is not installed in the platform (bundle versions), download the target version bundle.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `platform_version`
- Description: (Output) The platform version e.g. 1.13.2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bundles`
- Description: (Output) The list of bundles installed in the admin cluster. Structure is [documented below](#nested_platform_config_bundles).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: (Output) ResourceStatus representing detailed cluster state. Structure is [documented below](#nested_platform_config_status). <a name="nested_platform_config_bundles"></a>The `bundles` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Output) The version of the bundle.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: (Output) ResourceStatus representing detailed cluster state. Structure is [documented below](#nested_platform_config_bundles_bundles_status). <a name="nested_platform_config_bundles_bundles_status"></a>The `status` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_message`
- Description: (Output) Human-friendly representation of the error message from the admin cluster controller. The error message can be temporary as the admin cluster controller creates a cluster or node pool. If the error message persists for a longer period of time, it can be used to surface error message to indicate real problems requiring user intervention.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditions`
- Description: (Output) ResourceConditions provide a standard mechanism for higher-level status reporting from admin cluster controller. Structure is [documented below](#nested_platform_config_bundles_bundles_status_conditions). <a name="nested_platform_config_bundles_bundles_status_conditions"></a>The `conditions` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Output) Type of the condition. (e.g., ClusterRunning, NodePoolRunning or ServerSidePreflightReady)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reason`
- Description: (Output) Machine-readable message indicating details about last transition.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message`
- Description: (Output) Human-readable message indicating details about last transition.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last_transition_time`
- Description: (Output) Last time the condition transit from one status to another.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) The lifecycle state of the condition. <a name="nested_platform_config_status"></a>The `status` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `error_message`
- Description: (Output) Human-friendly representation of the error message from the admin cluster controller. The error message can be temporary as the admin cluster controller creates a cluster or node pool. If the error message persists for a longer period of time, it can be used to surface error message to indicate real problems requiring user intervention.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `conditions`
- Description: (Output) ResourceConditions provide a standard mechanism for higher-level status reporting from admin cluster controller. Structure is [documented below](#nested_platform_config_status_conditions). <a name="nested_platform_config_status_conditions"></a>The `conditions` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Output) Type of the condition. (e.g., ClusterRunning, NodePoolRunning or ServerSidePreflightReady)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reason`
- Description: (Output) Machine-readable message indicating details about last transition.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `message`
- Description: (Output) Human-readable message indicating details about last transition.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last_transition_time`
- Description: (Output) Last time the condition transit from one status to another.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Output) The lifecycle state of the condition. <a name="nested_private_registry_config"></a>The `private_registry_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address`
- Description: (Optional) The registry address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_cert`
- Description: (Optional) The CA certificate public key for private registry.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
