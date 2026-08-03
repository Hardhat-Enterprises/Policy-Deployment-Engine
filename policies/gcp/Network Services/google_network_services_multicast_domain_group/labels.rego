package terraform.gcp.security.network_services.google_network_services_multicast_domain_group.labels

import data.terraform.helpers
import data.terraform.gcp.security.network_services.google_network_services_multicast_domain_group.vars

conditions := [
    [
        {
            "situation_description": "The multicast domain group's labels do not include an 'environment' key with an approved value. Missing or inconsistent environment labels break environment-based governance and cost/ownership tracking.",
            "remedies": [
                "Add an 'environment' key to labels with an approved value (e.g. 'production', 'staging', 'development').",
                "Ensure all mandatory label keys are present before applying."
            ]
        },
        {
            "condition": "Check if labels.environment is set to an approved value",
            "attribute_path": ["labels", "environment"],
            "values": ["production", "staging", "development", "test"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details