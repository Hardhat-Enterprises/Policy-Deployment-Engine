package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_egress_policies_egress_from_identity_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars

conditions := [[
    {
        "situation_description": "Egress access should restrict the types of identities allowed outside the Service Perimeter.",
        "remedies": ["Configure status.egress_policies.egress_from.identity_type to an approved identity type."],
    },
    {
        "condition": "Egress identity type must be restricted.",
        "attribute_path": ["status", 0, "egress_policies", 0, "egress_from", 0, "identity_type"],
        "values": ["ANY_SERVICE_ACCOUNT"],
        "policy_type": "whitelist",
    },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
