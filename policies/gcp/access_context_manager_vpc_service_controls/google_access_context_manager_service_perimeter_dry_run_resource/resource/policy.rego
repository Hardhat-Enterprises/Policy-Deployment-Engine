package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_resource.allowed_project_resource

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_resource.vars

conditions := [
    [
        {
            "situation_description": "Ensure only whitelisted projects are added as dry-run resources.",
            "remedies": ["Update resource to 'projects/123456789'."]
        },
        {
            "condition": "resource is whitelisted",
            "attribute_path": ["resource"],
            "values": ["projects/123456789"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details