## 🛡️ Policy Deployment Engine: `gkeonprem_bare_metal_admin_cluster`

This section provides a concise policy evaluation for the `gkeonprem_bare_metal_admin_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_bare_metal_admin_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_bare_metal_admin_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The bare metal admin cluster name. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `description` | A human readable description of this Bare Metal Admin Cluster. | false | None | None |
| `bare_metal_version` | A human readable description of this Bare Metal Admin Cluster. | false | None | None |
| `annotations` | Annotations on the Bare Metal Admin Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `island_mode_cidr` | A nested object resource. Structure is [documented below](#nested_network_config_island_mode_cidr). | false | None | None |

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
| `manual_lb_config` | A nested object resource. Structure is [documented below](#nested_load_balancer_manual_lb_config). | false | None | None |

### storage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `lvp_share_config` | Specifies the config for local PersistentVolumes backed by subdirectories in a shared filesystem. These subdirectores are automatically created during cluster creation. Structure is [documented below](#nested_storage_lvp_share_config). | true | None | None |
| `lvp_node_mounts_config` | Specifies the config for local PersistentVolumes backed by mounted node disks. These disks need to be formatted and mounted by the user, which can be done before or after cluster creation. Structure is [documented below](#nested_storage_lvp_node_mounts_config). | true | None | None |

### proxy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | Specifies the address of your proxy server. For Example: http://domain WARNING: Do not provide credentials in the format of http://(username:password@)domain these will be rejected by the server. | true | None | None |
| `no_proxy` | A list of IPs, hostnames, and domains that should skip the proxy. For example: ["127.0.0.1", "example.com", ".corp", "localhost"]. | false | None | None |

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

### node_access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `login_user` | LoginUser is the user name used to access node machines. It defaults to "root" if not set. | false | None | None |

### security_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authorization` | Configures user access to the Bare Metal User cluster. Structure is [documented below](#nested_security_config_authorization). | false | None | None |

### island_mode_cidr Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. | true | None | None |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. | true | None | None |

### control_plane_node_pool_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_pool_config` | The generic configuration for a node pool running the control plane. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config). | true | None | None |

### node_pool_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_configs` | The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config_node_configs). | false | None | None |
| `operating_system` | Specifies the nodes operating system (default: LINUX). | false | None | None |
| `taints` | The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config_taints). | false | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |

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
| `control_plane_vip` | The VIP which you previously set aside for the Kubernetes API of this Bare Metal Admin Cluster. | true | None | None |

### port_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_load_balancer_port` | The port that control plane hosted load balancers will listen on. | true | None | None |

### manual_lb_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether manual load balancing is enabled. | true | None | None |

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
