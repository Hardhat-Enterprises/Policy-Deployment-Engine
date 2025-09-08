## 🛡️ Policy Deployment Engine: `tpu_v2_queued_resource`

This section provides a concise policy evaluation for the `tpu_v2_queued_resource` resource in GCP.

Reference: [Terraform Registry – tpu_v2_queued_resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_v2_queued_resource)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The immutable name of the Queued Resource. | true | None | None |
| `zone` | The GCP location for the Queued Resource. If it is not provided, the provider zone is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### tpu Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_spec` | The TPU node(s) being requested. Structure is [documented below](#nested_tpu_node_spec). | false | None | None |

### node_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The parent resource name. | true | None | None |
| `node_id` | Unqualified node identifier used to identify the node in the project once provisioned. | false | None | None |
| `node` | The node. Structure is [documented below](#nested_tpu_node_spec_node_spec_node). | true | None | None |

### node Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `runtime_version` | Runtime version for the TPU. | true | None | None |
| `accelerator_type` | TPU accelerator type for the TPU. If not specified, this defaults to 'v2-8'. | false | None | None |
| `description` | Text description of the TPU. | false | None | None |
| `network_config` | Network configurations for the TPU node. Structure is [documented below](#nested_tpu_node_spec_node_spec_node_network_config). | false | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The name of the network for the TPU node. It must be a preexisting Google Compute Engine network. If none is provided, "default" will be used. | false | None | None |
| `subnetwork` | The name of the subnetwork for the TPU node. It must be a preexisting Google Compute Engine subnetwork. If none is provided, "default" will be used. | false | None | None |
| `enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the specified subnetwork or network should have Private Google Access enabled. | false | None | None |
| `can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. This is required if you plan to use the TPU workers to forward routes. | false | None | None |
| `queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | None | None |
