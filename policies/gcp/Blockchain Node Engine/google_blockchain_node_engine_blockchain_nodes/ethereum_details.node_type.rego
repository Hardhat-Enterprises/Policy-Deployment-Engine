package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.ethereum_details_node_type

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "The type of Ethereum node allowed.",
            "remedies": [
                "Use a supported node type such as 'FULL', 'ARCHIVE' and 'LIGHT'",
                "Consult Google Blockchain_Node_Engine documentation for supported node types."
            ]
        },
        {
            "condition": "Check if node type is in the allowed whitelist",
            "attribute_path": ["ethereum_details", 0, "node_type"],
            "values": ["FULL", "LIGHT", "ARCHIVE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
