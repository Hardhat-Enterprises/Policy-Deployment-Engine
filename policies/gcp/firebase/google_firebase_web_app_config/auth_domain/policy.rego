package terraform.gcp.security.firebase.google_firebase_web_app_config.auth_domain
import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase.google_firebase_web_app_config.vars


conditions := [
    [
    {"situation_description" : "Firebase app is using an unapproved authentication domain",
    "remedies":[ "Use a company-approved domain ","remove extra domains"]},
    {
        "condition": "Company domain only",
        "attribute_path" : ["auth_domain"], # An array of strings and indicies eg. ["rsa",0,"key"]
        "values" : ["ankitacompany.com"], # Values to compare against
        "policy_type" : "whitelist" # Policy type eg. 'whitelist', 'blacklist', 'range', 'pattern whitelist', 'pattern blacklist'
    }
    ]
]
   


message := helpers.get_multi_summary(conditions, vars.variables).message



details := helpers.get_multi_summary(conditions, vars.variables).details