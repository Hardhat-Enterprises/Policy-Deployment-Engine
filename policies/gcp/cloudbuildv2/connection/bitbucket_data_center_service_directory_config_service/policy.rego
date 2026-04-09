package terraform.gcp.security.cloudbuildv2.connection.bitbucket_data_center_service_directory_config_service

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloudbuildv2.connection.vars

conditions := [
    [
        {
            "situation_description": "Prevent Terraform from using unapproved Bitbucket Data Center Service Directory services",
            "remedies": ["Use approved Bitbucket Data Center Service Directory service only"]
        },
        {
            "condition": "Use approved Bitbucket Data Center Service Directory service only",
            "attribute_path": ["bitbucket_data_center_config", 0, "service_directory_config", 0, "service"],
            "values": [
                "projects/my-project-c/locations/australia-southeast2/namespaces/default/services/bitbucket-service"
            ],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details