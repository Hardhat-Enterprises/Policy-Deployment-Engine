package terraform.gcp.security.cloud_workstations.google_workstations_workstation_config_iam_member.role
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_config_iam_member.vars


conditions := [
    [
    {"situation_description" : " grants access to broad IAM roles ",
    "remedies": ["use least privilege role such as role/viewer"]
    
    },
    {
        "condition": "c1 : check iam_member does not use higher levels/risky roles",
    
        "attribute_path" :["role"],
        "values" : ["roles/viewer"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details