package terraform.gcp.security.cloud_workstations.google_workstations_workstation_cluster.labels
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_cluster.vars


conditions := [
    [
    {"situation_description" : "is missing or has an invalid label value  ",
    "remedies": ["set labels.label to 'key'  "]
    
    },
    {
        "condition": "c1 : check the required label value",
    
        "attribute_path" : ["labels", "label"],
        "values" : ["key" ],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details