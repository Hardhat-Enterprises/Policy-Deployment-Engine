package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.ethereum_details_consensus_client

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "The consensus client is not allowed in the list of available clients.",
            "remedies": [
                "Use a supported consensus client such as 'LIGHTHOUSE' or 'CONSENSUS_CLIENT_UNSPECIFIED'",
                "Consult Google Blockchain_Node_Engine documentation for consensus client types."
            ]
        },
        {
            "condition": "Check if consensus client is in the allowed whitelist",
            "attribute_path": ["ethereum_details", 0, "consensus_client"],
            "values": ["LIGHTHOUSE", "CONSENSUS_CLIENT_UNSPECIFIED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
