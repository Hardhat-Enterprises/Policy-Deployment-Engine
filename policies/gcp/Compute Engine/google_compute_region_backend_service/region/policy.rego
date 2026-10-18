package terraform.gcp.security.compute_engine.google_compute_region_backend_service.region

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_backend_service.vars

conditions := [
  [
    {
      "situation_description": "Backend service is created in a region outside the approved region whitelist.",
      "remedies": ["Use 'australia-southeast1' or 'australia-southeast2' only."]
    },
    {
      "condition": "Region must be inside the approved region whitelist",
      "attribute_path": ["region"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := summary.message
details := summary.details
