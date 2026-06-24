package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.location

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "The location is not in the allowed list of regions.",
            "remedies": [
                "Use a supported location such as 'australia-southeast1', 'us-central1'",
                "Consult Google Blockchain_Node_Engine documentation for available locations."
            ]
        },
        {
            "condition": "Check if location is not in the allowed whitelist",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
