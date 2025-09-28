package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.cache_control_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

conditions := [
  [
    {
      "situation_description": "Static assets should have reasonable cache duration",
      "remedies": [
        "Set appropriate max-age for static resources",
        "Use cache busting for updated assets"
      ]
    },
    {
      "condition": "Cache-Control for static assets",
      "attribute_path": ["config", 0, "headers", 0, "headers", "Cache-Control"],
      "values": ["max-age=31536000", "max-age=86400", "max-age=3600"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
