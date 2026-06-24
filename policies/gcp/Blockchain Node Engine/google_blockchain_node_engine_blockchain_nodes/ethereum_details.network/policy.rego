package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.ethereum_details_network

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "The Ethereum environment being accessed.",
            "remedies": [
                "Use a supported environment such as 'MAINNET', 'TESTNET_GOERLI_PRATER' or 'TESTNET_SEPOLIA'",
                "Consult Google Blockchain_Node_Engine documentation for possible Etheruem environment."
            ]
        },
        {
            "condition": "Check if ethereum network is in the allowed whitelist",
            "attribute_path": ["ethereum_details", 0, "network"],
            "values": ["MAINNET", "TESTNET_GOERLI_PRATER", "TESTNET_SEPOLIA"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
