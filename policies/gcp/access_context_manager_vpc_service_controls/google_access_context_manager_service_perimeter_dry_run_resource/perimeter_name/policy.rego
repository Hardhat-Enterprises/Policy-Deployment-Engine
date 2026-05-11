package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_resource.require_perimeter_name

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_resource.require_perimeter_name.vars

conditions := [
    [
        {
            "situation_description": "Ensure the dry-run resource is attached to the correct authorized service perimeter.",
            "remedies": ["Update perimeter_name to 'accessPolicies/123456/servicePerimeters/my_perimeter'."]
        },
        {
            "condition": "perimeter_name is authorized",
            "attribute_path": ["perimeter_name"],
            "values": ["accessPolicies/123456/servicePerimeters/my_perimeter"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details