package terraform.gcp.security.cloud_workstations.google_workstations_workstation_cluster.location
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_cluster.vars


conditions := [
    [
    {"situation_description" : "is  deployed in a location outside of the approved region ",
    "remedies": ["change the location to us-central1 "]
    
    },
    {
        "condition": "c1 : check the cloud workstation cluster location",
    
        "attribute_path" : ["location"],
        "values" : ["us-central1" ],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details