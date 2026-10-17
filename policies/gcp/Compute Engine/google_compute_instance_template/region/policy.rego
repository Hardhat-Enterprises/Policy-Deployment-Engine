package terraform.gcp.security.compute_engine.google_compute_instance_template.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template is created in a region outside the approved Australia region",
            "remedies": ["Use region 'australia-southeast1' or 'australia-southeast2' only"]
        },
        {
            "condition": "region must be inside the approved list",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details