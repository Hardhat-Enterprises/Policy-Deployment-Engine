package terraform.gcp.security.cloud_workstations.google_workstations_workstation_config.workstation_config_id
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_config.vars


conditions := [
    [
    {"situation_description" : "is using an unapproved workstation config id ",
    "remedies": ["change the workstation_config_id to workstation-config"]
    
    },
    {
        "condition": "c1 : check the cloud workstation config id",
    
        "attribute_path" :["workstation_config_id"],
        "values" :  ["workstation-config"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details