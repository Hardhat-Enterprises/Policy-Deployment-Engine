## 🛡️ Policy Deployment Engine: `network_connectivity_spoke`

This section provides a concise policy evaluation for the `network_connectivity_spoke` resource in GCP.

Reference: [Terraform Registry – network_connectivity_spoke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_spoke)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Immutable. The name of the spoke. Spoke names must be unique. | true | None | None |
| `hub` | Immutable. The URI of the hub that this spoke is attached to. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `labels` | Optional labels in key:value format. For more information about labels, see [Requirements for labels](https://cloud.google.com/resource-manager/docs/creating-managing-labels#requirements). **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | An optional description of the spoke. | false | None | None |
| `group` | The name of the group that this spoke is associated with. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### linked_vpn_tunnels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uris` | The URIs of linked VPN tunnel resources. | true | None | None |
| `site_to_site_data_transfer` | A value that controls whether site-to-site data transfer is enabled for these resources. Note that data transfer is available only in supported locations. | true | None | None |
| `include_import_ranges` | IP ranges allowed to be included during import from hub (does not control transit connectivity). The only allowed value for now is "ALL_IPV4_RANGES". | false | None | None |

### linked_interconnect_attachments Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uris` | The URIs of linked interconnect attachment resources | true | None | None |
| `site_to_site_data_transfer` | A value that controls whether site-to-site data transfer is enabled for these resources. Note that data transfer is available only in supported locations. | true | None | None |
| `include_import_ranges` | IP ranges allowed to be included during import from hub (does not control transit connectivity). The only allowed value for now is "ALL_IPV4_RANGES". | false | None | None |

### linked_router_appliance_instances Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instances` | The list of router appliance instances Structure is [documented below](#nested_linked_router_appliance_instances_instances). | true | None | None |
| `site_to_site_data_transfer` | A value that controls whether site-to-site data transfer is enabled for these resources. Note that data transfer is available only in supported locations. | true | None | None |
| `include_import_ranges` | IP ranges allowed to be included during import from hub (does not control transit connectivity). The only allowed value for now is "ALL_IPV4_RANGES". | false | None | None |

### linked_vpc_network Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The URI of the VPC network resource. | true | None | None |
| `exclude_export_ranges` | IP ranges encompassing the subnets to be excluded from peering. | false | None | None |
| `include_export_ranges` | IP ranges allowed to be included from peering. | false | None | None |

### linked_producer_vpc_network Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The URI of the Service Consumer VPC that the Producer VPC is peered with. | true | None | None |
| `peering` | The name of the VPC peering between the Service Consumer VPC and the Producer VPC (defined in the Tenant project) which is added to the NCC hub. This peering must be in ACTIVE state. | true | None | None |
| `producer_network` | (Output) The URI of the Producer VPC. | none | None | None |
| `include_export_ranges` | IP ranges allowed to be included from peering. | false | None | None |
| `exclude_export_ranges` | IP ranges encompassing the subnets to be excluded from peering. | false | None | None |

### instances Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `virtual_machine` | The URI of the virtual machine resource | true | None | None |
| `ip_address` | The IP address on the VM to use for peering. | true | None | None |
