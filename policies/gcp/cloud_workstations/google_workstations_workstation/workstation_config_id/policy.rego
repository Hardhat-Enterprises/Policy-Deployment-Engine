package terraform.gcp.security.cloud_workstations.google_workstations_workstation.workstation_config_id 
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation.vars


conditions := [
    [
    {"situation_description" : "is linked to an unapproved workstation config",
    "remedies": ["change workstation_config_id to workstation-config "]
    
    },
    {
        "condition": "c1 : check the cloud workstation config id",
    
        "attribute_path" : ["workstation_config_id"],
        "values" : ["workstation-config" ],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details