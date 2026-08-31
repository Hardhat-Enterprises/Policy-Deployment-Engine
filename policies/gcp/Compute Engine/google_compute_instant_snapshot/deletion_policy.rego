package terraform.gcp.security.compute_engine.google_compute_instant_snapshot.deletion_policy

import data.terraform.helpers as helpers
import data.terraform.gcp.security.compute_engine.google_compute_instant_snapshot.vars as vars

conditions := [[
  {
    "situation_description": "Instant Snapshot Instance must be protected from accidental deletion.",
    "remedies": [
      "Set deletion_policy = PREVENT (recommended).",
      "Set deletion_policy = ABANDON (Subject to your organisations data lifecycle or retention configurations)
      ],
  },
  {
    "condition": "deletion_policy must be PREVENT.",
    "attribute_path": ["deletion_policy"],
    "values": [
      "PREVENT",
      "ABANDON"
      ],
    "policy_type": "whitelist",
  },
]]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
