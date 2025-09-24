package terraform.gcp.security.firebase_app_check.site.site_id_pattern

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.site.site_id_pattern.vars

conditions := [
    [
        {
            "situation_description": "Firebase Hosting Site ID does not follow the required pattern (lowercase alphanumeric and hyphens only).",
            "remedies": [
                "Ensure the site_id consists of only lowercase letters, numbers, and hyphens."
            ]
        },
        {
            "condition": "Check if site_id matches the pattern",
            "attribute_path": ["site_id"],
            "values": ["*", [["^[a-z0-9-]+$"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details