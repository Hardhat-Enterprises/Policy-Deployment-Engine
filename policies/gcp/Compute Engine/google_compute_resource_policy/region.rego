package terraform.gcp.security.compute_engine.google_compute_resource_policy.region

import data.terraform.helpers as helpers
import data.terraform.gcp.security.compute_engine.google_compute_resource_policy.vars as vars

conditions := [
    [
    {"situation_description" : "Resource Policy cannot be used or created in an unapproved region.",
    "remedies":[ "Use an approved region for this Resource Policy."]},
    {
        "condition": "Region must be in the approved list.",
        "attribute_path" : ["region"],
        "values" : ["australia-southeast1", "australia-southeast2"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
