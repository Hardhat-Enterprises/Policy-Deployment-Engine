## 🛡️ Policy Deployment Engine: `blockchain_node_engine_blockchain_nodes`

This section provides a concise policy evaluation for the `blockchain_node_engine_blockchain_nodes` resource in GCP.

Reference: [Terraform Registry – blockchain_node_engine_blockchain_nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/blockchain_node_engine_blockchain_nodes)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | Location of Blockchain Node being created. | true | None | None |
| `blockchain_node_id` | ID of the requesting object. | true | None | None |
| `labels` | User-provided key-value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `blockchain_type` | User-provided key-value pairs Possible values are: `ETHEREUM`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### ethereum_details Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `validator_config` | Configuration for validator-related parameters on the beacon client, and for any managed validator client. Structure is [documented below](#nested_ethereum_details_validator_config). | false | None | None |
| `geth_details` | User-provided key-value pairs Structure is [documented below](#nested_ethereum_details_geth_details). | false | None | None |
| `additional_endpoints` | (Output) User-provided key-value pairs Structure is [documented below](#nested_ethereum_details_additional_endpoints). | none | None | None |
| `network` | The Ethereum environment being accessed. Possible values are: `MAINNET`, `TESTNET_GOERLI_PRATER`, `TESTNET_SEPOLIA`. | false | None | None |
| `node_type` | The type of Ethereum node. Possible values are: `LIGHT`, `FULL`, `ARCHIVE`. | false | None | None |
| `execution_client` | The execution client Possible values are: `EXECUTION_CLIENT_UNSPECIFIED`, `GETH`, `ERIGON`. | false | None | None |
| `consensus_client` | The consensus client Possible values are: `CONSENSUS_CLIENT_UNSPECIFIED`, `LIGHTHOUSE`. | false | None | None |
| `api_enable_admin` | Enables JSON-RPC access to functions in the admin namespace. Defaults to false. | false | None | None |
| `api_enable_debug` | Enables JSON-RPC access to functions in the debug namespace. Defaults to false. | false | None | None |

### validator_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `mev_relay_urls` | URLs for MEV-relay services to use for block building. When set, a managed MEV-boost service is configured on the beacon client. | false | None | None |

### geth_details Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `garbage_collection_mode` | Blockchain garbage collection modes. Only applicable when NodeType is FULL or ARCHIVE. Possible values are: `FULL`, `ARCHIVE`. The `additional_endpoints` block contains: | false | None | None |
| `beacon_api_endpoint` | (Output) The assigned URL for the node's Beacon API endpoint. | none | None | None |
| `beacon_prometheus_metrics_api_endpoint` | (Output) The assigned URL for the node's Beacon Prometheus metrics endpoint. | none | None | None |
| `execution_client_prometheus_metrics_api_endpoint` | (Output) The assigned URL for the node's execution client's Prometheus metrics endpoint. | none | None | None |
