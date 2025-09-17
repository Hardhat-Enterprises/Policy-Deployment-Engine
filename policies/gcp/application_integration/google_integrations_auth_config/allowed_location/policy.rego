package terraform.gcp.security.application_integration.google_integrations_auth_config.allowed_location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_auth_config.vars

conditions := [
    [
    {"situation_description" : "Parameters should be in Aus location",
    "remedies":[ "Change regions to Aus"]},
    {
        "condition": "c1 Region is not Aus",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1","australia-southeast2"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details