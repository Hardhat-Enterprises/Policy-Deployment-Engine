package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.garbage_collection_mode

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "Blockchain garbage collection modes.",
            "remedies": [
                "Only applicable when NodeType is FULL or ARCHIVE.",
                "Consult Google Blockchain_Node_Engine documentation for right garbage collection modes."
            ]
        },
        {
            "condition": "Check if node type is in the allowed whitelist",
            "attribute_path": ["ethereum_details", 0, "geth_details", 0, "garbage_collection_mode"],
            "values": ["FULL", "ARCHIVE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
