package terraform.gcp.security.certificate_authority.certificate_template.max_path_length 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.certificate_authority.certificate_template.vars


conditions := [
    [
        {
            "situation_description" : "Path length less than 4",
            "remedies":["Reduce the path length to 4 or less than"]
        },
        {
            "condition": "Path length is less than 4",
            "attribute_path" : ["predefined_values",0,"ca_options",0,"max_issuer_path_length"], 
            "values" : [null,4],
            "policy_type" : "range" 
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details