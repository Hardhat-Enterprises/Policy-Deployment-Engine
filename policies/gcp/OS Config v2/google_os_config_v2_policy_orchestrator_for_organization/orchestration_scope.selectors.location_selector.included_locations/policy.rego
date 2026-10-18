package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestration_scope_selectors_location_selector_included_locations

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Only approved locations are allowed to receive the security policy",
            "remedies": ["Use an approved location such as us-central1"]
        },
        {
            "condition": "Check if the included location is approved",
            "attribute_path": [
                "orchestration_scope",
                0,
                "selectors",
                0,
                "location_selector",
                0,
                "included_locations"
            ],
            "values": ["us-central1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details