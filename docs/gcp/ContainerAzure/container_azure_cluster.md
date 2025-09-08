## 🛡️ Policy Deployment Engine: `container_azure_cluster`

This section provides a concise policy evaluation for the `container_azure_cluster` resource in GCP.

Reference: [Terraform Registry – container_azure_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_azure_cluster)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `azure_region` | The Azure region where the cluster runs. Each Google Cloud region supports a subset of nearby Azure regions. You can call to list all supported Azure regions within a given Google Cloud region. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `name` | The name of this resource. | true | None | None |
| `resource_group_id` | The ARM ID of the resource group where the cluster resources are deployed. For example: `/subscriptions/*/resourceGroups/*` | true | None | None |

### authorization Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `admin_groups` | Groups of users that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the groups. Up to ten admin groups can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | false | None | None |
| `admin_users` | Users that can perform operations as a cluster admin. A new ClusterRoleBinding will be created to grant the cluster-admin ClusterRole to the users. Up to ten admin users can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles | true | None | None |

### control_plane Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `database_encryption` | Optional. Configuration related to application-layer secrets encryption. | false | None | None |
| `main_volume` | Optional. Configuration related to the main volume provisioned for each control plane replica. The main volume is in charge of storing all of the cluster's etcd state. When unspecified, it defaults to a 8-GiB Azure Disk. | false | None | None |
| `proxy_config` | Proxy configuration for outbound HTTP(S) traffic. | false | None | None |
| `replica_placements` | Configuration for where to place the control plane replicas. Up to three replica placement instances can be specified. If replica_placements is set, the replica placement instances will be applied to the three control plane replicas as evenly as possible. | false | None | None |
| `root_volume` | Optional. Configuration related to the root volume provisioned for each control plane replica. When unspecified, it defaults to 32-GiB Azure Disk. | false | None | None |
| `ssh_config` | SSH configuration for how to access the underlying control plane machines. | true | None | None |
| `subnet_id` | The ARM ID of the subnet where the control plane VMs are deployed. Example: `/subscriptions//resourceGroups//providers/Microsoft.Network/virtualNetworks//subnets/default`. | true | None | None |
| `tags` | Optional. A set of tags to apply to all underlying control plane Azure resources. | false | None | None |
| `version` | The Kubernetes version to run on control plane replicas (e.g. `1.19.10-gke.1000`). You can list all supported versions on a given Google Cloud region by calling GetAzureServerConfig. | true | None | None |
| `vm_size` | Optional. The Azure VM size name. Example: `Standard_DS2_v2`. For available VM sizes, see https://docs.microsoft.com/en-us/azure/virtual-machines/vm-naming-conventions. When unspecified, it defaults to `Standard_DS2_v2`. | false | None | None |

### fleet Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `membership` | The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as projects/<project-number>/locations/global/membership/<cluster-id>. | none | None | None |
| `project` | The number of the Fleet host project where this cluster will be registered. | false | None | None |

### networking Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pod_address_cidr_blocks` | The IP address range of the pods in this cluster, in CIDR notation (e.g. `10.96.0.0/14`). All pods in the cluster get assigned a unique RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation. | true | None | None |
| `service_address_cidr_blocks` | The IP address range for services in this cluster, in CIDR notation (e.g. `10.96.0.0/14`). All services in the cluster get assigned a unique RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creating a cluster. | true | None | None |
| `virtual_network_id` | The Azure Resource Manager (ARM) ID of the VNet associated with your cluster. All components in the cluster (i.e. control plane and node pools) run on a single VNet. Example: `/subscriptions/*/resourceGroups/*/providers/Microsoft.Network/virtualNetworks/*` This field cannot be changed after creation. - - - | true | None | None |
| `annotations` | Optional. Annotations on the cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Keys can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `azure_services_authentication` | Azure authentication configuration for management of Azure resources | false | None | None |
| `client` | Name of the AzureClient. The `AzureClient` resource must reside on the same GCP project and region as the `AzureCluster`. `AzureClient` names are formatted as `projects/<project-number>/locations/<region>/azureClients/<client-id>`. See Resource Names (https:cloud.google.com/apis/design/resource_names) for more details on Google Cloud resource names. | false | None | None |
| `description` | Optional. A human readable description of this cluster. Cannot be longer than 255 UTF-8 encoded bytes. | false | None | None |
| `logging_config` | (Beta only) Logging configuration. | false | None | None |
| `project` | The project for the resource | false | None | None |

### admin_groups Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `group` | The name of the group, e.g. `my-group@domain.com`. | true | None | None |

### admin_users Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The name of the user, e.g. `my-gcp-id@gmail.com`. | true | None | None |

### azure_services_authentication Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `application_id` | The Azure Active Directory Application ID for Authentication configuration. | true | None | None |
| `tenant_id` | The Azure Active Directory Tenant ID for Authentication configuration. | true | None | None |

### database_encryption Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key_id` | The ARM ID of the Azure Key Vault key to encrypt / decrypt data. For example: `/subscriptions/<subscription-id>/resourceGroups/<resource-group-id>/providers/Microsoft.KeyVault/vaults/<key-vault-id>/keys/<key-name>` Encryption will always take the latest version of the key and hence specific version is not supported. | true | None | None |

### main_volume Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `size_gib` | Optional. The size of the disk, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource. | false | None | None |

### proxy_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_group_id` | The ARM ID the of the resource group containing proxy keyvault. Resource group ids are formatted as `/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>` | true | None | None |
| `secret_id` | The URL the of the proxy setting secret with its version. Secret ids are formatted as `https:<key-vault-name>.vault.azure.net/secrets/<secret-name>/<secret-version>`. | true | None | None |

### replica_placements Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `azure_availability_zone` | For a given replica, the Azure availability zone where to provision the control plane VM and the ETCD disk. | true | None | None |
| `subnet_id` | For a given replica, the ARM ID of the subnet where the control plane VM is deployed. Make sure it's a subnet under the virtual network in the cluster configuration. | true | None | None |

### root_volume Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `size_gib` | Optional. The size of the disk, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource. | false | None | None |

### ssh_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authorized_key` | The SSH public key data for VMs managed by Anthos. This accepts the authorized_keys file format used in OpenSSH according to the sshd(8) manual page. | true | None | None |

### logging_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `component_config` | Configuration of the logging components. | false | None | None |

### component_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_components` | Components of the logging configuration to be enabled. | false | None | None |
