package terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.params_resource_manager_tags

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_external_vpn_gateway.vars

conditions := [
    [
        {
            "situation_description": "External VPN gateway has no resource manager tags, which prevents organizational access control policies from being enforced.",
            "remedies": ["Add resource_manager_tags in the params block to enable resource governance and access control."]
        },
        {
            "condition": "params resource_manager_tags must be set for governance.",
            "attribute_path": ["params", 0, "resource_manager_tags"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details