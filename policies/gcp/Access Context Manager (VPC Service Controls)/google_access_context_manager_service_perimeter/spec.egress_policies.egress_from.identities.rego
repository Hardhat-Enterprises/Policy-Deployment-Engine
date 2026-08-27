package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.spec_egress_policies_egress_from_identities

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress access should be restricted to explicitly approved identities.",
    "remedies": ["Configure spec.egress_policies.egress_from.identities with approved user or service account identities."],
  },
  {
    "condition": "Egress identities must be explicitly approved.",
    "attribute_path": ["spec", 0, "egress_policies", 0, "egress_from", 0, "identities"],
    "values": ["serviceAccount:approved@example.iam.gserviceaccount.com"],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
