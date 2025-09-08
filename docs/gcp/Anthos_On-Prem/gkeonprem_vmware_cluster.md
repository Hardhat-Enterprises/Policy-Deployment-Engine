## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_cluster`

This section provides a concise policy evaluation for the `gkeonprem_vmware_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_cluster_membership` | The admin cluster this VMware User Cluster belongs to. This is the full resource name of the admin cluster's hub membership. In the future, references to other resource types might be allowed if admin clusters are modeled as their own resources. | true | None | None |
| `on_prem_version` | The Anthos clusters on the VMware version for your user cluster. | true | None | None |
| `name` | The VMware cluster name. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `description` | A human readable description of this VMware User Cluster. | false | None | None |
| `annotations` | Annotations on the VMware User Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `vm_tracking_enabled` | Enable VM tracking. | false | None | None |
| `enable_control_plane_v2` | Enable control plane V2. Default to false. | false | None | None |
| `enable_advanced_cluster` | Enable advanced cluster. Default to false. | false | None | None |
| `disable_bundled_ingress` | Disable bundled ingress. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### control_plane_node Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpus` | The number of CPUs for each admin cluster node that serve as control planes for this VMware User Cluster. (default: 4 CPUs) | false | None | None |
| `memory` | The megabytes of memory for each admin cluster node that serves as a control plane for this VMware User Cluster (default: 8192 MB memory). | false | None | None |
| `replicas` | The number of control plane nodes for this VMware User Cluster. (default: 1 replica). | false | None | None |
| `auto_resize_config` | AutoResizeConfig provides auto resizing configurations. Structure is [documented below](#nested_control_plane_node_auto_resize_config). | false | None | None |
| `vsphere_config` | (Output) Vsphere-specific config. Structure is [documented below](#nested_control_plane_node_vsphere_config). | none | None | None |

### anti_affinity_groups Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `aag_config_disabled` | Spread nodes across at least three physical hosts (requires at least three hosts). Enabled by default. | true | None | None |

### storage Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vsphere_csi_disabled` | Whether or not to deploy vSphere CSI components in the VMware User Cluster. Enabled by default. | true | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported.. This field cannot be changed after creation. | true | None | None |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | None | None |
| `static_ip_config` | Configuration settings for a static IP configuration. Structure is [documented below](#nested_network_config_static_ip_config). | false | None | None |
| `dhcp_ip_config` | Configuration settings for a DHCP IP configuration. Structure is [documented below](#nested_network_config_dhcp_ip_config). | false | None | None |
| `vcenter_network` | vcenter_network specifies vCenter network name. Inherited from the admin cluster. | false | None | None |
| `host_config` | Represents common network settings irrespective of the host's IP address. Structure is [documented below](#nested_network_config_host_config). | false | None | None |
| `control_plane_v2_config` | Configuration for control plane V2 mode. Structure is [documented below](#nested_network_config_control_plane_v2_config). | false | None | None |

### load_balancer Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vip_config` | The VIPs used by the load balancer. Structure is [documented below](#nested_load_balancer_vip_config). | false | None | None |
| `f5_config` | Configuration for F5 Big IP typed load balancers. Structure is [documented below](#nested_load_balancer_f5_config). | false | None | None |
| `manual_lb_config` | Manually configured load balancers. Structure is [documented below](#nested_load_balancer_manual_lb_config). | false | None | None |
| `metal_lb_config` | Configuration for MetalLB typed load balancers. Structure is [documented below](#nested_load_balancer_metal_lb_config). | false | None | None |

### dataplane_v2 Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dataplane_v2_enabled` | Enables Dataplane V2. | false | None | None |
| `windows_dataplane_v2_enabled` | Enable Dataplane V2 for clusters with Windows nodes. | false | None | None |
| `advanced_networking` | Enable advanced networking which requires dataplane_v2_enabled to be set true. | false | None | None |

### auto_repair_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether auto repair is enabled. | true | None | None |

### authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_users` | Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_authorization_admin_users). | false | None | None |

### upgrade_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_only` | Controls whether the upgrade applies to the control plane only. | false | None | None |

### vcenter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_pool` | The name of the vCenter resource pool for the user cluster. | false | None | None |
| `datastore` | The name of the vCenter datastore for the user cluster. | false | None | None |
| `datacenter` | The name of the vCenter datacenter for the user cluster. | false | None | None |
| `cluster` | The name of the vCenter cluster for the user cluster. | false | None | None |
| `folder` | The name of the vCenter folder for the user cluster. | false | None | None |
| `ca_cert_data` | Contains the vCenter CA certificate public key for SSL verification. | false | None | None |
| `address` | (Output) The vCenter IP address. | none | None | None |
| `storage_policy_name` | The name of the vCenter storage policy for the user cluster. | false | None | None |

### auto_resize_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether to enable control plane node auto resizing. The `vsphere_config` block contains: | true | None | None |
| `datastore` | (Output) The Vsphere datastore used by the Control Plane Node. | none | None | None |
| `storage_policy_name` | (Output) The Vsphere storage policy used by the control plane Node. | none | None | None |

### static_ip_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_blocks` | Represents the configuration values for static IP allocation to nodes. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks). | true | None | None |

### ip_blocks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `netmask` | The netmask used by the VMware User Cluster. | true | None | None |
| `gateway` | The network gateway used by the VMware User Cluster. | true | None | None |
| `ips` | The node's network configurations used by the VMware User Cluster. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks_ip_blocks_ips). | true | None | None |

### ips Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip` | IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2.3.0/24). | false | None | None |
| `hostname` | Hostname of the machine. VM's name will be used if this field is empty. | false | None | None |

### dhcp_ip_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | enabled is a flag to mark if DHCP IP allocation is used for VMware user clusters. | true | None | None |

### host_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dns_servers` | DNS servers. | false | None | None |
| `ntp_servers` | NTP servers. | false | None | None |
| `dns_search_domains` | DNS search domains. | false | None | None |

### control_plane_v2_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_ip_block` | Static IP addresses for the control plane nodes. Structure is [documented below](#nested_network_config_control_plane_v2_config_control_plane_ip_block). | false | None | None |

### control_plane_ip_block Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `netmask` | The netmask used by the VMware User Cluster. | false | None | None |
| `gateway` | The network gateway used by the VMware User Cluster. | false | None | None |
| `ips` | The node's network configurations used by the VMware User Cluster. Structure is [documented below](#nested_network_config_control_plane_v2_config_control_plane_ip_block_ips). | false | None | None |

### vip_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_vip` | The VIP which you previously set aside for the Kubernetes API of this cluster. | false | None | None |
| `ingress_vip` | The VIP which you previously set aside for ingress traffic into this cluster. | false | None | None |

### f5_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `address` | The load balancer's IP address. | false | None | None |
| `partition` | he preexisting partition to be used by the load balancer. T his partition is usually created for the admin cluster for example: 'my-f5-admin-partition'. | false | None | None |
| `snat_pool` | The pool name. Only necessary, if using SNAT. | false | None | None |

### manual_lb_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ingress_http_node_port` | NodePort for ingress service's http. The ingress service in the admin cluster is implemented as a Service of type NodePort (ex. 32527). | false | None | None |
| `ingress_https_node_port` | NodePort for ingress service's https. The ingress service in the admin cluster is implemented as a Service of type NodePort (ex. 30139). | false | None | None |
| `control_plane_node_port` | NodePort for control plane service. The Kubernetes API server in the admin cluster is implemented as a Service of type NodePort (ex. 30968). | false | None | None |
| `konnectivity_server_node_port` | NodePort for konnectivity server service running as a sidecar in each kube-apiserver pod (ex. 30564). | false | None | None |

### metal_lb_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `address_pools` | AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_metal_lb_config_address_pools). | true | None | None |

### address_pools Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pool` | The name of the address pool. | true | None | None |
| `addresses` | The addresses that are part of this pool. Each address must be either in the CIDR form (1.2.3.0/24) or range form (1.2.3.1-1.2.3.5). | true | None | None |
| `avoid_buggy_ips` | If true, avoid using IPs ending in .0 or .255. This avoids buggy consumer devices mistakenly dropping IPv4 traffic for those special IP addresses. | false | None | None |
| `manual_assign` | If true, prevent IP addresses from being automatically assigned. | false | None | None |

### admin_users Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | None | None |
