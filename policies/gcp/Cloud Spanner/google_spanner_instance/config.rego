package terraform.gcp.security.cloud_spanner.google_spanner_instance.config

import data.terraform.helpers
import data.terraform.gcp.security.cloud_spanner.google_spanner_instance.vars

conditions := [
  [
    {
      "situation_description": "Cloud Spanner instance is configured in a region that is not an approved data-residency location, risking storage of data outside permitted jurisdictions.",
      "remedies": [
        "Set config to an approved regional configuration, e.g. regional-australia-southeast1 or regional-australia-southeast2."
      ]
    },
    {
      "condition": "config must be an approved data-residency region",
      "attribute_path": ["config"],
      "values": ["regional-australia-southeast1", "regional-australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
