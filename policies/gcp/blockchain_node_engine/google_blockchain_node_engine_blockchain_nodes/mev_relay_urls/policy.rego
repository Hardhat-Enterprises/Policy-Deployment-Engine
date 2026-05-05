package terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.mev_relay_urls

import data.terraform.helpers
import data.terraform.gcp.security.blockchain_node_engine.google_blockchain_node_engine_blockchain_nodes.vars

conditions := [
    [
        {
            "situation_description": "URLs for MEV-relay services to use for block building.",
            "remedies": [
                "Use only the valid mev relay urls like: [\"https://mev1.example.org/\",\"https://mev2.example.org/\"]",
                "Consult Google Blockchain_Node_Engine documentation."
            ]
        },
        {
            "condition": "Check if mev_relay_urls contains valid URLs",
            "attribute_path": ["ethereum_details", 0, "validator_config", 0, "mev_relay_urls"],
            "values": ["https://mev1.example.org/","https://mev2.example.org/"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
