package terraform.gcp.security.compute_engine.google_compute_network_endpoints.zone

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_network_endpoints.vars

conditions := [
    [
    {"situation_description" : "zone is outside the approved zone whitelist",
    "remedies":[ "Deploy the resource in an approved zone for data residency compliance"]},
    {
        "condition": "Test if zone is not in the approved whitelist",
        "attribute_path" : ["zone"],
        "values" : ["us-central1-a", "us-east1-b", "us-west1-a"],
        "policy_type" : "whitelist"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details
