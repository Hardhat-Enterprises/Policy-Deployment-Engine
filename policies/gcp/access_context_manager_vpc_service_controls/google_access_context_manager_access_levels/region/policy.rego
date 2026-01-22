package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.region

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_levels.vars

conditions := [
    [
    {"situation_description" : "Must be in Australia Region",
    "remedies":[ "Change regions to Aus"]},
    {
        "condition": "Region is not Aus",
        "attribute_path" : ["access_levels", 0, "basic", 0, "conditions", 0, "regions"],
        "values" : ["australia-southeast1","australia-southeast2"],
        "policy_type" : "whitelist" 
    }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details