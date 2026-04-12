package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.region

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Ensure that access is restricted to approved Australian regions for compliance and data residency requirements.",
            "remedies": ["Restrict regions to approved Australian locations such as australia-southeast1 and australia-southeast2."]
        },
        {
            "condition": "region must be within approved Australian regions",
            "attribute_path": ["basic", 0, "conditions", 0, "regions"],
            "values": ["australia-southeast1","australia-southeast2"],
            "policy_type": "whitelist" 
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details