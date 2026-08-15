package terraform.gcp.security.identity_aware_proxy.google_iap_tunnel_dest_group.region

import data.terraform.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_tunnel_dest_group.vars

conditions := [
    [
        {
            "situation_description": "IAP tunnel destination group region is outside approved Australian regions.",
            "remedies": [
                "Set region to australia-southeast1 (Sydney).",
                "Set region to australia-southeast2 (Melbourne)."
            ]
        },
        {
            "condition": "region must be an approved Australian region",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details