package terraform.gcp.security.Firebase_Data_Connect.data_connect_service.deletion_policy
import data.terraform.gcp.helpers
import data.terraform.gcp.security.Firebase_Data_Connect.data_connect_service.vars

conditions := [
    [
    {"situation_description" : "The deletion_policy is set to FORCE, which may cause unintended or irreversible data loss.",
    "remedies":[  "Avoid using FORCE deletion unless strictly required.",
                "Use a safer deletion policy such as ABANDON to retain resources.",
                "Implement change review before applying destructive operations."
]},
    {
        "condition": "deletion_policy set to FORCE",
        "attribute_path" : ["deletion_policy"], 
        "values" : ["FORCE"], 
        "policy_type" : "whitelist" 
    }
    ]
]
   
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details