package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.status_egress_policies_egress_from_identities

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Egress access should be restricted to explicitly approved identities.",
    "remedies": ["Configure status.egress_policies.egress_from.identities with approved users or service accounts."],
  },
  {
    "condition": "Egress identities must be explicitly approved.",
    "attribute_path": ["status", 0, "egress_policies", 0, "egress_from", 0, "identities"],
    "values": ["serviceAccount:approved@example-project.iam.gserviceaccount.com"],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
