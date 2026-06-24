package terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.bitbucket_data_center_service_directory_config_service

import data.terraform.helpers
import data.terraform.gcp.security.cloudbuildv2.google_cloudbuildv2_connection.vars

conditions := [
    [
        {
            "situation_description": "Ensure Bitbucket Data Center Service Directory service uses the required format",
            "remedies": ["Use service in the format projects/*/locations/*/namespaces/*/services/*"]
        },
        {
            "condition": "service must use approved Service Directory path format",
            "attribute_path": ["bitbucket_data_center_config", 0, "service_directory_config", 0, "service"],
            "values": [
                "projects/*/locations/*/namespaces/*/services/*",
                [
                    ["my-project-c"],         
                    ["australia-southeast2"], 
                    ["default"],              
                    ["bitbucket-service"]    
                ]
            ],
            "policy_type": "pattern whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details