package terraform.gcp.security.datastream.google_datastream_connection_profile.location

import data.terraform.helpers
import data.terraform.gcp.security.datastream.google_datastream_connection_profile.vars

conditions := [
    [
        {
            "situation_description": "The Datastream connection profile is located outside the approved Australian regions, which may violate organisational data-residency or regional deployment requirements.",
            "remedies": [
                "Set location to an approved Australian region.",
                "Use australia-southeast1 or australia-southeast2.",
                "Confirm regional requirements before deploying the connection profile."
            ]
        },
        {
            "condition": "Check whether the connection profile uses an approved Australian location.",
            "attribute_path": [
                "location"
            ],
            "values": [
                "australia-southeast1",
                "australia-southeast2"
            ],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details