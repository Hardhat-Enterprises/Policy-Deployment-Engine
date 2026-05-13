package terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_agent_pool.Bandwidth_limit

import data.terraform.helpers
import data.terraform.gcp.security.Storage_Transfer_Service.google_storage_transfer_agent_pool.vars

conditions := [
    [
        {
            "situation_description": "Storage Transfer agent pool is configured with an unsafe bandwidth limit.",
            "remedies": [
                "Set bandwidth_limit.limit_mbps to an approved lower value.",
                "Avoid excessive bandwidth allocations on transfer agent pools."
            ]
        },
        {
            "condition": "Storage Transfer agent pool bandwidth limit must not use unsafe high Mbps values.",
            "attribute_path": ["bandwidth_limit", 0, "limit_mbps"],
            "values": [null, 1000],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details

