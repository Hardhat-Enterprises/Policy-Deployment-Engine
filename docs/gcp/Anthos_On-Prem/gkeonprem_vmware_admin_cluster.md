## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_admin_cluster`

This section provides a concise policy evaluation for the `gkeonprem_vmware_admin_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_admin_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_admin_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The VMware admin cluster resource name. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `description` | A human readable description of this VMware admin cluster. | false | None | None |
| `on_prem_version` | The Anthos clusters on the VMware version for the admin cluster. | false | None | None |
| `image_type` | The OS image type for the VMware admin cluster. | false | None | None |
| `bootstrap_cluster_membership` | The bootstrap cluster this VMware admin cluster belongs to. | false | None | None |
| `annotations` | Annotations on the VMware Admin Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported.. This field cannot be changed after creation. | true | None | None |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | None | None |
| `static_ip_config` | Configuration settings for a static IP configuration. Structure is [documented below](#nested_network_config_static_ip_config). | false | None | None |
| `dhcp_ip_config` | Configuration settings for a DHCP IP configuration. Structure is [documented below](#nested_network_config_dhcp_ip_config). | false | None | None |
| `vcenter_network` | vcenter_network specifies vCenter network name. | false | None | None |
| `host_config` | Represents common network settings irrespective of the host's IP address. Structure is [documented below](#nested_network_config_host_config). | false | None | None |
| `ha_control_plane_config` | Configuration for HA admin cluster control plane. Structure is [documented below](#nested_network_config_ha_control_plane_config). | false | None | None |

### control_plane_node Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpus` | The number of vCPUs for the control-plane node of the admin cluster. | false | None | None |
| `memory` | The number of mebibytes of memory for the control-plane node of the admin cluster. | false | None | None |
| `replicas` | The number of control plane nodes for this VMware admin cluster. | false | None | None |

### addon_node Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_resize_config` | Specifies auto resize config. Structure is [documented below](#nested_addon_node_auto_resize_config). | false | None | None |

### load_balancer Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vip_config` | Specified the VMware Load Balancer Config Structure is [documented below](#nested_load_balancer_vip_config). | true | None | None |
| `f5_config` | Configuration for F5 Big IP typed load balancers. Structure is [documented below](#nested_load_balancer_f5_config). | false | None | None |
| `manual_lb_config` | Manually configured load balancers. Structure is [documented below](#nested_load_balancer_manual_lb_config). | false | None | None |
| `metal_lb_config` | Metal LB load balancers. Structure is [documented below](#nested_load_balancer_metal_lb_config). | false | None | None |

### vcenter Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_pool` | The name of the vCenter resource pool for the admin cluster. | false | None | None |
| `datastore` | The name of the vCenter datastore for the admin cluster. | false | None | None |
| `datacenter` | The name of the vCenter datacenter for the admin cluster. | false | None | None |
| `cluster` | The name of the vCenter cluster for the admin cluster. | false | None | None |
| `folder` | The name of the vCenter folder for the admin cluster. | false | None | None |
| `ca_cert_data` | Contains the vCenter CA certificate public key for SSL verification. | false | None | None |
| `address` | The vCenter IP address. | false | None | None |
| `data_disk` | The name of the virtual machine disk (VMDK) for the admin cluster. | false | None | None |
| `storage_policy_name` | The name of the vCenter storage policy for the user cluster. | false | None | None |

### anti_affinity_groups Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `aag_config_disabled` | Spread nodes across at least three physical hosts (requires at least three hosts). Enabled by default. | true | None | None |

### auto_repair_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether auto repair is enabled. | true | None | None |

### authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `viewer_users` | Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_authorization_viewer_users). | false | None | None |

### platform_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `required_platform_version` | The required platform version e.g. 1.13.1. If the current platform version is lower than the target version, the platform version will be updated to the target version. If the target version is not installed in the platform (bundle versions), download the target version bundle. | false | None | None |
| `platform_version` | (Output) The platform version e.g. 1.13.2. | none | None | None |
| `bundles` | (Output) The list of bundles installed in the admin cluster. Structure is [documented below](#nested_platform_config_bundles). | none | None | None |
| `status` | (Output) ResourceStatus representing detailed cluster state. Structure is [documented below](#nested_platform_config_bundles_bundles_status). The `status` block contains: | none | None | None |
| `version` | (Output) The version of the bundle. | none | None | None |
| `error_message` | (Output) Human-friendly representation of the error message from the admin cluster controller. The error message can be temporary as the admin cluster controller creates a cluster or node pool. If the error message persists for a longer period of time, it can be used to surface error message to indicate real problems requiring user intervention. | none | None | None |
| `conditions` | (Output) ResourceConditions provide a standard mechanism for higher-level status reporting from admin cluster controller. Structure is [documented below](#nested_platform_config_status_conditions). The `conditions` block contains: | none | None | None |
| `type` | (Output) Type of the condition. (e.g., ClusterRunning, NodePoolRunning or ServerSidePreflightReady) | none | None | None |
| `reason` | (Output) Machine-readable message indicating details about last transition. | none | None | None |
| `message` | (Output) Human-readable message indicating details about last transition. | none | None | None |
| `last_transition_time` | (Output) Last time the condition transit from one status to another. | none | None | None |
| `state` | (Output) The lifecycle state of the condition. | none | None | None |

### private_registry_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `address` | The registry address. | false | None | None |
| `ca_cert` | The CA certificate public key for private registry. | false | None | None |

### static_ip_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_blocks` | Represents the configuration values for static IP allocation to nodes. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks). | false | None | None |

### ip_blocks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `netmask` | The netmask used by the VMware Admin Cluster. | true | None | None |
| `gateway` | The network gateway used by the VMware Admin Cluster. | true | None | None |
| `ips` | The node's network configurations used by the VMware Admin Cluster. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks_ip_blocks_ips). | true | None | None |

### ips Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip` | IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2.3.0/24). | true | None | None |
| `hostname` | Hostname of the machine. VM's name will be used if this field is empty. | false | None | None |

### dhcp_ip_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | enabled is a flag to mark if DHCP IP allocation is used for VMware admin clusters. | true | None | None |

### host_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `dns_servers` | DNS servers. | false | None | None |
| `ntp_servers` | NTP servers. | false | None | None |
| `dns_search_domains` | DNS search domains. | false | None | None |

### ha_control_plane_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_ip_block` | Static IP addresses for the control plane nodes. Structure is [documented below](#nested_network_config_ha_control_plane_config_control_plane_ip_block). | false | None | None |

### control_plane_ip_block Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `netmask` | The netmask used by the VMware Admin Cluster. | true | None | None |
| `gateway` | The network gateway used by the VMware Admin Cluster. | true | None | None |
| `ips` | The node's network configurations used by the VMware Admin Cluster. Structure is [documented below](#nested_network_config_ha_control_plane_config_control_plane_ip_block_ips). | true | None | None |

### auto_resize_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether to enable controle plane node auto resizing. | true | None | None |

### vip_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `control_plane_vip` | The VIP which you previously set aside for the Kubernetes API of this VMware Admin Cluster. | true | None | None |
| `addons_vip` | The VIP to configure the load balancer for add-ons. | false | None | None |

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
| `addons_node_port` | NodePort for add-ons server in the admin cluster. | false | None | None |

### metal_lb_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Metal LB is enabled. | false | None | None |

### viewer_users Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | None | None |
