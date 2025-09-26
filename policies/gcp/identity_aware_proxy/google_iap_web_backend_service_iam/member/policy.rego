package terraform.gcp.security.identity_aware_proxy.google_iap_web_backend_service_iam.member

import data.terraform.gcp.helpers
import data.terraform.gcp.security.identity_aware_proxy.google_iap_web_backend_service_iam as vars

# Exact-match conditions (helper-friendly)
conditions := [
  [
    {"situation_description": "Public principals are not allowed",
     "remedies": ["Remove public principals", "Grant access to specific users/groups/service accounts only"]},
    {
      "condition": "member must not be public",
      "attribute_path": ["member"],
      "values": ["allUsers", "allAuthenticatedUsers"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "Domain-wide grants are not allowed",
     "remedies": ["Replace domain: principals with explicit user:/group: members"]},
    {
      "condition": "member must not be domain-scoped",
      "attribute_path": ["member"],
      "values": ["domain:example.com"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "Only supported IAM member prefixes",
     "remedies": ["Use user:, group:, or serviceAccount: prefixes"]},
    {
      "condition": "member must use allowed prefix",
      "attribute_path": ["member"],
      "values": ["users:jane@example.com"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "Member strings must be clean",
     "remedies": ["Trim spaces; avoid whitespace"]},
    {
      "condition": "member must not contain whitespace",
      "attribute_path": ["member"],
      "values": [" user:jane@example.com "],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "External/personal emails are not allowed",
     "remedies": ["Use corporate email addresses for user:/group: members"]},
    {
      "condition": "member must be a corporate email",
      "attribute_path": ["member"],
      "values": ["user:jane@gmail.com"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "User/Group emails must be syntactically valid",
     "remedies": ["Fix malformed email (double '@')"]},
    {
      "condition": "member must not contain malformed email",
      "attribute_path": ["member"],
      "values": ["group:eng@@example.com"],
      "policy_type": "blacklist"
    }
  ],
  [
    {"situation_description": "Service account members must be valid",
     "remedies": ["Use a valid service account email ending with .iam.gserviceaccount.com"]},
    {
      "condition": "serviceAccount email format must be valid",
      "attribute_path": ["member"],
      "values": ["serviceAccount:not-an-email"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
