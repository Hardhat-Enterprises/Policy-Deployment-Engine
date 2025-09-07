## 🛡️ Policy Deployment Engine: `edgecontainer_node_pool`

This section provides a concise policy evaluation for the `edgecontainer_node_pool` resource in GCP.

Reference: [Terraform Registry – edgecontainer_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_node_pool)

---

## 1. Argument Reference

### `node_location`
- Description: (Required) Name of the Google Distributed Cloud Edge zone where this node pool will be created. For example: `us-central1-edge-customer-a`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_count`
- Description: (Required) The number of nodes in the pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The resource name of the node pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location of the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) The name of the target Distributed Cloud Edge Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_filter`
- Description: (Optional) Only machines matching this filter will be allowed to join the node pool. The filtering language accepts strings like "name=<name>", and is documented in more detail in [AIP-160](https://google.aip.dev/160).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_disk_encryption`
- Description: (Optional) Local disk encryption options. This field is only used when enabling CMEK support. Structure is [documented below](#nested_local_disk_encryption).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_config`
- Description: (Optional) Configuration for each node in the NodePool Structure is [documented below](#nested_node_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_local_disk_encryption"></a>The `local_disk_encryption` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The Cloud KMS CryptoKey e.g. projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey} to use for protecting node local disks. If not specified, a Google-managed key will be used instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_active_version`
- Description: (Output) The Cloud KMS CryptoKeyVersion currently in use for protecting node local disks. Only applicable if kmsKey is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_state`
- Description: (Output) Availability of the Cloud KMS CryptoKey. If not KEY_AVAILABLE, then nodes may go offline as they cannot access their local data. This can be caused by a lack of permissions to use the key, or if the key is disabled or deleted. <a name="nested_node_config"></a>The `node_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) "The Kubernetes node labels"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
