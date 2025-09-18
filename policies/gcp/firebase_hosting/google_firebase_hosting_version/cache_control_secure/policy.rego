package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.cache_control_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

conditions := [
  [
    {
      "situation_description": "Sensitive files should not be cached for extended periods",
      "remedies": [
        "Set appropriate cache headers for sensitive content",
        "Use no-cache for authentication pages",
        "Set short TTL for dynamic content"
      ],
    },
    {
      "condition": "Validating sensitive files have proper cache control (path match)",
      "attribute_path": ["config", "headers", 0, "glob"],
      "values": ["/login*", "/admin*", "/api/auth*", "*.json"],
      "policy_type": "pattern whitelist",
    },
    {
      "condition": "Validating header key is Cache-Control",
      "attribute_path": ["config", "headers", 0, "headers", 0, "key"],
      "values": ["Cache-Control"],
      "policy_type": "whitelist",
    },
    {
      "condition": "Validating cache control is restrictive for sensitive files",
      "attribute_path": ["config", "headers", 0, "headers", 0, "value"],
      "values": ["no-cache", "no-store", "max-age=0"],
      "policy_type": "whitelist",
    },
  ],
  [
    {
      "situation_description": "Static assets should have reasonable cache duration",
      "remedies": [
        "Set appropriate max-age for static resources",
        "Use cache busting for updated assets"
      ],
    },
    {
      "condition": "Validating static assets cache duration (path match)",
      "attribute_path": ["config", "headers", 0, "glob"],
      "values": ["**/*.js", "**/*.css", "**/*.png", "**/*.jpg"],
      "policy_type": "pattern whitelist",
    },
    {
      "condition": "Validating header key is Cache-Control",
      "attribute_path": ["config", "headers", 0, "headers", 0, "key"],
      "values": ["Cache-Control"],
      "policy_type": "whitelist",
    },
    {
      "condition": "Validating cache duration is reasonable",
      "attribute_path": ["config", "headers", 0, "headers", 0, "value"],
      "values": ["max-age=31536000", "max-age=86400", "max-age=3600"],
      "policy_type": "whitelist",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
