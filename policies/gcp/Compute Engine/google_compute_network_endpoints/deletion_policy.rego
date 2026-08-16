package terraform.gcp.security.compute_engine.google_compute_network_endpoints.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_endpoints.vars

conditions := [
    [
    {"situation_description" : "deletion_policy is not set to PREVENT",
    "remedies":[ "Set deletion_policy to PREVENT to protect against accidental or unauthorized destruction of this resource"]},
    {
        "condition": "Test if deletion_policy is not PREVENT",
        "attribute_path" : ["deletion_policy"],
        "values" : ["PREVENT"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
