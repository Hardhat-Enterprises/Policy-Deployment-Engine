package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.basic_conditions_members

import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_access_level.vars
import data.terraform.helpers

conditions := [[
        {
                "situation_description": "Ensure Access Context Manager access level conditions do not allow public identities.",
                "remedies": ["Remove public identities and restrict members to approved users or service accounts."],
        },
        {
                "condition": "members must not contain public identities",
                "attribute_path": ["basic", 0, "conditions", 0, "members"],
                "values": ["allUsers", "allAuthenticatedUsers"],
                "policy_type": "blacklist",
        },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
