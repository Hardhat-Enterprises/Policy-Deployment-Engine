package terraform.gcp.security.compute_engine.google_compute_target_tcp_proxy.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_target_tcp_proxy.vars

conditions := [
    [
        {
            "situation_description": "Target TCP Proxy is not protected from unintended Terraform deletion",
            "remedies": [
                "Set deletion_policy to PREVENT to protect the resource from unintended destruction"
            ]
        },
        {
            "condition": "Deletion policy must be set to the approved PREVENT value",
            "attribute_path": ["deletion_policy"],
            "values": ["PREVENT"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details