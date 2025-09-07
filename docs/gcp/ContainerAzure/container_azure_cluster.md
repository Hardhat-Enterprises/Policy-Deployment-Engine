## 🛡️ Policy Deployment Engine: `container_azure_cluster`

This section provides a concise policy evaluation for the `container_azure_cluster` resource in GCP.

Reference: [Terraform Registry – container_azure_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_azure_cluster)

---

## 1. Argument Reference

### `authorization`
- Description: (Required) Configuration related to the cluster RBAC settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `azure_region`
- Description: (Required) The Azure region where the cluster runs. Each Google Cloud region supports a subset of nearby Azure regions. You can call to list all supported Azure regions within a given Google Cloud region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `control_plane`
- Description: (Required) Configuration related to the cluster control plane.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fleet`
- Description: (Required) Fleet configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networking`
- Description: (Required) Cluster-wide networking configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_group_id`
- Description: (Required) The ARM ID of the resource group where the cluster resources are deployed. For example: `/subscriptions/*/resourceGroups/*`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `authorization` Block

### `admin_groups`
- Description: (Optional) Groups of users that can perform operations as a cluster admin. A managed ClusterRoleBinding will be created to grant the `cluster-admin` ClusterRole to the groups. Up to ten admin groups can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `admin_users`
- Description: (Required) Users that can perform operations as a cluster admin. A new ClusterRoleBinding will be created to grant the cluster-admin ClusterRole to the users. Up to ten admin users can be provided. For more info on RBAC, see https://kubernetes.io/docs/reference/access-authn-authz/rbac/#user-facing-roles
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `control_plane` Block

### `database_encryption`
- Description: (Optional) Optional. Configuration related to application-layer secrets encryption.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `main_volume`
- Description: (Optional) Optional. Configuration related to the main volume provisioned for each control plane replica. The main volume is in charge of storing all of the cluster's etcd state. When unspecified, it defaults to a 8-GiB Azure Disk.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_config`
- Description: (Optional) Proxy configuration for outbound HTTP(S) traffic.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_placements`
- Description: (Optional) Configuration for where to place the control plane replicas. Up to three replica placement instances can be specified. If replica_placements is set, the replica placement instances will be applied to the three control plane replicas as evenly as possible.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `root_volume`
- Description: (Optional) Optional. Configuration related to the root volume provisioned for each control plane replica. When unspecified, it defaults to 32-GiB Azure Disk.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_config`
- Description: (Required) SSH configuration for how to access the underlying control plane machines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet_id`
- Description: (Required) The ARM ID of the subnet where the control plane VMs are deployed. Example: `/subscriptions//resourceGroups//providers/Microsoft.Network/virtualNetworks//subnets/default`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Optional. A set of tags to apply to all underlying control plane Azure resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Required) The Kubernetes version to run on control plane replicas (e.g. `1.19.10-gke.1000`). You can list all supported versions on a given Google Cloud region by calling GetAzureServerConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_size`
- Description: (Optional) Optional. The Azure VM size name. Example: `Standard_DS2_v2`. For available VM sizes, see https://docs.microsoft.com/en-us/azure/virtual-machines/vm-naming-conventions. When unspecified, it defaults to `Standard_DS2_v2`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `fleet` Block

### `membership`
- Description: The name of the managed Hub Membership resource associated to this cluster. Membership names are formatted as projects/<project-number>/locations/global/membership/<cluster-id>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The number of the Fleet host project where this cluster will be registered.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `networking` Block

### `pod_address_cidr_blocks`
- Description: (Required) The IP address range of the pods in this cluster, in CIDR notation (e.g. `10.96.0.0/14`). All pods in the cluster get assigned a unique RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_address_cidr_blocks`
- Description: (Required) The IP address range for services in this cluster, in CIDR notation (e.g. `10.96.0.0/14`). All services in the cluster get assigned a unique RFC1918 IPv4 address from these ranges. Only a single range is supported. This field cannot be changed after creating a cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_network_id`
- Description: (Required) The Azure Resource Manager (ARM) ID of the VNet associated with your cluster. All components in the cluster (i.e. control plane and node pools) run on a single VNet. Example: `/subscriptions/*/resourceGroups/*/providers/Microsoft.Network/virtualNetworks/*` This field cannot be changed after creation. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. Annotations on the cluster. This field has the same restrictions as Kubernetes annotations. The total size of all keys and values combined is limited to 256k. Keys can have 2 segments: prefix (optional) and name (required), separated by a slash (/). Prefix must be a DNS subdomain. Name must be 63 characters or less, begin and end with alphanumerics, with dashes (-), underscores (_), dots (.), and alphanumerics between. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `azure_services_authentication`
- Description: (Optional) Azure authentication configuration for management of Azure resources
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client`
- Description: (Optional) Name of the AzureClient. The `AzureClient` resource must reside on the same GCP project and region as the `AzureCluster`. `AzureClient` names are formatted as `projects/<project-number>/locations/<region>/azureClients/<client-id>`. See Resource Names (https:cloud.google.com/apis/design/resource_names) for more details on Google Cloud resource names.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. A human readable description of this cluster. Cannot be longer than 255 UTF-8 encoded bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_config`
- Description: (Optional) (Beta only) Logging configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `admin_groups` Block

### `group`
- Description: (Required) The name of the group, e.g. `my-group@domain.com`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `admin_users` Block

### `username`
- Description: (Required) The name of the user, e.g. `my-gcp-id@gmail.com`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `azure_services_authentication` Block

### `application_id`
- Description: (Required) The Azure Active Directory Application ID for Authentication configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tenant_id`
- Description: (Required) The Azure Active Directory Tenant ID for Authentication configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `database_encryption` Block

### `key_id`
- Description: (Required) The ARM ID of the Azure Key Vault key to encrypt / decrypt data. For example: `/subscriptions/<subscription-id>/resourceGroups/<resource-group-id>/providers/Microsoft.KeyVault/vaults/<key-vault-id>/keys/<key-name>` Encryption will always take the latest version of the key and hence specific version is not supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `main_volume` Block

### `size_gib`
- Description: (Optional) Optional. The size of the disk, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `proxy_config` Block

### `resource_group_id`
- Description: (Required) The ARM ID the of the resource group containing proxy keyvault. Resource group ids are formatted as `/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_id`
- Description: (Required) The URL the of the proxy setting secret with its version. Secret ids are formatted as `https:<key-vault-name>.vault.azure.net/secrets/<secret-name>/<secret-version>`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `replica_placements` Block

### `azure_availability_zone`
- Description: (Required) For a given replica, the Azure availability zone where to provision the control plane VM and the ETCD disk.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet_id`
- Description: (Required) For a given replica, the ARM ID of the subnet where the control plane VM is deployed. Make sure it's a subnet under the virtual network in the cluster configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `root_volume` Block

### `size_gib`
- Description: (Optional) Optional. The size of the disk, in GiBs. When unspecified, a default value is provided. See the specific reference in the parent resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `ssh_config` Block

### `authorized_key`
- Description: (Required) The SSH public key data for VMs managed by Anthos. This accepts the authorized_keys file format used in OpenSSH according to the sshd(8) manual page.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `logging_config` Block

### `component_config`
- Description: (Optional) Configuration of the logging components.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `component_config` Block

### `enable_components`
- Description: (Optional) Components of the logging configuration to be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
