package terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.cors_policy_secure

import data.terraform.gcp.helpers
import data.terraform.gcp.security.firebase_hosting.google_firebase_hosting_version.vars

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
      "condition": "Validating Access-Control-Allow-Origin is not '*'",
      "attribute_path": ["config", "headers", 0, "headers", 0, "value"],
      "values": ["*"],
      "policy_type": "blacklist",
    },
  ],
  [
    {
      "situation_description": "CORS must not allow credentials",
      "remedies": [
        "Avoid Access-Control-Allow-Credentials: true unless strictly required",
        "If credentials are necessary, restrict origins to an explicit allowlist (never '*')"
      ],
    },
    {
      "condition": "Validating Access-Control-Allow-Credentials is not 'true'",
      "attribute_path": ["config", "headers", 0, "headers", 0, "value"],
      "values": ["true"],
      "policy_type": "blacklist",
    },
  ],
  [
    {
      "situation_description": "CORS headers must be explicitly set",
      "remedies": [
        "Define CORS headers in firebase.json or Terraform config",
        "Ensure Access-Control-Allow-Origin is not omitted"
      ],
    },
    {
      "condition": "Check if headers are missing entirely",
      "attribute_path": ["config", "headers"],
      "values": [""],
      "policy_type": "blacklist",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
