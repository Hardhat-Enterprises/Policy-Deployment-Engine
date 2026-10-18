package terraform.gcp.security.identity_platform.google_identity_platform_config.mfa_provider_configs_totp_provider_config_adjacent_intervals

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "The TOTP verification window accepts too many adjacent time intervals.",
            "remedies": [
                "Set mfa.provider_configs.totp_provider_config.adjacent_intervals to 0 or 1 to limit clock-skew tolerance."
            ]
        },
        {
            "condition": "TOTP adjacent intervals must be between 0 and 1",
            "attribute_path": ["mfa",0,"provider_configs",0,"totp_provider_config",0,"adjacent_intervals"],
            "values": [0, 1],
            "policy_type": "range"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
