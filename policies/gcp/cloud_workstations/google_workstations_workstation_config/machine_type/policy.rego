package terraform.gcp.security.cloud_workstations.google_workstations_workstation_config.machine_type
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_config.vars


conditions := [
    [
    {"situation_description" : "is using an unapproved machine type ",
    "remedies": ["change the machine_type to e2-standard-4"]
    
    },
    {
        "condition": "c1 : check the machine type",
    
        "attribute_path" : ["host", 0, "gce_instance", 0, "machine_type"],
        "values" : ["e2-standard-4"],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details