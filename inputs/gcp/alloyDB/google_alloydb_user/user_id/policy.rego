package terraform.gcp.security.alloydb.google_alloydb_user.user_id_security

import data.terraform.gcp.helpers
import data.terraform.gcp.security.alloydb.google_alloydb_user.vars

# Goal:
# 1) Block risky/default usernames (blacklist)
# 2) Enforce a safe naming pattern (pattern whitelist)

conditions := [
  # ── Scenario 1: block weak/default IDs ────────────────────────────────────────
  [
    {
      "situation_description": "User ID is a risky/default username",
      "remedies": [
        "Use a unique service-style ID (e.g., svc_app_env)",
        "Avoid admin/root/postgres/test/temp/dev/etc."
      ]
    },
    {
      "condition": "Disallow common/weak usernames",
      "attribute_path": ["change","after","user_id"],
      "values": vars.variables.disallowed_usernames,
      "policy_type": "blacklist"
    }
  ],

  # ── Scenario 2: enforce a safe pattern ────────────────────────────────────────
  [
    {
      "situation_description": "User ID must follow hardened naming convention",
      "remedies": [
        "Rename to match ^[a-z][a-z0-9_]{2,29}$ (lowercase, digits, underscore; 3–30 chars; starts with a letter)"
      ]
    },
    {
      "condition": "User ID must match approved pattern",
      "attribute_path": ["change","after","user_id"],
      "values": [vars.variables.username_pattern],
      "policy_type": "pattern whitelist"
    }
  ]
]

# Summary & per-resource results (your helpers produce these)
message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
