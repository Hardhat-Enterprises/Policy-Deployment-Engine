## 🛡️ Policy Deployment Engine: `gkeonprem_bare_metal_cluster`

This section provides a concise policy evaluation for the `gkeonprem_bare_metal_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_bare_metal_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_bare_metal_cluster)

---

## 1. Argument Reference

### `admin_cluster_membership`
- Description: (Required) The Admin Cluster this Bare Metal User Cluster belongs to. This is the full resource name of the Admin Cluster's hub membership.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bare_metal_version`
- Description: (Required) A human readable description of this Bare Metal User Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Required) Network configuration. Structure is [documented below](#nested_network_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane`
- Description: (Required) Specifies the control plane configuration. Structure is [documented below](#nested_control_plane).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancer`
- Description: (Required) Specifies the load balancer configuration. Structure is [documented below](#nested_load_balancer).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage`
- Description: (Required) Specifies the cluster storage configuration. Structure is [documented below](#nested_storage).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The bare metal cluster name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A human readable description of this Bare Metal User Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Annotations on the Bare Metal User Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy`
- Description: (Optional) Specifies the cluster proxy configuration. Structure is [documented below](#nested_proxy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_operations`
- Description: (Optional) Specifies the User Cluster's observability infrastructure. Structure is [documented below](#nested_cluster_operations).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_config`
- Description: (Optional) Specifies the workload node configurations. Structure is [documented below](#nested_maintenance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_config`
- Description: (Optional) Specifies the workload node configurations. Structure is [documented below](#nested_node_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_access_config`
- Description: (Optional) Specifies the node access related settings for the bare metal user cluster. Structure is [documented below](#nested_node_access_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `os_environment_config`
- Description: (Optional) OS environment related configurations. Structure is [documented below](#nested_os_environment_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_config`
- Description: (Optional) Specifies the security related settings for the Bare Metal User Cluster. Structure is [documented below](#nested_security_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_authorization`
- Description: (Optional) Binary Authorization related configurations. Structure is [documented below](#nested_binary_authorization).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upgrade_policy`
- Description: (Optional) The cluster upgrade policy. Structure is [documented below](#nested_upgrade_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `island_mode_cidr`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_network_config_island_mode_cidr).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_networking`
- Description: (Optional) Enables the use of advanced Anthos networking features, such as Bundled Load Balancing with BGP or the egress NAT gateway. Setting configuration for advanced networking features will automatically set this flag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multiple_network_interfaces_config`
- Description: (Optional) Configuration for multiple network interfaces. Structure is [documented below](#nested_network_config_multiple_network_interfaces_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sr_iov_config`
- Description: (Optional) Configuration for SR-IOV. Structure is [documented below](#nested_network_config_sr_iov_config). <a name="nested_network_config_island_mode_cidr"></a>The `island_mode_cidr` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_address_cidr_blocks`
- Description: (Required) All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pod_address_cidr_blocks`
- Description: (Required) All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. <a name="nested_network_config_multiple_network_interfaces_config"></a>The `multiple_network_interfaces_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether to enable multiple network interfaces for your pods. When set network_config.advanced_networking is automatically set to true. <a name="nested_network_config_sr_iov_config"></a>The `sr_iov_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether to install the SR-IOV operator. <a name="nested_control_plane"></a>The `control_plane` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_node_pool_config`
- Description: (Required) Configures the node pool running the control plane. If specified the corresponding NodePool will be created for the cluster's control plane. The NodePool will have the same name and namespace as the cluster. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_server_args`
- Description: (Optional) Customizes the default API server args. Only a subset of customized flags are supported. Please refer to the API server documentation below to know the exact format: https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/ Structure is [documented below](#nested_control_plane_api_server_args). <a name="nested_control_plane_control_plane_node_pool_config"></a>The `control_plane_node_pool_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool_config`
- Description: (Required) The generic configuration for a node pool running the control plane. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config). <a name="nested_control_plane_control_plane_node_pool_config_node_pool_config"></a>The `node_pool_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_configs`
- Description: (Optional) The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config_node_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operating_system`
- Description: (Optional) Specifies the nodes operating system (default: LINUX).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `taints`
- Description: (Optional) The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config_taints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. <a name="nested_control_plane_control_plane_node_pool_config_node_pool_config_node_configs"></a>The `node_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_ip`
- Description: (Optional) The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. <a name="nested_control_plane_control_plane_node_pool_config_node_pool_config_taints"></a>The `taints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Key associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effect`
- Description: (Optional) Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. <a name="nested_control_plane_api_server_args"></a>The `api_server_args` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `argument`
- Description: (Required) The argument name as it appears on the API Server command line please make sure to remove the leading dashes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) The value of the arg as it will be passed to the API Server command line. <a name="nested_load_balancer"></a>The `load_balancer` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vip_config`
- Description: (Required) Specified the Bare Metal Load Balancer Config Structure is [documented below](#nested_load_balancer_vip_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port_config`
- Description: (Required) Specifies the load balancer ports. Structure is [documented below](#nested_load_balancer_port_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metal_lb_config`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_load_balancer_metal_lb_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual_lb_config`
- Description: (Optional) A nested object resource. Structure is [documented below](#nested_load_balancer_manual_lb_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bgp_lb_config`
- Description: (Optional) Configuration for BGP typed load balancers. Structure is [documented below](#nested_load_balancer_bgp_lb_config). <a name="nested_load_balancer_vip_config"></a>The `vip_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_vip`
- Description: (Required) The VIP which you previously set aside for the Kubernetes API of this Bare Metal User Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ingress_vip`
- Description: (Required) The VIP which you previously set aside for ingress traffic into this Bare Metal User Cluster. <a name="nested_load_balancer_port_config"></a>The `port_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_load_balancer_port`
- Description: (Required) The port that control plane hosted load balancers will listen on. <a name="nested_load_balancer_metal_lb_config"></a>The `metal_lb_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address_pools`
- Description: (Required) AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_metal_lb_config_address_pools).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancer_node_pool_config`
- Description: (Optional) Specifies the load balancer's node pool configuration. Structure is [documented below](#nested_load_balancer_metal_lb_config_load_balancer_node_pool_config). <a name="nested_load_balancer_metal_lb_config_address_pools"></a>The `address_pools` block supports:
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
- Description: (Optional) If true, prevent IP addresses from being automatically assigned. <a name="nested_load_balancer_metal_lb_config_load_balancer_node_pool_config"></a>The `load_balancer_node_pool_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool_config`
- Description: (Optional) The generic configuration for a node pool running a load balancer. Structure is [documented below](#nested_load_balancer_metal_lb_config_load_balancer_node_pool_config_node_pool_config). <a name="nested_load_balancer_metal_lb_config_load_balancer_node_pool_config_node_pool_config"></a>The `node_pool_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_configs`
- Description: (Optional) The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_load_balancer_metal_lb_config_load_balancer_node_pool_config_node_pool_config_node_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operating_system`
- Description: (Optional) Specifies the nodes operating system (default: LINUX).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `taints`
- Description: (Optional) The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_load_balancer_metal_lb_config_load_balancer_node_pool_config_node_pool_config_taints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. <a name="nested_load_balancer_metal_lb_config_load_balancer_node_pool_config_node_pool_config_node_configs"></a>The `node_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_ip`
- Description: (Optional) The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. <a name="nested_load_balancer_metal_lb_config_load_balancer_node_pool_config_node_pool_config_taints"></a>The `taints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Key associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effect`
- Description: (Optional) Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. <a name="nested_load_balancer_manual_lb_config"></a>The `manual_lb_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether manual load balancing is enabled. <a name="nested_load_balancer_bgp_lb_config"></a>The `bgp_lb_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asn`
- Description: (Required) BGP autonomous system number (ASN) of the cluster. This field can be updated after cluster creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bgp_peer_configs`
- Description: (Required) The list of BGP peers that the cluster will connect to. At least one peer must be configured for each control plane node. Control plane nodes will connect to these peers to advertise the control plane VIP. The Services load balancer also uses these peers by default. This field can be updated after cluster creation. Structure is [documented below](#nested_load_balancer_bgp_lb_config_bgp_peer_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `address_pools`
- Description: (Required) AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_bgp_lb_config_address_pools).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `load_balancer_node_pool_config`
- Description: (Optional) Specifies the node pool running data plane load balancing. L2 connectivity is required among nodes in this pool. If missing, the control plane node pool is used for data plane load balancing. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config). <a name="nested_load_balancer_bgp_lb_config_bgp_peer_configs"></a>The `bgp_peer_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `asn`
- Description: (Required) BGP autonomous system number (ASN) for the network that contains the external peer device.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_address`
- Description: (Required) The IP address of the external peer device.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane_nodes`
- Description: (Optional) The IP address of the control plane node that connects to the external peer. If you don't specify any control plane nodes, all control plane nodes can connect to the external peer. If you specify one or more IP addresses, only the nodes specified participate in peering sessions. <a name="nested_load_balancer_bgp_lb_config_address_pools"></a>The `address_pools` block supports:
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
- Description: (Optional) If true, prevent IP addresses from being automatically assigned. <a name="nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config"></a>The `load_balancer_node_pool_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_pool_config`
- Description: (Optional) The generic configuration for a node pool running a load balancer. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config). <a name="nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config"></a>The `node_pool_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_configs`
- Description: (Optional) The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_node_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `operating_system`
- Description: (Optional) Specifies the nodes operating system (default: LINUX).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `taints`
- Description: (Optional) The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_taints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kubelet_config`
- Description: (Optional) The modifiable kubelet configurations for the baremetal machines. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_kubelet_config). <a name="nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_node_configs"></a>The `node_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_ip`
- Description: (Optional) The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. <a name="nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_taints"></a>The `taints` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Key associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value associated with the effect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effect`
- Description: (Optional) Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. <a name="nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_kubelet_config"></a>The `kubelet_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `registry_pull_qps`
- Description: (Optional) The limit of registry pulls per second. Setting this value to 0 means no limit. Updating this field may impact scalability by changing the amount of traffic produced by image pulls. Defaults to 5.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `registry_burst`
- Description: (Optional) The maximum size of bursty pulls, temporarily allows pulls to burst to this number, while still not exceeding registry_pull_qps. The value must not be a negative number. Updating this field may impact scalability by changing the amount of traffic produced by image pulls. Defaults to 10.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `serialize_image_pulls_disabled`
- Description: (Optional) Prevents the Kubelet from pulling multiple images at a time. We recommend *not* changing the default value on nodes that run docker daemon with version  < 1.9 or an Another Union File System (Aufs) storage backend. Issue https://github.com/kubernetes/kubernetes/issues/10959 has more details. <a name="nested_storage"></a>The `storage` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lvp_share_config`
- Description: (Required) Specifies the config for local PersistentVolumes backed by subdirectories in a shared filesystem. These subdirectores are automatically created during cluster creation. Structure is [documented below](#nested_storage_lvp_share_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lvp_node_mounts_config`
- Description: (Required) Specifies the config for local PersistentVolumes backed by mounted node disks. These disks need to be formatted and mounted by the user, which can be done before or after cluster creation. Structure is [documented below](#nested_storage_lvp_node_mounts_config). <a name="nested_storage_lvp_share_config"></a>The `lvp_share_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lvp_config`
- Description: (Required) Defines the machine path and storage class for the LVP Share. Structure is [documented below](#nested_storage_lvp_share_config_lvp_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shared_path_pv_count`
- Description: (Optional) The number of subdirectories to create under path. <a name="nested_storage_lvp_share_config_lvp_config"></a>The `lvp_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) The host machine path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_class`
- Description: (Required) The StorageClass name that PVs will be created with. <a name="nested_storage_lvp_node_mounts_config"></a>The `lvp_node_mounts_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) The host machine path.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_class`
- Description: (Required) The StorageClass name that PVs will be created with. <a name="nested_proxy"></a>The `proxy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) Specifies the address of your proxy server. For example: http://domain WARNING: Do not provide credentials in the format of http://(username:password@)domain these will be rejected by the server.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `no_proxy`
- Description: (Optional) A list of IPs, hostnames, and domains that should skip the proxy. For example ["127.0.0.1", "example.com", ".corp", "localhost"]. <a name="nested_cluster_operations"></a>The `cluster_operations` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_application_logs`
- Description: (Optional) Whether collection of application logs/metrics should be enabled (in addition to system logs/metrics). <a name="nested_maintenance_config"></a>The `maintenance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_address_cidr_blocks`
- Description: (Required) All IPv4 address from these ranges will be placed into maintenance mode. Nodes in maintenance mode will be cordoned and drained. When both of these are true, the "baremetal.cluster.gke.io/maintenance" annotation will be set on the node resource. <a name="nested_node_config"></a>The `node_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_pods_per_node`
- Description: (Optional) The maximum number of pods a node can run. The size of the CIDR range assigned to the node will be derived from this parameter.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_runtime`
- Description: (Optional) The available runtimes that can be used to run containers in a Bare Metal User Cluster. Possible values are: `CONTAINER_RUNTIME_UNSPECIFIED`, `DOCKER`, `CONTAINERD`. <a name="nested_node_access_config"></a>The `node_access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `login_user`
- Description: (Optional) LoginUser is the user name used to access node machines. It defaults to "root" if not set. <a name="nested_os_environment_config"></a>The `os_environment_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `package_repo_excluded`
- Description: (Required) Whether the package repo should not be included when initializing bare metal machines. <a name="nested_security_config"></a>The `security_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization`
- Description: (Optional) Configures user access to the Bare Metal User cluster. Structure is [documented below](#nested_security_config_authorization). <a name="nested_security_config_authorization"></a>The `authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_users`
- Description: (Required) Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_security_config_authorization_admin_users). <a name="nested_security_config_authorization_admin_users"></a>The `admin_users` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) The name of the user, e.g. `my-gcp-id@gmail.com`. <a name="nested_binary_authorization"></a>The `binary_authorization` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `evaluation_mode`
- Description: (Optional) Mode of operation for binauthz policy evaluation. If unspecified, defaults to DISABLED. Possible values are: `DISABLED`, `PROJECT_SINGLETON_POLICY_ENFORCE`. <a name="nested_upgrade_policy"></a>The `upgrade_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy`
- Description: (Optional) Specifies which upgrade policy to use. Possible values are: `SERIAL`, `CONCURRENT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
