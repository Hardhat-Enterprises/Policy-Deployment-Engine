package terraform.gcp.security.certificate_authority.ca.subject 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.ca.vars

conditions := [
    [
        {
            "situation_description" : "Subject field is not empty",
            "remedies":["Specify organisation", "Specify common name"]
        },
        {
            "condition": "Organisation is empty",
            "attribute_path" : ["config",0,"subject_config",0,"subject",0,"organization"], 
            "values" : [""," ",null],
            "policy_type" : "blacklist" 
        },
        {
            "condition": "Common name is empty",
            "attribute_path" : ["config",0,"subject_config",0,"subject",0,"common_name"], 
            "values" : [""," ",null],
            "policy_type" : "blacklist" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details