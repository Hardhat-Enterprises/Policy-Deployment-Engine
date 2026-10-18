package terraform.gcp.security.compute_engine.google_compute_instant_snapshot.zone

import data.terraform.gcp.security.compute_engine.google_compute_instant_snapshot.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Instant Snapshot is created in a zone outside the approved Australian zone.",
      "remedies": [
        "Use zone 'australia-southeast1-a' only.",
      ],
    },
    {
      "condition": "Zone must be whitelisted.",
      "attribute_path": ["zone"],
      "values": [
        "australia-southeast1-a",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message

details := result.details
