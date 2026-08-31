package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_egress_policies_egress_from_identities

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress access should be restricted to explicitly approved service account identities.",
    "remedies": ["Configure status.egress_policies.egress_from.identities with valid service account identities."],
  },
  {
    "condition": "Egress identities must be service account identities.",
    "attribute_path": ["status", 0, "egress_policies", 0, "egress_from", 0, "identities"],
    "values": ["serviceAccount:*"],
    "policy_type": "pattern whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
