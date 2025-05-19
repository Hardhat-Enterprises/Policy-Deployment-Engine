package terraform.gcp.security.cloud_buildv2.repository.remote_uri

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_buildv2.repository.vars

scenarios_list := [
  [
    {
      "situation_description": "The repository must point to an approved GitHub repository using HTTPS",
      "remedies": [
        "Set 'remote_uri' to a secure HTTPS URL hosted on github.com, such as 'https://github.com/<org>/<repo>.git'"
      ]
    },
    {
      "condition": "The remote_uri must match approved HTTPS GitHub URL patterns",
      "attribute_path": ["remote_uri"],
      "pattern_whitelist": ["^https://github\\.com/.+\\.git$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(scenarios_list, vars.variables)
message := summary.message
details := summary.details
