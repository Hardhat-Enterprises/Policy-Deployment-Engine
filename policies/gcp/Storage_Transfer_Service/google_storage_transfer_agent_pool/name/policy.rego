package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_agent_pool.name

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_agent_pool.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer agent pool uses a disallowed name.",
            "remedies": [
                "Use an approved Storage Transfer agent pool name.",
                "Do not use disallowed agent pool identifiers."
            ]
        },
        {
            "condition": "Storage Transfer agent pool name must not use disallowed values.",
            "attribute_path": ["name"],
            "values": ["nc"],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details