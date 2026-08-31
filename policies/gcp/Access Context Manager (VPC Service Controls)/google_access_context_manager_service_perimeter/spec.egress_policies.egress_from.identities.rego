package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_egress_policies_egress_from_identities

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress access should be restricted to explicitly scoped identities.",
    "remedies": ["Configure spec.egress_policies.egress_from.identities with explicitly approved service account identities."],
  },
  {
    "condition": "Egress identities must use explicitly approved service account identities.",
    "attribute_path": ["spec", 0, "egress_policies", 0, "egress_from", 0, "identities"],
    "values": ["serviceAccount:approved@example.iam.gserviceaccount.com"],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
