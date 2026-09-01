package terraform.gcp.security.compute_engine.google_compute_instance_group_manager.zone

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_group_manager.vars

conditions := [
  [
    {
      "situation_description": "Instance group manager is created in a zone outside the approved region whitelist.",
      "remedies": ["Use a zone in 'australia-southeast1' or 'australia-southeast2' only."]
    },
    {
      "condition": "Zone must be inside the approved region whitelist",
      "attribute_path": ["zone"],
      "values": [
        "australia-southeast1-a", "australia-southeast1-b", "australia-southeast1-c",
        "australia-southeast2-a", "australia-southeast2-b", "australia-southeast2-c"
      ],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
