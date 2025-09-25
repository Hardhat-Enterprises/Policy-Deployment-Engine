package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.redirect_rules_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

conditions := [
  [
    {
      "situation_description": "Redirect sources must not expose sensitive routes",
      "remedies": [
        "Avoid redirects that match admin/config/secret paths",
        "Limit redirects to public routes (e.g., /old/**)"
      ],
    },
    {
      "condition": "Sensitive redirect sources are forbidden",
      "attribute_path": ["config", 0, "redirects", 0, "glob"],
      "values": ["/admin/**", "/config/**", "/secret/**"],
      "policy_type": "blacklist",
    },
  ],
  [
    {
      "situation_description": "Redirects must use safe HTTP status codes",
      "remedies": [
        "Use 301 (permanent) or 302/308 (temporary/permanent) for redirects",
        "Avoid non-redirect codes like 200"
      ],
    },
    {
      "condition": "Status code is a safe redirect",
      "attribute_path": ["config", 0, "redirects", 0, "status_code"],
      "values": [301, 302, 308],
      "policy_type": "whitelist",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
