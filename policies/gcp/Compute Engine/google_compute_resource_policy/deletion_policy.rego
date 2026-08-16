package terraform.gcp.security.compute_engine.google_compute_resource_policy.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.compute_engine.google_compute_resource_policy.vars as vars

conditions := [[
  {
    "situation_description": "Google Compute Resources must be protected from accidental deletion.",
    "remedies": ["Set deletion_policy = PREVENT (recommended)."],
  },
  {
    "condition": "deletion_policy must be PREVENT.",
    "attribute_path": ["deletion_policy"],
    "values": ["PREVENT"],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
