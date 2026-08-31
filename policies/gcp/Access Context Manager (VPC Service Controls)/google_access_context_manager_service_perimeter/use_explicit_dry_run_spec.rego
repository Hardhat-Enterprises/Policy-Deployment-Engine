package terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.use_explicit_dry_run_spec

import data.terraform.helpers as helpers
import data.terraform.gcp.security.access_context_manager_vpc_service_controls.google_access_context_manager_service_perimeter.vars as vars

conditions := [[
  {
    "situation_description": "Explicit dry-run configuration can cause the dry-run Service Perimeter configuration to differ from the enforced configuration, which may result in security controls being tested but not enforced.",
    "remedies": ["Set use_explicit_dry_run_spec = false to use the enforced Service Perimeter configuration."],
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
