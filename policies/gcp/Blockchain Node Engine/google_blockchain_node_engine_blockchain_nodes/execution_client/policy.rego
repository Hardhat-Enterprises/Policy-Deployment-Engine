package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.execution_client

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "The execution client is not allowed in the list of available clients.",
            "remedies": [
                "Use a supported execution client such as 'GETH', 'ERIGON' or 'EXECUTION_CLIENT_UNSPECIFIED'",
                "Consult Google Blockchain_Node_Engine documentation for execution client types."
            ]
        },
        {
            "condition": "Check if execution client is in the allowed whitelist",
            "attribute_path": ["ethereum_details", 0, "execution_client"],
            "values": ["GETH", "EXECUTION_CLIENT_UNSPECIFIED", "ERIGON"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
