## 🛡️ Policy Deployment Engine: `gkeonprem_bare_metal_cluster`

This section provides a concise policy evaluation for the `gkeonprem_bare_metal_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_bare_metal_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_bare_metal_cluster)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_cluster_membership` | The Admin Cluster this Bare Metal User Cluster belongs to. This is the full resource name of the Admin Cluster's hub membership. | true | false | admin_cluster_membership does not have a security impact. | None | None |
| `bare_metal_version` | A human readable description of this Bare Metal User Cluster. | true | true | bare_metal_version is a critical security parameter that determines the version of the bare metal user cluster and can affect compliance with security requirements. | 1.13.4 | 1.10.0 |
| `network_config` | Network configuration. Structure is [documented below](#nested_network_config). | true | false | network_config itself does not need security considerations, but its nested fields might. | None | None |
| `control_plane` | Specifies the control plane configuration. Structure is [documented below](#nested_control_plane). | true | false | Control plane itself does not require specific security considerations. | None | None |
| `load_balancer` | Specifies the load balancer configuration. Structure is [documented below](#nested_load_balancer). | true | false | Load balancer itself does not require specific security considerations. | None | None |
| `storage` | Specifies the cluster storage configuration. Structure is [documented below](#nested_storage). | true | false | Storage does not require specific security considerations. | None | None |
| `name` | The bare metal cluster name. | true | false | Name does not have security impact on the service. | None | None |
| `location` | The location of the resource. | true | true | Location can impact security posture due to regional compliance and data residency requirements. | australia | asia1 |
| `description` | A human readable description of this Bare Metal User Cluster. | false | false | Description does not have security impact on the service. | None | None |
| `annotations` | Annotations on the Bare Metal User Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations do not have security impact on the service. | None | None |
| `proxy` | Specifies the cluster proxy configuration. Structure is [documented below](#nested_proxy). | false | false | Proxy is not security important enough to write a policy. | None | None |
| `cluster_operations` | Specifies the User Cluster's observability infrastructure. Structure is [documented below](#nested_cluster_operations). | false | false | Cluster operations are not security critical. | None | None |
| `maintenance_config` | Specifies the workload node configurations. Structure is [documented below](#nested_maintenance_config). | false | false | Maintenance config is not security critical. | None | None |
| `node_config` | Specifies the workload node configurations. Structure is [documented below](#nested_node_config). | false | false | Node config itself does not have a direct security impact. | None | None |
| `node_access_config` | Specifies the node access related settings for the bare metal user cluster. Structure is [documented below](#nested_node_access_config). | false | false | Node access config is not security critical. | None | None |
| `os_environment_config` | OS environment related configurations. Structure is [documented below](#nested_os_environment_config). | false | false | OS environment config is not security critical. | None | None |
| `security_config` | Specifies the security related settings for the Bare Metal User Cluster. Structure is [documented below](#nested_security_config). | false | false | Security config itself is not security critical. | None | None |
| `binary_authorization` | Binary Authorization related configurations. Structure is [documented below](#nested_binary_authorization). | false | false | Binary authorization is not security critical. | None | None |
| `upgrade_policy` | The cluster upgrade policy. Structure is [documented below](#nested_upgrade_policy). | false | false | Upgrade policy is not security critical. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project does not impact security of the service. | None | None |
| `island_mode_cidr` |  | false | false | None | None | None |
| `multiple_network_interfaces_config` |  | false | false | None | None | None |
| `sr_iov_config` |  | false | false | None | None | None |
| `control_plane_node_pool_config` |  | false | false | None | None | None |
| `node_pool_config` |  | false | false | None | None | None |
| `node_configs` |  | false | false | None | None | None |
| `taints` |  | false | false | None | None | None |
| `api_server_args` |  | false | false | None | None | None |
| `vip_config` |  | false | false | None | None | None |
| `port_config` |  | false | false | None | None | None |
| `metal_lb_config` |  | false | false | None | None | None |
| `address_pools` |  | false | false | None | None | None |
| `load_balancer_node_pool_config` |  | false | false | None | None | None |
| `manual_lb_config` |  | false | false | None | None | None |
| `bgp_lb_config` |  | false | false | None | None | None |
| `bgp_peer_configs` |  | false | false | None | None | None |
| `kubelet_config` |  | false | false | None | None | None |
| `lvp_share_config` |  | false | false | None | None | None |
| `lvp_config` |  | false | false | None | None | None |
| `lvp_node_mounts_config` |  | false | false | None | None | None |
| `authorization` |  | false | false | None | None | None |
| `admin_users` |  | false | false | None | None | None |

### network_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `island_mode_cidr` | A nested object resource. Structure is [documented below](#nested_network_config_island_mode_cidr). | false | false | island_mode_cidr is not important enough to require specific security considerations. | None | None |
| `advanced_networking` | Enables the use of advanced Anthos networking features, such as Bundled Load Balancing with BGP or the egress NAT gateway. Setting configuration for advanced networking features will automatically set this flag. | false | false | advanced_networking does not have a security impact. | None | None |
| `multiple_network_interfaces_config` | Configuration for multiple network interfaces. Structure is [documented below](#nested_network_config_multiple_network_interfaces_config). | false | false | multiple_network_interfaces_config does not have a security impact. | None | None |
| `sr_iov_config` | Configuration for SR-IOV. Structure is [documented below](#nested_network_config_sr_iov_config). | false | false | sr_iov_config does not have a security impact. | None | None |

### control_plane Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_node_pool_config` | Configures the node pool running the control plane. If specified the corresponding NodePool will be created for the cluster's control plane. The NodePool will have the same name and namespace as the cluster. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config). | true | false | Control plane node pool itself does not require specific security considerations. | None | None |
| `api_server_args` | Customizes the default API server args. Only a subset of customized flags are supported. Please refer to the API server documentation below to know the exact format: https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/ Structure is [documented below](#nested_control_plane_api_server_args). | false | false | api_server_args does not have security impact on the service. | None | None |

### load_balancer Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vip_config` | Specified the Bare Metal Load Balancer Config Structure is [documented below](#nested_load_balancer_vip_config). | true | false | VIP config itself does not require specific security considerations. | None | None |
| `port_config` | Specifies the load balancer ports. Structure is [documented below](#nested_load_balancer_port_config). | true | false | Load balancer port config itself does not require specific security considerations. | None | None |
| `metal_lb_config` | A nested object resource. Structure is [documented below](#nested_load_balancer_metal_lb_config). | false | false | Metal LB config does not require specific security considerations. | None | None |
| `manual_lb_config` | A nested object resource. Structure is [documented below](#nested_load_balancer_manual_lb_config). | false | false | Manual LB config does not require specific security considerations. | None | None |
| `bgp_lb_config` | Configuration for BGP typed load balancers. Structure is [documented below](#nested_load_balancer_bgp_lb_config). | false | false | BGP LB config does not require specific security considerations. | None | None |

### storage Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `lvp_share_config` | Specifies the config for local PersistentVolumes backed by subdirectories in a shared filesystem. These subdirectores are automatically created during cluster creation. Structure is [documented below](#nested_storage_lvp_share_config). | true | false | LVP share config does not require specific security considerations. | None | None |
| `lvp_node_mounts_config` | Specifies the config for local PersistentVolumes backed by mounted node disks. These disks need to be formatted and mounted by the user, which can be done before or after cluster creation. Structure is [documented below](#nested_storage_lvp_node_mounts_config). | true | false | LVP node mounts config does not require specific security considerations. | None | None |

### proxy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | Specifies the address of your proxy server. For example: http://domain WARNING: Do not provide credentials in the format of http://(username:password@)domain these will be rejected by the server. | true | false | Proxy URI is not security critical. | None | None |
| `no_proxy` | A list of IPs, hostnames, and domains that should skip the proxy. For example ["127.0.0.1", "example.com", ".corp", "localhost"]. | false | false | No proxy is not important enough to write a policy. | None | None |

### cluster_operations Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_application_logs` | Whether collection of application logs/metrics should be enabled (in addition to system logs/metrics). | false | false | Application logs are not security critical. | None | None |

### maintenance_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `maintenance_address_cidr_blocks` | All IPv4 address from these ranges will be placed into maintenance mode. Nodes in maintenance mode will be cordoned and drained. When both of these are true, the "baremetal.cluster.gke.io/maintenance" annotation will be set on the node resource. | true | false | Maintenance address CIDR blocks is not important enough to write a policy for. | None | None |

### node_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `max_pods_per_node` | The maximum number of pods a node can run. The size of the CIDR range assigned to the node will be derived from this parameter. | false | false | Max pods per node is not security critical. | None | None |
| `container_runtime` | The available runtimes that can be used to run containers in a Bare Metal User Cluster. Possible values are: `CONTAINER_RUNTIME_UNSPECIFIED`, `DOCKER`, `CONTAINERD`. | false | false | Container runtime is not security critical. | None | None |

### node_access_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `login_user` | LoginUser is the user name used to access node machines. It defaults to "root" if not set. | false | false | Login user is not important enough to write a policy for. | None | None |

### os_environment_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `package_repo_excluded` | Whether the package repo should not be included when initializing bare metal machines. | true | false | Package repo exclusion is not security critical. | None | None |

### security_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `authorization` | Configures user access to the Bare Metal User cluster. Structure is [documented below](#nested_security_config_authorization). | false | false | Authorization itself is not security critical. | None | None |

### binary_authorization Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `evaluation_mode` | Mode of operation for binauthz policy evaluation. If unspecified, defaults to DISABLED. Possible values are: `DISABLED`, `PROJECT_SINGLETON_POLICY_ENFORCE`. | false | false | Binary authorization is not security critical. | None | None |

### upgrade_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `policy` | Specifies which upgrade policy to use. Possible values are: `SERIAL`, `CONCURRENT`. | false | false | Upgrade policy is not security critical. | None | None |

### island_mode_cidr Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. | true | false | Service address CIDR blocks are not security critical. | None | None |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. | true | false | Pod address CIDR blocks are not security critical. | None | None |

### multiple_network_interfaces_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether to enable multiple network interfaces for your pods. When set network_config.advanced_networking is automatically set to true. | false | false | enabled is not security critical. | None | None |

### sr_iov_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether to install the SR-IOV operator. | false | false | SR-IOV operator is not security critical. | None | None |

### control_plane_node_pool_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_pool_config` | The generic configuration for a node pool running the control plane. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config). | true | false | Control plane node pool configuration itself does not need policy. | None | None |

### node_pool_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_configs` | The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_node_configs). | false | false | Node configurations itself does not need policy. | None | None |
| `operating_system` | Specifies the nodes operating system (default: LINUX). | false | true | Outdated Operating system selection can impact security posture. | LINUX | WINDOWS |
| `taints` | The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_taints). | false | false | taints is not security critical. | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | false | labels are not security critical. | None | None |
| `kubelet_config` | The modifiable kubelet configurations for the baremetal machines. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_kubelet_config). | false | false | kubelet configurations are not security critical. | None | None |

### node_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_ip` | The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1 | false | false | Node IP addresses are not important enough to be considered security critical. | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | false | labels are not security critical. | None | None |

### taints Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key associated with the effect. | false | false | taint keys are not security critical. | None | None |
| `value` | Value associated with the effect. | false | false | taint values are not security critical. | None | None |
| `effect` | Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. | false | false | taint effects are not security critical. | None | None |

### api_server_args Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `argument` | The argument name as it appears on the API Server command line please make sure to remove the leading dashes. | true | false | API server arguments are not security critical. | None | None |
| `value` | The value of the arg as it will be passed to the API Server command line. | true | false | API server argument values are not security critical. | None | None |

### vip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_vip` | The VIP which you previously set aside for the Kubernetes API of this Bare Metal User Cluster. | true | true | VIP is a critical component for the cluster's API access and must be properly secured. | 10.200.0.13 | 8.8.8.8 |
| `ingress_vip` | The VIP which you previously set aside for ingress traffic into this Bare Metal User Cluster. | true | true | Ingress VIP is a critical component for the cluster's ingress traffic and must be properly secured. | 10.200.0.14 | 175.45.23.101 |

### port_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_load_balancer_port` | The port that control plane hosted load balancers will listen on. | true | true | Control plane load balancer port is a critical component for the cluster's control plane access and must select a secure port. | 443 | 80 |

### metal_lb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `address_pools` | AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_metal_lb_config_address_pools). | true | false | address pools are not security critical. | None | None |
| `load_balancer_node_pool_config` | Specifies the load balancer's node pool configuration. Structure is [documented below](#nested_load_balancer_metal_lb_config_load_balancer_node_pool_config). | false | false | load balancer node pool config is not security critical. | None | None |

### address_pools Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pool` | The name of the address pool. | true | false | address pools are not security critical. | None | None |
| `addresses` | The addresses that are part of this pool. Each address must be either in the CIDR form (1.2.3.0/24) or range form (1.2.3.1-1.2.3.5). | true | false | addresses are not security critical. | None | None |
| `avoid_buggy_ips` | If true, avoid using IPs ending in .0 or .255. This avoids buggy consumer devices mistakenly dropping IPv4 traffic for those special IP addresses. | false | false | avoid_buggy_ips is not security critical. | None | None |
| `manual_assign` | If true, prevent IP addresses from being automatically assigned. | false | false | manual_assign is not security critical. | None | None |

### load_balancer_node_pool_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_pool_config` | The generic configuration for a node pool running a load balancer. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config). | false | false | node pool config itself is not security critical. | None | None |

### manual_lb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether manual load balancing is enabled. | true | false | manual load balancing is not security critical. | None | None |

### bgp_lb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `asn` | BGP autonomous system number (ASN) of the cluster. This field can be updated after cluster creation. | true | false | BGP ASN is not security critical. | None | None |
| `bgp_peer_configs` | The list of BGP peers that the cluster will connect to. At least one peer must be configured for each control plane node. Control plane nodes will connect to these peers to advertise the control plane VIP. The Services load balancer also uses these peers by default. This field can be updated after cluster creation. Structure is [documented below](#nested_load_balancer_bgp_lb_config_bgp_peer_configs). | true | false | BGP peer configs are not security critical. | None | None |
| `address_pools` | AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_bgp_lb_config_address_pools). | true | false | Address pools are not security critical. | None | None |
| `load_balancer_node_pool_config` | Specifies the node pool running data plane load balancing. L2 connectivity is required among nodes in this pool. If missing, the control plane node pool is used for data plane load balancing. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config). | false | false | load balancer node pool config itself is not security critical. | None | None |

### bgp_peer_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `asn` | BGP autonomous system number (ASN) for the network that contains the external peer device. | true | false | BGP ASN is not security critical. | None | None |
| `ip_address` | The IP address of the external peer device. | true | false | IP address of the external peer device is not securily important enough. | None | None |
| `control_plane_nodes` | The IP address of the control plane node that connects to the external peer. If you don't specify any control plane nodes, all control plane nodes can connect to the external peer. If you specify one or more IP addresses, only the nodes specified participate in peering sessions. | false | false | Control plane node IP addresses are not security critical. | None | None |

### kubelet_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `registry_pull_qps` | The limit of registry pulls per second. Setting this value to 0 means no limit. Updating this field may impact scalability by changing the amount of traffic produced by image pulls. Defaults to 5. | false | false | Registry pull QPS is not security critical. | None | None |
| `registry_burst` | The maximum size of bursty pulls, temporarily allows pulls to burst to this number, while still not exceeding registry_pull_qps. The value must not be a negative number. Updating this field may impact scalability by changing the amount of traffic produced by image pulls. Defaults to 10. | false | false | Registry burst is not security critical. | None | None |
| `serialize_image_pulls_disabled` | Prevents the Kubelet from pulling multiple images at a time. We recommend *not* changing the default value on nodes that run docker daemon with version  < 1.9 or an Another Union File System (Aufs) storage backend. Issue https://github.com/kubernetes/kubernetes/issues/10959 has more details. | false | false | Serialize image pulls is not security critical. | None | None |

### lvp_share_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `lvp_config` | Defines the machine path and storage class for the LVP Share. Structure is [documented below](#nested_storage_lvp_share_config_lvp_config). | true | false | LVP share configuration is not security critical. | None | None |
| `shared_path_pv_count` | The number of subdirectories to create under path. | false | false | Shared path PV count is not security critical. | None | None |

### lvp_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The host machine path. | true | false | LVP config path is not security critical. | None | None |
| `storage_class` | The StorageClass name that PVs will be created with. | true | false | LVP config storage class is not security critical. | None | None |

### lvp_node_mounts_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The host machine path. | true | false | LVP node mounts path is not security critical. | None | None |
| `storage_class` | The StorageClass name that PVs will be created with. | true | false | LVP node mounts storage class is not security critical. | None | None |

### authorization Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_users` | Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_security_config_authorization_admin_users). | true | true | Admin users have full access to the cluster and should be protected. | admin@hashicorptest.com | user@hashicorptest.com |

### admin_users Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | true | Admin users have full access to the cluster and should be protected. | admin@hashicorptest.com | user@hashicorptest.com |
