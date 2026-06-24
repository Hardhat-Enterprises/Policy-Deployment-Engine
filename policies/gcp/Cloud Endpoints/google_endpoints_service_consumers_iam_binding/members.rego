package terraform.gcp.security.google_endpoints.google_endpoints_consumers_iam.members

import data.terraform.helpers
import data.terraform.gcp.security.google_endpoints.google_endpoints_consumers_iam.vars

conditions := [
    [
        {
            "situation_description": "Google Cloud Endpoints consumers IAM members includes a principal outside the approved member types.",
            "remedies": [
                "Use only approved member types in members.",
                "Allow only user:, group:, or serviceAccount: principals."
            ]
        },
        
           {
                
                "condition": "Google Cloud Endpoints consumers IAM members must not include public principals.",
                "attribute_path": ["members", 0],
                "values": ["allUsers", "allAuthenticatedUsers"],
                "policy_type": "blacklist"

            
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details

