package terraform.gcp.security.google_kms.google_kms_key_ring.location
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_key_ring.location.vars as vars

conditions :=[
[
    {"situation_description" : "location",
    "remedies":[ "Change location to us-central"]},
    {
        "condition": "Check if location is not permitted",
        "attribute_path" : ["location"],
        "values" : ["us-central1"],
        "policy_type" : "whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions,vars.variables)
message = summary.message