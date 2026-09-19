package terraform.gcp.security.compute_engine.google_compute_region_security_policy.ddos_protection_config_ddos_protection

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "The security policy is using a DDoS protection level below the approved ADVANCED level.",
            "remedies": [
                "Set ddos_protection to ADVANCED for enhanced DDoS protection."
            ]
        },
        {
            "condition": "DDoS protection must be ADVANCED",
            "attribute_path": ["ddos_protection_config", 0, "ddos_protection"],
            "values": ["ADVANCED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details