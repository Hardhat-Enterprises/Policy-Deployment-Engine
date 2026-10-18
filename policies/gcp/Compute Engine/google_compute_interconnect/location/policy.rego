package terraform.gcp.security.compute_engine.google_compute_interconnect.location

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect.vars

conditions := [
    [
        {
            "situation_description": "Interconnect must be provisioned in an approved physical facility.",
            "remedies": [
                "Set the location field to an approved InterconnectLocation such as 'syd-zone1-6' or 'syd-zone2-6'.",
                "Run 'gcloud compute interconnects locations list' to see all available locations."
            ]
        },
        {
            "condition": "location is in approved facility whitelist",
            "attribute_path": ["location"],
            "values": ["syd-zone1-6", "syd-zone2-6"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
