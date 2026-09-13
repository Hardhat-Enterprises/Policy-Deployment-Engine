package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.ingress_from_sources_resource

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure only valid project resources are allowed to ingress the service perimeter.",
        "remedies": ["Update resource to a valid project resource such as 'projects/<project-number>'."]
    },
    {
        "condition": "resource names a project",
        "attribute_path": ["ingress_from", 0, "sources", 0, "resource"],
        "values": ["*/", [["projects"]]],
        "policy_type": "pattern whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
