package terraform.gcp.security.compute_engine.google_compute_region_target_http_proxy.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_http_proxy.vars

conditions := [
    [
        {
            "situation_description": "Region Target HTTP Proxy is deployed outside the approved region",
            "remedies": [
                "Set region to australia-southeast1"
            ]
        },
        {
            "condition": "Region must use the approved deployment region",
            "attribute_path": ["region"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
