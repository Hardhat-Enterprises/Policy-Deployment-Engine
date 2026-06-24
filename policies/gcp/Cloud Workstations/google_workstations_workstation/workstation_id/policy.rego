package terraform.gcp.security.cloud_workstations.google_workstations_workstation.workstation_id
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation.vars


conditions := [
    [
    {"situation_description" : "is using an unapproved workstation_id",
    "remedies": ["change workstation_id to work-station "]
    
    },
    {
        "condition": "c1 : check the cloud workstation id",
    
        "attribute_path" : ["workstation_id"],
        "values" : ["work-station" ],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details