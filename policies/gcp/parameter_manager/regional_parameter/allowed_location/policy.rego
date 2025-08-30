package terraform.gcp.security.parameter_manager.regional_parameter.allowed_location 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.parameter_manager.regional_parameter.vars

conditions := [
    [
    {"situation_description" : "Parameters should be in Aus location",
    "remedies":[ "Change regions to Aus"]},
    {
        "condition": "c1 Region is not Aus",
        "attribute_path" : ["location"],
        "values" : ["australia-southeast1","australia-southeast2"],
        "policy_type" : "whitelist" 
    }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message

details := helpers.get_multi_summary(conditions, vars.variables).details