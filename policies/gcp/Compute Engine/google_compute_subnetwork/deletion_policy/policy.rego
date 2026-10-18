package terraform.gcp.security.compute_engine.google_compute_subnetwork.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_subnetwork.vars

conditions := [[
    {
        "situation_description": "The subnetwork is not protected from deletion",
        "remedies": ["Set deletion_policy to PREVENT"]
    },
    {
        "condition": "The deletion policy must prevent deletion",
        "attribute_path": ["deletion_policy"],
        "values": ["PREVENT"],
        "policy_type": "whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
