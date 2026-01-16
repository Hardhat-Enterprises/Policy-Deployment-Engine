## 🛡️ Policy Deployment Engine: `gkeonprem_bare_metal_admin_cluster`

This section provides a concise policy evaluation for the `gkeonprem_bare_metal_admin_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_bare_metal_admin_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_bare_metal_admin_cluster)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The bare metal admin cluster name. | true | false | Display name has no security impact on the service or data | None | None |
| `location` | The location of the resource. | true | true | Location is a critical security parameter that determines where the resource is deployed and can affect compliance with data residency requirements. | us-west1 | europe-west1 |
| `description` | A human readable description of this Bare Metal Admin Cluster. | false | false | Description has no security impact on the service or data | None | None |
| `bare_metal_version` | A human readable description of this Bare Metal Admin Cluster. | false | true | Bare metal version is a critical security parameter that determines the version of the bare metal admin cluster and can affect compliance with security requirements. | 1.13.4 | 1.11.4 |
| `annotations` | Annotations on the Bare Metal Admin Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | annotations has no security impact on the service or data | None | None |
| `network_config` | Network configuration. Structure is [documented below](#nested_network_config). | false | false | network_config itself does not need security considerations, but its nested fields might. | None | None |
| `control_plane` | Specifies the control plane configuration. Structure is [documented below](#nested_control_plane). | false | false | Control plane itself does not require specific security considerations. | None | None |
| `load_balancer` | Specifies the load balancer configuration. Structure is [documented below](#nested_load_balancer). | false | false | Load balancer itself does not require specific security considerations. | None | None |
| `storage` | Specifies the cluster storage configuration. Structure is [documented below](#nested_storage). | false | false | Storage does not have security impact on the service. | None | None |
| `proxy` | Specifies the cluster proxy configuration. Structure is [documented below](#nested_proxy). | false | false | Proxy configuration does not require specific security considerations. | None | None |
| `cluster_operations` | Specifies the Admin Cluster's observability infrastructure. Structure is [documented below](#nested_cluster_operations). | false | false | Cluster operations do not have security impact on the service. | None | None |
| `maintenance_config` | Specifies the workload node configurations. Structure is [documented below](#nested_maintenance_config). | false | false | Maintenance configuration is not important enough to have security implications. | None | None |
| `node_config` | Specifies the workload node configurations. Structure is [documented below](#nested_node_config). | false | false | Node configuration is not important enough to have security implications. | None | None |
| `node_access_config` | Specifies the node access related settings for the bare metal user cluster. Structure is [documented below](#nested_node_access_config). | false | false | Node access configuration is not important enough to have security implications. | None | None |
| `security_config` | Specifies the security related settings for the Bare Metal User Cluster. Structure is [documented below](#nested_security_config). | false | false | Security configuration itself does not require specific security considerations. | None | None |
| `project` | If it is not provided, the provider project is used. | true | false | Project is not important enough to have security implications. | None | None |
| `island_mode_cidr` |  | false | false | None | None | None |
| `control_plane_node_pool_config` |  | false | false | None | None | None |
| `node_pool_config` |  | false | false | None | None | None |
| `node_configs` |  | false | false | None | None | None |
| `taints` |  | false | false | taints does not have security impact on the service. | None | None |
| `api_server_args` |  | false | false | None | None | None |
| `vip_config` |  | false | false | None | None | None |
| `port_config` |  | false | false | None | None | None |
| `manual_lb_config` |  | false | false | None | None | None |
| `lvp_share_config` |  | false | false | None | None | None |
| `lvp_config` |  | false | false | None | None | None |
| `lvp_node_mounts_config` |  | false | false | None | None | None |
| `authorization` |  | false | false | None | None | None |
| `admin_users` |  | false | false | None | None | None |

### network_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `island_mode_cidr` | A nested object resource. Structure is [documented below](#nested_network_config_island_mode_cidr). | false | false | island_mode_cidr is not important enough to require specific security considerations. | None | None |

### control_plane Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_node_pool_config` | Configures the node pool running the control plane. If specified the corresponding NodePool will be created for the cluster's control plane. The NodePool will have the same name and namespace as the cluster. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config). | true | false | Control plane node pool itself does not require specific security considerations. | None | None |
| `api_server_args` | Customizes the default API server args. Only a subset of customized flags are supported. Please refer to the API server documentation below to know the exact format: https://kubernetes.io/docs/reference/command-line-tools-reference/kube-apiserver/ Structure is [documented below](#nested_control_plane_api_server_args). | false | false | api_server_args does not have security impact on the service. | None | None |

