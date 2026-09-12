package terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.orchestration_scope_selectors_resource_hierarchy_selector_included_folders

import data.terraform.helpers
import data.terraform.gcp.security.os_config_v2.google_os_config_v2_policy_orchestrator_for_organization.vars

conditions := [
    [
        {
            "situation_description": "Only approved folder identifiers are allowed in the policy orchestration scope",
            "remedies": ["Use an approved folder identifier"]
        },
        {
            "condition": "Check that included folders do not contain project identifiers",
            "attribute_path": [
                "orchestration_scope",
                0,
                "selectors",
                0,
                "resource_hierarchy_selector",
                0,
                "included_folders"
            ],
            "values": ["projects/"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details