package terraform.gcp.security.scc.mute_config.type
import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.mute_config.vars

conditions := [
    [
    {"situation_description" : "Type in mute_config should be one of the accpected values",
    "remedies":[ "Type in mute_config should be on of MUTE_CONFIG_TYPE_UNSPECIFIED, STATIC and DYNAMIC"]},
    {
        "condition": "Check if the type is in a specific state",
        "attribute_path" : ["type"], 
        "values" : ["MUTE_CONFIG_TYPE_UNSPECIFIED","STATIC", "DYNAMIC" ], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
