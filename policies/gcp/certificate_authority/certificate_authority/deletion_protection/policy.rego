package terraform.gcp.security.certificate_authority.ca.deletion_protection 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.ca.vars

conditions := [
    [
    {"situation_description" : "Deletion protection is turned on",
    "remedies":["Turn deletion protection on"]},
    {
        "condition": "Deletion protection is turned on",
        "attribute_path" : ["deletion_protection"], 
        "values" : [true],
        "policy_type" : "whitelist" 
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details