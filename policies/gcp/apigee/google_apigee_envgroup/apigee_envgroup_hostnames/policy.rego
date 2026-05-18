package terraform.gcp.security.apigee.google_apigee_envgroup.apigee_envgroup_hostnames

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_envgroup.vars

conditions := [
    [
        {
            "situation_description": "Apigee Environment Group does not have any hostnames configured which prevents routing of API traffic to the environment group",
            "remedies": [
                "Add at least one hostname to the hostnames list",
                "Hostnames must be valid domain names",
                "Example: hostnames = [\"api.example.com\"]"
            ]
        },
        {
            "condition": "Check if hostnames list is not empty",
            "attribute_path": ["hostnames"],
            "values": [[]],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details