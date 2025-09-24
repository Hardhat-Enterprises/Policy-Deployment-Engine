package terraform.gcp.security.oslogin.google_compute_instance.enabled

import data.terraform.gcp.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

conditions := [
    [
        {
            "situation_description": "Instances must have OS Login enabled",
            "remedies": [
                "Set metadata.enable-oslogin = TRUE",
                "Remove metadata.enable-oslogin = FALSE"
            ]
        },
        {
            "condition": "OS Login metadata key must equal TRUE",
            "attribute_path": ["metadata", "enable-oslogin"],
            "values": ["TRUE"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
