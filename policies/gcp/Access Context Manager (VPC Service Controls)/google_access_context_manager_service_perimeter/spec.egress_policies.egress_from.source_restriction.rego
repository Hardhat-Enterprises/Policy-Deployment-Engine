package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_egress_policies_egress_from_source_restriction

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress source-based traffic restrictions should be enabled.",
    "remedies": ["Set spec.egress_policies.egress_from.source_restriction to SOURCE_RESTRICTION_ENABLED."],
  },
  {
    "condition": "Egress source restriction must be enabled.",
    "attribute_path": ["spec", "egress_policies", "egress_from", "source_restriction"],
    "values": ["SOURCE_RESTRICTION_ENABLED"],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
