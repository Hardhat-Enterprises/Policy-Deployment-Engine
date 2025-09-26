package terraform.gcp.security.application_integration.google_integrations_client.cloud_kms_config.allowed_kms_location

import data.terraform.gcp.helpers
import data.terraform.gcp.security.application_integration.google_integrations_client.vars

conditions := [
    [
    {"situation_description" : "Parameters should be in Aus location",
    "remedies":[ "Change regions to Aus"]},
    {
        "condition": "Region is not Aus",
        "attribute_path" : ["cloud_kms_config",0,"kms_location"],
        "values" : ["australia-southeast1","australia-southeast2"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details