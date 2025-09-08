## 🛡️ Policy Deployment Engine: `gkeonprem_bare_metal_cluster`

This section provides a concise policy evaluation for the `gkeonprem_bare_metal_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_bare_metal_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_bare_metal_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_cluster_membership` | The Admin Cluster this Bare Metal User Cluster belongs to. This is the full resource name of the Admin Cluster's hub membership. | true | None | None |
| `bare_metal_version` | A human readable description of this Bare Metal User Cluster. | true | None | None |
| `name` | The bare metal cluster name. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `description` | A human readable description of this Bare Metal User Cluster. | false | None | None |
| `annotations` | Annotations on the Bare Metal User Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `island_mode_cidr` | A nested object resource. Structure is [documented below](#nested_network_config_island_mode_cidr). | false | None | None |
| `advanced_networking` | Enables the use of advanced Anthos networking features, such as Bundled Load Balancing with BGP or the egress NAT gateway. Setting configuration for advanced networking features will automatically set this flag. | false | None | None |
| `multiple_network_interfaces_config` | Configuration for multiple network interfaces. Structure is [documented below](#nested_network_config_multiple_network_interfaces_config). | false | None | None |
| `sr_iov_config` | Configuration for SR-IOV. Structure is [documented below](#nested_network_config_sr_iov_config). | false | None | None |

### control_plane Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_node_pool_config` | Configures the node pool running the control plane. If specified the corresponding NodePool will be created for the cluster's control plane. The NodePool will have the same name and namespace as the cluster. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config). | true | None | None |
| `api_server_args` | Customizes the default API server args. Only a subset of customized flags are supported. Please refer to the API server documentation below to know the exact format: https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/ Structure is [documented below](#nested_control_plane_api_server_args). | false | None | None |

### load_balancer Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vip_config` | Specified the Bare Metal Load Balancer Config Structure is [documented below](#nested_load_balancer_vip_config). | true | None | None |
| `port_config` | Specifies the load balancer ports. Structure is [documented below](#nested_load_balancer_port_config). | true | None | None |
| `metal_lb_config` | A nested object resource. Structure is [documented below](#nested_load_balancer_metal_lb_config). | false | None | None |
| `manual_lb_config` | A nested object resource. Structure is [documented below](#nested_load_balancer_manual_lb_config). | false | None | None |
| `bgp_lb_config` | Configuration for BGP typed load balancers. Structure is [documented below](#nested_load_balancer_bgp_lb_config). | false | None | None |

### storage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `lvp_share_config` | Specifies the config for local PersistentVolumes backed by subdirectories in a shared filesystem. These subdirectores are automatically created during cluster creation. Structure is [documented below](#nested_storage_lvp_share_config). | true | None | None |
| `lvp_node_mounts_config` | Specifies the config for local PersistentVolumes backed by mounted node disks. These disks need to be formatted and mounted by the user, which can be done before or after cluster creation. Structure is [documented below](#nested_storage_lvp_node_mounts_config). | true | None | None |

### proxy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | Specifies the address of your proxy server. For example: http://domain WARNING: Do not provide credentials in the format of http://(username:password@)domain these will be rejected by the server. | true | None | None |
| `no_proxy` | A list of IPs, hostnames, and domains that should skip the proxy. For example ["127.0.0.1", "example.com", ".corp", "localhost"]. | false | None | None |

### cluster_operations Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_application_logs` | Whether collection of application logs/metrics should be enabled (in addition to system logs/metrics). | false | None | None |

### maintenance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `maintenance_address_cidr_blocks` | All IPv4 address from these ranges will be placed into maintenance mode. Nodes in maintenance mode will be cordoned and drained. When both of these are true, the "baremetal.cluster.gke.io/maintenance" annotation will be set on the node resource. | true | None | None |

### node_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_pods_per_node` | The maximum number of pods a node can run. The size of the CIDR range assigned to the node will be derived from this parameter. | false | None | None |
| `container_runtime` | The available runtimes that can be used to run containers in a Bare Metal User Cluster. Possible values are: `CONTAINER_RUNTIME_UNSPECIFIED`, `DOCKER`, `CONTAINERD`. | false | None | None |

### node_access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `login_user` | LoginUser is the user name used to access node machines. It defaults to "root" if not set. | false | None | None |

### os_environment_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `package_repo_excluded` | Whether the package repo should not be included when initializing bare metal machines. | true | None | None |

### security_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authorization` | Configures user access to the Bare Metal User cluster. Structure is [documented below](#nested_security_config_authorization). | false | None | None |

### binary_authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `evaluation_mode` | Mode of operation for binauthz policy evaluation. If unspecified, defaults to DISABLED. Possible values are: `DISABLED`, `PROJECT_SINGLETON_POLICY_ENFORCE`. | false | None | None |

### upgrade_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `policy` | Specifies which upgrade policy to use. Possible values are: `SERIAL`, `CONCURRENT`. | false | None | None |

### island_mode_cidr Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. | true | None | None |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. | true | None | None |

### multiple_network_interfaces_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether to enable multiple network interfaces for your pods. When set network_config.advanced_networking is automatically set to true. | false | None | None |

### sr_iov_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether to install the SR-IOV operator. | false | None | None |

### control_plane_node_pool_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_pool_config` | The generic configuration for a node pool running the control plane. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config). | true | None | None |

### node_pool_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_configs` | The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_node_configs). | false | None | None |
| `operating_system` | Specifies the nodes operating system (default: LINUX). | false | None | None |
| `taints` | The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_taints). | false | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |
| `kubelet_config` | The modifiable kubelet configurations for the baremetal machines. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config_kubelet_config). | false | None | None |

### node_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_ip` | The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1 | false | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |

### taints Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Key associated with the effect. | false | None | None |
| `value` | Value associated with the effect. | false | None | None |
| `effect` | Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. | false | None | None |

### api_server_args Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `argument` | The argument name as it appears on the API Server command line please make sure to remove the leading dashes. | true | None | None |
| `value` | The value of the arg as it will be passed to the API Server command line. | true | None | None |

### vip_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_vip` | The VIP which you previously set aside for the Kubernetes API of this Bare Metal User Cluster. | true | None | None |
| `ingress_vip` | The VIP which you previously set aside for ingress traffic into this Bare Metal User Cluster. | true | None | None |

### port_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_load_balancer_port` | The port that control plane hosted load balancers will listen on. | true | None | None |

### metal_lb_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `address_pools` | AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_metal_lb_config_address_pools). | true | None | None |
| `load_balancer_node_pool_config` | Specifies the load balancer's node pool configuration. Structure is [documented below](#nested_load_balancer_metal_lb_config_load_balancer_node_pool_config). | false | None | None |

### address_pools Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pool` | The name of the address pool. | true | None | None |
| `addresses` | The addresses that are part of this pool. Each address must be either in the CIDR form (1.2.3.0/24) or range form (1.2.3.1-1.2.3.5). | true | None | None |
| `avoid_buggy_ips` | If true, avoid using IPs ending in .0 or .255. This avoids buggy consumer devices mistakenly dropping IPv4 traffic for those special IP addresses. | false | None | None |
| `manual_assign` | If true, prevent IP addresses from being automatically assigned. | false | None | None |

### load_balancer_node_pool_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_pool_config` | The generic configuration for a node pool running a load balancer. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config_node_pool_config). | false | None | None |

### manual_lb_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether manual load balancing is enabled. | true | None | None |

### bgp_lb_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `asn` | BGP autonomous system number (ASN) of the cluster. This field can be updated after cluster creation. | true | None | None |
| `bgp_peer_configs` | The list of BGP peers that the cluster will connect to. At least one peer must be configured for each control plane node. Control plane nodes will connect to these peers to advertise the control plane VIP. The Services load balancer also uses these peers by default. This field can be updated after cluster creation. Structure is [documented below](#nested_load_balancer_bgp_lb_config_bgp_peer_configs). | true | None | None |
| `address_pools` | AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_bgp_lb_config_address_pools). | true | None | None |
| `load_balancer_node_pool_config` | Specifies the node pool running data plane load balancing. L2 connectivity is required among nodes in this pool. If missing, the control plane node pool is used for data plane load balancing. Structure is [documented below](#nested_load_balancer_bgp_lb_config_load_balancer_node_pool_config). | false | None | None |

### bgp_peer_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `asn` | BGP autonomous system number (ASN) for the network that contains the external peer device. | true | None | None |
| `ip_address` | The IP address of the external peer device. | true | None | None |
| `control_plane_nodes` | The IP address of the control plane node that connects to the external peer. If you don't specify any control plane nodes, all control plane nodes can connect to the external peer. If you specify one or more IP addresses, only the nodes specified participate in peering sessions. | false | None | None |

### kubelet_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `registry_pull_qps` | The limit of registry pulls per second. Setting this value to 0 means no limit. Updating this field may impact scalability by changing the amount of traffic produced by image pulls. Defaults to 5. | false | None | None |
| `registry_burst` | The maximum size of bursty pulls, temporarily allows pulls to burst to this number, while still not exceeding registry_pull_qps. The value must not be a negative number. Updating this field may impact scalability by changing the amount of traffic produced by image pulls. Defaults to 10. | false | None | None |
| `serialize_image_pulls_disabled` | Prevents the Kubelet from pulling multiple images at a time. We recommend *not* changing the default value on nodes that run docker daemon with version  < 1.9 or an Another Union File System (Aufs) storage backend. Issue https://github.com/kubernetes/kubernetes/issues/10959 has more details. | false | None | None |

### lvp_share_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `lvp_config` | Defines the machine path and storage class for the LVP Share. Structure is [documented below](#nested_storage_lvp_share_config_lvp_config). | true | None | None |
| `shared_path_pv_count` | The number of subdirectories to create under path. | false | None | None |

### lvp_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | The host machine path. | true | None | None |
| `storage_class` | The StorageClass name that PVs will be created with. | true | None | None |

### lvp_node_mounts_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | The host machine path. | true | None | None |
| `storage_class` | The StorageClass name that PVs will be created with. | true | None | None |

### authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_users` | Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_security_config_authorization_admin_users). | true | None | None |

### admin_users Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | None | None |
