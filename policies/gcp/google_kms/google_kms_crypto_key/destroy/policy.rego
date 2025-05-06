package terraform.gcp.security.google_kms.google_kms_crypto_key.destroy
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars as vars

#Situation: 1
situation :=[
[
    {"situation_description" : "Crypto key destroy duration",
    "remedies":[ "Duration can only be one month"]},

    {
        "condition" : "If duration is other than 1 month",
        "attribute_path" : ["destroy_scheduled_duration"],
        "values" : ["2592000s"],
        "policy_type" : "whitelist" 
    }
    ]
]
summary = helpers.get_multi_summary(situation,vars.variables)
message = summary.message