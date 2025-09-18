package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.rewrite_rules_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

conditions := [
  [
    {
      "situation_description": "Rewrite sources must not expose sensitive routes",
      "remedies": [
        "Avoid rewrites that match admin/config/secret paths",
        "Limit rewrites to public routes (e.g., /, /app/**)"
      ],
    },
    {
      "condition": "Sensitive rewrite sources are forbidden",
      "attribute_path": ["config", 0, "rewrites", 0, "glob"],
      "values": ["/admin/**", "/config/**", "/secret/**"],
      "policy_type": "blacklist",
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
