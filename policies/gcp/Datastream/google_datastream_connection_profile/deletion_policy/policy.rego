package terraform.gcp.security.datastream.google_datastream_connection_profile.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The Datastream connection profile is not protected against deletion, which could disrupt dependent streams or remove the profile from infrastructure-as-code governance.",
            "remedies": [
                "Set deletion_policy to PREVENT.",
                "Review dependencies before changing or removing the connection profile.",
                "Use an approved change process when deletion is intentionally required."
            ]
        },
        {
            "condition": "Check whether deletion_policy prevents destruction of the connection profile.",
            "attribute_path": [
                "deletion_policy"
            ],
            "values": [
                "PREVENT"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
