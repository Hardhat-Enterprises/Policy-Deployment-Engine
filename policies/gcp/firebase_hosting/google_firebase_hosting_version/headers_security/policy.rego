package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.headers_security

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

conditions := [
  [
    {
      "situation_description": "Firebase Hosting must include core security headers",
      "remedies": [
        "Add X-Frame-Options header to prevent clickjacking",
        "Add Content-Security-Policy header to mitigate XSS",
        "Add X-Content-Type-Options header to prevent MIME sniffing"
      ],
    },
    {
      "condition": "Required security headers are present",
      "attribute_path": ["config", "headers", 0, "headers", 0, "key"],
      "values": ["X-Frame-Options", "Content-Security-Policy", "X-Content-Type-Options"],
      "policy_type": "whitelist",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
