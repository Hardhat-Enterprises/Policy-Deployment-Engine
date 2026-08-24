package terraform.gcp.security.compute_engine.google_compute_target_tcp_proxy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_target_tcp_proxy.vars

conditions := [
    [
        {
            "situation_description": "Target TCP Proxy uses the ABANDON deletion policy",
            "remedies": [
                "Set deletion_policy to DELETE or PREVENT"
            ]
        },
        {
            "condition": "Deletion policy must not abandon the resource",
            "attribute_path": ["deletion_policy"],
            "values": ["ABANDON"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
