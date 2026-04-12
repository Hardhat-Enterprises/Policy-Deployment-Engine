package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.os_type

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars

conditions := [
    [
        {
            "situation_description": "Ensure only authorized users can request certificates.",
            "remedies": ["Restrict access to admin users only."]
        },
        {
            "condition": "user_role is admin",
            "attribute_path": ["user", "role"],
            "values": ["admin"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Ensure only secure devices are used.",
            "remedies": ["Restrict access to approved device types."]
        },
        {
            "condition": "device os is allowed",
            "attribute_path": ["device", "os"],
            "values": ["DESKTOP_WINDOWS","DESKTOP_LINUX","DESKTOP_MAC"],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Ensure access is from approved locations.",
            "remedies": ["Restrict access to approved regions."]
        },
        {
            "condition": "region is allowed",
            "attribute_path": ["location", "region"],
            "values": ["australia-southeast1","us-central1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
  
message := result.message
details := result.details