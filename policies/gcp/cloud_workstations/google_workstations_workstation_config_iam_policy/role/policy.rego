package terraform.gcp.security.cloud_workstations.google_workstations_workstation_config_iam_policy.role
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_config_iam_policy.vars


conditions := [
    [
    {"situation_description" : "policy_data grants access to broad IAM roles ",
    "remedies": ["remove roles/owner and roles/editor from IAM policy "]
    
    },
    {
        "condition": "c1 : check iam_policy does not include risky roles",
    
        "attribute_path" :["role"],
        "values" :  ["roles/viewer"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details