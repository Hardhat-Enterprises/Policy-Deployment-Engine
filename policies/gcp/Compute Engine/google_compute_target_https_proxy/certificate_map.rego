package terraform.gcp.security.compute_engine.google_compute_target_https_proxy.certificate_map

import data.terraform.gcp.security.compute_engine.google_compute_target_https_proxy.vars
import data.terraform.helpers

conditions := [
  [
    {
      "situation_description": "Target HTTPS proxy certificate_map is not an approved certificate map.",
      "remedies": [
        "Set certificate_map to an explicitly approved certificate map.",
      ],
    },
    {
      "condition": "certificate_map must be an approved certificate map.",
      "attribute_path": ["certificate_map"],
      "values": [
        "//certificatemanager.googleapis.com/projects/approved-project/locations/global/certificateMaps/approved-map",
      ],
      "policy_type": "whitelist",
    },
  ],
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
