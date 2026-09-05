package terraform.gcp.security.compute_engine.google_compute_region_health_source.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_health_source.vars

conditions := [
    [
    {"situation_description" : "region is outside the approved region whitelist",
    "remedies":[ "Deploy the resource in an approved region for data residency compliance"]},
    {
        "condition": "Test if region is not in the approved whitelist",
        "attribute_path" : ["region"],
        "values" : ["us-central1", "us-east1", "us-west1"],
        "policy_type" : "whitelist"
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
