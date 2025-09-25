package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.cors_policy_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

# NOTE
# - .values.config is an array -> index with 0
# - .values.config[0].headers is an array -> index with 0
# - The inner "headers" is a MAP (string->string)

conditions := [
  [
    {
      "situation_description": "CORS must not allow wildcard origin",
      "remedies": [
        "Set Access-Control-Allow-Origin to an explicit origin (e.g., https://example.com)",
        "Avoid '*' especially on authenticated endpoints"
      ],
    },
    {
      "condition": "Access-Control-Allow-Origin must not be '*'",
      "attribute_path": ["config", 0, "headers", 0, "headers", "Access-Control-Allow-Origin"],
      "values": ["*"],
      "policy_type": "blacklist",
    },
  ],
  [
    {
      "situation_description": "CORS must not allow credentials broadly",
      "remedies": [
        "Avoid Access-Control-Allow-Credentials: true unless strictly required",
        "If credentials are necessary, restrict origins to an explicit allowlist (never '*')"
      ],
    },
    {
      "condition": "Access-Control-Allow-Credentials must not be 'true'",
      "attribute_path": ["config", 0, "headers", 0, "headers", "Access-Control-Allow-Credentials"],
      "values": ["true"],
      "policy_type": "blacklist",
    },
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
