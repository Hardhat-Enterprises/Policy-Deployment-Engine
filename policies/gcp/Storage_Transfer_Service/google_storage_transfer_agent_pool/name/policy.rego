package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_agent_pool.name

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_agent_pool.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer agent pool uses an unapproved name.",
            "remedies": [
                "Use an approved Storage Transfer agent pool name.",
                "Do not use reserved or unapproved agent pool names such as names starting with goog."
            ]
        },
        {
            "condition": "Storage Transfer agent pool name must be in the approved list.",
            "attribute_path": ["name"],
            "values": ["agent-pool-example"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details