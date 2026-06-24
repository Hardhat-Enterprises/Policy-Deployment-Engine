package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.api_enable_debug

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "Enables JSON-RPC access to functions in the debug namespace.",
            "remedies": [
                "api_enable_debug value defaults to false.",
                "Consult Google Blockchain_Node_Engine documentation for approved api_enable_debug config."
            ]
        },
        {
            "condition": "Check if api_enable_debug is set to false",
            "attribute_path": ["ethereum_details", 0, "api_enable_debug"],
            "values": [false],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
