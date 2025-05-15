package terraform.gcp.security.google_kms.google_kms_crypto_key.purpose
import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars as vars

conditions := [
[   #Situation 1: Purpose must be ENCRYPT_DECRYPT 
    {"situation_description" : "Purpose is not correct",
    "remedies":[ "Purpose must be ENCRYPT_DECRYPT or ASYMMETRIC_SIGN"]},
    {
        "condition": "Check purpose",
        "attribute_path" : ["purpose"],
        "values" : ["ENCRYPT_DECRYPT"],
        "policy_type" : "whitelist" 
    }
    ], 
    [#Situation 2 If purpose is asymmetric sign then the signing label must be true
    {"situation_description" : "ASYMMETRIC SIGN but missing label true",
    "remedies":[ "ASYMMETRIC_SIGN purpose must have label set to true"]},
    {
        "condition": "Check purpose",
        "attribute_path" : ["purpose"],
        "values" : ["ASYMMETRIC_SIGN"],
        "policy_type" : "whitelist" 
    },
    {
        "condition": "Check label",
        "attribute_path" : ["labels",0,"signing"],
        "values" : ["true"],
        "policy_type" : "whitelist" 
    }

    ]
]

message = helpers.get_multi_summary(conditions, vars.variables)