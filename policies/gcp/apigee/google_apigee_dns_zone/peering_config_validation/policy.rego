package terraform.gcp.security.apigee.google_apigee_dns_zone.peering_config_validation

import data.terraform.helpers
import data.terraform.gcp.security.apigee.google_apigee_dns_zone.vars

conditions := [
    [
        {
            "situation_description": "target_network_id should not be empty'",
            "remedies": [
                "Add values to target_network_id'"
            ]
        },
        {
            "condition": "Ensures that the target_network_id is not empty",

            # Correct nested attribute path
            "attribute_path": ["peering_config",0,"target_network_id"],

            # Allow only org names that match this pattern
            "values": ["",null],

            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "target_project_id should not be empty'",
            "remedies": [
                "Add values to target_project_id'"
            ]
        },
        {
            "condition": "Ensures that the target_project_id is not empty",

            # Correct nested attribute path
            "attribute_path": ["peering_config",0,"target_project_id"],

            # Allow only org names that match this pattern
            "values": ["",null],

            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
