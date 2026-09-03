package terraform.gcp.security.compute_engine.google_compute_region_security_policy.rules_rate_limit_options_ban_duration_sec

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_security_policy.vars

conditions := [
    [
        {
            "situation_description": "Rate-based ban duration should provide sufficient time to deter abusive clients.",
            "remedies": [
                "Set ban_duration_sec to a value between 600 and 86400 seconds."
            ]
        },
        {
            "condition": "Rate-based ban duration must be between 600 and 86400 seconds",
            "attribute_path": ["rules", 0, "rate_limit_options", 0, "ban_duration_sec"],
            "values": [600, 86400],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details