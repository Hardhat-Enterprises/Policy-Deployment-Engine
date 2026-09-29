package terraform.gcp.security.eventarc.google_eventarc_pipeline.location

import data.terraform.helpers
import data.terraform.gcp.security.eventarc.google_eventarc_pipeline.vars

conditions := [
    [
        {"situation_description" : "Pipeline is not deployed in an approved region",
        "remedies":[ "Change location to an approved region"]},
        {
            "condition": "Test if a location is an approved region",
            "attribute_path" : ["location"],
            "values" : ["us-central1", "us-east1"],
            "policy_type" : "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
