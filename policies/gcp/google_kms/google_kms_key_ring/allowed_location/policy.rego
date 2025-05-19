package terraform.gcp.security.google_kms.google_kms_key_ring.location
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_key_ring.location.vars as vars

conditions :=[
[
    {"situation_description" : "location",
    "remedies":[ "Change location to australia-southeast1"]},
    {
        "condition": "Check if location is not permitted",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1"],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
