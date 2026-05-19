package terraform.gcp.security.cloud_workstations.google_workstations_workstation_cluster.project
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_cluster.vars


conditions := [
    [
    {"situation_description" : "is deployed in an unapproved project ",
    "remedies": ["change the project 925810350503"]
    
    },
    {
        "condition": "c1 : check the cloud workstation cluster project",
    
        "attribute_path" : ["project"],
        "values" : ["925810350503" ],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details