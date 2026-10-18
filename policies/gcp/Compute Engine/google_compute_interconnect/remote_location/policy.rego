package terraform.gcp.security.compute_engine.google_compute_interconnect.remote_location

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_interconnect.vars

conditions := [
    [
        {
            "situation_description": "Cross-Cloud Interconnect must terminate at an approved external facility.",
            "remedies": [
                "Set remote_location to an approved InterconnectRemoteLocation such as 'syd-1000-1' or 'syd-2000-1'.",
                "Run 'gcloud compute interconnects remote-locations list' to see all available remote locations."
            ]
        },
        {
            "condition": "remote_location is in approved facility whitelist",
            "attribute_path": ["remote_location"],
            "values": ["syd-1000-1", "syd-2000-1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
