package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.ingress_to_roles

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter_dry_run_ingress_policy.vars as vars

conditions := [[
  {
    "situation_description": "Ingress policies should use least-privilege IAM roles instead of broad primitive roles.",
    "remedies": ["Configure ingress_to.roles with narrowly scoped IAM roles instead of roles/owner or roles/editor."],
  },
  {
    "condition": "Ingress roles must not include broad primitive IAM roles.",
    "attribute_path": ["ingress_to", 0, "roles"],
    "values": ["roles/owner", "roles/editor"],
    "policy_type": "element blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
