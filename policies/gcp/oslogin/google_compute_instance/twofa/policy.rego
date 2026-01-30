package terraform.gcp.security.oslogin.google_compute_instance.twofa

import data.terraform.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

conditions := [
    [
        {
            "situation_description": "OS Login 2FA must be enabled on all Compute Instances",
            "remedies": ["Set metadata.enable-oslogin-2fa = TRUE"]
        },
        {
            "condition": "Check if OS Login 2FA is enabled",
            "attribute_path": ["metadata", "enable-oslogin-2fa"],
            "values": ["TRUE"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
