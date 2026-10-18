package terraform.gcp.security.compute_engine.google_compute_instance_group.zone 

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_group.vars

conditions := [
    [
        {
            "situation_description": "Instance group is deployed outside the approved zone whitelist.",
            "remedies": ["Use a zone within the approved zone whitelist.",]
        },
        {
            "condition": "Zone must be within the approved region whitelist.",
            "attribute_path": ["zone"],
            "values": ["australia-southeast1-a", "australia-southeast1-b", "australia-southeast1-c"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details