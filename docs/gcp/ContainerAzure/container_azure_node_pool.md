## 🛡️ Policy Deployment Engine: `container_azure_node_pool`

This section provides a concise policy evaluation for the `container_azure_node_pool` resource in GCP.

Reference: [Terraform Registry – container_azure_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_azure_node_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cluster` | The azureCluster for the resource | true | None | None |
| `location` | The location for the resource | true | None | None |
| `name` | The name of this resource. | true | None | None |
| `subnet_id` | The ARM ID of the subnet where the node pool VMs run. Make sure it's a subnet under the virtual network in the cluster configuration. | true | None | None |
| `version` | The Kubernetes version (e.g. `1.19.10-gke.1000`) running on this node pool. | true | None | None |

### autoscaling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_node_count` | Maximum number of nodes in the node pool. Must be >= min_node_count. | true | None | None |
| `min_node_count` | Minimum number of nodes in the node pool. Must be >= 1 and <= max_node_count. | true | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `image_type` | (Beta only) The OS image type to use on node pool instances. | false | None | None |
| `labels` | Optional. The initial labels assigned to nodes of this node pool. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |
| `proxy_config` | Proxy configuration for outbound HTTP(S) traffic. | false | None | None |
| `root_volume` | Optional. Configuration related to the root volume provisioned for each node pool machine. When unspecified, it defaults to a 32-GiB Azure Disk. | false | None | None |
| `ssh_config` | SSH configuration for how to access the node pool machines. | true | None | None |
| `tags` | Optional. A set of tags to apply to all underlying Azure resources for this node pool. This currently only includes Virtual Machine Scale Sets. Specify at most 50 pairs containing alphanumerics, spaces, and symbols (.+-=_:@/). Keys can be up to 127 Unicode characters. Values can be up to 255 Unicode characters. | false | None | None |
| `vm_size` | Optional. The Azure VM size name. Example: `Standard_DS2_v2`. See (/anthos/clusters/docs/azure/reference/supported-vms) for options. When unspecified, it defaults to `Standard_DS2_v2`. | false | None | None |

### max_pods_constraint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_pods_per_node` | The maximum number of pods to schedule on a single node. - - - | true | None | None |
| `annotations` | Optional. Annotations on the node pool. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Keys can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `azure_availability_zone` | Optional. The Azure availability zone of the nodes in this nodepool. When unspecified, it defaults to `1`. | false | None | None |
| `management` | The Management configuration for this node pool. | false | None | None |
| `project` | The project for the resource | false | None | None |

### proxy_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_group_id` | The ARM ID the of the resource group containing proxy keyvault. Resource group ids are formatted as `/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>` | true | None | None |
| `secret_id` | The URL the of the proxy setting secret with its version. Secret ids are formatted as `https:<key-vault-name>.vault.azure.net/secrets/<secret-name>/<secret-version>`. | true | None | None |

### root_volume Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `size_gib` | Optional. The size of the disk, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource. | false | None | None |

### ssh_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authorized_key` | The SSH public key data for VMs managed by Anthos. This accepts the authorized_keys file format used in OpenSSH according to the sshd(8) manual page. | true | None | None |

### management Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_repair` | Optional. Whether or not the nodes will be automatically repaired. | false | None | None |
