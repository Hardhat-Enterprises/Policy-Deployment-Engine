package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.allowed_blockchain_type

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "The blockchain_type is not in the allowed list of types.",
            "remedies": [
                "Use a supported location such as 'ETHEREUM'",
                "Consult Google Blockchain_Node_Engine documentation for available blockchain types."
            ]
        },
        {
            "condition": "Check if blockchain_type is not in the allowed whitelist",
            "attribute_path": ["blockchain_type"],
            "values": ["ETHEREUM"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
