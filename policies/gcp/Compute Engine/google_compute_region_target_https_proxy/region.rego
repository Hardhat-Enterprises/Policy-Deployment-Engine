package terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_target_https_proxy.vars

conditions := [
    [
        {
            "situation_description": "Region target HTTPS proxy is not deployed in an approved Australian region, which may violate data residency requirements.",
            "remedies": ["Set region to an approved Australian region such as australia-southeast1 or australia-southeast2."]
        },
        {
            "condition": "region must be an approved Australian region.",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details