### load_balancer Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vip_config` | Specified the Bare Metal Load Balancer Config Structure is [documented below](#nested_load_balancer_vip_config). | true | false | VIP config itself does not require specific security considerations. | None | None |
| `port_config` | Specifies the load balancer ports. Structure is [documented below](#nested_load_balancer_port_config). | true | false | port_config itself does not require specific security considerations. | None | None |
| `manual_lb_config` | A nested object resource. Structure is [documented below](#nested_load_balancer_manual_lb_config). | false | false | manual_lb_config does not require specific security considerations. | None | None |

### storage Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `lvp_share_config` | Specifies the config for local PersistentVolumes backed by subdirectories in a shared filesystem. These subdirectores are automatically created during cluster creation. Structure is [documented below](#nested_storage_lvp_share_config). | true | false | lvp_share_config does not have security impact on the service. | None | None |
| `lvp_node_mounts_config` | Specifies the config for local PersistentVolumes backed by mounted node disks. These disks need to be formatted and mounted by the user, which can be done before or after cluster creation. Structure is [documented below](#nested_storage_lvp_node_mounts_config). | true | false | lvp_node_mounts_config does not have security impact on the service. | None | None |

### proxy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uri` | Specifies the address of your proxy server. For Example: http://domain WARNING: Do not provide credentials in the format of http://(username:password@)domain these will be rejected by the server. | true | false | uri does not require specific security considerations. | None | None |
| `no_proxy` | A list of IPs, hostnames, and domains that should skip the proxy. For example: ["127.0.0.1", "example.com", ".corp", "localhost"]. | false | false | no_proxy does not require specific security considerations. | None | None |

### cluster_operations Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_application_logs` | Whether collection of application logs/metrics should be enabled (in addition to system logs/metrics). | false | false | enable_application_logs does not have security impact on the service. | None | None |

### maintenance_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `maintenance_address_cidr_blocks` | All IPv4 address from these ranges will be placed into maintenance mode. Nodes in maintenance mode will be cordoned and drained. When both of these are true, the "baremetal.cluster.gke.io/maintenance" annotation will be set on the node resource. | true | false | maintenance_address_cidr_blocks does not require specific security considerations. | None | None |

### node_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `max_pods_per_node` | The maximum number of pods a node can run. The size of the CIDR range assigned to the node will be derived from this parameter. | false | false | max_pods_per_node does not require specific security considerations. | None | None |

### node_access_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `login_user` | LoginUser is the user name used to access node machines. It defaults to "root" if not set. | false | false | login_user is not important enough to have security implications. | None | None |

### security_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `authorization` | Configures user access to the Bare Metal User cluster. Structure is [documented below](#nested_security_config_authorization). | false | false | Authorization configuration itself does not require specific security considerations. | None | None |

### island_mode_cidr Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. | true | false | Service address CIDR blocks are not important enough to have security implications. | None | None |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. This field cannot be changed after creation. | true | false | Pod address CIDR blocks are not important enough to have security implications. | None | None |

### control_plane_node_pool_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_pool_config` | The generic configuration for a node pool running the control plane. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config). | true | false | Node pool configuration itself does not require specific security considerations. | None | None |

### node_pool_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_configs` | The list of machine addresses in the Bare Metal Node Pool. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config_node_configs). | false | false | node configs itself is not a security concern. | None | None |
| `operating_system` | Specifies the nodes operating system (default: LINUX). | false | true | Operating system selection affects the security posture of nodes. | LINUX | WINDOWS |
| `taints` | The initial taints assigned to nodes of this node pool. Structure is [documented below](#nested_control_plane_control_plane_node_pool_config_node_pool_config_taints). | false | false | taints does not have security impact on the service. | None | None |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | false | labels does not have security impact on the service. | None | None |

### node_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_ip` | The default IPv4 address for SSH access and Kubernetes node. Example: 192.168.0.1 | false | true | Node IPs are critical for security and must be carefully managed. | 10.200.0.2 | 8.8.8.8 |
| `labels` | The map of Kubernetes labels (key/value pairs) to be applied to each node. These will added in addition to any default label(s) that Kubernetes may apply to the node. In case of conflict in label keys, the applied set may differ depending on the Kubernetes version -- it's best to assume the behavior is undefined and conflicts should be avoided. For more information, including usage and the valid values, see: - http://kubernetes.io/v1.1/docs/user-guide/labels.html An object containing a list of "key": value pairs. For example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | false | labels does not have security impact on the service. | None | None |

### taints Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key associated with the effect. | false | false | key is not important enough to have security implications. | None | None |
| `value` | Value associated with the effect. | false | false | value is not important enough to have security implications. | None | None |
| `effect` | Specifies the nodes operating system (default: LINUX). Possible values are: `EFFECT_UNSPECIFIED`, `PREFER_NO_SCHEDULE`, `NO_EXECUTE`. | false | false | effect does not have security impact on the service. | None | None |

### api_server_args Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `argument` | The argument name as it appears on the API Server command line please make sure to remove the leading dashes. | true | false | argument does not have security impact on the service. | None | None |
| `value` | The value of the arg as it will be passed to the API Server command line. | true | false | value does not have security impact on the service. | None | None |

### vip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_vip` | The VIP which you previously set aside for the Kubernetes API of this Bare Metal Admin Cluster. | true | true | control_plane_vip is a critical component for the cluster's API access and must be properly secured. | 10.200.0.5 | 8.8.8.8 |

### port_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_load_balancer_port` | The port that control plane hosted load balancers will listen on. | true | true | control_plane_load_balancer_port is critical for secure communication with the control plane using a secured port. | 443 | 80 |

### manual_lb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether manual load balancing is enabled. | true | false | enabled does not have security impact on the service. | None | None |

### lvp_share_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `lvp_config` | Defines the machine path and storage class for the LVP Share. Structure is [documented below](#nested_storage_lvp_share_config_lvp_config). | true | false | lvp_config is not important enough to have a security policy. | None | None |
| `shared_path_pv_count` | The number of subdirectories to create under path. | false | false | shared_path_pv_count does not have security impact on the service. | None | None |

### lvp_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The host machine path. | true | false | path is not important enough to have a security policy. | None | None |
| `storage_class` | The StorageClass name that PVs will be created with. | true | false | storage_class is not important enough to have a security policy. | None | None |

### lvp_node_mounts_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | The host machine path. | true | false | path is not important enough to have a security policy. | None | None |
| `storage_class` | The StorageClass name that PVs will be created with. | true | false | storage_class is not important enough to have a security policy. | None | None |

### authorization Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_users` | Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_security_config_authorization_admin_users). | true | false | admin_users itself does not have a security impact. | None | None |

### admin_users Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | true | admin_users has a security impact because it grants full access to the cluster. | admin@hashicorptest.com | user@hashicorptest.com |
