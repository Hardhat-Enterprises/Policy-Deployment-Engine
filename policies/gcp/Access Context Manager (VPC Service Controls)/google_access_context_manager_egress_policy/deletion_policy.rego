package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_egress_policy.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_egress_policy.vars as vars

conditions := [[
  {
    "situation_description": "Access Context Manager egress policy must be protected from accidental deletion.",
    "remedies": ["Set deletion_policy = PREVENT."],
  },
  {
    "condition": "deletion_policy must be PREVENT.",
    "attribute_path": ["deletion_policy"],
    "values": ["PREVENT"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details