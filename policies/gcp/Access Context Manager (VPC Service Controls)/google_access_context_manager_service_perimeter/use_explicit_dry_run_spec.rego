package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.use_explicit_dry_run_spec

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Service Perimeter configurations should use a valid explicit dry-run specification setting appropriate to the deployment workflow.",
    "remedies": ["Configure use_explicit_dry_run_spec according to the deployment workflow and ensure the setting is explicitly defined."],
  },
  {
    "condition": "use_explicit_dry_run_spec must be explicitly configured with a valid boolean value.",
    "attribute_path": ["use_explicit_dry_run_spec"],
    "values": [true, false],
    "policy_type": "whitelist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
