package terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_network_firewall_policy_with_rules.vars as vars


conditions := [[
  {
    "situation_description": "Firewall policy must be protected from accidental deletion.",
    "remedies": ["Set deletion_policy to PREVENT to avoid accidental deletion of firewall rules."],
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
