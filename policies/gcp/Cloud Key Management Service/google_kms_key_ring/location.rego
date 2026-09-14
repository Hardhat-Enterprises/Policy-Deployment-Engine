package terraform.gcp.security.google_kms.google_kms_key_ring.location
import data.terraform.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_key_ring.vars as vars

conditions :=[
[
    {"situation_description" : "The key ring is created outside the approved region, so the keys it holds — and therefore the data they protect — sit outside the organisation's data-residency boundary.",
    "remedies":[ "Change location to australia-southeast1"]},
    {
        "condition": "Check if location is not permitted",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1"],
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
