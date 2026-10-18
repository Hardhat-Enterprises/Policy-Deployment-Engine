package terraform.gcp.security.compute_engine.google_compute_subnetwork.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_subnetwork.vars

conditions := [[
    {
        "situation_description": "The subnetwork is outside the approved Australian regions",
        "remedies": ["Use australia-southeast1 or australia-southeast2"]
    },
    {
        "condition": "The region must be approved",
        "attribute_path": ["region"],
        "values": ["australia-southeast1", "australia-southeast2"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
