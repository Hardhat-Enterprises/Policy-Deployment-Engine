package terraform.gcp.security.scc.source.display_name
import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.source.vars

conditions := [
    [
    {"situation_description" : "Diplay name length is less than 32 characters",
    "remedies":[ "The name must be no more than 32 characters long."]},
    {
        "condition": "Check if the display_name follows the length requirement",
        "attribute_path" : ["display_name"],
        "values" : [0,32], 
        "policy_type" : "range"
    }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
