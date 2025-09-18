package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.redirect_rules_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

conditions := [
  [
    {
      "situation_description": "Redirects must use HTTPS",
      "remedies": [
        "Ensure all redirect targets start with https://"
      ],
    },
    {
      "condition": "Validating redirect locations use HTTPS",
      "attribute_path": ["config", "redirects", 0, "location"],
      "values": ["https://"],
      "policy_type": "pattern whitelist",
    },
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
