## 🛡️ Policy Deployment Engine: `blockchain_node_engine_blockchain_nodes`

This section provides a concise policy evaluation for the `blockchain_node_engine_blockchain_nodes` resource in GCP.

Reference: [Terraform Registry – blockchain_node_engine_blockchain_nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/blockchain_node_engine_blockchain_nodes)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Location of Blockchain Node being created. | true | false | Restricting to allowed locations ensures compliance, so use a supported location such as 'us-central1'. | None | None |
| `blockchain_node_id` | ID of the requesting object. | false | false | None | None | None |
| `labels` | User-provided key-value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `ethereum_details` | User-provided key-value pairs Structure is [documented below](#nested_ethereum_details). | false | false | None | None | None |
| `blockchain_type` | User-provided key-value pairs Possible values are: `ETHEREUM`. | true | false | Specifying the blockchain type is essential for ensuring that the node is configured correctly for the intended blockchain network. For example, if the node is meant to connect to the Ethereum network, setting the blockchain type to `ETHEREUM` ensures that the appropriate configurations and settings are applied for compatibility and optimal performance. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `validator_config` | Configuration for validator-related parameters on the beacon client, and for any managed validator client | false | false | None | None | None |
| `geth_details` | This refers to the specific configuration settings for a Geth (Go-Ethereum) execution client. Geth is a widely used Ethereum client that provides various features and functionalities for interacting with the Ethereum network. The details for Geth would include settings such as garbage collection mode, API endpoints, and other configurations that are necessary for the proper functioning of the Geth client within the blockchain node setup. | false | false | None | None | None |

### ethereum_details Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `validator_config` | Configuration for validator-related parameters on the beacon client, and for any managed validator client. Structure is [documented below](#nested_ethereum_details_validator_config). | false | false | None | None | None |
| `geth_details` | User-provided key-value pairs Structure is [documented below](#nested_ethereum_details_geth_details). | false | false | None | None | None |
| `additional_endpoints` | (Output) User-provided key-value pairs Structure is [documented below](#nested_ethereum_details_additional_endpoints). | false | false | None | None | None |
| `network` | The Ethereum environment being accessed. Possible values are: `MAINNET`, `TESTNET_GOERLI_PRATER`, `TESTNET_SEPOLIA`. | true | false | Specifying the Ethereum network ensures that the node is configured to connect to the correct environment, which is essential for its intended use and compliance with network-specific requirements. | None | None |
| `node_type` | The type of Ethereum node. Possible values are: `LIGHT`, `FULL`, `ARCHIVE`. | true | false | Choosing the appropriate node type is crucial for performance and resource management. For example, a LIGHT node requires fewer resources than a FULL or ARCHIVE node, which may be necessary for certain use cases or to comply with organizational policies on resource usage. | None | None |
| `execution_client` | The execution client Possible values are: `EXECUTION_CLIENT_UNSPECIFIED`, `GETH`, `ERIGON`. | true | false | Selecting the execution client is essential for ensuring compatibility with the Ethereum network and for meeting specific requirements related to performance, features, or security. For instance, Geth is a widely used execution client that offers robust performance and a rich set of features, making it a common choice for many users. | None | None |
| `consensus_client` | The consensus client Possible values are: `CONSENSUS_CLIENT_UNSPECIFIED`, `LIGHTHOUSE`. | true | false | Selecting the consensus client is crucial for ensuring that the beacon client can effectively participate in the Ethereum consensus mechanism. For example, Lighthouse is a popular consensus client that is known for its performance and reliability, making it a suitable choice for many users. | None | None |
| `api_enable_admin` | Enables JSON-RPC access to functions in the admin namespace. Defaults to false. | true | false | Enabling the admin API can pose security risks if not properly secured, as it provides access to sensitive functions. Therefore, it is important to carefully consider whether to enable this API based on the specific use case and security requirements. | None | None |
| `api_enable_debug` | Enables JSON-RPC access to functions in the debug namespace. Defaults to false. | true | false | Enabling the debug API can pose security risks if not properly secured, as it provides access to sensitive functions. Therefore, it is important to carefully consider whether to enable this API based on the specific use case and security requirements. | None | None |

### validator_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mev_relay_urls` | URLs for MEV-relay services to use for block building. When set, a managed MEV-boost service is configured on the beacon client. | true | false | Configuring MEV relay URLs is important for validators that want to participate in MEV (Miner Extractable Value) opportunities, which can enhance the profitability of their validation activities. By connecting to MEV relays, validators can access a wider range of block-building opportunities and potentially increase their rewards. | None | None |

### geth_details Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `garbage_collection_mode` | Blockchain garbage collection modes. Only applicable when NodeType is FULL or ARCHIVE. Possible values are: `FULL`, `ARCHIVE`. The `additional_endpoints` block contains: | true | false | Selecting the appropriate garbage collection mode is important for managing disk space and performance of the Geth execution client. For example, a FULL node with aggressive garbage collection may use less disk space but could have slower response times for certain queries, while an ARCHIVE node retains all historical data but requires significantly more disk space. | None | None |
| `beacon_api_endpoint` | (Output) The assigned URL for the node's Beacon API endpoint. | false | false | None | None | None |
| `beacon_prometheus_metrics_api_endpoint` | (Output) The assigned URL for the node's Beacon Prometheus metrics endpoint. | false | false | None | None | None |
| `execution_client_prometheus_metrics_api_endpoint` | (Output) The assigned URL for the node's execution client's Prometheus metrics endpoint. | false | false | None | None | None |
