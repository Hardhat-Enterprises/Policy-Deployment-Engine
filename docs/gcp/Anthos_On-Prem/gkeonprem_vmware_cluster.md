## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_cluster`

This section provides a concise policy evaluation for the `gkeonprem_vmware_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_cluster)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_cluster_membership` | The admin cluster this VMware User Cluster belongs to. This is the full resource name of the admin cluster's hub membership. In the future, references to other resource types might be allowed if admin clusters are modeled as their own resources. | true | false | admin cluster membership is not sensitive enough for policy compliance | None | None |
| `on_prem_version` | The Anthos clusters on the VMware version for your user cluster. | true | true | on-prem version is a sensitive configuration parameter as outdated versions may have vulnerabilities | 1.13.1-gke.35 | 1.11.1-gke.35 |
| `control_plane_node` | VMware User Cluster control plane nodes must have either 1 or 3 replicas. Structure is [documented below](#nested_control_plane_node). | true | false | control plane node is not security impactful | None | None |
| `name` | The VMware cluster name. | true | false | name does not impact the security of the service | None | None |
| `location` | The location of the resource. | true | true | location is a sensitive parameter as certain locations may have different compliance requirements | us-west1 | asia-southeast1 |
| `description` | A human readable description of this VMware User Cluster. | false | false | description does not impact the security of the service | None | None |
| `annotations` | Annotations on the VMware User Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | annotations do not impact the security of the service | None | None |
| `anti_affinity_groups` | AAGConfig specifies whether to spread VMware User Cluster nodes across at least three physical hosts in the datacenter. Structure is [documented below](#nested_anti_affinity_groups). | false | false | anti_affinity_groups does not impact the security of the service | None | None |
| `storage` | Storage configuration. Structure is [documented below](#nested_storage). | false | false | storage is not a security impactful configuration | None | None |
| `network_config` | The VMware User Cluster network configuration. Structure is [documented below](#nested_network_config). | false | false | network_config itself does not require security considerations, but its sub-arguments may | None | None |
| `load_balancer` | Load Balancer configuration. Structure is [documented below](#nested_load_balancer). | false | false | load balancer itself does not require security compliance, but its sub-arguments may be | None | None |
| `dataplane_v2` | VmwareDataplaneV2Config specifies configuration for Dataplane V2. Structure is [documented below](#nested_dataplane_v2). | false | false | dataplane v2 config does not require security compliance | None | None |
| `vm_tracking_enabled` | Enable VM tracking. | false | false | enabling of vm tracking does not require security compliance | None | None |
| `auto_repair_config` | Configuration for auto repairing. Structure is [documented below](#nested_auto_repair_config). | false | false | auto repair config does not require security compliance | None | None |
| `authorization` | RBAC policy that will be applied and managed by GKE On-Prem. Structure is [documented below](#nested_authorization). | false | false | authorization itself does not require security compliance, but its sub-arguments may | None | None |
| `enable_control_plane_v2` | Enable control plane V2. Default to false. | false | false | enabling of control plane v2 does not require security compliance | None | None |
| `enable_advanced_cluster` | Enable advanced cluster. Default to false. | false | false | enabling of advanced cluster does not require security compliance | None | None |
| `disable_bundled_ingress` | Disable bundled ingress. | false | false | disabling of bundled ingress does not require security compliance | None | None |
| `upgrade_policy` | Specifies upgrade policy for the cluster. Structure is [documented below](#nested_upgrade_policy). | false | false | upgrade policy does not require security compliance | None | None |
| `vcenter` | VmwareVCenterConfig specifies vCenter config for the user cluster. Inherited from the admin cluster. Structure is [documented below](#nested_vcenter). | false | false | vcenter config does not require security compliance | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | project does not impact the security of the service | None | None |
| `auto_resize_config` |  | false | false | None | None | None |
| `static_ip_config` |  | false | false | None | None | None |
| `ip_blocks` |  | false | false | None | None | None |
| `ips` |  | false | false | None | None | None |
| `dhcp_ip_config` |  | false | false | None | None | None |
| `host_config` |  | false | false | None | None | None |
| `control_plane_v2_config` |  | false | false | None | None | None |
| `control_plane_ip_block` |  | false | false | None | None | None |
| `vip_config` |  | false | false | None | None | None |
| `f5_config` |  | false | false | None | None | None |
| `manual_lb_config` |  | false | false | None | None | None |
| `metal_lb_config` |  | false | false | None | None | None |
| `address_pools` |  | false | false | None | None | None |
| `admin_users` |  | false | false | None | None | None |

### control_plane_node Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cpus` | The number of CPUs for each admin cluster node that serve as control planes for this VMware User Cluster. (default: 4 CPUs) | false | false | cpus does not impact security posture | None | None |
| `memory` | The megabytes of memory for each admin cluster node that serves as a control plane for this VMware User Cluster (default: 8192 MB memory). | false | false | memory does not impact security posture | None | None |
| `replicas` | The number of control plane nodes for this VMware User Cluster. (default: 1 replica). | false | false | replicas does not impact security posture | None | None |
| `auto_resize_config` | AutoResizeConfig provides auto resizing configurations. Structure is [documented below](#nested_control_plane_node_auto_resize_config). | false | false | auto resize config does not impact security posture | None | None |
| `vsphere_config` | (Output) Vsphere-specific config. Structure is [documented below](#nested_control_plane_node_vsphere_config). | false | false | vsphere config does not impact security posture | None | None |

### anti_affinity_groups Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `aag_config_disabled` | Spread nodes across at least three physical hosts (requires at least three hosts). Enabled by default. | true | false | aag_config_disabled does not impact the security of the service | None | None |

### storage Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vsphere_csi_disabled` | Whether or not to deploy vSphere CSI components in the VMware User Cluster. Enabled by default. | true | false | vsphere_csi_disabled does not impact the security of the service | None | None |

### network_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported.. This field cannot be changed after creation. | true | true | service_address_cidr_blocks defines the IP address ranges for services, which can impact network security and access control. | 10.96.0.0/12 | 8.8.8.8/12 |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | true | pod_address_cidr_blocks defines the IP address ranges for pods, which can impact network security and access control. | 192.168.0.0/16 | 17.5.7.3/16 |
| `static_ip_config` | Configuration settings for a static IP configuration. Structure is [documented below](#nested_network_config_static_ip_config). | false | false | static ip config is not security impactful enough to warrant policy compliance | None | None |
| `dhcp_ip_config` | Configuration settings for a DHCP IP configuration. Structure is [documented below](#nested_network_config_dhcp_ip_config). | false | false | dhcp ip config is not security impactful enough to warrant policy compliance | None | None |
| `vcenter_network` | vcenter_network specifies vCenter network name. Inherited from the admin cluster. | false | false | vcenter_network name is not security impactful | None | None |
| `host_config` | Represents common network settings irrespective of the host's IP address. Structure is [documented below](#nested_network_config_host_config). | false | false | host config is not security impactful enough to warrant policy compliance | None | None |
| `control_plane_v2_config` | Configuration for control plane V2 mode. Structure is [documented below](#nested_network_config_control_plane_v2_config). | false | false | control plane v2 config is not security impactful enough to warrant policy compliance | None | None |

### load_balancer Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vip_config` | The VIPs used by the load balancer. Structure is [documented below](#nested_load_balancer_vip_config). | false | false | vip config itself does not require security compliance, but its sub-arguments may be | None | None |
| `f5_config` | Configuration for F5 Big IP typed load balancers. Structure is [documented below](#nested_load_balancer_f5_config). | false | false | f5 config does not require security compliance | None | None |
| `manual_lb_config` | Manually configured load balancers. Structure is [documented below](#nested_load_balancer_manual_lb_config). | false | false | manual load balancer config does not require security compliance | None | None |
| `metal_lb_config` | Configuration for MetalLB typed load balancers. Structure is [documented below](#nested_load_balancer_metal_lb_config). | false | false | metal load balancer config does not require security compliance | None | None |

### dataplane_v2 Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dataplane_v2_enabled` | Enables Dataplane V2. | false | false | enabling of dataplane v2 config does not require security compliance | None | None |
| `windows_dataplane_v2_enabled` | Enable Dataplane V2 for clusters with Windows nodes. | false | false | enabling of dataplane v2 config does not require security compliance | None | None |
| `advanced_networking` | Enable advanced networking which requires dataplane_v2_enabled to be set true. | false | false | advanced networking does not require security compliance | None | None |

### auto_repair_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether auto repair is enabled. | true | false | enabling of auto repair config does not require security compliance | None | None |

### authorization Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `admin_users` | Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_authorization_admin_users). | false | false | admin users itself does not require security compliance, but its sub-arguments may | None | None |

### upgrade_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_only` | Controls whether the upgrade applies to the control plane only. | false | false | control plane only upgrade does not require security compliance | None | None |

### vcenter Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_pool` | The name of the vCenter resource pool for the user cluster. | false | false | resource pool does not impact the security of the service | None | None |
| `datastore` | The name of the vCenter datastore for the user cluster. | false | false | datastore does not impact the security of the service | None | None |
| `datacenter` | The name of the vCenter datacenter for the user cluster. | false | false | datacenter does not impact the security of the service | None | None |
| `cluster` | The name of the vCenter cluster for the user cluster. | false | false | cluster does not impact the security of the service | None | None |
| `folder` | The name of the vCenter folder for the user cluster. | false | false | folder does not impact the security of the service | None | None |
| `ca_cert_data` | Contains the vCenter CA certificate public key for SSL verification. | false | false | ca_cert_data is not security impactful enough to warrant policy compliance | None | None |
| `address` | (Output) The vCenter IP address. | false | false | address is only an output and does not impact security posture | None | None |
| `storage_policy_name` | The name of the vCenter storage policy for the user cluster. | false | false | storage_policy_name does not impact the security of the service | None | None |

### auto_resize_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether to enable control plane node auto resizing. The `vsphere_config` block contains: | true | false | enabling of auto resize config does not require security compliance | None | None |
| `datastore` | (Output) The Vsphere datastore used by the Control Plane Node. | false | false | datastore is only an output and does not impact security posture | None | None |
| `storage_policy_name` | (Output) The Vsphere storage policy used by the control plane Node. | false | false | storage_policy_name is only an output and does not impact security posture | None | None |

### static_ip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip_blocks` | Represents the configuration values for static IP allocation to nodes. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks). | true | false | static_ip_config ip blocks is not security impactful enough to warrant policy compliance | None | None |

### ip_blocks Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `netmask` | The netmask used by the VMware User Cluster. | true | false | netmask is not security impactful enough to warrant policy compliance | None | None |
| `gateway` | The network gateway used by the VMware User Cluster. | true | false | gateway is not security impactful enough to warrant policy compliance | None | None |
| `ips` | The node's network configurations used by the VMware User Cluster. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks_ip_blocks_ips). | true | false | ips is not security impactful enough to warrant policy compliance | None | None |

### ips Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip` | IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2.3.0/24). | false | false | ip is not security impactful enough to warrant policy compliance | None | None |
| `hostname` | Hostname of the machine. VM's name will be used if this field is empty. | false | false | hostname does not impact the security of the service | None | None |

### dhcp_ip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | enabled is a flag to mark if DHCP IP allocation is used for VMware user clusters. | true | false | enabling of dhcp ip config does not require security compliance | None | None |

### host_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dns_servers` | DNS servers. | false | false | dns servers do not impact the security of the service | None | None |
| `ntp_servers` | NTP servers. | false | false | ntp servers do not impact the security of the service | None | None |
| `dns_search_domains` | DNS search domains. | false | false | dns search domains do not impact the security of the service | None | None |

### control_plane_v2_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_ip_block` | Static IP addresses for the control plane nodes. Structure is [documented below](#nested_network_config_control_plane_v2_config_control_plane_ip_block). | false | false | control plane ip block is not security impactful enough to warrant policy compliance | None | None |

### control_plane_ip_block Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `netmask` | The netmask used by the VMware User Cluster. | false | false | netmask is not security impactful enough to warrant policy compliance | None | None |
| `gateway` | The network gateway used by the VMware User Cluster. | false | false | gateway is not security impactful enough to warrant policy compliance | None | None |
| `ips` | The node's network configurations used by the VMware User Cluster. Structure is [documented below](#nested_network_config_control_plane_v2_config_control_plane_ip_block_ips). | false | false | ips is not security impactful enough to warrant policy compliance | None | None |

### vip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_vip` | The VIP which you previously set aside for the Kubernetes API of this cluster. | false | true | control plane vip is critical for cluster access and should be secured appropriately | 10.251.133.5 | 8.8.8.8 |
| `ingress_vip` | The VIP which you previously set aside for ingress traffic into this cluster. | false | true | ingress vip is critical for cluster access and should be secured appropriately | 10.251.135.19 | 17.5.7.3 |

### f5_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `address` | The load balancer's IP address. | false | false | address is not security impactful enough to warrant policy compliance | None | None |
| `partition` | The preexisting partition to be used by the load balancer. This partition is usually created for the admin cluster for example: 'my-f5-admin-partition'. | false | false | partition is not security impactful enough to warrant policy compliance | None | None |
| `snat_pool` | The pool name. Only necessary, if using SNAT. | false | false | snat_pool does not impact the security of the service | None | None |

### manual_lb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ingress_http_node_port` | NodePort for ingress service's http. The ingress service in the admin cluster is implemented as a Service of type NodePort (ex. 32527). | false | false | ingress_http_node_port is not security impactful enough to warrant policy compliance | None | None |
| `ingress_https_node_port` | NodePort for ingress service's https. The ingress service in the admin cluster is implemented as a Service of type NodePort (ex. 30139). | false | false | ingress_https_node_port is not security impactful enough to warrant policy compliance | None | None |
| `control_plane_node_port` | NodePort for control plane service. The Kubernetes API server in the admin cluster is implemented as a Service of type NodePort (ex. 30968). | false | false | control_plane_node_port is not security impactful enough to warrant policy compliance | None | None |
| `konnectivity_server_node_port` | NodePort for konnectivity server service running as a sidecar in each kube-apiserver pod (ex. 30564). | false | false | konnectivity_server_node_port is not security impactful enough to warrant policy compliance | None | None |

### metal_lb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `address_pools` | AddressPools is a list of non-overlapping IP pools used by load balancer typed services. All addresses must be routable to load balancer nodes. IngressVIP must be included in the pools. Structure is [documented below](#nested_load_balancer_metal_lb_config_address_pools). | true | false | address_pools does not impact the security of the service | None | None |

### address_pools Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `pool` | The name of the address pool. | true | false | pool does not impact the security of the service | None | None |
| `addresses` | The addresses that are part of this pool. Each address must be either in the CIDR form (1.2.3.0/24) or range form (1.2.3.1-1.2.3.5). | true | false | addresses is not security impactful enough to warrant policy compliance | None | None |
| `avoid_buggy_ips` | If true, avoid using IPs ending in .0 or .255. This avoids buggy consumer devices mistakenly dropping IPv4 traffic for those special IP addresses. | false | false | avoid_buggy_ips does not impact the security of the service | None | None |
| `manual_assign` | If true, prevent IP addresses from being automatically assigned. | false | false | manual_assign does not impact the security of the service | None | None |

### admin_users Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | true | admin_users are critical for system access and must be properly managed to prevent unauthorized access. | testuser@gmail.com | testuser@apple.com |
