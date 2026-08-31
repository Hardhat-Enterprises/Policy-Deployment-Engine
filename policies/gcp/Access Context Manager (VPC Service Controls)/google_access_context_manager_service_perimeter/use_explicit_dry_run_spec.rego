package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.use_explicit_dry_run_spec

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Explicit dry-run specifications should not be enabled because they can cause the enforced and dry-run configurations to diverge.",
    "remedies": ["Set use_explicit_dry_run_spec = false unless an explicit dry-run configuration is specifically required."],
  },
  {
    "condition": "Explicit dry-run specification must not be enabled.",
    "attribute_path": ["use_explicit_dry_run_spec"],
    "values": [true],
    "policy_type": "blacklist",
  },
]]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
