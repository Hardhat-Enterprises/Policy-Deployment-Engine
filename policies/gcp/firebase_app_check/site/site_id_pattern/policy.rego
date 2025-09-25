package terraform.gcp.security.firebase_app_check.site.site_id_pattern

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_app_check.site.site_id_pattern.vars

conditions := [
    [
        {
            "situation_description": "Firebase Hosting Site ID does not follow the required pattern (lowercase alphanumeric and hyphens only).",
            "remedies": [
                "Ensure the site_id is in the format: app-env-region (e.g., myapp-prod-us).",
                "Allowed apps: myapp, webapp. Environments: prod, dev, test. Regions: us, eu, asia."
            ]
        },
        {
            "condition": "Check if site_id matches allowed pattern",
            "attribute_path": ["site_id"],
            "values": ["*-*-*", [["myapp", "webapp"]], [["prod", "dev", "test"]], [["us", "eu", "asia"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details