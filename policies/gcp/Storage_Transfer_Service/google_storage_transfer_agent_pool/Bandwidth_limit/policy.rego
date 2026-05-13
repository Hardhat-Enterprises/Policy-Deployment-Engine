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
            "values": vars.variables.disallowed_bandwidth_limit_mbps,
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details