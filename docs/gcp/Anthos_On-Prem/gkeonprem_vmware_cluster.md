## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_cluster`

This section provides a concise policy evaluation for the `gkeonprem_vmware_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_cluster)

---

## 1. Argument Reference

### `admin_cluster_membership`
- Description: (Required) The admin cluster this VMware User Cluster belongs to. This is the full resource name of the admin cluster's hub membership. In the future, references to other resource types might be allowed if admin clusters are modeled as their own resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_prem_version`
- Description: (Required) The Anthos clusters on the VMware version for your user cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_node`
- Description: (Required) VMware User Cluster control plane nodes must have either 1 or 3 replicas. Structure is [documented below](#nested_control_plane_node).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The VMware cluster name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human readable description of this VMware User Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Annotations on the VMware User Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `anti_affinity_groups`
- Description: (Optional) AAGConfig specifies whether to spread VMware User Cluster nodes across at least three physical hosts in the datacenter. Structure is [documented below](#nested_anti_affinity_groups).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage`
- Description: (Optional) Storage configuration. Structure is [documented below](#nested_storage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Optional) The VMware User Cluster network configuration. Structure is [documented below](#nested_network_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancer`
- Description: (Optional) Load Balancer configuration. Structure is [documented below](#nested_load_balancer).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataplane_v2`
- Description: (Optional) VmwareDataplaneV2Config specifies configuration for Dataplane V2. Structure is [documented below](#nested_dataplane_v2).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_tracking_enabled`
- Description: (Optional) Enable VM tracking.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_repair_config`
- Description: (Optional) Configuration for auto repairing. Structure is [documented below](#nested_auto_repair_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization`
- Description: (Optional) RBAC policy that will be applied and managed by GKE On-Prem. Structure is [documented below](#nested_authorization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_control_plane_v2`
- Description: (Optional) Enable control plane V2. Default to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_advanced_cluster`
- Description: (Optional) Enable advanced cluster. Default to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_bundled_ingress`
- Description: (Optional) Disable bundled ingress.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upgrade_policy`
- Description: (Optional) Specifies upgrade policy for the cluster. Structure is [documented below](#nested_upgrade_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vcenter`
- Description: (Optional) VmwareVCenterConfig specifies vCenter config for the user cluster. Inherited from the admin cluster. Structure is [documented below](#nested_vcenter).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_control_plane_node"></a>The `control_plane_node` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpus`
- Description: (Optional) The number of CPUs for each admin cluster node that serve as control planes for this VMware User Cluster. (default: 4 CPUs)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory`
- Description: (Optional) The megabytes of memory for each admin cluster node that serves as a control plane for this VMware User Cluster (default: 8192 MB memory).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replicas`
- Description: (Optional) The number of control plane nodes for this VMware User Cluster. (default: 1 replica).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_resize_config`
- Description: (Optional) AutoResizeConfig provides auto resizing configurations. Structure is [documented below](#nested_control_plane_node_auto_resize_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vsphere_config`
- Description: (Output) Vsphere-specific config. Structure is [documented below](#nested_control_plane_node_vsphere_config). <a name="nested_control_plane_node_auto_resize_config"></a>The `auto_resize_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether to enable control plane node auto resizing. <a name="nested_control_plane_node_vsphere_config"></a>The `vsphere_config` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `datastore`
- Description: (Output) The Vsphere datastore used by the Control Plane Node.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_policy_name`
- Description: (Output) The Vsphere storage policy used by the control plane Node. <a name="nested_anti_affinity_groups"></a>The `anti_affinity_groups` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aag_config_disabled`
- Description: (Required) Spread nodes across at least three physical hosts (requires at least three hosts). Enabled by default. <a name="nested_storage"></a>The `storage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vsphere_csi_disabled`
- Description: (Required) Whether or not to deploy vSphere CSI components in the VMware User Cluster. Enabled by default. <a name="nested_network_config"></a>The `network_config` block supports:
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
- Description: (Optional) vcenter_network specifies vCenter network name. Inherited from the admin cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_config`
- Description: (Optional) Represents common network settings irrespective of the host's IP address. Structure is [documented below](#nested_network_config_host_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_v2_config`
- Description: (Optional) Configuration for control plane V2 mode. Structure is [documented below](#nested_network_config_control_plane_v2_config). <a name="nested_network_config_static_ip_config"></a>The `static_ip_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_blocks`
- Description: (Required) Represents the configuration values for static IP allocation to nodes. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks). <a name="nested_network_config_static_ip_config_ip_blocks"></a>The `ip_blocks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `netmask`
- Description: (Required) The netmask used by the VMware User Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway`
- Description: (Required) The network gateway used by the VMware User Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ips`
- Description: (Required) The node's network configurations used by the VMware User Cluster. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks_ip_blocks_ips). <a name="nested_network_config_static_ip_config_ip_blocks_ip_blocks_ips"></a>The `ips` block supports:
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
- Description: (Required) enabled is a flag to mark if DHCP IP allocation is used for VMware user clusters. <a name="nested_network_config_host_config"></a>The `host_config` block supports:
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
- Description: (Optional) DNS search domains. <a name="nested_network_config_control_plane_v2_config"></a>The `control_plane_v2_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_ip_block`
- Description: (Optional) Static IP addresses for the control plane nodes. Structure is [documented below](#nested_network_config_control_plane_v2_config_control_plane_ip_block). <a name="nested_network_config_control_plane_v2_config_control_plane_ip_block"></a>The `control_plane_ip_block` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `netmask`
- Description: (Optional) The netmask used by the VMware User Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gateway`
- Description: (Optional) The network gateway used by the VMware User Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ips`
- Description: (Optional) The node's network configurations used by the VMware User Cluster. Structure is [documented below](#nested_network_config_control_plane_v2_config_control_plane_ip_block_ips). <a name="nested_network_config_control_plane_v2_config_control_plane_ip_block_ips"></a>The `ips` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip`
- Description: (Optional) IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2.3.0/24).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: (Optional) Hostname of the machine. VM's name will be used if this field is empty. <a name="nested_load_balancer"></a>The `load_balancer` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vip_config`
- Description: (Optional) The VIPs used by the load balancer. Structure is [documented below](#nested_load_balancer_vip_config).
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
- Description: (Optional) Configuration for MetalLB typed load balancers. Structure is [documented below](#nested_load_balancer_metal_lb_config). <a name="nested_load_balancer_vip_config"></a>The `vip_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_vip`
- Description: (Optional) The VIP which you previously set aside for the Kubernetes API of this cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress_vip`
- Description: (Optional) The VIP which you previously set aside for ingress traffic into this cluster. <a name="nested_load_balancer_f5_config"></a>The `f5_config` block supports:
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
- Description: (Optional) NodePort for konnectivity server service running as a sidecar in each kube-apiserver pod (ex. 30564). <a name="nested_load_balancer_metal_lb_config"></a>The `metal_lb_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address_pools`
- Description: (Required) AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_metal_lb_config_address_pools). <a name="nested_load_balancer_metal_lb_config_address_pools"></a>The `address_pools` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pool`
- Description: (Required) The name of the address pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `addresses`
- Description: (Required) The addresses that are part of this pool. Each address must be either in the CIDR form (1.2.3.0/24) or range form (1.2.3.1-1.2.3.5).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `avoid_buggy_ips`
- Description: (Optional) If true, avoid using IPs ending in .0 or .255. This avoids buggy consumer devices mistakenly dropping IPv4 traffic for those special IP addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual_assign`
- Description: (Optional) If true, prevent IP addresses from being automatically assigned. <a name="nested_dataplane_v2"></a>The `dataplane_v2` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataplane_v2_enabled`
- Description: (Optional) Enables Dataplane V2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `windows_dataplane_v2_enabled`
- Description: (Optional) Enable Dataplane V2 for clusters with Windows nodes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_networking`
- Description: (Optional) Enable advanced networking which requires dataplane_v2_enabled to be set true. <a name="nested_auto_repair_config"></a>The `auto_repair_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether auto repair is enabled. <a name="nested_authorization"></a>The `authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_users`
- Description: (Optional) Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_authorization_admin_users). <a name="nested_authorization_admin_users"></a>The `admin_users` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) The name of the user, e.g. `my-gcp-id@gmail.com`. <a name="nested_upgrade_policy"></a>The `upgrade_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_only`
- Description: (Optional) Controls whether the upgrade applies to the control plane only. <a name="nested_vcenter"></a>The `vcenter` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_pool`
- Description: (Optional) The name of the vCenter resource pool for the user cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `datastore`
- Description: (Optional) The name of the vCenter datastore for the user cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `datacenter`
- Description: (Optional) The name of the vCenter datacenter for the user cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Optional) The name of the vCenter cluster for the user cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `folder`
- Description: (Optional) The name of the vCenter folder for the user cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_cert_data`
- Description: (Optional) Contains the vCenter CA certificate public key for SSL verification.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address`
- Description: (Output) The vCenter IP address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_policy_name`
- Description: (Optional) The name of the vCenter storage policy for the user cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
