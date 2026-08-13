package terraform.gcp.security.compute_engine.google_compute_router_route_policy.deletion_policy

import data.terraform.gcp.security.compute_engine.google_compute_router_route_policy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Router route policy deletion_policy does not prevent accidental deletion.",
      "remedies": [
        "Set deletion_policy to PREVENT to avoid accidental deletion of critical routing policies.",
      ],
    },
    {
      "condition": "deletion_policy must be PREVENT.",
      "attribute_path": ["deletion_policy"],
      "values": [
        "PREVENT",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
