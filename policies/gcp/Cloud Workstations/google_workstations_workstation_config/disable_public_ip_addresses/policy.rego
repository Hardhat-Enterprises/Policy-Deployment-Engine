package terraform.gcp.security.cloud_workstations.google_workstations_workstation_config.disable_public_ip_addresses
import data.terraform.helpers
import data.terraform.gcp.security.cloud_workstations.google_workstations_workstation_config.vars


conditions := [
    [
    {"situation_description" : "has public IP addresses enabled ",
    "remedies": ["set disable_public_ip_addresses to true  "]
    
    },
    {
        "condition": "c1 : check the disable public ip addresses",
    
        "attribute_path" : ["host", 0, "gce_instance", 0, "disable_public_ip_addresses"],
        "values" : [true ],
        "policy_type" : "whitelist" 
    }
    ]
]
   
   
result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details