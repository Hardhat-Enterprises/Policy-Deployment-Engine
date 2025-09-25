package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.headers_security

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

# We validate concrete, safe values so presence + correctness are both enforced.
conditions := [
  [
    {
      "situation_description": "Firebase Hosting must include core security headers",
      "remedies": [
        "Add X-Frame-Options header to prevent clickjacking (DENY or SAMEORIGIN)",
        "Add Content-Security-Policy header to mitigate XSS (e.g., default-src 'self')",
        "Add X-Content-Type-Options header to prevent MIME sniffing (nosniff)"
      ],
    },

    # X-Frame-Options
    {
      "condition": "X-Frame-Options is set to a safe value",
      "attribute_path": ["config", 0, "headers", 0, "headers", "X-Frame-Options"],
      "values": ["DENY", "SAMEORIGIN"],
      "policy_type": "whitelist",
    },

    # X-Content-Type-Options
    {
      "condition": "X-Content-Type-Options is set to nosniff",
      "attribute_path": ["config", 0, "headers", 0, "headers", "X-Content-Type-Options"],
      "values": ["nosniff"],
      "policy_type": "whitelist",
    },

    # Content-Security-Policy (keep strict; expand if your reviewers want more)
    {
      "condition": "Content-Security-Policy is set to a strict default",
      "attribute_path": ["config", 0, "headers", 0, "headers", "Content-Security-Policy"],
      "values": ["default-src 'self'"],
      "policy_type": "whitelist",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
