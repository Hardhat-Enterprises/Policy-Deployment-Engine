package terraform.gcp.security.compute_engine.google_compute_forwarding_rule.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_forwarding_rule.vars

conditions := [
    [
        {
            "situation_description": "Forwarding Rule must be deployed in an approved geographic region.",
            "remedies": [
                "Set the region field to an approved region such as 'australia-southeast1' or 'australia-southeast2'.",
                "Run 'gcloud compute regions list' to see all available regions."
            ]
        },
        {
            "condition": "region is in approved region whitelist",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
