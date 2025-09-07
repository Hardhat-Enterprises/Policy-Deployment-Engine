## 🛡️ Policy Deployment Engine: `blockchain_node_engine_blockchain_nodes`

This section provides a concise policy evaluation for the `blockchain_node_engine_blockchain_nodes` resource in GCP.

Reference: [Terraform Registry – blockchain_node_engine_blockchain_nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/blockchain_node_engine_blockchain_nodes)

---

## 1. Argument Reference

### `location`
- Description: (Required) Location of Blockchain Node being created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `blockchain_node_id`
- Description: (Required) ID of the requesting object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-provided key-value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ethereum_details`
- Description: (Optional) User-provided key-value pairs Structure is [documented below](#nested_ethereum_details).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `blockchain_type`
- Description: (Optional) User-provided key-value pairs Possible values are: `ETHEREUM`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_ethereum_details"></a>The `ethereum_details` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `validator_config`
- Description: (Optional) Configuration for validator-related parameters on the beacon client, and for any managed validator client. Structure is [documented below](#nested_ethereum_details_validator_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `geth_details`
- Description: (Optional) User-provided key-value pairs Structure is [documented below](#nested_ethereum_details_geth_details).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_endpoints`
- Description: (Output) User-provided key-value pairs Structure is [documented below](#nested_ethereum_details_additional_endpoints).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The Ethereum environment being accessed. Possible values are: `MAINNET`, `TESTNET_GOERLI_PRATER`, `TESTNET_SEPOLIA`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type`
- Description: (Optional) The type of Ethereum node. Possible values are: `LIGHT`, `FULL`, `ARCHIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_client`
- Description: (Optional) The execution client Possible values are: `EXECUTION_CLIENT_UNSPECIFIED`, `GETH`, `ERIGON`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `consensus_client`
- Description: (Optional) The consensus client Possible values are: `CONSENSUS_CLIENT_UNSPECIFIED`, `LIGHTHOUSE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_enable_admin`
- Description: (Optional) Enables JSON-RPC access to functions in the admin namespace. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_enable_debug`
- Description: (Optional) Enables JSON-RPC access to functions in the debug namespace. Defaults to false. <a name="nested_ethereum_details_validator_config"></a>The `validator_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mev_relay_urls`
- Description: (Optional) URLs for MEV-relay services to use for block building. When set, a managed MEV-boost service is configured on the beacon client. <a name="nested_ethereum_details_geth_details"></a>The `geth_details` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `garbage_collection_mode`
- Description: (Optional) Blockchain garbage collection modes. Only applicable when NodeType is FULL or ARCHIVE. Possible values are: `FULL`, `ARCHIVE`. <a name="nested_ethereum_details_additional_endpoints"></a>The `additional_endpoints` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `beacon_api_endpoint`
- Description: (Output) The assigned URL for the node's Beacon API endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `beacon_prometheus_metrics_api_endpoint`
- Description: (Output) The assigned URL for the node's Beacon Prometheus metrics endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `execution_client_prometheus_metrics_api_endpoint`
- Description: (Output) The assigned URL for the node's execution client's Prometheus metrics endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
