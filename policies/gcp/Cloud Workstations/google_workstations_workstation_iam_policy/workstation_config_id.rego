package terraform.gcp.security.cloud_workstations.google_workstations_workstation_iam_policy.workstation_config_id
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_iam_policy.vars


conditions := [
    [
    {"situation_description" : "IAM policy must be in a correct workstation config",
    "remedies": ["change workstation_config_id to workstation-config "]
    
    },
    {
        "condition": "c1 : check workstation_config_id is correct",
    
        "attribute_path" :  ["workstation_config_id"],
        "values" :  ["workstation-config"],
        "policy_type" :  "whitelist"
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details