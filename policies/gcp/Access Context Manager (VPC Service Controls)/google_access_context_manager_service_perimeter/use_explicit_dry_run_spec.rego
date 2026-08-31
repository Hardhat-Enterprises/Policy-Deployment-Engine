package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.use_explicit_dry_run_spec

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Explicit dry-run configuration should only be enabled when it is specifically required for testing Service Perimeter changes.",
    "remedies": ["Set use_explicit_dry_run_spec = false when an explicit dry-run configuration is not required."],
  },
  {
    "condition": "Explicit dry-run specification should not be enabled by default.",
    "attribute_path": ["use_explicit_dry_run_spec"],
    "values": [true],
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
