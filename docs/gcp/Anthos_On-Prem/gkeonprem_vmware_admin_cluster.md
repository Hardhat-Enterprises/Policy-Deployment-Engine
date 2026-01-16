## 🛡️ Policy Deployment Engine: `gkeonprem_vmware_admin_cluster`

This section provides a concise policy evaluation for the `gkeonprem_vmware_admin_cluster` resource in GCP.

Reference: [Terraform Registry – gkeonprem_vmware_admin_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gkeonprem_vmware_admin_cluster)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network_config` | The VMware admin cluster network configuration. Structure is [documented below](#nested_network_config). | true | false | network config itself is not sensitive, but may contain sensitive data in its nested fields | None | None |
| `name` | The VMware admin cluster resource name. | true | false | name does not require security considerations | None | None |
| `location` | The location of the resource. | true | true | location is a sensitive field and should be protected | us-west1 | africa1 |
| `description` | A human readable description of this VMware admin cluster. | false | false | description is not a security sensitive field | None | None |
| `on_prem_version` | The Anthos clusters on the VMware version for the admin cluster. | false | true | on_prem_version is a sensitive field and should be protected | 1.31.0-gke.35 | 1.30.0-gke.35 |
| `image_type` | The OS image type for the VMware admin cluster. | false | false | image_type is not security sensitive enough | None | None |
| `bootstrap_cluster_membership` | The bootstrap cluster this VMware admin cluster belongs to. | false | false | bootstrap_cluster_membership is not security sensitive enough | None | None |
| `annotations` | Annotations on the VMware Admin Cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Key can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | annotations is not a security sensitive field | None | None |
| `control_plane_node` | The VMware admin cluster control plane node configuration. Structure is [documented below](#nested_control_plane_node). | false | false | control_plane_node does not require security considerations | None | None |
| `addon_node` | The VMware admin cluster addon node configuration. Structure is [documented below](#nested_addon_node). | false | false | addon_node does not require security considerations | None | None |
| `load_balancer` | Specifies the load balancer configuration for VMware admin cluster. Structure is [documented below](#nested_load_balancer). | false | false | load_balancer itself is not sensitive, but may contain sensitive data in its nested fields | None | None |
| `vcenter` | Specifies vCenter config for the admin cluster. Structure is [documented below](#nested_vcenter). | false | false | vcenter is not sensitive information | None | None |
| `anti_affinity_groups` | AAGConfig specifies whether to spread VMware Admin Cluster nodes across at least three physical hosts in the datacenter. Structure is [documented below](#nested_anti_affinity_groups). | false | false | anti_affinity_groups does not require security considerations | None | None |
| `auto_repair_config` | Configuration for auto repairing. Structure is [documented below](#nested_auto_repair_config). | false | false | auto_repair_config does not require security considerations | None | None |
| `authorization` | The VMware admin cluster authorization configuration. Structure is [documented below](#nested_authorization). | false | false | authorization itself is not sensitive, but may contain sensitive data in its nested fields | None | None |
| `platform_config` | The VMware platform configuration. Structure is [documented below](#nested_platform_config). | false | false | platform config itself is not sensitive, but may contain sensitive data in its nested fields | None | None |
| `private_registry_config` | Configuration for private registry. Structure is [documented below](#nested_private_registry_config). | false | false | private registry config does not require security considerations | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | project is not a security sensitive field | None | None |
| `static_ip_config` |  | false | false | None | None | None |
| `ip_blocks` |  | false | false | None | None | None |
| `ips` |  | false | false | None | None | None |
| `dhcp_ip_config` |  | false | false | None | None | None |
| `host_config` |  | false | false | None | None | None |
| `ha_control_plane_config` |  | false | false | None | None | None |
| `control_plane_ip_block` |  | false | false | None | None | None |
| `auto_resize_config` |  | false | false | None | None | None |
| `vip_config` |  | false | false | None | None | None |
| `f5_config` |  | false | false | None | None | None |
| `manual_lb_config` |  | false | false | None | None | None |
| `metal_lb_config` |  | false | false | None | None | None |
| `viewer_users` |  | false | false | None | None | None |

### network_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_address_cidr_blocks` | All services in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported.. This field cannot be changed after creation. | true | true | service_address_cidr_blocks contains sensitive network configuration data | 10.96.0.0/12 | 8.8.8.8/12 |
| `pod_address_cidr_blocks` | All pods in the cluster are assigned an RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | true | pod_address_cidr_blocks contains sensitive network configuration data | 192.168.0.0/16 | 1.1.1.1/16 |
| `static_ip_config` | Configuration settings for a static IP configuration. Structure is [documented below](#nested_network_config_static_ip_config). | false | false | static ip config is not security sensitive enough | None | None |
| `dhcp_ip_config` | Configuration settings for a DHCP IP configuration. Structure is [documented below](#nested_network_config_dhcp_ip_config). | false | false | dhcp ip config does not require security considerations | None | None |
| `vcenter_network` | vcenter_network specifies vCenter network name. | false | false | vcenter network name is not sensitive information | None | None |
| `host_config` | Represents common network settings irrespective of the host's IP address. Structure is [documented below](#nested_network_config_host_config). | false | false | host config is not security sensitive enough | None | None |
| `ha_control_plane_config` | Configuration for HA admin cluster control plane. Structure is [documented below](#nested_network_config_ha_control_plane_config). | false | false | ha control plane config does not require security considerations | None | None |

### control_plane_node Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cpus` | The number of vCPUs for the control-plane node of the admin cluster. | false | false | cpus is not a security sensitive field | None | None |
| `memory` | The number of mebibytes of memory for the control-plane node of the admin cluster. | false | false | memory is not a security sensitive field | None | None |
| `replicas` | The number of control plane nodes for this VMware admin cluster. | false | false | replicas is not a security sensitive field | None | None |

### addon_node Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `auto_resize_config` | Specifies auto resize config. Structure is [documented below](#nested_addon_node_auto_resize_config). | false | false | auto_resize_config is not a security sensitive field | None | None |

### load_balancer Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `vip_config` | Specified the VMware Load Balancer Config Structure is [documented below](#nested_load_balancer_vip_config). | true | false | vip_config itself is not sensitive, but may contain sensitive data in its nested fields | None | None |
| `f5_config` | Configuration for F5 Big IP typed load balancers. Structure is [documented below](#nested_load_balancer_f5_config). | false | false | f5_config is not a security sensitive field | None | None |
| `manual_lb_config` | Manually configured load balancers. Structure is [documented below](#nested_load_balancer_manual_lb_config). | false | false | manual_lb_config is not a security sensitive field | None | None |
| `metal_lb_config` | Metal LB load balancers. Structure is [documented below](#nested_load_balancer_metal_lb_config). | false | false | metal_lb_config is not a security sensitive field | None | None |

### vcenter Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `resource_pool` | The name of the vCenter resource pool for the admin cluster. | false | false | resource_pool is not a security sensitive field | None | None |
| `datastore` | The name of the vCenter datastore for the admin cluster. | false | false | datastore is not a security sensitive field | None | None |
| `datacenter` | The name of the vCenter datacenter for the admin cluster. | false | false | datacenter is not a security sensitive field | None | None |
| `cluster` | The name of the vCenter cluster for the admin cluster. | false | false | cluster is not a security sensitive field | None | None |
| `folder` | The name of the vCenter folder for the admin cluster. | false | false | folder is not a security sensitive field | None | None |
| `ca_cert_data` | Contains the vCenter CA certificate public key for SSL verification. | false | false | ca_cert_data is not a security sensitive field | None | None |
| `address` | The vCenter IP address. | false | false | address is not a security sensitive field | None | None |
| `data_disk` | The name of the virtual machine disk (VMDK) for the admin cluster. | false | false | data_disk is not a security sensitive field | None | None |
| `storage_policy_name` | The name of the vCenter storage policy for the user cluster. | false | false | storage_policy_name is not a security sensitive field | None | None |

### anti_affinity_groups Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `aag_config_disabled` | Spread nodes across at least three physical hosts (requires at least three hosts). Enabled by default. | true | false | aag_config_disabled is not a security sensitive field | None | None |

### auto_repair_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether auto repair is enabled. | true | false | enabled is not a security sensitive field | None | None |

### authorization Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `viewer_users` | Users that will be granted the cluster-admin role on the cluster, providing full access to the cluster. Structure is [documented below](#nested_authorization_viewer_users). | false | true | viewer_users contains sensitive user information and should be protected | user1@gmail.com | user1@apple.com |

### platform_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `required_platform_version` | The required platform version e.g. 1.13.1. If the current platform version is lower than the target version, the platform version will be updated to the target version. If the target version is not installed in the platform (bundle versions), download the target version bundle. | false | true | required_platform_version is a sensitive field that specifies the version of the platform to be used | 1.31.0 | 1.30.0 |
| `platform_version` | (Output) The platform version e.g. 1.13.2. | false | false | platform version is only an output field and does not require security considerations | None | None |
| `bundles` | (Output) The list of bundles installed in the admin cluster. Structure is [documented below](#nested_platform_config_bundles). | false | false | bundles is only an output field and does not require security considerations | None | None |
| `status` | (Output) ResourceStatus representing detailed cluster state. Structure is [documented below](#nested_platform_config_bundles_bundles_status). The `status` block contains: | false | false | status is only an output field and does not require security considerations | None | None |
| `version` | (Output) The version of the bundle. | false | false | version is only an output field and does not require security considerations | None | None |
| `error_message` | (Output) Human-friendly representation of the error message from the admin cluster controller. The error message can be temporary as the admin cluster controller creates a cluster or node pool. If the error message persists for a longer period of time, it can be used to surface error message to indicate real problems requiring user intervention. | false | false | error_message is only an output field and does not require security considerations | None | None |
| `conditions` | (Output) ResourceConditions provide a standard mechanism for higher-level status reporting from admin cluster controller. Structure is [documented below](#nested_platform_config_status_conditions). The `conditions` block contains: | false | false | conditions is only an output field and does not require security considerations | None | None |
| `type` | (Output) Type of the condition. (e.g., ClusterRunning, NodePoolRunning or ServerSidePreflightReady) | false | false | type is only an output field and does not require security considerations | None | None |
| `reason` | (Output) Machine-readable message indicating details about last transition. | false | false | reason is only an output field and does not require security considerations | None | None |
| `message` | (Output) Human-readable message indicating details about last transition. | false | false | message is only an output field and does not require security considerations | None | None |
| `last_transition_time` | (Output) Last time the condition transit from one status to another. | false | false | last_transition_time is only an output field and does not require security considerations | None | None |
| `state` | (Output) The lifecycle state of the condition. | false | false | state is only an output field and does not require security considerations | None | None |

### private_registry_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `address` | The registry address. | false | false | address is not a security sensitive field | None | None |
| `ca_cert` | The CA certificate public key for private registry. | false | false | ca_cert is not a security sensitive field | None | None |

### static_ip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip_blocks` | Represents the configuration values for static IP allocation to nodes. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks). | false | false | static_ip_config is not security sensitive enough | None | None |

### ip_blocks Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `netmask` | The netmask used by the VMware Admin Cluster. | true | false | netmask is not security sensitive enough | None | None |
| `gateway` | The network gateway used by the VMware Admin Cluster. | true | false | gateway is not security sensitive enough | None | None |
| `ips` | The node's network configurations used by the VMware Admin Cluster. Structure is [documented below](#nested_network_config_static_ip_config_ip_blocks_ip_blocks_ips). | true | false | ips is not security sensitive enough | None | None |

### ips Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ip` | IP could be an IP address (like 1.2.3.4) or a CIDR (like 1.2.3.0/24). | true | false | ip is not security sensitive enough | None | None |
| `hostname` | Hostname of the machine. VM's name will be used if this field is empty. | false | false | hostname is not security sensitive enough | None | None |

### dhcp_ip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | enabled is a flag to mark if DHCP IP allocation is used for VMware admin clusters. | true | false | enabled is not a security sensitive field | None | None |

### host_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `dns_servers` | DNS servers. | false | false | dns_servers is not security sensitive enough | None | None |
| `ntp_servers` | NTP servers. | false | false | ntp_servers is not security sensitive enough | None | None |
| `dns_search_domains` | DNS search domains. | false | false | dns_search_domains is not security sensitive enough | None | None |

### ha_control_plane_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_ip_block` | Static IP addresses for the control plane nodes. Structure is [documented below](#nested_network_config_ha_control_plane_config_control_plane_ip_block). | false | false | control_plane_ip_block is not security sensitive enough | None | None |

### control_plane_ip_block Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `netmask` | The netmask used by the VMware Admin Cluster. | true | false | netmask is not security sensitive enough | None | None |
| `gateway` | The network gateway used by the VMware Admin Cluster. | true | false | gateway is not security sensitive enough | None | None |
| `ips` | The node's network configurations used by the VMware Admin Cluster. Structure is [documented below](#nested_network_config_ha_control_plane_config_control_plane_ip_block_ips). | true | false | ips is not security sensitive enough | None | None |

### auto_resize_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether to enable controle plane node auto resizing. | true | false | auto_resize_config does not require security considerations | None | None |

### vip_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `control_plane_vip` | The VIP which you previously set aside for the Kubernetes API of this VMware Admin Cluster. | true | true | control_plane_vip is a critical network configuration and must be properly secured | 10.251.133.5 | 8.8.8.8 |
| `addons_vip` | The VIP to configure the load balancer for add-ons. | false | false | addons_vip is not security sensitive enough | None | None |

### f5_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `address` | The load balancer's IP address. | false | false | address is not security sensitive enough | None | None |
| `partition` | he preexisting partition to be used by the load balancer. T his partition is usually created for the admin cluster for example: 'my-f5-admin-partition'. | false | false | partition is not security sensitive enough | None | None |
| `snat_pool` | The pool name. Only necessary, if using SNAT. | false | false | snat_pool does not require security considerations | None | None |

### manual_lb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ingress_http_node_port` | NodePort for ingress service's http. The ingress service in the admin cluster is implemented as a Service of type NodePort (ex. 32527). | false | false | ingress_http_node_port is not security sensitive enough | None | None |
| `ingress_https_node_port` | NodePort for ingress service's https. The ingress service in the admin cluster is implemented as a Service of type NodePort (ex. 30139). | false | false | ingress_https_node_port is not security sensitive enough | None | None |
| `control_plane_node_port` | NodePort for control plane service. The Kubernetes API server in the admin cluster is implemented as a Service of type NodePort (ex. 30968). | false | false | control_plane_node_port is not security sensitive enough | None | None |
| `konnectivity_server_node_port` | NodePort for konnectivity server service running as a sidecar in each kube-apiserver pod (ex. 30564). | false | false | konnectivity_server_node_port is not security sensitive enough | None | None |
| `addons_node_port` | NodePort for add-ons server in the admin cluster. | false | false | addons_node_port does not require security considerations | None | None |

### metal_lb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Metal LB is enabled. | false | false | Metal LB does not require security considerations | None | None |

### viewer_users Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | true | viewer_users contains sensitive user information and should be protected | user1@gmail.com | user1@apple.com |
