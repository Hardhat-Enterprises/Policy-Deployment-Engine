package terraform.gcp.security.google_kms.google_kms_crypto_key.complaint_purpose
import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_kms.google_kms_crypto_key.vars 

conditions := [
    [   
    {"situation_description" : "Purpose is not correct",
    "remedies":[ "Purpose must be ENCRYPT_DECRYPT or ASYMMETRIC_SIGN"]},
    {
        "condition": "Check purpose",
        "attribute_path" : ["purpose"],
        "values" : ["ENCRYPT_DECRYPT","ASYMMETRIC_SIGN"],
        "policy_type" : "whitelist" 
    }
    ],

    [
    {"situation_description" : "ASYMMETRIC SIGN but missing label true",
    "remedies":[ "ASYMMETRIC_SIGN purpose must have label set to true"]},
    {
        "condition": "Check purpose",
        "attribute_path" : ["purpose"],
        "values" : ["ASYMMETRIC_SIGN"],
        "policy_type" : "blacklist" 
    },
    {
        "condition": "Check label",
        "attribute_path" : ["labels",0,"signing"],
        "values" : ["true"],
        "policy_type" : "whitelist" 
    }

    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
