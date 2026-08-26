package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.use_explicit_dry_run_spec

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Service Perimeter should use an explicit dry-run specification to safely test security configuration changes.",
    "remedies": ["Set use_explicit_dry_run_spec = true."],
  },
  {
    "condition": "use_explicit_dry_run_spec must be true.",
    "attribute_path": ["use_explicit_dry_run_spec"],
    "values": [true],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
