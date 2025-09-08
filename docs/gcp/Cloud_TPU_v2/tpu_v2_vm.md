## 🛡️ Policy Deployment Engine: `tpu_v2_vm`

This section provides a concise policy evaluation for the `tpu_v2_vm` resource in GCP.

Reference: [Terraform Registry – tpu_v2_vm](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/tpu_v2_vm)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The immutable name of the TPU. | true | None | None |
| `runtime_version` | Runtime version for the TPU. | true | None | None |
| `accelerator_type` | TPU accelerator type for the TPU. `accelerator_type` cannot be used at the same time as `accelerator_config`. If neither is specified, `accelerator_type` defaults to 'v2-8'. | false | None | None |
| `description` | Text description of the TPU. | false | None | None |
| `cidr_block` | The CIDR block that the TPU node will use when selecting an IP address. This CIDR block must be a /29 block; the Compute Engine networks API forbids a smaller block, and using a larger block would be wasteful (a node can only consume one IP address). Errors will occur if the CIDR block has already been used for a currently existing TPU node, the CIDR block conflicts with any subnetworks in the user's provided network, or the provided network is peered with another network that is using that CIDR block. | false | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `metadata` | Custom metadata to apply to the TPU Node. Can set startup-script and shutdown-script. | false | None | None |
| `tags` | Tags to apply to the TPU Node. Tags are used to identify valid sources or targets for network firewalls. | false | None | None |
| `zone` | The GCP location for the TPU. If it is not provided, the provider zone is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### network_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The name of the network for the TPU node. It must be a preexisting Google Compute Engine network. If none is provided, "default" will be used. | false | None | None |
| `subnetwork` | The name of the subnetwork for the TPU node. It must be a preexisting Google Compute Engine subnetwork. If none is provided, "default" will be used. | false | None | None |
| `enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the specified subnetwork or network should have Private Google Access enabled. | false | None | None |
| `can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. This is required if you plan to use the TPU workers to forward routes. | false | None | None |
| `queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | None | None |

### network_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The name of the network for the TPU node. It must be a preexisting Google Compute Engine network. If none is provided, "default" will be used. | false | None | None |
| `subnetwork` | The name of the subnetwork for the TPU node. It must be a preexisting Google Compute Engine subnetwork. If none is provided, "default" will be used. | false | None | None |
| `enable_external_ips` | Indicates that external IP addresses would be associated with the TPU workers. If set to false, the specified subnetwork or network should have Private Google Access enabled. | false | None | None |
| `can_ip_forward` | Allows the TPU node to send and receive packets with non-matching destination or source IPs. This is required if you plan to use the TPU workers to forward routes. | false | None | None |
| `queue_count` | Specifies networking queue count for TPU VM instance's network interface. | false | None | None |

### service_account Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | Email address of the service account. If empty, default Compute service account will be used. | false | None | None |
| `scope` | The list of scopes to be made available for this service account. If empty, access to all Cloud APIs will be allowed. | false | None | None |

### scheduling_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `preemptible` | Defines whether the node is preemptible. | false | None | None |
| `reserved` | Whether the node is created under a reservation. | false | None | None |
| `spot` | Optional. Defines whether the node is Spot VM. | false | None | None |

### data_disks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_disk` | Specifies the full path to an existing disk. For example: "projects/my-project/zones/us-central1-c/disks/my-disk". | true | None | None |
| `mode` | The mode in which to attach this disk. If not specified, the default is READ_WRITE mode. Only applicable to dataDisks. Default value is `READ_WRITE`. Possible values are: `READ_WRITE`, `READ_ONLY`. | false | None | None |

### shielded_instance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_secure_boot` | Defines whether the instance has Secure Boot enabled. | true | None | None |

### accelerator_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Type of TPU. Please select one of the allowed types: https://cloud.google.com/tpu/docs/reference/rest/v2/AcceleratorConfig#Type | true | None | None |
| `topology` | Topology of TPU in chips. | true | None | None |
