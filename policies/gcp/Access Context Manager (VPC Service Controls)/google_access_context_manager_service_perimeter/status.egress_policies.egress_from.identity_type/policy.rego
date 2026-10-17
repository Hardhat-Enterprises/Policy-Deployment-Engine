package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_egress_policies_egress_from_identity_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars

conditions := [[
    {
        "situation_description": "Egress access should prevent overly permissive identity types while allowing valid identity configurations.",
        "remedies": ["Configure status.egress_policies.egress_from.identity_type to use an appropriate identity type and avoid ANY_IDENTITY."],
    },
    {
        "condition": "Egress identity type must not allow the overly permissive ANY_IDENTITY value.",
        "attribute_path": ["status", 0, "egress_policies", 0, "egress_from", 0, "identity_type"],
        "values": ["ANY_IDENTITY"],
        "policy_type": "blacklist",
    },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
