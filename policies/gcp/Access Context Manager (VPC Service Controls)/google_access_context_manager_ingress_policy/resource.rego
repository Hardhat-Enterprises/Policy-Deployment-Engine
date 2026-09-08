package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_ingress_policy.resource

import data.terraform.helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_ingress_policy.vars

conditions := [[
    {
        "situation_description": "Ensure only valid project resources are associated with the ingress policy.",
        "remedies": ["Update resource to a valid project resource such as 'projects/<project-number>'."]
    },
    {
        "condition": "resource names a project",
        "attribute_path": ["resource"],
        "values": ["*/", [["projects"]]],
        "policy_type": "pattern whitelist"
    }
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details